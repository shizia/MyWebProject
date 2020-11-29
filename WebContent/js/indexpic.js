/**
 * 
 */
var imgs=["img/pic1.png","img/pic2.png","img/pic3.png","img/pic4.png",
            "img/pic5.png","img/pic6.png","img/pic7.png"];
    var index=0;
    function change_pic(){
        document.getElementById("pic_change").src=imgs[index];
        index++;
        if(index >= 7){
            index=0;
        }
    }
setInterval("change_pic()",4000);