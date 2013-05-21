// JavaScript Document

$(document).ready(function() {
	see_big2();
	$("a[rel^='prettyPhoto']").prettyPhoto({
		deeplinking : false,
		counter_separator_label : ' of ',
		gallery_markup : '',
		social_tools : '',
		slideshow : false,
		opacity : 0.29
	});
//	$('.shadow_img>div').each(function(){
//		var img = $(this).find('img').attr('src');
//			$(this).css({'background-image': 'url('+img+')'});
//		})
//	$('.see_big2>div').each(function(){
//		var img = $(this).find('img').attr('src');
//		$(this).css({'background-image': 'url('+img+')'});
//		})
	$('.see_big').hover(function(){
		$(this).find('.description').slideDown();
		$(this).find('.link_big').slideDown();
		}, function(){
		$(this).find('.description').slideUp();
		$(this).find('.link_big').slideUp();
		})
});
function see_big2(){
	$('.see_big2>div').find('a').hide();
	$('.see_big2>div').hover(function(){
		$(this).find('a').fadeIn('fast');
		}, function(){
			$(this).find('a').fadeOut('fast');
		})
	}
