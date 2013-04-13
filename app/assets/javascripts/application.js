// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-alert
//= require bootstrap-datepicker
//= require bootstrap-dropdown
//= require bootstrap-wysihtml5

$(function() {
  $(".datepicker").datepicker({
    autoclose: true
  });

  $(".dropdown-toggle").dropdown();

  $(".wysihtml5").each(function(i, elem) {
    $(elem).wysihtml5();
  });

  $('.ajax-form').submit(function(){
    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      success: function(){
      }
    });
    return false;
  });

  $('.ajax-checkbox').click(function() {
    $(this).closest('form').submit();
  });
  
});