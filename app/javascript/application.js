// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('turbo:load', () => {
  const menu_btn = document.getElementById('menu_btn');
  const menu_box = document.getElementById('menu_box');
  const menu_open = () => {
    menu_box.classList.toggle('menu_open');
  } 
  menu_btn.addEventListener('click', menu_open)
});