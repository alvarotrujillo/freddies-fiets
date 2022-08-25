import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Change your life", "Learn to code"],
      typeSpeed: 50,
      loop: true
    })
  }
}
// add the line below to the view you wanna show it
// <p><span data-controller="typed-js"></span></p>
