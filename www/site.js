  $(function() {
    $('#slides').slidesjs({
      width: 960,
      height: 300,
      navigation: {
            active: false,
            effect: "slide"
          },
      pagination:{
        active: false
      },
      play: {
        active: false,
        interval: 5000,
        auto: true
      }
    });
	
$('.footer ul.social li a').prepend('<span class="sicon"> </span>');
$('.footer ul.social li a').hover(function() {
$(this).find('.sicon').css("background-color","rgba(0,0,0,0.9)");
                },
				function() {
$(this).find('.sicon').css("background-color","rgba(0,0,0,0.2)");
                });
								
 $.fn.scrollToElm = function(offset){
    this.click(function(){
		if(!this.href) return false;
		var tName=this.href.substring(this.href.lastIndexOf('#')+1);
        var trg = $("[name='"+ tName +"']");
		if (trg.length ==0) trg = $("[id='"+ tName +"']");			
		$('html,body').animate({scrollTop: trg.offset().top-offset},1000,'easeInOutExpo');
        return false; 
    });    
};				
	
$('.scrollto').scrollToElm(60);


	$(window).scroll(function() { 
		
	if ($(this).scrollTop() > 150)
	{
	$('#toTop').fadeIn(300);
	return;
	}
	
	$('#toTop').fadeOut(300);
	
    });
	
	$('#toTop').hover(function() {$(this).fadeTo(300,1)},function() {$(this).fadeTo(300,0.25)});
	
$('#scrollToTop').click(function(ev){
$('html,body').animate({scrollTop:0},1000,'easeOutExpo');
});
	
				
});


