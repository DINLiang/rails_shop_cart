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
function reduce_goods(x)
{
    $.get("/reduce_good?id=" + x + '.json', function(data,sum){
        $('#cart_num').text(data)
        //$('#').text(sum)
       })
}
//function add_goods(x) {
//    $.get("/homepage/add_goods?id=" + x + '.json'
//        //$('#cart_num').text(data)
//    )
//}

