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
	$('.shadow_img>div').each(function(){
		var img = $(this).find('img').attr('src');
			$(this).css({'background-image': 'url('+img+')'});
		})
	$('.see_big2>div').each(function(){
		var img = $(this).find('img').attr('src');
		$(this).css({'background-image': 'url('+img+')'});
		})
	$('.see_big').hover(function(){
		$(this).find('.description').slideDown();
		$(this).find('.link_big').slideDown();
		}, function(){
		$(this).find('.description').slideUp();
		$(this).find('.link_big').slideUp();
		})
		
		var html_caregory_panel = '';
	html_caregory_panel+='{@each categories as item,index}'+
	'<li><a href="/productsincategory?user_id=1&category_id=${item.id}">${item.name}&nbsp;&nbsp;</a>'+
	'{@if item.childCategories }<ul style="display: none; ">{@each item.childCategories as item1,index1}'+
	'<li><a href="/productsOfCategory2Front/1/${item1.id}">${item1.name}&nbsp;&nbsp;</a></li>'+
	'{@/each}</ul>{@/if}'+
	'</li>{@/each}';
	var tpl_caregory_panel=juicer(html_caregory_panel);
    $.ajax({//得到用户产品分类
		type: 'POST',
		url: '/userinfo/product/1',
		success:function(data){
		    $('#caregory_panel').html(tpl_caregory_panel.render(data));

		    $('#menu>ul>li').hover(function(){
				$(this).find('ul').eq(0).stop(true, true).slideDown('fast');
				},function(){
					$(this).find('ul').slideUp(100);
					}
			)
			
			$('#menu>ul>li>ul>li a').hover(function(){
				$(this).animate({'padding-left': 3}, 100);
				},function(){
					$(this).animate({'padding-left': 0}, 100);
					}
			
			)
			$('#menu>ul>li>ul>li').hover(function(){
				$(this).find('ul').slideDown('fast');
				},function(){
					$(this).find('ul').slideUp(100);
					}
			)
		    
		},
	  	error:function(){}
	});	
});
function see_big2(){
	$('.see_big2>div').find('a').hide();
	$('.see_big2>div').hover(function(){
		$(this).find('a').fadeIn('fast');
		}, function(){
			$(this).find('a').fadeOut('fast');
		})
	}
