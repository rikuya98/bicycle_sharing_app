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
import 'packs/common';


axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// common.js

$(document).on('turbolinks:load',function() {
  $('.topslide .slide-image:first').addClass('active');

  $('.topslide .arrow.right').click(function() {
    var active = $('.topslide .slide-image.active');
    var next = active.next('.slide-image').length ? active.next('.slide-image') : $('.topslide .slide-image:first');
    active.removeClass('active');
    next.addClass('active');
  });

  $('.topslide .arrow.left').click(function() {
    var active = $('.topslide .slide-image.active');
    var prev = active.prev('.slide-image').length ? active.prev('.slide-image') : $('.topslide .slide-image:last');
    active.removeClass('active');
    prev.addClass('active');
  });
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




document.addEventListener("turbolinks:load", function() {

  let wrapper = document.getElementById("links");
  
  let addButton = document.querySelector(".add_link");
  
  addButton.addEventListener("click", function(e) {  
  e.preventDefault();
  let newLink = wrapper.querySelector(".link").cloneNode(true);  
  let formIdx = document.querySelectorAll(".link").length;  
  newLink.innerHTML = newLink.innerHTML.replace(/new_article_links/g, `article_links_attributes[${formIdx}]`);  
  wrapper.appendChild(newLink); 
  wrapper.appendChild(addButton);
  newLink.querySelector(".remove_link").addEventListener("click", removeLink);
  
  });
  
  function removeLink(e) {  
  e.preventDefault();  
  let link = e.target.closest(".link");  
  link.querySelector("input[type=hidden]").value = "1";  
  link.style.display = "none";
  
  }
  
  document.querySelectorAll(".remove_link").forEach(function(removeButton) {  
  removeButton.addEventListener("click", removeLink);
  
  });
  
  });
