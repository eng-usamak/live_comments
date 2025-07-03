import "@hotwired/turbo-rails";
import "controllers";

window.clearCommentForm = function () {
  const form = document.getElementById("new_comment_form");
  if (form) {
    const textarea = form.querySelector("textarea");
    if (textarea) {
      textarea.value = "";
      textarea.focus();
    }
  }
};
