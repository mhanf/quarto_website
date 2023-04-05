
const default_theme = localStorage.getItem("quarto-color-scheme");
console.log(default_theme)


if (default_theme == "alternate"){
 var effect = VANTA.TRUNK({
      el: 'body',
      mouseControls: true,
      touchControls: true,
      gyroControls: false,
      minHeight: 100.00,
      minWidth: 100.00,
      scale: 1,
      scaleMobile: 1.00,
      color: 0xffffff,
      backgroundColor: 0x0,
      spacing: 0.8,
      chaos: 3
    }); 
}
else {
var effect = VANTA.TRUNK({
      el: 'body',
      mouseControls: true,
      touchControls: true,
      gyroControls: false,
      minHeight: 100.00,
      minWidth: 100.00,
      scale: 1,
      scaleMobile: 1.00,
      color: 0x0,
      backgroundColor:0xffffff,
      spacing: 0.8,
      chaos: 3
    });
}

const box = document.querySelector('.quarto-color-scheme-toggle ');

box.addEventListener('click', function() {
  var alternate = box.classList.contains("alternate");
  if (alternate === true){
  effect.setOptions({
    color: 0xffffff,
    backgroundColor:0x0
  });
  effect.restart();
  }
  else {
  effect.setOptions({
    color: 0x0,
    backgroundColor: 0xffffff
  });
  effect.restart();  
  }
});

