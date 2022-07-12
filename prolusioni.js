
var mybutton;
function gestoreLoad () { 
    window.onscroll = function() {scrollFunction()};
    mybutton=document.getElementById("myBtn");
    imageZoom("pag4f", "myresult4");   
    imageZoom("pag5f", "myresult5");     
} 

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
    }
    function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
    }
    
window.onload = gestoreLoad; 


/* zoom immagine */
function imageZoom(imgID, resultID) {
    var img, lens, result, cx, cy;
    img = document.getElementById(imgID);
    result = document.getElementById(resultID);
    /* Create lens: */
    lens = document.createElement("DIV");
    lens.setAttribute("class", "img-zoom-lens");
    /* Insert lens: */
    img.parentElement.insertBefore(lens, img);
    /* Calculate the ratio between result DIV and lens: */
    cx = result.offsetWidth / lens.offsetWidth;
    cy = result.offsetHeight / lens.offsetHeight;
    /* Set background properties for the result DIV */
    result.style.backgroundImage = "url('" + img.src + "')";
    result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
    /* Execute a function when someone moves the cursor over the image, or the lens: */
    lens.addEventListener("mousemove", moveLens);
    img.addEventListener("mousemove", moveLens);
    /* And also for touch screens: */
    lens.addEventListener("touchmove", moveLens);
    img.addEventListener("touchmove", moveLens);
    function moveLens(e) {
      var pos, x, y;
      /* Prevent any other actions that may occur when moving over the image */
      e.preventDefault();
      /* Get the cursor's x and y positions: */
      pos = getCursorPos(e);
      /* Calculate the position of the lens: */
      x = pos.x - (lens.offsetWidth / 2);
      y = pos.y - (lens.offsetHeight / 2);
      /* Prevent the lens from being positioned outside the image: */
      if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
      if (x < 0) {x = 0;}
      if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
      if (y < 0) {y = 0;}
      /* Set the position of the lens: */
      lens.style.left = x + "px";
      lens.style.top = y + "px";
      /* Display what the lens "sees": */
      result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
    }
    function getCursorPos(e) {
      var a, x = 0, y = 0;
      e = e || window.event;
      /* Get the x and y positions of the image: */
      a = img.getBoundingClientRect();
      /* Calculate the cursor's x and y coordinates, relative to the image: */
      x = e.pageX - a.left;
      y = e.pageY - a.top;
      /* Consider any page scrolling: */
      x = x - window.pageXOffset;
      y = y - window.pageYOffset;
      return {x : x, y : y};
    }
  }

function traduzione4(){
    var x=document.getElementById("traduzione4");
    var y=document.getElementById("trasc4");
    var z=document.getElementById("button-trad4");
    if (x.style.display=="none"){
        x.style.display="block";
        y.style.display="none";
        z.innerHTML="Mostra trascrizione";
    }  else {
        x.style.display="none";
        y.style.display="block";
    } 
}

function traduzione5(){
    var x=document.getElementById("traduzione5");
    var y=document.getElementById("trasc5");
    var z=document.getElementById("button-trad5");
    if (x.style.display=="none"){
        x.style.display="block";
        y.style.display="none";
        z.innerHTML="Mostra trascrizione";
    }  else {
        x.style.display="none";
        y.style.display="block";
    } 
}

function mostraRetro(){
    var x=document.getElementById("imgretro");
    var y=document.getElementById("imgfronte");
    var z=document.getElementById("mostraretro");
    if (x.style.display=="none"){
        x.style.display="block";
        y.style.display="none";
        z.innerHTML="Mostra fronte";
    }  else {
        x.style.display="none";
        y.style.display="block";
        z.innerHTML="Mostra retro";
    } 
}