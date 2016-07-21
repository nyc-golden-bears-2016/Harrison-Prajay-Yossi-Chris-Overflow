get '/questions' do
  if params[:interesting]
    @questions = Question.all.order(created_at: :desc)
  elsif params[:views]
    @questions = Question.all.order(view_count: :desc)
  elsif params[:answers]
    @questions = Question.all.to_a.sort {|q1,q2| q2.answers.count <=> q1.answers.count }
  elsif params[:votes]
    @questions = Question.all.to_a.sort {|q1,q2| count_votes(q2) <=> count_votes(q1) }
  else
    @questions = Question.all
  end
  erb :"questions/index"
end

get '/questions/new' do
  if current_user
    erb :'questions/new'
  else
    session[:new_post_message] = "You must be logged in to ask a question"
    redirect '/login'
  end
end

post '/questions' do
  tags = params[:tags].split(" ")
  if tags.length > 5
    session[:tag_limit] = "You can only enter 5 tags \n You entered #{tags.length}"
    redirect "/questions/new"
  else
    @question = Question.new(params[:question])
    @question.user_id = session[:id]
    tags.each do |tag_name|
    existing_tag = Tag.find_by({tag_name: tag_name.downcase})
      if existing_tag
        @question.tags << existing_tag
      else
        tag = Tag.new({tag_name: tag_name.downcase})
        if tag.save
          @question.tags << tag
        else
          session[:form_error] = tag.errors.full_messages
          redirect "/questions/new"
        end
      end
    end

    if @question.save
      redirect "/questions/#{@question.id}"
    else
      @question.tags.delete_all
      session[:form_error] = @question.errors.full_messages
      if session[:form_error].empty?
        session[:form_error] = ["You had duplicate tags."]
      end
      redirect "/questions/new"
    end
  end
end

get "/questions/tag" do
  search_tags = params[:search_input].split(" ")
  @questions = search_tags.map do |tag_name|
    p Question.joins(:tags).where(:tags => {:tag_name => tag_name})
  end
  @questions = @questions.flatten.uniq
  erb :"tags/questions"
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])

  if @question
    @question.view_count += 1
    @question.save
    erb :'questions/show'
  else
    halt(404, "404!!!!!! Question not found")
  end
end

get '/questions/:id/new_comment' do
  if !logged_in?
    session[:new_post_message] = "You must login to comment."
    redirect "/login"
  end
  @question = Question.find_by(id: params[:id])
  if @question
    erb :'comments/new'
  else
    halt(404, "404!!!!!! Question not found")
  end
end

post '/questions/new_comment' do
  question = Question.find_by(id: params[:question_id])
  comment = Comment.new(comment_body: params[:comment_body], user_id: current_user.id)
  if comment.save
    question.comments << comment
    redirect "/questions/#{question.id}"
  else
    session[:form_error] = comment.errors.full_messages
    redirect "/questions/#{question.id}/new_comment"
  end
end
