function main(){
 	$('.welcome').hide();
 	$('.welcome').fadeIn(400)
 	$('.pic').hide()
 	$('.pic').fadeIn(800)
 	$('.quote').hide()
 	$('.quote').fadeIn(1200)

	}
$(document).ready(main);
$(document).on('page:change', main);