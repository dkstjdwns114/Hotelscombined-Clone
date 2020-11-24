"use strict";
// 모든 숙소를 한 눈에 비교하세요
$(function () {
  for (let i = 1; i <= 15; i++) {
    $(`#openLinks_${i} a`).on("click", function (e) {
      if ($(this).hasClass("on")) {
        $(`#icon_${i}`).css("transform", "none");
        $(this).add(`#links_${i}`).removeClass("on");
        $(this).add(`#click_${i}`).removeClass("on");
      } else {
        $(`#icon_${i}`)
          .css("transform", "rotateX(180deg)")
          .css("transition", "transform 250ms ease");
        $(this).add(`#links_${i}`).addClass("on");
        $(this).add(`#click_${i}`).addClass("on");
        e.stopPropagation();
      }
    });
  }
});

$(function() {
	$('input[type="text"]').keydown(function() {
		  if (event.keyCode === 13) {
		    event.preventDefault();
		  };
		});
});
// FAQ
$(function () {
  for (let i = 1; i <= 15; i++) {
    $(`#openFAQ_${i} a`).on("click", function (e) {
      if ($(this).hasClass("onFAQ")) {
        $(`#FAQicon_${i}`).css("transform", "none");
        $(this).add(`#FAQAnswer_${i}`).removeClass("onFAQ");
        $(this).add(`#FAQ_${i}`).removeClass("onFAQ");
      } else {
        $(`#FAQicon_${i}`)
          .css("transform", "rotateX(180deg)")
          .css("transition", "transform 250ms ease");
        $(this).add(`#FAQAnswer_${i}`).addClass("onFAQ");
        $(this).add(`#FAQ_${i}`).addClass("onFAQ");
        e.stopPropagation();
      }
    });
  }
});
//객실 수 인원수
$(function () {
  $('#roomGuest').on("click", function(e){
    if(!$("#insert_location").hasClass("onbox")){
      $(this).add("#roomGuest_box").toggleClass("on");
      e.stopPropagation();
    }else{
      $('#insert_location').removeClass("onbox");
    }
  });
    
});
// 호텔 검색
$(function() {
	  $("#location").on('change keyup paste',function(){
	    let locationBox = $("#location").val();
	        $("#locationText").text(locationBox);
	        $("#locationText").val(locationBox);
	  });
	})
$(function() {
  $("#search_location").on('click', function(e){
    if(!$("#roomGuest_box").hasClass("on")){
      if (!$(this).hasClass("on")) {
        $(this).add("#insert_location").addClass("onbox");
        e.stopPropagation();
      }
    }else{
      $('#roomGuest_box').removeClass("on");
    }
  });
});



//  remove div 태그
$(function(){
  $("body").on('click', function(e){
    if( !$('#roomGuest_box').has(e.target).length ){
      $('#roomGuest_box').removeClass("on");
      e.stopPropagation();
    }
    if( !$('#insert_location').has(e.target).length ){
      $('#insert_location').removeClass("onbox");
      e.stopPropagation();
    }
  });
});


