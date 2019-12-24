// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import '../stylesheets/application'
import 'bootstrap'
import "@fortawesome/fontawesome-free/js/all"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()

  $('.init-button').click(function () {
    $('.star-rating').hide()
    $($(this).attr('data-target')).toggle()
  })

  $('a.star-rating-delete').click(function(){
    $(this).parents('.star-rating').hide()
    const movie_id = getMovieId($(this).attr('id'))
    sendAndSetMark(movie_id, 0)
  });

  $('a.star-rating-star').click(function(){
    $(this).parents('.star-rating').hide()
    const [movie_id, mark] = getMovieIdAndMark($(this).attr('id'))
    sendAndSetMark(movie_id, mark)
  });
})

function getMovieId(id) {
  const movie_id = id.split('_')[0].slice(5)
  return movie_id
}

function getMovieIdAndMark(id) {
  let [movie, mark] = id.split('_')
  const movie_id = movie.slice(5)
  mark = mark.slice(4)
  return [movie_id, mark]
}

function sendAndSetMark(movie_id, mark) {
  $.ajax({
    type: "POST",
    url: "/ratings/set_new_rating",
    data: {movie_id: movie_id, mark: mark},
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    },
    success: function(result){
      if (result.data) setNewMarks(result.data)
    }});
}

function setNewMarks(data) {
  const $user_rating_obj = $("#user-rating" + data.movie_id).children().find('.u-rating')
  const $common_rating_obj = $("#common-rating" + data.movie_id).children().find('.c-rating')
  const $votes_obj = $("#votes" + data.movie_id)

  if (data.user_rating) {
    $user_rating_obj.html(`<h3>${data.user_rating}</h3>`)
  } else {
    $user_rating_obj.html("Vote<br/>this")
  }

  if (data.rating > 0) {
    $common_rating_obj.html(`<h3>${data.rating}</h3>`)
  } else {
    $common_rating_obj.html("No<br/>votes")
  }

  $votes_obj.html(`<h3>${data.votes}</h3>`)
}