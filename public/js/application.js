$(document).ready(function() {
  $(".the_question_box form:nth-child(3)").children().first().parent().parent().find(".vote_count").children().first().data("did_vote", {first: true})
  $(".normal form:nth-child(3)").children().first().parent().parent().find(".vote_count").children().first().data("did_vote", {first: true})
  $(".best form:nth-child(3)").children().first().parent().parent().find(".vote_count").children().first().data("did_vote", {first: true})
  var userName;
  var response = $.ajax({
    method: 'post',
    url: '/user'
  });
  response.done(function(username_data){
    userName = username_data;
  });


  $(".the_question_box form").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore + 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });

  $(".best form").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore + 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });

  $(".normal form").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore + 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });


  $(".the_question_box form:nth-child(3)").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore - 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });

  $(".best form:nth-child(3)").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore - 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });

  $(".normal form:nth-child(3)").children().first().on("click", function(event){
    event.preventDefault();
    var voteScore = $(this).parent().parent().find(".vote_count").children().text();
    voteScore = Number(voteScore);
    var form = $(this).parent();
    if ($(this).parent().parent().find(".vote_count").children().first().data("did_vote").first === true) {
      $(this).parent().parent().find(".vote_count").children().text(voteScore - 1);
    }
    $(this).parent().parent().find(".vote_count").children().first().data("did_vote", {first: false});
    $.ajax({
      method: 'post',
      url: form.attr('action'),
      data: form.serialize()
    });
  });

  $(".normal").find("a").data("did_click", {clicked: false});
  $(".normal").on("click","a", function(event){
    $(this).parent().find(".new_comment").show();
    var action = $(this).attr('href');
    action = action.match(/\d+/g)[0];
    var test;
    event.preventDefault();
    if ($(this).data("did_click").clicked === false) {
      $(this).after('<form class="new_comment" method="post" action="/answers/new_comment"><input type="textbox" placeholder="Enter your comment" name="comment_body"><input type="hidden" name="answer_id" value="' + action + '"><input type="submit" value="Submit Comment"></form>');
    }
    $(this).data("did_click", {clicked: true});
  });

  $(".normal").on("submit",".new_comment", function(event){
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    var comment_body = $(this).find("input").first().val();
    if ($(this).parent().parent().find(".comment-to-question").last().length == 0){
      $(this).parent().parent().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    else {
      $(this).parent().parent().find(".comment-to-question").last().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    $(this).hide();
    $(this).find("input").first().val("");
  });

  $(".best").find("a").data("did_click", {clicked: false});
  $(".best").on("click","a", function(event){

    $(this).parent().find(".new_comment").show();
    var action = $(this).attr('href');
    action = action.match(/\d+/g)[0];
    var test;
    event.preventDefault();
    if ($(this).data("did_click").clicked === false) {
      $(this).after('<form class="new_comment" method="post" action="/answers/new_comment"><input type="textbox" placeholder="Enter your comment" name="comment_body"><input type="hidden" name="answer_id" value="' + action + '"><input type="submit" value="Submit Comment"></form>');
    }
    $(this).data("did_click", {clicked: true});
  });

  $(".best").on("submit",".new_comment", function(event){
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    var comment_body = $(this).find("input").first().val();
    if ($(this).parent().parent().find(".comment-to-question").last().length == 0){
      $(this).parent().parent().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    else {
      $(this).parent().parent().find(".comment-to-question").last().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    $(this).hide();
    $(this).find("input").first().val("");
  });

  $(".the_question_box").find("a").data("did_click", {clicked: false});
  $(".the_question_box").on("click","a", function(event){
    $(this).parent().find(".new_comment").show();
    var action = $(this).attr('href');
    action = action.match(/\d+/g)[0];
    var test;
    event.preventDefault();
    if ($(this).data("did_click").clicked === false) {
      $(this).after('<form class="new_comment" method="post" action="/questions/new_comment"><input type="textbox" placeholder="Enter your comment" name="comment_body"><input type="hidden" name="question_id" value="' + action + '"><input type="submit" value="Submit Comment"></form>');
    }
    $(this).data("did_click", {clicked: true});
  });

  $(".the_question_box").on("submit",".new_comment", function(event){
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: $(this).attr('action'),
      data: $(this).serialize()
    });
    var comment_body = $(this).find("input").first().val();
    if ($(this).parent().parent().find(".comment-to-question").last().length == 0){
      $(this).parent().parent().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    else {
      $(this).parent().parent().find(".comment-to-question").last().after('<div class="comment-to-question"><p>' + comment_body +' - ' + userName + '</p></div>');
    }
    $(this).hide();
    $(this).find("input").first().val("");
  });


});
