<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HTTP로 접근해서 https ajax 요청하는 샘플</title>
<link rel="stylesheet" href="http://localhost:8080/resources/bower_components/bootstrap/dist/css/bootstrap.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h3>테스트 개요</h3>
				<div class="well">
					1. http를 기준으로 이 페이지에 접속<br>
					2. ajax 통신을 https 프로토콜로 요청 시 이슈가 생기는가? <button id="load-product">ajax 요청하기</button><br>
					3. 현재 페이지에서 css나 js는 http로 요청되고 있는데, https로 이 페이지에 접근할 경우 문제가 생기는가?<br>
					(https -> http resource load)
					<a href="https://localhost:8443/">https로 접속하기</a>
				</div>
				<div class="ajax-loaded-container">
					
				</div>
				<div class="errors">
				
				</div>
			</div>
		</div>
	</div>
	<script src="http://localhost:8080/resources/bower_components/jquery/dist/jquery.js"></script>
	<script>
		(function($){
			var API_URL = 'https://localhost:8443/api/products';
			
			window.addEventListener('error', function(error){
				console.log(error);
				var errorMessageTemplate = '<div class="alert alert-danger"><strong>에러<strong>' + error.messgae + '</div>';
				document.querySelector('.errors').innerHTML = document.querySelector('.errors').innerHTML + errorMessageTemplate; 
			});
			
			function ajaxSuccessCallback(products){
				var html = ['<ul class="list-unstyled">'],
				i, product;
				for(i = 0; i < products.length; i++){
					product = products[i];
					
					html.push('<li>' + product.name + ' 가격:' + product.price + '</li>');
				}					
				html.push('</ul>');
				
				if(window.$){
					$('.ajax-loaded-container').html(html.join(''));	
				}else{
					document.querySelector('.ajax-loaded-container').innerHTML = html.join('');
				}			
			}
			
			function ajaxErrorCallback(err){
				alert('에러발생! ' + err.message);
			}
			if(window.$){
				$('#load-product').on('click', function(){
					$.ajax({
						url: API_URL,
						success: ajaxSuccessCallback,
						error: ajaxErrorCallback
					});
				});	
			}else{
				document.querySelector('#load-product').addEventListener('click', function(){
					var xhr = new XMLHttpRequest();
					xhr.open('GET', API_URL);
					console.log(xhr);
					xhr.onreadystatechange = function(){
						console.log(xhr);
						if(xhr.readyState == xhr.DONE){							
							ajaxSuccessCallback(xhr.response);
						}
					}
				});				
			}	
		})(window.jQuery);		
		
	</script>
</body>
</html>