// increase decrease Btn
$(function(){
  const numbers = {
    roomsNum : Number($("#rooms").val()),
    adultsNum : Number($("#adults").val()),
    childrenNum : Number($("#children").val())
  }
  $(".numPlus").on('click', function(e){
    if($(this).hasClass("roombtn")){
      numbers.roomsNum++;
      if(numbers.roomsNum < 9 && numbers.roomsNum > 0){
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        $("#room_guest").val(`객실${numbers.roomsNum}개, 투숙객${numbers.adultsNum+numbers.childrenNum}명`);
      }
    }else if($(this).hasClass("adultsbtn")){
      numbers.adultsNum++;
      if(numbers.adultsNum <= 40 && numbers.adultsNum > 0){
      $("#adults").val(numbers.adultsNum);
      }
      switch(numbers.adultsNum){
        case 10 : numbers.roomsNum++;
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        break;
        case 20 : numbers.roomsNum++;
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        break;
        case 30 : numbers.roomsNum++;
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        break;
        case 40 : numbers.roomsNum++;
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        break;
      }
    }else if($(this).hasClass("childrenbtn")){
      numbers.childrenNum++;
      if(numbers.childrenNum < 20 && numbers.childrenNum >= 0){
      $("#children").val(numbers.childrenNum);
      }
    }
    $("#guestcnt").text(numbers.adultsNum+numbers.childrenNum);
    $("#room_guest").val(`객실${numbers.roomsNum}개, 투숙객${numbers.adultsNum+numbers.childrenNum}명`);
  });

  $(".numMinus").on('click', function(e){
    if($(this).hasClass("roombtn")){
      numbers.roomsNum--;
      if(numbers.roomsNum < 9 && numbers.roomsNum > 0){
        $("#rooms").val(numbers.roomsNum);
        $("#roomscnt").text(numbers.roomsNum);
        $("#room_guest").val(`객실${numbers.roomsNum}개, 투숙객${numbers.adultsNum+numbers.childrenNum}명`);
      }
    }else if($(this).hasClass("adultsbtn")){
      numbers.adultsNum--;
      if(numbers.adultsNum > 0){
        $("#adults").val(numbers.adultsNum);
        }
    }else if($(this).hasClass("childrenbtn")){
      numbers.childrenNum--;
      if(numbers.childrenNum >= 0){
        $("#children").val(numbers.childrenNum);
        }
    }
    $("#guestcnt").text(numbers.adultsNum+numbers.childrenNum);
    $("#room_guest").val(`객실${numbers.roomsNum}개, 투숙객${numbers.adultsNum+numbers.childrenNum}명`);
  });
});

// img nextBtn
  let imgcnt = 0;
