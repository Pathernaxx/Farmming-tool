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
					alert('로케1 입력 성공!');
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
						alert('로케2 입력 성공!!');
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
			async : true,
			method : "POST",
			data : {
				location2 : selected1,
				fmNo : selected2
			},
			success : function(result) {
				if (!result) {
					alert('입력 실패!');
					console.log(data);
				} else { 
					alert('입력 성공!');
				}
			},
			error : function(xhr, status, error) {
				alert('입력이 에러');
			}
		});//ajax
		
	});
	
	
	location2Listener('#location2');
	machine1Listener('#machine1');
});