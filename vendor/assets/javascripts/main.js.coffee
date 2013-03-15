$.fn.exists = () ->
	this.length > 0;
Slider = 
	slide: $('#slider .active').index(),
	init: () ->
		@setWidthContainers();
		$(window).resize () ->
			Slider.setWidthContainers()
		window.onorientationchange = () ->
			Slider.setWidthContainers()
		$('#baslangic').click (e)->
			e.preventDefault();
			Slider.slideForward()
		$('#geriana').click (e)->
			e.preventDefault();
			Slider.goBack();
		if @slide == 1
			$('#slider').css 'margin-left', '-' + $('#turuncu').width() + 'px';
			$('#icerik_baslangic').show();
	setWidthContainers: ()->
		$('#slider').removeClass 'wrap';
		$cAna = $('#tasiyici_anasayfa');
		$cBaslangic = $('#tasiyici_baslangic');

		if $('body').width() > 979
			$cAna.width $('#turuncu').width();
			$cBaslangic.width $('#turuncu').width();
		else 
			$cAna.width $('body').width();
			$cBaslangic.width $('body').width();
		$('#slider').css 'margin-left', '-' + $('#turuncu').width() + 'px' if @slide isnt 0
	slideForward: ()->
		$('#tasiyici_baslangic').show();
		$('#slider').animate {marginLeft: '-' + $('#turuncu').width()}, 500, ()->
			Slider.slide++;
			$('#geriana').show();
	goBack: ()->
		$('#geriana').hide();
		$('#slider').animate {marginLeft:0}, 500, ()->
			Slider.slide--;
Assets =
	positioning: ()->
		$('li.birinci').css 'margin-top', '235px';
		$('li.ikinci').css 'margin-top', '225px';
		$('li.ucuncu, li.dorduncu').css 'margin-top', '215px';
		$('li.besinci').css 'margin-top', '225px';
		$('li.altinci').css 'margin-top', '235px';
Index = 
	init: ()->
		Slider.init();
		Assets.positioning();
		@startSlidingPhotos();
		$('#anasayfa_yazi').css 'background-size', 'contain' if not Modernizr.backgroundsize
		$('.sosikon').click (e)->
			e.preventDefault();
	startSlidingPhotos: ()->
		setInterval ()->
			$('#resimler_tasiyici img').eq(4).animate {opacity:0}, 1000, 'swing', ()->
				$('#resimler_tasiyici img').eq(4).prependTo('#resimler_tasiyici').css 'opacity', 1
		,3000
Index.init() if $('#slider').exists()