const next = function() {
  imgcnt++;
  if(imgcnt === 11){imgcnt = 0;}
  $(`.main_content_1`).attr("src",`../xm_images/Skybay_Hotel${imgcnt}.jpg`);
  $(`.main_content_2`).attr("src",`../xm_images/Skybay_Hotel${imgcnt}.jpg`);
  $(`.main_content_3`).attr("src",`../xm_images/St_John_Hotel${imgcnt}.jpg`);
  $(`.main_content_4`).attr("src",`../xm_images/St_John_Hotel${imgcnt}.jpg`);
  $(`.main_content_5`).attr("src",`../xm_images/Nine_Tree_Premier${imgcnt}.jpg`);
  $(`.main_content_6`).attr("src",`../xm_images/Nine_Tree_Premier${imgcnt}.jpg`);
  $(`.main_content_7`).attr("src",`../xm_images/Glad_Hotel_Mapo${imgcnt}.jpg`);
  $(`.main_content_8`).attr("src",`../xm_images/Glad_Hotel_Mapo${imgcnt}.jpg`);
  $(`.main_content_9`).attr("src",`../xm_images/LOTTE_CITY_HOTEL_MYEONGDONG${imgcnt}.jpg`);
  $(`.main_content_10`).attr("src",`../xm_images/LOTTE_CITY_HOTEL_MYEONGDONG${imgcnt}.jpg`);
  $(`.main_content_11`).attr("src",`../xm_images/GLAD_Gangnam_COEX_center${imgcnt}.jpg`);
  $(`.main_content_12`).attr("src",`../xm_images/GLAD_Gangnam_COEX_center${imgcnt}.jpg`);
  $(`.main_content_13`).attr("src",`../xm_images/Shilla_Stay_Seocho${imgcnt}.jpg`);
  $(`.main_content_14`).attr("src",`../xm_images/Shilla_Stay_Seocho${imgcnt}.jpg`);
  $(`.main_content_15`).attr("src",`../xm_images/Shilla_Stay_Haeundae${imgcnt}.jpg`);
  $(`.main_content_16`).attr("src",`../xm_images/Shilla_Stay_Haeundae${imgcnt}.jpg`);
  $(`.main_content_17`).attr("src",`../xm_images/Paradise Hotel Busan${imgcnt}.jpg`);
  $(`.main_content_18`).attr("src",`../xm_images/Paradise Hotel Busan${imgcnt}.jpg`);
  $(`.main_content_19`).attr("src",`../xm_images/Lavalse_hotel_busan${imgcnt}.jpg`);
  $(`.main_content_20`).attr("src",`../xm_images/Lavalse_hotel_busan${imgcnt}.jpg`);
  $(`.main_content_21`).attr("src",`../xm_images/Ramada_Encore_Haeundae${imgcnt}.jpg`);
  $(`.main_content_22`).attr("src",`../xm_images/Ramada_Encore_Haeundae${imgcnt}.jpg`);
  $(`.main_content_23`).attr("src",`../xm_images/Amanti_Seoul_Hotel${imgcnt}.jpg`);
  $(`.main_content_24`).attr("src",`../xm_images/Amanti_Seoul_Hotel${imgcnt}.jpg`);

}
const prev = function() {
  imgcnt--;
  if(imgcnt === -1) {imgcnt = 10;}
  if(imgcnt === 11){imgcnt = 0;}
  $(`.main_content_1`).attr("src",`../xm_images/skybay${imgcnt}.jpg`);
  $(`.main_content_2`).attr("src",`../xm_images/skybay${imgcnt}.jpg`);
  $(`.main_content_3`).attr("src",`../xm_images/St_John_Hotel${imgcnt}.jpg`);
  $(`.main_content_4`).attr("src",`../xm_images/St_John_Hotel${imgcnt}.jpg`);
  $(`.main_content_5`).attr("src",`../xm_images/Nine_Tree_Premier${imgcnt}.jpg`);
  $(`.main_content_6`).attr("src",`../xm_images/Nine_Tree_Premier${imgcnt}.jpg`);
  $(`.main_content_7`).attr("src",`../xm_images/Glad_Hotel_Mapo${imgcnt}.jpg`);
  $(`.main_content_8`).attr("src",`../xm_images/Glad_Hotel_Mapo${imgcnt}.jpg`);
  $(`.main_content_9`).attr("src",`../xm_images/LOTTE_CITY_HOTEL_MYEONGDONG${imgcnt}.jpg`);
  $(`.main_content_10`).attr("src",`../xm_images/LOTTE_CITY_HOTEL_MYEONGDONG${imgcnt}.jpg`);
  $(`.main_content_11`).attr("src",`../xm_images/GLAD_Gangnam_COEX_center${imgcnt}.jpg`);
  $(`.main_content_12`).attr("src",`../xm_images/GLAD_Gangnam_COEX_center${imgcnt}.jpg`);
  $(`.main_content_13`).attr("src",`../xm_images/Shilla_Stay_Seocho${imgcnt}.jpg`);
  $(`.main_content_14`).attr("src",`../xm_images/Shilla_Stay_Seocho${imgcnt}.jpg`);
  $(`.main_content_15`).attr("src",`../xm_images/Shilla_Stay_Haeundae${imgcnt}.jpg`);
  $(`.main_content_16`).attr("src",`../xm_images/Shilla_Stay_Haeundae${imgcnt}.jpg`);
  $(`.main_content_17`).attr("src",`../xm_images/Paradise Hotel Busan${imgcnt}.jpg`);
  $(`.main_content_18`).attr("src",`../xm_images/Paradise Hotel Busan${imgcnt}.jpg`);
  $(`.main_content_19`).attr("src",`../xm_images/Lavalse_hotel_busan${imgcnt}.jpg`);
  $(`.main_content_20`).attr("src",`../xm_images/Lavalse_hotel_busan${imgcnt}.jpg`);
  $(`.main_content_21`).attr("src",`../xm_images/Ramada_Encore_Haeundae${imgcnt}.jpg`);
  $(`.main_content_22`).attr("src",`../xm_images/Ramada_Encore_Haeundae${imgcnt}.jpg`);
  $(`.main_content_23`).attr("src",`../xm_images/Amanti_Seoul_Hotel${imgcnt}.jpg`);
  $(`.main_content_24`).attr("src",`../xm_images/Amanti_Seoul_Hotel${imgcnt}.jpg`);

}





