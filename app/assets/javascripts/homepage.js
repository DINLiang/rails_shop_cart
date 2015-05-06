function get_cart_number(x)
{
        $.get("/get_cart_number?id=" + x +'.json' , function (data) {
            $('#cart_num').text(data)
        })
}
function reduce_goods(x)
{
    $.get("/reduce_good?id=" + x , function(data){
        if(data[0] == 0){
            window.location = '/homepage/shopping_cart'
        }
        if(data[1] == 0){
            window.location = '/homepage/shop_list'
        }
        if(data[6] == 0 ){
            $('#cart_num').text(data[1])
            $('#' + data[0] + 'GoodNumber')[0].value = data[2];
            $('#' + data[0] + 'self_sum').text(data[3] + '元');
            $('#' + data[0] + 'save_sum').text(data[3] + '元');
            $('#sum').text(data[5] + '元');
        }
        else{
            $('#cart_num').text(data[1]);
            $('#' + data[0] + 'GoodNumber')[0].value = data[2];
            $('#' + data[0] + 'save_sum').text(data[4] + '元（原价' + data[3] + '元）');
            $('#' + data[0] + 'self_sum').text(data[4] + '元（原价' + data[3] + '元）');
            $('#sum').text(data[5] + '元');
        }
       })
}

function add_goods(x) {
    $.get("/add_goods?id=" + x ,function(data) {
        if( data[6] == 0 ){
            $('#cart_num').text(data[1]);
            $('#' + x + 'GoodNumber')[0].value = data[2];
            $('#' + x + 'save_sum').text(data[3] + '元');
            $('#' + x + 'self_sum').text(data[3] + '元');
            $('#sum').text(data[5] + '元');
        }
        else{
            $('#cart_num').text(data[1]);
            $('#' + x + 'GoodNumber')[0].value = data[2];
            $('#' + x + 'save_sum').text(data[4] + '元（原价' + data[3] + '元）');
            $('#' + x + 'self_sum').text(data[4] + '元（原价' + data[3] + '元）');
            $('#sum').text(data[5] + '元');
        }
    })
}

