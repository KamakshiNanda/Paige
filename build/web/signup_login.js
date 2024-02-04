/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
	$('.message a').click(function()
	{
   	 $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	});
	});
        
        
        
/*$(document).ready(function() {
	$(".recaptcha_form").submit(function(event) {
		
		var recaptcha = $("#g-recaptcha-response").val();
		
		if(recaptcha === "")
		{
			event.preventDefault();
			alert("check recaptcha");
		}
		
		else
		{
			$(".custom_modal").show();
		}
		
		event.preventDefault();
		
		$.post("grecaptcha.php", {
				"secret":"6LfGEbQUAAAAAPj5Ze4KVHcaew21N40pDdDXcF3-",
				"response":recaptcha
		}, function(ajaxResponse) {
			console.log(ajaxResponse);
		});
		
	});
	
});*/

