import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "menu",
    "burgerButton",
    "closeButton",
    "dropdownMenu",
    "dropdownToggle",
  ];

  connect() {
    console.log("SimpleNavBarController connected");
    this.checkWindowWidth();
    this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    window.addEventListener("resize", () => this.watchWindowWidth());
    this.dropdownToggleTargets.forEach((dropdownToggle) => {
      dropdownToggle.addEventListener("click", () =>
        this.dropdownToggle(dropdownToggle)
      );
    });
  }

  isMobile() {
    return window.innerWidth < 1024;
  }

  watchWindowWidth() {
    if (this.isMobile()) {
      this.menuTarget.classList.add("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.remove("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    } else {
      this.menuTarget.classList.remove("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.add("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    }
  }

  checkWindowWidth() {
    if (this.isMobile()) {
      this.menuTarget.classList.add("simple-nav-bar-hidden");
      this.burgerButtonTarget.classList.remove("simple-nav-bar-hidden");
      this.closeButtonTarget.classList.add("simple-nav-bar-hidden");
    }
  }

  menuToggle() {
    const menu = this.menuTarget;
    const burger = this.burgerButtonTarget;
    const close = this.closeButtonTarget;

    if (menu) menu.classList.toggle("simple-nav-bar-hidden");
    if (burger) burger.classList.toggle("simple-nav-bar-hidden");
    if (close) close.classList.toggle("simple-nav-bar-hidden");
  }

  dropdownToggle(dropdown) {
    const dropdownMenu = dropdown.nextElementSibling;
    if (dropdownMenu) {
      dropdownMenu.classList.toggle("simple-nav-bar-hidden");
      dropdown.children[0].classList.toggle("simple-nav-bar-hidden");
      dropdown.children[1].classList.toggle("simple-nav-bar-hidden");
    }
  }
}