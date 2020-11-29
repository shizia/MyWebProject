//减
function minus(num){
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)-1;
    if(count<1){
        alert("不能再减了，再减就没有啦！");
    }
    else{
        document.getElementsByName("amount")[num].value=count;
        var totals=parseFloat(prices*count);
        document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);//.toFixed(2)表示四舍五入，取2位小数点
        total();
    }
}
//增
function plus(num){
    var prices=document.getElementsByName("price")[num].value;
    var count=parseInt(document.getElementsByName("amount")[num].value)+1;
    document.getElementsByName("amount")[num].value=count;
    var totals=parseFloat(prices*count);
    document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);
    total();
}
//计算总额
function total(){
    var prices=document.getElementsByName("price");
    var count=document.getElementsByName("amount");
    var sum=0;
    for(var i=0; i<prices.length;i++){
       sum+=prices[i].value*count[i].value;
    }
    document.getElementById("totalPrice").getElementsByTagName("span")[0].innerHTML="¥" +sum.toFixed(2);
}
//结算
function accounts(){
var obj=document.getElementById("cartList").nextElementSibling;//.nextElementSibling表示下一个同辈元素
obj.style.display="block";
var str="您本次购买的商品信息好下：";
str+="<br/>白岩松：白说："+ document.getElementById("price0").innerHTML;
str+="<br/>岛上书店："+ document.getElementById("price1").innerHTML;
str+="<br/>商品总计："+document.getElementById("totalPrice").innerHTML;
obj.innerHTML=str;
}
//删除
function del(num){
var ocartList=document.getElementById("cartList");
var delObj=document.getElementsByName("price")[num].parentNode.parentNode;
ocartList.removeChild(delObj);
total();
} 