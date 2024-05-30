
document.addEventListener('DOMContentLoaded', function() {
  const burgerMenuButton = document.getElementById('burger-menu');
  const navbarMenu = document.getElementById('navbar-sticky');
  burgerMenuButton.addEventListener('click', function() {
    navbarMenu.classList.toggle('hidden');
  });
});