// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require stimulus-init
//= require materialize
//= require nouislider
//= require_tree .

// M.AutoInit();

document.addEventListener('DOMContentLoaded', function() {
  let elems = document.querySelectorAll('.modal');
  M.Modal.init(elems, {
    inDuration: 500,
    outDuration: 500
  });
});

$(document).ready(function(){
  $('select').formSelect();
  var priceStart = document.getElementById('price-start');
  var priceEnd = document.getElementById('price-end');

  var sliderElem = document.getElementById('slider');
  console.log(slider)
  var slider = noUiSlider.create(sliderElem, {
    start: [priceStart.value, priceEnd.value],
    connect: true,
    // step: 1,
    // behaviour: 'unconstrained',
    orientation: 'horizontal', // 'horizontal' or 'vertical'
    range: {
     'min': [0],
     'max': [100]
    }
  });

  slider.on('update', function (values, handle) {
      var value = values[handle];
      if (handle == 1) {
          priceEnd.value = Math.round(value);
      } else {
          priceStart.value = Math.round(value);
      }
  });


  priceStart.addEventListener('change', function () {
      slider.set([this.value, null]);
  });

  priceEnd.addEventListener('change', function () {
      slider.set([null, this.value]);
  });

  var elems = document.querySelectorAll('.datepicker');
  var instances = M.Datepicker.init(elems);
});
