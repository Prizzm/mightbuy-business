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
$(->
    $('a.introVid').click(->
        $("#intro_vid").hide();
        $("#intro_vid").html("<iframe title='MightBuy for Business Video' width='467' height='316' src='http://www.youtube.com/embed/dScpCe1SJzE?autoplay=1' frameborder='0' allowfullscreen ></iframe>");
        $('a.introVid').hide();
        $("#intro_vid").fadeIn(100);
        
    );
)
$(->
    $('a.introVidRetail').click(->
        $("#intro_vid_retail").hide();
        $("#intro_vid_retail").html("<iframe title='MightBuy for Business Video' width='445' height='316' src='http://www.youtube.com/embed/oaqDJTnnm5c?autoplay=1' frameborder='0' allowfullscreen ></iframe>");
        $('a.introVidRetail').hide();
        $("#intro_vid_retail").fadeIn(100);
        
    );
)