//auto

window.onload =function(){
const availableCity = [
  {name : "서울, 대한민국",sub : "도시", icon:"globe-asia"},
  {name : '서울 올림픽 파크텔',sub : "서울, 대한민국", icon:"bed"},
  {name : '서울 해밀톤 호텔',sub : "서울, 대한민국", icon:"bed"},
  {name : '서울 중심지, 서울, 대한민국',sub : "랜드마크", icon:"archway"},
  {name : '서울 브라운 스위트 레지던스',sub : "서울, 대한민국", icon:"bed"},
  {name : '서울 로프트 아파트먼트',sub : "서울, 대한민국", icon:"bed"},
  {name : '부산, 대한민국',sub : "도시", icon:"globe-asia"},
  {name : '부산 중심지, 대한민국',sub : "랜드마크", icon:"archway"},
  {name : '강릉, 대한민국',sub : "도시", icon:"globe-asia"},
  {name : '부산진구, 부산, 대한민국',sub : "행정구역", icon:"globe-asia"},
  {name : '부산 아벤트리 호텔',sub : "부산, 대한민국", icon:"bed"},
  {name : '부산광안리 오션투헤븐',sub : "부산, 대한민국", icon:"bed"},
  {name : '부산역, 부산, 대한민국',sub : "랜드마크", icon:"archway"},
  {name : '부산 송도해수욕장, 부산, 대한민국',sub : "랜드마크", icon:"archway"},
];

const locationInput = document.getElementById('location');
const locationText = document.getElementById('locationText');
console.log(locationText)
const optionsList = document.querySelectorAll(".option");
const resultBox = document.getElementById('result_box');
const insertLocation = document.getElementsByClassName('insert_location')
const option =document.getElementsByClassName('option')

locationInput.onkeyup= (e) =>{
    let userData = e.target.value;
    let emptyArray = [];
    if(userData){
      emptyArray = availableCity.filter((data) => {
        return data.name.toLocaleLowerCase().startsWith(userData.toLocaleLowerCase());
      });
      emptyArray = emptyArray.map((data) => {
        
        return data = `<li>
                          <div><i class="fas fa-${data.icon} findIcon"></i></div>
                          <div class="option">
                              <div >${data.name}</div>
                              <div class="sub_location">${data.sub}</div>
                          </div>
                      </li>`;
      });
      // locationInput.classList.add('active');
      showSuggestions(emptyArray);
      let allList = resultBox.querySelectorAll(".option");
      for (let i = 0; i < allList.length; i++) {
        allList[i].addEventListener('click', function(e){
          let selectUserData = e.target.textContent;
          console.log(selectUserData);
          locationInput.value = selectUserData;
          locationText.innerText = selectUserData;
          locationText.value = selectUserData;
          });
        
      }
     
    }
    
}




function showSuggestions(list){
  let listData;
  if(!list.length){
    let userValue = locationInput.value;
    listData = `<li >
                    <div><i class="fas fa-building findIcon"></i></div>
                    <div class="option">
                        <div>${userValue}</div>
                        <div class="sub_location">도시</div>
                    </div>
                </li>`;
  }else{
    listData = list.join('');
  }
  console.log(resultBox.innerHTML);
  resultBox.innerHTML = listData;
}

};

const sendit = function () {
	const date1 = document.getElementById("datepicker1");
	const date2 = document.getElementById("datepicker2");
	  if (date1.value == "" || date1.value == null) {
	    alert("날짜를 입력하세요.");
	    date1.focus();
	    
	    return false;
	  }
	  if (date2.value == "" || date2.value == null) {
		    alert("날짜를 입력하세요.");
		    date2.focus();
		    return false;
		  }
	  if (date1.value >  date2.value) {
		    alert("날짜를 다시 선택하세요.");
		    date2.focus();
		    return false;
		  }
	  if (date1.value ==  date2.value) {
		  alert("날짜를 다시 선택하세요.");
		  date2.focus();
		    return false;
		  }
	  return true;
	};


