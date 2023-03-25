window.updateCommentsArea = function(commentsArea, comments) {
    commentsArea.innerHTML = comments;
    document.querySelector("textarea").value = "";
  };
  



// function updateCommentsArea(comments) {
//     // 関数内で変数を定義
//     const commentsArea = document.getElementById("comments");
//     commentsArea.innerHTML = comments;
//     document.querySelector("textarea").value = "";
//   }