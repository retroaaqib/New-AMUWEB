function populateScholars() {
    $("#content").html("<i class='fa fa-spinner fa-pulse'></i>");
    var dname = $("#dep option:selected").attr("id");    
    var request = $.ajax({
        url: "populatescholars.jsp",
        type: "POST",
        data: {"dname": dname}
    });
    request.done(function (msg) {
        $("#content").html(msg);
    });

    request.fail(function (jqXHR, textStatus) {
        alert("Request failed: " + textStatus);
    });
}

function populateScholarsf() {
    $("#contentf").html("<i class='fa fa-spinner fa-pulse'></i>");
    var pname = $("#faculty option:selected").attr("id");        
    var request = $.ajax({
        url: "populatescholarsf.jsp",
        type: "POST",
        data: {"pname": pname}
    });
    request.done(function (msg) {
        $("#contentf").html(msg);
    });

    request.fail(function (jqXHR, textStatus) {
        alert("Request failed: " + textStatus);
    });
}
