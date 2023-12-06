import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modaldiv"]

  openModal() {
    this.modaldivTarget.classList.add("is-active")

  }
  closeModal() {
    this.modaldivTarget.classList.remove("is-active")
  }
}
