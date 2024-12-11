class MenuController {
  constructor() {
    this.menu = document.querySelector(".simple-nav-bar-nav-list-container");
    this.burgerButton = document.querySelector(".simple-nav-bar-burger-button");
    this.closeButton = document.querySelector(".simple-nav-bar-close-button");
    this.dropdownMenu = document.querySelector(".simple-nav-bar-dropdown-menu");
    this.dropdownToggleTargets = document.querySelectorAll(
      ".simple-nav-bar-dropdown-toggle"
    );

    this.menuToggle = this.menuToggle.bind(this);
    this.checkWindowWidth = this.checkWindowWidth.bind(this);
    this.dropdownToggle = this.dropdownToggle.bind(this);

    this.burgerButton.addEventListener("click", this.menuToggle);
    this.closeButton.addEventListener("click", this.menuToggle);
    window.addEventListener("resize", this.checkWindowWidth);

    this.init();
  }

  isMobile() {
    return window.innerWidth < 1024;
  }

  init() {
    if (this.isMobile()) {
      this.menu.classList.add("simple-nav-bar-hidden");
      this.burgerButton.classList.remove("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    }
    this.dropdownToggleTargets.forEach((dropdownToggle) => {
      dropdownToggle.addEventListener("click", () =>
        this.dropdownToggle(dropdownToggle)
      );
    });
  }

  checkWindowWidth() {
    if (this.isMobile()) {
      this.menu.classList.add("simple-nav-bar-hidden");
      this.burgerButton.classList.remove("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    } else {
      this.menu.classList.remove("simple-nav-bar-hidden");
      this.burgerButton.classList.add("simple-nav-bar-hidden");
      this.closeButton.classList.add("simple-nav-bar-hidden");
    }
  }

  menuToggle() {
    this.menu.classList.toggle("simple-nav-bar-hidden");
    this.burgerButton.classList.toggle("simple-nav-bar-hidden");
    this.closeButton.classList.toggle("simple-nav-bar-hidden");
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

document.addEventListener("turbo:load", () => {
  new MenuController();
});
