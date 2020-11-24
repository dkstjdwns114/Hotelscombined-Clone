
//$(document).ready(function() { 
//	alert(price); 
//});


function comma(num){
    var len, point, str;  
       
    num = num + "";  
    point = num.length % 3 ;
    len = num.length;  
   
    str = num.substring(0, point);  
    while (point < len) {  
        if (str != "") str += ",";  
        str += num.substring(point, point + 3);  
        point += 3;  
    }  
     
    return str;
 
}

const changePrice = function(price, total) {
	let html1 = "￦" + comma(total);
	let html2 = "￦" + comma(price);
	let html3 = "￦" + comma(total - price);
	//console.log(html1);
	$('#room_price_before').html(html1);
	$('#coupon_price').html(html2);
	$('#calPrice').html(html3);
}

$(document).ready(function(){
	let html1 = "￦" + comma(defaultTotal);
	let html2 = "￦" + 0;
	let html3 = "￦" + comma(defaultTotal);

	$('#room_price_before').html(html1);
	$('#coupon_price').html(html2);
	$('#calPrice').html(html3);
});

$(function(){
    $('#select_nation').on('change', function(){
        let nationNum = 0;       
        switch(this.value){
            case "대한민국":
                nationNum = 82;
                break;
            case "미국":
                nationNum = 1;
                break;
            case "중국":
                nationNum = 86;
                break;
            case "일본":
                nationNum = 81;
                break;
            case "러시아":
                nationNum = 7;
                break;
            case "영국":
                nationNum = 44;
                break;
            case "칠레":
                nationNum = 56;
                break;
        }
        $('[name="user_ph"]').val(nationNum);
        $('.require > b').eq(1).html('전화번호(가능한 경우 핸드폰)');
        $('.require > b').eq(1).css('color', 'black');
        $('.require + .info_input > input').css('border', '1px solid #AAA'); 
    });
})

$(function(){
    $('#payIn_step3_frm').on('submit', function(){
        const hpExp = /^[0-9]{9,}$/ ;

        if(!hpExp.test($('[name="user_ph"]').val())){
            $('.require > b').eq(1).html('유효한 전화번호를 입력해주세요.');
            $('.require > b').eq(1).css('color', 'rgb(187, 8, 8)');
            $('.require + .info_input > input').css('border', '2px solid rgb(187, 8, 8)'); 
            $('.require + .info_input > input').focus();
            return false;           
        } else {
            $('.require + .info_input > input').css('border', '2px solid rgb(23, 110, 67)'); 
        }
        return true;
    });

    $('.require + .info_input > input').on('keydown', function(){
        $('.require > b').eq(1).html('전화번호(가능한 경우 핸드폰)');
        $('.require > b').eq(1).css('color', 'black');
        $('.require + .info_input > input').css('border', '1px solid #AAA'); 
    });

})

$(function(){
    $('#promo_btn').on('click', function(){       
        const promoExp = /^[A-z0-9]{20}$/;
        if(!promoExp.test($('[name="user_promo_code"]').val())){            
            $('#promo_code_box > p').html('유효한 코드번호를 입력해주세요.');
            $('#promo_code_box > p').css('color', 'rgb(187, 8, 8)');
            $('#promo_code_box > p').css('font-weight', 'bold');
            $('[name="user_promo_code"]').css('border', '2px solid rgb(187, 8, 8)'); 
            $('[name="user_promo_code"]').focus();
            return false;           
        } else {
            if($('[name="user_promo_code"]').val() != ''){
                $('#promo_code_box > p').html('유효한 코드번호입니다.');
                $('#promo_code_box > p').css('color', 'rgb(23, 110, 67)');
                $('#promo_code_box > p').css('font-weight', 'bold');
                $('[name="user_promo_code"]').css('border', '2px solid rgb(23, 110, 67)'); 
            }
        }
    });

    $('[name="user_promo_code"]').on('keydown', function(){
        $('#promo_code_box > p').html('Booking.com에서 받은 프로모션 코드를 입력하세요');
        $('#promo_code_box > p').css('color', 'black');
        $('#promo_code_box > p').css('font-weight', 'normal');
        $('[name="user_promo_code"]').css('border', '1px solid #AAA'); 
    });
})


