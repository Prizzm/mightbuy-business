# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(->
    $('a.open-window[href^=http]').click(->
        $el = $(this)

        child = window.open($el.attr('href'), $el.data('window-name'), 'height=445,width=697,top=200,left=300,resizable');
        child.focus();

        return false;
    );
)