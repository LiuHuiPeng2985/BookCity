$(function (){
    var index=0; //标记当前图片索引
    var f;
    dingshiqi()
    function dingshiqi(){
        f = setInterval(function (){
            if(index==$(".box-img").length-1){
                index=0;
                $(".box-img").css("opacity","0");
                $(".box-img").eq(index).css("opacity","1");
                $(".botton").css("background-color","#ccc")
                $(".botton").eq(index).css("background-color","#fff")
            }else {
                index++;
                $(".box-img").css("opacity","0");
                $(".box-img").eq(index).css("opacity","1");
                $(".botton").css("background-color","#ccc")
                $(".botton").eq(index).css("background-color","#fff")
            }
        },2000)
    }
    $(".box-left").click(function (){
        clearInterval(f);
        if (index==0){
            index=$(".box-img").length-1;
            $(".box-img").css("opacity","0");
            $(".box-img").eq(index).css("opacity","1");
            $(".botton").css("background-color","#ccc")
            $(".botton").eq(index).css("background-color","#fff")
            dingshiqi();
        }else {
            index--;
            $(".box-img").css("opacity","0");
            $(".box-img").eq(index).css("opacity","1");
            $(".botton").css("background-color","#ccc")
            $(".botton").eq(index).css("background-color","#fff")
            dingshiqi();
        }
    })
    $(".box-right").click(function (){
        clearInterval(f);
        if (index==$(".box-img").length-1){
            index=0;
            $(".box-img").css("opacity","0");
            $(".box-img").eq(index).css("opacity","1");
            $(".botton").css("background-color","#ccc")
            $(".botton").eq(index).css("background-color","#fff")
            dingshiqi();
        }else {
            index++;
            $(".box-img").css("opacity","0");
            $(".box-img").eq(index).css("opacity","1");
            $(".botton").css("background-color","#ccc")
            $(".botton").eq(index).css("background-color","#fff")
            dingshiqi();
        }
    })

    $(".botton").click(function (){
        clearInterval(f);
        var indexx=$(this).index();
        index=indexx;
        $(".box-img").css("opacity","0");
        $(".box-img").eq(index).css("opacity","1");
        $(".botton").css("background-color","#ccc")
        $(".botton").eq(index).css("background-color","#fff")
        dingshiqi();
    })
})