function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

var galleryModal = new bootstrap.Modal(document.getElementById('modal_init'), { keyboard: false });
galleryModal.show();
sleep(5000).then(() => { 
  galleryModal.hide();
  galleryModal.style.display = 'none';
  document.getElementById("modal_init").remove(); //HIDE THE ELEMENT
});
console.log('prout');