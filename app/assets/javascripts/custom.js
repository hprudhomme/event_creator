var larg = (window.innerWidth);
var haut = (window.innerHeight);
console.log(haut);
var x = 2;

if (document.getElementById('slide1') != null) {
      document.getElementById('slide1').style.height = haut+"px";
}

if (document.getElementById('container-new-event') != null) {
  document.getElementById('container-new-event').style.height = haut+"px";
}

// form create event

if (document.getElementById('submit-event') != null) {
  let btn_submit_event = document.getElementById('submit-event');
  let title = document.getElementById('new-event-title');
  let categorie = document.getElementById('new-event-categorie');
  let description = document.getElementById('new-event-description');

  function isdisabled(params) {
    if (title.value == "" || categorie.value == "" || description.value == "") {
      console.log("bla");
      btn_submit_event.setAttribute("disabled", "");
    }else if (title.value != "" && categorie.value != "" && description.value != "") {
      btn_submit_event.removeAttribute("disabled");
    }
  }

  title.addEventListener("focusout", isdisabled);
  categorie.addEventListener("focusout", isdisabled);
  description.addEventListener("focusout", isdisabled);

  btn_submit_event.setAttribute("disabled", "");


  function isformgood(params) {
    if (btn_submit_event.hasAttribute("disabled")) {
      alert("Tous les champs doivent être remplis !");
    }
  }

  btn_submit_event.addEventListener("click", isformgood)

}


// nav

    var open = document.getElementById('hamburger');
    var changeIcon = true;
    
    open.addEventListener("click", function(){
    
        var overlay = document.querySelector('.overlay');
        var nav = document.querySelector('nav');
        var icon = document.querySelector('.menu-toggle i');
        var container = document.querySelector('.container');
        var content1 = document.getElementById('content1');
    
    
        overlay.classList.toggle("menu-open");
        nav.classList.toggle("menu-open");
    
        if (changeIcon) {
            icon.classList.remove("fa-bars");
            icon.classList.add("fa-times");              
            changeIcon = false;
        }
        else {
            icon.classList.remove("fa-times");
            icon.classList.add("fa-bars");
            changeIcon = true;
        }
    });

// landing-page

let left = document.getElementById('left');
let right = document.getElementById('right');
let buttons = document.getElementsByClassName('btn');


const t1 = new TimelineMax();

t1.fromTo(
    left,
    1,
    { height: "0%"},
    { height: "100%", ease: Power2.easeInOut}
  ).fromTo(
    right,
    1,
    { height: "0%"},
    { height: "100%", ease: Power2.easeInOut},
    "-=0.8"
  ).fromTo(
    buttons[0],
    1,
    { display: "none"},
    { display: "block", ease: Power0.easeInOut},
    "-=0.5"
  ).fromTo(
    buttons[1],
    1,
    { display: "none"},
    { display: "block", ease: Power0.easeInOut},
    "-=0.5"
  )

  
  