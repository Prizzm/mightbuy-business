// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require bootstrap
//= require prettify
//= require jquery.form
//= require jquery.remotipart
//= require jquery-fileupload/jquery.fileupload
//= require jquery-fileupload/vendor/load-image
//= require jquery-fileupload/vendor/canvas-to-blob
//= require jquery-fileupload/jquery.fileupload-fp
//= require jquery.facebox
//= require markitup
//= require markitup-markdown
//= require mightbuy
//= require_tree .


if($("#flash-notifications").is(":visible"))
{
	$("#flash-notifications").delay(6000).fadeOut(500);
}

$("input[type=submit], button[type=submit]").bind('click',function(){
	$(".saving-loader").show().delay(8000).hide(500);
});		

