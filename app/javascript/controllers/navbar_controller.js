import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = [ "banner", "navbar"]
  connect() {
    if (!this.hasBannerTarget) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-babyblue")
    }
  }
  updateNavbar() {
    if (!this.hasBannerTarget) {
      // this.navbarTarget.classList.remove("navbar-transparent")
      // this.navbarTarget.classList.add("navbar-babyblue")
    }

    if (window.scrollY > 16) {
      this.navbarTarget.classList.remove("navbar-transparent")
      this.navbarTarget.classList.add("navbar-babyblue")
    } else {
      this.navbarTarget.classList.remove("navbar-babyblue")
      this.navbarTarget.classList.add("navbar-transparent")
    }
  }
}
