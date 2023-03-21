// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


$(document).ready(function() {
    $('.topslide img:first').addClass('active');
    setInterval(function() {
      var active = $('.topslide img.active');
      var next = active.next().length ? active.next() : $('.topslide img:first');
      active.removeClass('active');
      next.addClass('active');
    }, 5000);
  });


document.addEventListener('turbolinks:load', () => {
  const dataset = $('#article-show').data()
  const articleId = dataset.articleId
  axios.get(`/articles/${articleId}/like`)
  .then((response) => {
    const hasLiked = response.data.hasLiked
    if (hasLiked) {
      $('.like-good').removeClass('hidden')
  }else{
    $('.like-nogood').removeClass('hidden')
  }
 })

 $('.like-nogood').on('click', ()=> {
  axios.post(`/articles/${articleId}/like`)
  .then((response) => {
    if (response.data.status === 'ok') {
      $('.like-nogood').addClass('hidden')
      $('.like-good').removeClass('hidden')
    }
  })
  .catch((e) => {
    window.alert('Error')
    console.log(e)
 })
})

  $('.like-good').on('click', ()=> {
    axios.delete(`/articles/${articleId}/like`)
    .then((response) => {
      if (response.data.status === 'ok') {
        $('.like-good').addClass('hidden')
        $('.like-nogood').removeClass('hidden')
      }
    })
    .catch((e) => {
      window.alert('Error')
      console.log(e)
    })
  })
})




