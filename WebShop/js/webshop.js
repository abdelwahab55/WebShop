function GetBooks() {
    jQuery.support.cors = true;
    $.ajax({
        url: 'api/bookapi',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            alert('Success');
        },
        error: function (x, y, z) {
            alert(x + '\n' + y + '\n' + z);
        }
    });
}