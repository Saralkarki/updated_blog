
var myInput = document.getElementById("textbox");
$(function() {
    $(myInput).on('keydown', function(e) {
      if (e.keyCode == 9 || e.which == 9) {
        e.preventDefault();
        var s = this.selectionStart;
        $(this).val(function(i, v) {
          return v.substring(0, s) + "\t" + v.substring(this.selectionEnd)
        });
        this.selectionEnd = s + 1;
      }
    });
  });