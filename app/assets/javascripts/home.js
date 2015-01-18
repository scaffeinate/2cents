// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

this.show_voting = function(el) {
  $(el).parent().find('.col-md-1').find('.voting').toggle(100);
};

this.addCategory = function(e) {
  var category_name;
  e.preventDefault();
  $("#category_name").val($("#autocomplete_category_name").val());
  category_name = void 0;
  category_name = $("#category_name").serialize();
  return $.ajax({
    type: "POST",
    url: "/categories",
    data: category_name,
    dataType: "json"
  }).success(function(data) {
    var finalStr;
    finalStr = void 0;
    finalStr = "<label class=\"checkbox vsmall\" for=\"post_" + data.name + "\">" + "<input id=\"post_category_ids_\" name=\"post[category_ids][]\" type=\"checkbox\" value=\"" + data.id + "\" checked=\"true\">" + data.name + "</label>";
    $("#categories").append(finalStr);
    $("#autocomplete_category_name").val("");
    $("#autocomplete_category_name").autocomplete("close");
    return $("#category_name").val("");
  });
};

$(document).ready(function() {
  var category_exists;
  category_exists = false;
  return $("#autocomplete_category_name").autocomplete({
    minLength: 0,
    response: function(event, ui) {
      if (ui.content[0].value === "no existing match") {
        category_exists = false;
      } else {
        category_exists = true;
      }
    },
    open: function(event, ui) {
      if (!category_exists) {
        $(".ui-autocomplete").html("<li><a id=\"add_category\" href=\"#\" onclick=\"addCategory(event);\" class=\"ui-corner-all\" tabindex=\"-1\">Add " + $(this).val() + "</a></li>");
      }
    }
  });
});