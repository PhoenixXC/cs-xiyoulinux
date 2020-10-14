$('#op').click(function() {
    $("#v-aside").addClass("hidden");
    $("#v-main").removeClass("col-md-8");
    $("#v-main").addClass("col-md-12");
    $("#op-hide").removeClass("hidden");
});

$('#op-hide').click(function() {
    $("#op-hide").addClass("hidden");
    $("#v-aside").removeClass("hidden");
    $("#v-main").removeClass("col-md-12");
    $("#v-main").addClass("col-md-8");
});