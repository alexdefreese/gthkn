// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-datepicker
//= require bootstrap-dropdown
//= require bootstrap-wysihtml5

$(function() {
  $(".datepicker").datepicker();
  $(".dropdown-toggle").dropdown();

  $(".wysihtml5").each(function(i, elem) {
    $(elem).wysihtml5();
  });
});