
document.addEventListener("turbolinks:load", function() {
    let formIdx = document.querySelectorAll(".link").length;
  
    const wrapper = document.getElementById("links");
    const addButton = document.querySelector(".add_link");
    
    addButton.addEventListener("click", function(e) {  
      e.preventDefault();
  
      const newLink = wrapper.querySelector(".link").cloneNode(true);
      
      const inputElement = newLink.querySelector("input[type=text]");
      const nameAttr = inputElement.getAttribute("name");
      const updatedNameAttr = nameAttr.replace(/\[\d+\]/, `[${formIdx}]`);
      inputElement.setAttribute("name", updatedNameAttr);
  
      const regex = /article_links_attributes\[(\d+)\]/g;
      newLink.innerHTML = newLink.innerHTML.replace(regex, () => {
        return `article_links_attributes[${formIdx}]`;
      });
  
      newLink.querySelector("label").setAttribute("for", `article_article_links_attributes_${formIdx}_url`);
      newLink.querySelector("input[type=text]").setAttribute("id", `article_article_links_attributes_${formIdx}_url`);
  
      wrapper.appendChild(newLink); 
      wrapper.appendChild(addButton);
      newLink.querySelector(".remove_link").addEventListener("click", removeLink);
      formIdx++;
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
  