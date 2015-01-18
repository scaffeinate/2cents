$(document).ready(function() {
  return $("#autocomplete_category_name").bind("railsAutocomplete.select", function(event, data) {
    var finalStr;
    if (data.item.value !== "no existing match") {
      finalStr = "<label class=\"checkbox vsmall\" for=\"post_" + data.item.value + "\">" + "<input id=\"post_category_ids_\" name=\"post[category_ids][]\" type=\"checkbox\" value=\"" + data.item.id + "\" checked=\"true\">" + data.item.value + "</label>";
      $("#categories").append(finalStr);
      return $(this).val("");
    }
  });
});
