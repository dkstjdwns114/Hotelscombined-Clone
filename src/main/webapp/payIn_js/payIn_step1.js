
'use script';




function filter_submit(){
    let filter_destination = document.getElementById('filter_destination');
    let datepicker1 = document.getElementById('datepicker1');
    let datepicker2 = document.getElementById('datepicker2');
    let filter_business = document.getElementById('filter_business');
    let filter_null_warning = document.getElementsByClassName('filter_null_warning');


    if(filter_destination.value == ''){
        filter_null_warning[0].style.display = 'block';
        return false;
    }

    if(datepicker1.value == ''){
        filter_null_warning[1].style.display = 'block';
        return false;
    } 
    
    if(datepicker2.value == ''){
        filter_null_warning[2].style.display = 'block';
        return false;
    }    

    if(filter_business.checked == 'false'){
        filter_business.value = 'no';
    }

    return true;
}

function filter_back(){
    let filter_null_warning = document.getElementsByClassName('filter_null_warning');
    for(let i =0; i < filter_null_warning.length; i++){
        filter_null_warning[i].style.display = 'none';
    }
}

// <input type = "button" value="비슷한 호텔 보기"> 이거 뒤로 돌아가기인데 어디로 돌아가야 할 지 링크


function isRoomSelected() {
    let room_cnt = document.getElementsByClassName('room_cnt');
    const zero = 0;
    let room_selected = false;
    let num_room = document.getElementsByClassName('num_room');
    let arrow_box = document.getElementsByClassName('arrow_box');

    
    for(let i = 0; i < num_room.length; i++){
        if(zero != num_room[i].options.selectedIndex){
            room_selected = true;
        }

    }

    if(!room_selected){
        for(let i = 0; i < room_cnt.length; i++){
            room_cnt[i].style.transition = 'background-color ease-out 1s';
            room_cnt[i].style.backgroundColor ='#FFF0F0';
            
        }
        window.scroll({
            behavior: 'smooth',
            top: 1000
        });
        arrow_box[0].style.display = 'block';
        return false;
    }

    return true;
}


function selectRoomFirst() {
    const zero = 0;
    let num_room = document.getElementsByClassName('num_room');

    for(let i = 0; i < num_room.length; i++){
        if(zero != num_room[i].options.selectedIndex){
            return true;
        }       
    }

    return false;
}



$(function(){    
    $('.reservation').on('click', function(){
        if(isRoomSelected()){
            $('#user_info_form').submit();
        }
    });
})


$(function(){    
    $('.num_room').on('click', function(){
        for(let i = 0; i < $('.room_cnt').length; i++){
            $('.room_cnt').css('transition', 'none');
            $('.room_cnt').css('background', 'white');
            $('.arrow_box').css('display', 'none');
        }
    });
})

$(function(){
    $('#first_tt').on('mouseover', function(){
        if(!selectRoomFirst()){
            $('#first_tt-text').css('visibility','visible');
        }
    });
    $('#first_tt').on('mouseout', function(){
            $('#first_tt-text').css('visibility','hidden');
    });
    $('#second_tt').on('mouseover', function(){
        if(!selectRoomFirst()){
            $('#second_tt-text').css('visibility','visible');
        }
    });
    $('#second_tt').on('mouseout', function(){
            $('#second_tt-text').css('visibility','hidden');
    });   
    $('#third_tt').on('mouseover', function(){
        if(!selectRoomFirst()){
            $('#third_tt-text').css('visibility','visible');
        }
    });
    $('#third_tt').on('mouseout', function(){
            $('#third_tt-text').css('visibility','hidden');
    });   
})

$(function(){
    $('.num_room').on('change', function(){
        let isZero = true;
        $('.num_room').each(function(){
            if(this.options.selectedIndex != 0){
                isZero = false;
            }
        });
        $('.td_reservation').css('transition', 'background-color ease-out 1s');
        if(!isZero){
            $('.td_reservation').css('background', 'rgb(235, 243, 255)');
        } else {
            $('.td_reservation').css('background', 'white');
        }
    });
});


$(function(){
	$('.num_room').on('change',function(){
		let today_price = $('.today_price');
		let index = 0;
		let room_cnt = 0;
		let total = 0;
		$('.num_room').each(function(){
			total += today_price.eq(index).attr('title') * this.value;
			room_cnt += parseInt(this.value);
			index++;
		});
		
		if(room_cnt > 0){
			$('#current_room').css('display', 'block');
			$('.current_room_num > strong').html(room_cnt);
			$('.current_room_price').html('￦' + comma(total));
			$('.current_room_tax > span').html('￦' + comma(parseInt(total/10)));
		} else {
			$('#current_room').css('display', 'none');
		}
	});
})


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

// 여기가 사진
$(function(){
	$('.img_list').on('click', function(){
		$('.img_list').css('border', 'none');
		this.style.border = '4px solid rgb(0, 113, 194)';
	})
	$('.img_list > img').on('click', function(){
		let img_path = this.getAttribute("src");
		let img_num = this.getAttribute("imgNum");
		$('#main_img > img').attr("src", img_path);
		$('#main_img > img').attr("imgNum", img_num);
	})
	
})



$(function(){
	$('#prev_img_btn').on('click',function(){	
		let main_img_path = $('#main_img > img').attr("src");
		let main_img_num = $('#main_img > img').attr("imgNum");

		if(main_img_num > 1){
			$('.img_list > img').each(function(){
				$('.img_list').css('border', 'none');
				if(this.getAttribute('imgNum') == (main_img_num - 1)){
					$('#main_img > img').attr("src", this.getAttribute('src'));
					$('#main_img > img').attr("imgNum", (main_img_num - 1));
				}
			});
			$('.img_list').eq(main_img_num-2).css('border', '4px solid rgb(0, 113, 194)');
		}
	})
})	
	
	
$(function(){
	$('#next_img_btn').on('click',function(){	
		let main_img_path = $('#main_img > img').attr("src");
		let main_img_num = $('#main_img > img').attr("imgNum");
		let leng = $('.img_list');
		if(main_img_num  < leng.length){
			$('.img_list > img').each(function(){
				$('.img_list').css('border', 'none');
				if(this.getAttribute('imgNum') == (Number(main_img_num) + 1)){
					$('#main_img > img').attr("src", this.getAttribute('src'));
					$('#main_img > img').attr("imgNum", (Number(main_img_num) + 1));					
				}
			});
			if((Number(main_img_num) + 1) >= leng.length){
				$('.img_list').eq(leng.length - 1).css('border', '4px solid rgb(0, 113, 194)');
			} else {
				$('.img_list').eq(Number(main_img_num)).css('border', '4px solid rgb(0, 113, 194)');
			}
		}
	})
})	
	


