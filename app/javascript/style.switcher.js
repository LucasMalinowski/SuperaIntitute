document.addEventListener('DOMContentLoaded', function () {

    // Check if the DOMContentLoaded event is firing
    console.log('DOM is loaded');
  
    /* style switcher */
    const styleSwitcherToggle = () => {
      const styleSwitcher = document.querySelector('.js-switcher');
      const styleSwitcherToggle = document.querySelector('.js-style-switcher-toggler');
  
      if (!styleSwitcher || !styleSwitcherToggle) {
        console.error('Style switcher elements not found');
        return;
      }
  
      styleSwitcherToggle.addEventListener("click", function() {
        console.log('Button clicked');
        styleSwitcher.classList.toggle("open");
        this.querySelector("i").classList.toggle("fa-times");
      });
    }
  
    styleSwitcherToggle();
  
    /* theme color */
    const themeColor = () => {
      const hueSlider = document.querySelector('.js-hue-slider');
      const html = document.querySelector('html');
  
      const setHue = (value) => {
        html.style.setProperty("--hue", value);
        document.querySelector(".js-hue").innerHTML = value;
    }
  
    hueSlider.addEventListener("input", function () {
        setHue(this.value);
        /*set the users preference in local storage*/
        localStorage.setItem("--hue", this.value);
    });
  
    const slider = (value) => { 
        hueSlider.value = value;
    }
  
    /* check for saved user reference, if any, on load of the website*/
    if (localStorage.getItem("--hue") !== null) {
        setHue(localStorage.getItem("--hue"));
        slider(localStorage.getItem("--hue"));
    }
    else {
        //default  color
        const hue = getComputedStyle(html).getPropertyValue("--hue");
        slider(hue.split(" ").join(" "));
    }
    
  }
  themeColor();
  
    /* theme light & dark mode */
    const themeLightDark = () => {
      const darkModeCheckBox = document.querySelector('.js-dark-mode');
  
      const themeMode = () => {
        if (localStorage.getItem("theme-dark") === "false") {
            document.body.classList.remove("t-dark");
        }
        else {
            document.body.classList.add("t-dark");
        }
    }
  
    darkModeCheckBox.addEventListener("click", function () {
        /* set the user's preference in lical storage*/
        localStorage.setItem("theme-dark", this.checked);
        themeMode();
    })
  
    /*  check for saved user preference, if any , on load of the website */
    if (localStorage.getItem("theme-dark") !== null) {
        themeMode();
    }
    if (document.body.classList.contains("t-dark")) {
        darkModeCheckBox.checked = true;
    }
  }
  
    themeLightDark();
  
  });
  