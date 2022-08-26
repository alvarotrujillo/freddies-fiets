import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"


// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['City bike', 'Amsterdam', 'Road bike', 'Utrecht', 'BMX', 'Rotterdam', 'Cargo bike', 'MTB', 'Fixie'],
      loop: true,
      attr: 'placeholder',
      typeSpeed: 50,
      backSpeed: 30,
      backDelay: 500,
      startDelay: 100,
      bindInputFocusEvents: true,
    })
  }
}
// add the line below to the view you wanna show
// <p><span data-controller="typed-js"></span></p>
