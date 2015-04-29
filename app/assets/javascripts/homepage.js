function get_cart_number(x)
{
        $.get("/get_cart_number?id=" + x +'.json' , function (data) {
            $('#cart_num').text(data)
        })


    //$.ajax({
    //    type: "get",
    //    url: "/homepage/get_cart_number?id=" + x,
    //    dataType: "json",
    //    success: function(data){
    //        if(data.success){
    //            $('#cart_num').text(data)
    //
    //        }
    //        else{
    //            $('#cart_num').text("出现问题" + data)
    //        }
    //    },
    //    //timeout: 1000
    //});
}

