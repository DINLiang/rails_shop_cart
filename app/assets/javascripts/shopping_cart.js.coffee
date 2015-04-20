#/**
# * Created by ding on 15-3-19.
# */
#//document.write("<script language='javascript' src='shopping_cart.js'></script>");
#$(function()
#  {
#  show_cart_goods();
#});
#function loadPromotions()
#{
#return [
#  {
#    type: 'BUY_TWO_GET_ONE_FREE',
#    barcodes:
#      [
#        'ITEM000000',
#        'ITEM000001',
#        'ITEM000005'
#      ]
#  }
#];
#}
#localStorage.setItem('free_goods', JSON.stringify(loadPromotions()));
#var promotion_goods = JSON.parse(localStorage.getItem('free_goods'));
#var show_list = JSON.parse(localStorage.getItem('goods_list'));
#function show_cart_goods()
#{
#var html = '<tr class="list_top"><th id="sort">分类</th><th id="name">名称</th><th id="price">单价（元）</th> <th id="unit">单位</th><th id="cart">数量</th><th id="count">小计</th></tr></thead>';
#html = html + '<tr>';
#var free_lists = [];
#var total = 0;
#var save_money = 0;
#var cart_num = 0;
#for(var k in show_list)
#  {
#  var btn_id = k.toString();
#var key_id = k.toString();
#show_list[k].free_count = 0;
#for (var j in promotion_goods[0].barcodes)
#{
#if (show_list[k].barcode == promotion_goods[0].barcodes[j])
#{
#show_list[k].free_count = Math.floor(show_list[k].count / 3);
#free_lists.push(show_list[k]);
#}
#}
#var subtotal = show_list[k].price * show_list[k].count;
#var new_subtotal = (show_list[k].count - show_list[k].free_count) * show_list[k].price;
#total+=new_subtotal;
#save_money += subtotal - new_subtotal;
#cart_num += show_list[k].count;
#if(new_subtotal === subtotal)
#{
#html = html + "<td>" + show_list[k].sort + "</td><td>" + show_list[k].name + "</td><td>" + show_list[k].price + "</td><td>" + show_list[k].unit + "</td><td>" +
#  '<div id="format">' + '<input type="button" id='+ btn_id +' value="-" onclick="reduce_good();jump_goods()" style = "background-color: white;height: 30px;width: 30px;;border-bottom-left-radius: 5px;border-top-left-radius: 5px;border:1px solid lightgray">' + '<input style="width: 35px;height:26px;text-align:center;border:1px solid lightgray" value=' + show_list[k].count + '><input type="button" id='+ key_id +' value="+" onclick="add_good();document.location.reload()" style = "background-color: white;height: 30px;width: 30px;;border-bottom-right-radius: 5px;border-top-right-radius: 5px;border:1px solid lightgray"></div>' + '</td><td>'+ subtotal + '元' + '</td>'
#}
#else {
#html = html + "<td>" + show_list[k].sort + "</td><td>" + show_list[k].name + "</td><td>" + show_list[k].price + "</td><td>" + show_list[k].unit + "</td><td>" +
#  '<div id="format">' + '<input type="button" id=' + btn_id + ' value="-" onclick="reduce_good();jump_goods()" style = "background-color: white;height: 30px;width: 30px;border-bottom-left-radius: 5px;border-top-left-radius: 5px;border:1px solid lightgray">' + '<input style="width: 35px;height:26px;text-align:center;border:1px solid lightgray" value=' + show_list[k].count + '><input type="button" id=' + key_id + ' value="+" onclick="add_good();document.location.reload()" style = "background-color: white;height: 30px;width: 30px;border-bottom-right-radius: 5px;border-top-right-radius: 5px;border:1px solid lightgray"></div>' + '</td><td>' + new_subtotal + '元' + '(原价: ' + subtotal + '元)' + '</td>'
#}
#html = html + '</tr>';
#}
#$('#lists').html(html);
#$('#sum').text(total+"元");
#$('#save').text(save_money+"元");
#$('#cart_num').text(cart_num);
#localStorage.setItem('free_list', JSON.stringify(free_lists));
#}
#function reduce_good() {
#var btn_id = parseInt(event.srcElement.id,0);
#if(show_list[btn_id].count >= 1) {
#show_list[btn_id].count--;
#}
#if(show_list[btn_id].count == 0) {
#show_list.splice(btn_id,1);
#}
#localStorage.setItem('goods_list', JSON.stringify(show_list));
#location.reload();
#}
#function add_good()
#{
#var key_id = parseInt(event.srcElement.id,0);
#var cart_goods = show_list[key_id];
#cart_goods.count ++;
#localStorage.setItem('goods_list', JSON.stringify(show_list));
#}
#function jump_goods(){
#console.log('dfd');
#var show_lists = JSON.parse(localStorage.getItem('goods_list'));
#if(show_lists.length == 0){
#location.href='../html_file/Goods_list.html';
#}
#}
