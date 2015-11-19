$(function() {
  _app.modalContent = "<h3>Modal</h3><p>This is a modal.</p>";
  _app.modal = function(){
    $(".modal-content").html(_app.modalContent);
    $("#modal-1").prop("checked", true);
    $("body").addClass("modal-open");
  };
  _app.unmodal = function(){
    $("#modal-1").prop("checked", false);
    $("body").removeClass("modal-open");
  };

  $(".modal-fade-screen, .modal-close").on("click", _app.unmodal);

  $(".modal-inner").on("click", function(e) { e.stopPropagation(); });
});
