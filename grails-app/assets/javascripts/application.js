// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery-2.1.3.js
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        var detalle = $('.factura-detalle'),
            cantidad = 0;

      function clickHandler(e){
        cantidad++;
        e.preventDefault();
        var $this = $(this),
            row = $('.js-row-clone').first().clone();

        var names = row.find('input').val('').end().find('select').val(0).end().find("[name]");
        changeAttrs(names);
        detalle.append(row);
      }

      function changeAttrs(elements){
        elements.each(function(){
          var el = $(this)
              name = el.attr('name'),
              changedName = name.replace(/[\d]/, cantidad);
          $(this).attr('name', changedName).attr('id', changedName);
        });
      }

        $('select').material_select();
        $(".button-collapse").sideNav();
        $('#spinner').ajaxStart(function() {
            $(this).fadeIn();
        }).ajaxStop(function() {
            $(this).fadeOut();
        });

        $('.js-new').on('click', clickHandler);

    })(jQuery);
}
