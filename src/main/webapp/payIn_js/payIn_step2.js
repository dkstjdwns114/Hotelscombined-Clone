$(function() {
    $('#payIn_step2_frm').on('submit', function(){

        const nameExp = /^[A-Za-z]*$/ ;
        const emailExp = /^[A-z|0-9]([A-z|0-9]*)(@)([A-z]*)(\.)([A-z]*)$/;

        if($('.require + .info_input > input').eq(0).val() == '' || !nameExp.test($('.require + .info_input > input').eq(0).val())){
            $('.require > b').eq(0).html('성을 입력하세요(영문)');
            $('.require > b').eq(0).css('color', 'rgb(187, 8, 8)');
            $('.require + .info_input > input').eq(0).css('border', '2px solid rgb(187, 8, 8)'); 
            $('.require + .info_input > input').eq(0).focus();
            return false;
        } else {
            $('.require + .info_input > input').eq(0).css('border', '2px solid rgb(23, 110, 67)'); 
        }
        if($('.require + .info_input > input').eq(1).val() == '' || !emailExp.test($('.require + .info_input > input').eq(1).val())) { 
            $('.require > b').eq(1).html('유효한 이메일 주소를 입력하세요');
            $('.require > b').eq(1).css('color', 'rgb(187, 8, 8)');
            $('.require + .info_input > input').eq(1).css('border', '2px solid rgb(187, 8, 8)'); 
            $('.require + .info_input > input').eq(1).focus();
            return false;
        } else {
                $('.require + .info_input > input').eq(1).css('border', '2px solid rgb(23, 110, 67)'); 
        }
            
        if($('.require + .info_input > input').eq(1).val() != '' && $('.require + .info_input > input').eq(1).val() != $('.require + .info_input > input').eq(2).val()) {
            $('.require > b').eq(2).html("'이메일 주소'와 '이메일 주소 확인'이 동일한지 확인하세요");
            $('.require > b').eq(2).css('color', 'rgb(187, 8, 8)');
            $('.require + .info_input > input').eq(2).css('border', '2px solid rgb(187, 8, 8)'); 
            $('.require + .info_input > input').eq(2).focus();
            return false;
        } else if ($('.require + .info_input > input').eq(1).val() != '' && $('.require + .info_input > input').eq(1).val() == $('.require + .info_input > input').eq(2).val()) {
            $('.require + .info_input > input').eq(2).css('border', '2px solid rgb(23, 110, 67)'); 
        }

        return true;
    });

    $('.require + .info_input > input').eq(0).on('keydown', function(){
        $('.require > b').eq(0).html('성(영문)');
        $('.require > b').eq(0).css('color', 'black');
        $('.require + .info_input > input').eq(0).css('border', '1px solid #AAA'); 
    });
    $('.require + .info_input > input').eq(1).on('keydown', function(){
        $('.require > b').eq(1).html('이메일 주소');
        $('.require > b').eq(1).css('color', 'black');
        $('.require + .info_input > input').eq(1).css('border', '1px solid #AAA'); 
    });    
    $('.require + .info_input > input').eq(2).on('keydown', function(){
        $('.require > b').eq(2).html('이메일 주소 확인');
        $('.require > b').eq(2).css('color', 'black');
        $('.require + .info_input > input').eq(2).css('border', '1px solid #AAA'); 
    });
})

$(function(){
    $('[name="book_for_whom"]').eq(0).on('click',function(){
        $('.book_for_other').css('display', 'none');
        $('.book_for_me').css('display', 'block');
    });
    $('[name="book_for_whom"]').eq(1).on('click',function(){
        $('.book_for_me').css('display', 'none');
        $('.book_for_other').css('display', 'block');
    });
})

