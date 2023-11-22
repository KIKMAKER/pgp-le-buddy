import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="adminnav"
export default class extends Controller {
  static targets = ["menuitem"]
  
  toggle() {
    this.menuitemTargets.forEach(function (element) {
      if (element.innerHTML === event.target.innerHTML) {
        element.classList.add("has-background-white-ter")
      } else {
        element.classList.remove("has-background-white-ter")
      }
    })
  }
}
