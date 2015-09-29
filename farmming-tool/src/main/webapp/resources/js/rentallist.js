$(document).ready(function (){
	$("#location1").click(function(){
		selected1 = $("#location1 option:selected").val();
		if(selected1 == "" || selected1 == null){
			return;
		}
		$.ajax({
			url : "/farmingtool/rental/searchlocation2.action",
			async : true,
			method : "POST",
			data : {
				location1 : selected1
			},
			success : function(result) {
				if (!result) {
					alert('입력 실패!');
					console.log(data);
				} else { 
					$('#ac').empty();
					var se = $(result.substr(result.indexOf("<se")));
					$( "#ac" ).append(se);
					location2Listener('#location2');
					var list = result;
				}
			},
			error : function(xhr, status, error) {
				alert('입력이 에러');
			}
		});
	});
	
	function location2Listener(target){
		$(target).click(function(){
			selected1 = $("#location1 option:selected").val();
			selected2 = $("#location2 option:selected").val();
			if(selected2 == "" || selected2 == null){
				return;
			}
			$.ajax({
				url : "/farmingtool/rental/searchmachinebylocation.action",
				async : true,
				method : "POST",
				data : {
					location2 : selected2
				},
				success : function(result) {
					if (!result) {
						alert('입력 실패!');
						console.log(data);
					} else { 
						$("#ac2").empty();
						var di = $(result.substr(result.indexOf("<div")));
						$("#ac2").append(di);
						machine1Listener('#machine1');
					}
				},
				error : function(xhr, status, error) {
					alert('입력이 에러');
				}
			});
		});
	}
	
	function machine1Listener(target){
		$(target).click(function(){
			selected1 = $("#machine1 option:selected").val();
			if(selected1 == null || selected1 ==""){
				$('#machine2 option[class!="basic_type"]').css("display","none");
				$('#machine2 option[class="basic_type"]').css("display","block");
				$('#machine2 option[class="basic_type"]').attr("selected","selected");
				return;
			}
			if(selected1 != null){
				$('#machine2 option[class!='+selected1+']').css("display","none");
				$('#machine2 option[class='+selected1+']').css("display","block");
				$('#machine2 option[class="basic_type"]').attr("selected","selected");
			}
		})
	}
	
	$('#search').click(function(){
		alert("검색");
		
		selected1 = $("#location2 option:selected").val();
		selected2 = $("#machine2 option:selected").val();
		
		$.ajax({
			url : "/farmingtool/rental/searchmachine.action",
			async : false,
			method : "POST",
			data : {
				location2 : selected1,
				fmNo : selected2
			},
			success: function(dates) {//controller에서 results로 넘어오지만 사용은 dates로 할 것이다(보기 쉬워서)
				//기계소분류 총 대수
				if(dates != null){
					var eventData = new Array();
					
					$.each(dates, function(index, date){
						eventData.push({"date":date,"badge":false,"title":index});
					});
					
					$.ajax({
						url : "/farmingtool/rental/searchmachinecount.action",
						async : false,
						method : "POST",
						data : {
							location2 : selected1,
							fmNo : selected2
						},
						success : function(result){
							var data = result.split("@");
							if(data[0] <= 0){
								$("#totalDetailMachine").val("대여 가능한 기계가 없습니다.");
								return;
							}
							$("#totalDetailMachine").val(data[0]);//보유 대수 찍어주는 것
							$("#rentalCost").val(data[1]);//렌탈 가격 찍어주는 것
							/** 이거 어디서 처리해야하나... 이미 찍히는 것 같은데
							 * 
							 * 
							 *
							 * $(".fmNo").val(selected2);
							 * 
							 * 
							 *
							 *
							 */							
						},
						error : function(xhr, status, error) {
							alert('입력이 에러');
							console.log(error);
						}
					});
					
					$("#calendar-area").html('<div id="my-calendar" style="margin-top:20px"></div>');
					$("#my-calendar").zabuto_calendar({
						action: function () {
							return myDateFunction(this.id, false, selected1, selected2);
						},
						data: eventData,
						language: "ko",
						year: 2015,
						month: 9,
						show_previous: true,
						show_next: 12,
						cell_border: true,
						today: true,
						show_days: true,
						weekstartson: 0,
						nav_icon: {
							prev: '<i class="fa fa-chevron-circle-left"></i>',
							next: '<i class="fa fa-chevron-circle-right"></i>'
						}
					});
					
				}else{
					alert("success but exception");
	            }
			},
			error : function(xhr, status, error) {
				alert('입력이 에러');
				console.log(error);
			}
		});//ajax
		
	});
	
    
	location2Listener('#location2');
	machine1Listener('#machine1');
});