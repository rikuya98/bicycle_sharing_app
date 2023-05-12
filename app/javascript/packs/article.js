import $ from 'jquery'
import axios from 'modules/axios'

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
  
  