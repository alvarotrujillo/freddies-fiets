import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = [ "banner", "navbar"]
  connect() {
    if (!this.hasBannerTarget) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-yellow")
    }
  }
  updateNavbar() {
    if (!this.hasBannerTarget) {
      return
    }

    if (window.scrollY > 50) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-yellow")
    } else {
      this.navbarTarget.classList.remove("navbar-yellow")
      this.navbarTarget.classList.add("navbar-transparent")
    }
  }
}
