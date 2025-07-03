import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["repliesContainer", "toggleButton", "icon", "text"];

  connect() {
    this.updateButtonState();
  }

  handleKeydown(event) {
    if (event.ctrlKey && event.key === "Enter") {
      event.preventDefault();
      this.element.closest("form").requestSubmit();
    }
  }

  toggleEditForm(event) {
    const commentId = event.currentTarget.dataset.commentId;
    const editForm = document.getElementById(`edit_form_${commentId}`);
    const replyForm = document.getElementById(`reply_form_${commentId}`);

    if (editForm) {
      editForm.classList.toggle("hidden");
    }

    if (replyForm) {
      replyForm.classList.add("hidden");
    }
  }

  toggleReplyForm(event) {
    const commentId = event.currentTarget.dataset.commentId;
    const replyForm = document.getElementById(`reply_form_${commentId}`);
    const editForm = document.getElementById(`edit_form_${commentId}`);

    if (replyForm) {
      replyForm.classList.toggle("hidden");
    }

    if (editForm) {
      editForm.classList.add("hidden");
    }
  }

  toggleReplies() {
    if (
      this.hasRepliesContainerTarget &&
      this.hasIconTarget &&
      this.hasTextTarget
    ) {
      const isCollapsed =
        this.repliesContainerTarget.classList.contains("hidden");

      if (isCollapsed) {
        this.repliesContainerTarget.classList.remove("hidden");
        this.iconTarget.style.transform = "rotate(0deg)";
        this.textTarget.textContent = "Hide replies";
      } else {
        this.repliesContainerTarget.classList.add("hidden");
        this.iconTarget.style.transform = "rotate(-90deg)";
        this.textTarget.textContent = "Show replies";
      }
    }
  }

  updateButtonState() {
    if (
      this.hasRepliesContainerTarget &&
      this.hasIconTarget &&
      this.hasTextTarget
    ) {
      const isCollapsed =
        this.repliesContainerTarget.classList.contains("hidden");
      if (isCollapsed) {
        this.iconTarget.style.transform = "rotate(-90deg)";
        this.textTarget.textContent = "Show replies";
      } else {
        this.iconTarget.style.transform = "rotate(0deg)";
        this.textTarget.textContent = "Hide replies";
      }
    }
  }
}
