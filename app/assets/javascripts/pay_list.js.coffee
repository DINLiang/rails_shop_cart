#$(function()
#  {
#  show_cart_goods();
#  show_free_list();
#});
#var date = new Date();
#var free_goods_list = JSON.parse(localStorage.getItem('free_list'));
#var years=date.getFullYear();
#var months=date.getMonth()+1;
#var days=date.getDate();
#var hours=date.getHours();
#var minutes=date.getMinutes();
#var seconds=date.getSeconds();
#var show_date = years+'年'+((months < 10) ? "0" : "")  +months+'月'+((days < 10) ? "0" : "") + days+'日 '+((hours < 10) ? "0" : "") + hours+':'+((minutes < 10) ? "0" : "") + minutes+':'+((seconds < 10) ? "0" : "") + seconds;
#function show_free_list() {
#var html = '<tr>' + '<th id="oder">分类</th><th id="tag">名称</th><th id="amount">数量</th>';
#for(var i in free_goods_list) {
#html = html + '<tr>' + '<td>' + free_goods_list[i].sort +
#  '</td><td>' + free_goods_list[i].name +
#  '</td><td>' + free_goods_list[i].free_count +'</td>';
#}
#html = html +'</tr>';
#$("#free_lists").html(html);
#$("#time").html(show_date);
#}
#function clear_all(){
#localStorage.clear();
#}