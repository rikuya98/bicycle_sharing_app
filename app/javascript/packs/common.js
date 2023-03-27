window.updateCommentsArea = function(commentsArea, comments) {
    commentsArea.innerHTML = comments;
    document.querySelector("textarea").value = "";
  };
  
