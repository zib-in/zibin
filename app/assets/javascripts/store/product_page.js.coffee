$.fn.exists = ()->
	@length > 0
$.fn.limit = (limit, element)->
	$(this).on 'keyup focus', ()->
		setCount this, element
	setCount = (src, elem)->
		alert src
		chars = src.value.length
		if chars > limit
			src.value = src.value.substr(0, limit)
			chars = limit
		elem.html limit-chars
	setCount()
Details = 
	init: ()->
		onlyNumbers '#miktar'

		RadioButtons.init()

		OnIzleme.init()

		$('#renk').bind('valuechanged.rb', (event,value)->
			OnIzleme.changeProductColor value
			)

		Sekmeler.init()
		YaziTipi.init()

		width = if window.innerWidth > 0 then window.innerWidth else screen.width
		if width <= 1024
			options = ''
			for num in [15..50]
				options += "<option value='#{num}'>#{num}</option>"
			$('input[name^="buyukluk"]').each ()->
				name = $(this).attr 'name'
				$(this).parent().before "<select name='#{name}>#{options}</select>"
				$(this).parent().remove()
		else
			AsagiYukari.init()

		Buyukluk.init()

		$('#ana').css 'height', ($('#turuncu').height() + $('#turuncualt').height() - 70) + 'px'
		$('#geri, #geriana').hide() if $(window).width() < 1250
		$(window).resize ()->
			$('#ana').css 'height', ($('#turuncu').height() + $('#turuncualt').height() - 70) + 'px'
		$('#webfonts-tutucu .kapatdgm').click (e)->
			e.preventDefault();
			$('#webfonts-tasiyici').hide()

		$('#olcutablosudgm').click (e)->
			e.preventDefault()
			$('#olcutablosu-tasiyici').show()
		$('#olcutablosu .kapatdgm').click (e)->
			e.preventDefault()
			$('#olcutablosu-tasiyici').hide()
		$('#olcutablosu-tasiyici').click (e)->
			e.preventDefault()
			$(this).hide()
		$('#olcutablosu').click (e)->
			e.preventDefault()
			e.stopPropagation()

Sepet = 
	init: ()->
		onlyNumbers 'table input', 2
		RadioButtons.init()
		#SubOptions.init
		$('#mesaj').click (e)->
			e.preventDefault()
			$('#hedpakmesaj-tasiyici').show()
		$('#hedpakmesaj-tasiyici, #kaydet').click (e)->
			e.preventDefault()
			$('#hedpakmesaj-tasiyici').hide()
			if $('#hedpakmesaj-tasiyici textarea').val() is '' 
				$('#mesaj').html "Bir de kişisel mesajınızı ekleyin..." 
			else 
				$('#mesaj').html "Eklediğiniz mesajı düzenleyin..."
		$('#hedpakmesaj').click (e)->
			e.preventDefault()
			e.stopPropagation()
		$('#hedpakmesaj .kapatdgm').click (e)->
			e.preventDefault()
			$('#hedpakmesaj-tasiyici').hide()
		$('#minik_pak').click (e)->
			e.preventDefault()
			$('#hedpak-tasiyici').show()
		$('#hedpak-tasiyici').click (e)->
			e.preventDefault()
			$(this).hide()
		$('#hedpak-tasiyici .kapatdgm').click (e)->
			e.preventDefault()
			$('#hedpak-tasiyici').hide()
		$('#hedpak-onizleme').click (e)->
			e.preventDefault()
			$(this).parent().hide()
			e.stopPropagation()
		$('#yazitipi').click (e)->
			e.preventDefault()
			e.stopPropagation()	
			$('#webfonts-tasiyici').show().css 'overflow', 'visible'
		$('#webfonts').click (e)->
			e.preventDefault();
			e.stopPropagation();
		$('#webfonts').delegate 'a', 'click', (e)->
			e.stopPropagation()
			e.preventDefault()
			$holder = $('#webfonts-tutucu');
			id = $(this).attr('href').substring 1
			side = $holder.attr 'data-side'
			line = $holder.attr 'data-line'
			fontclass = $(this).parent().attr 'class'
			fontname = $(this).html()
			$('#yazitipi').html fontname
			$('#yazitipi').attr 'class', fontclass
			$('input[name="yazitipi"]').val id
			$('#hedpakmesaj textarea').attr 'class', fontclass
			$('#webfonts-tasiyici').hide()
		$('#webfonts-tutucu .kapatdgm').click (e)->
			e.preventDefault()
			e.stopPropagation()
			$('#webfonts-tasiyici').hide()
		$('#webfonts-tasiyici').click (e)->
			e.preventDefault()
			$(this).hide()
		$('#hedpakmesaj textarea').limit '42', $('#hedpakmesaj span')
		id = $('input[name="yazitipi"]').val()
		if id?
			fontclass = $("#webfonts a[href='##{id}']").parent().attr 'class'
			fontname = $("#webfonts a[href='##{id}']").html()
			$('#hedpakmesaj textarea').attr 'class', fontclass
			$('#yazitipi').attr 'class', fontclass
			$('#yazitipi').html fontname
Sekmeler = 
	init: ()->
		$('#detaylarSekme a:first').tab 'show';
		$('#detaylarSekme a').click((e)->
			e.preventDefault();
			if not $(this).parent().hasClass 'active'
				$(this).tab 'show';
				OnIzleme.turn();
			)
	switchTab: (name)->
		$('#detaylarSekme a[href="#'+ name + '"]').tab 'show';
RadioButtons = 
	init: ()->
		$('.radiobuttonlar').each(()->
			$element = $(this)
			value = $element.find('input').val();
			
			if value isnt ''
				RadioButtons.setValue '#' + $element.attr('id'), value 
			else
				RadioButtons.setValue '#' + $element.attr('id'), $element.find('button:first').attr('rel')
			
			$element.delegate "button", "click", (e)->
				e.preventDefault();
				value = $(this).attr('rel')
				$element.find('input').val value
				$element.find('.secili').remove()
				$(this).html "<div class='secili'></div>"
				$element.trigger 'valuechanged.rb', value;
			
			)
	setValue: (rb, value)->
		$(rb+' input').val value
		$(rb+' button').each(()->
			if $(this).attr('rel') is value
				$(this).html "<div class='secili'></div>"
			else
				$(this).html ""
			)
	getValue: (rb)->
		$(rb+' input').val()

Checkboxes =
	init: ()->
		$('.checkbox').delegate 'button', 'click', (e)->
			e.preventDefault()
			chk = "##{$(this).parent().attr id}"
			if Checkboxes.getValue is 'evet' then Checkboxes.setValue chk, 'hayir' else Checkboxes.setValue chk, 'evet'
	setValue: (chk, eh)->
		if $(chk + ' input').exists()
			$hidden = $(chk + ' input')
			$hidden.val(eh)
		if eh is 'evet' then $(chk + ' button').html "<div class='secili'></div>" else $(chk + ' button'). html ''
	getValue: (chk)->
		$(chk + ' input').val()
YaziTipi =
	titlenumbers: ["Bİrİncİ", "İkİncİ", "ÜÇÜncÜ"]
	init: ()->
		@setup "#on_taraf"
		@setup "#arka_taraf"
		@setupFontholder()
	setup: (taraf)->
		index = 0

		$(taraf + ' .yazitipleri input').each(()->
			value = $(this).val();
			YaziTipi.update taraf.substring(1).index, value, $('#webfonts a[href="#' + value + '"]').parent().attr('class'), $('#webfonts a[href="#' + value + '"]').html() if value?
			index++;
			)
		$(taraf + ' .yazitipleri').delegate('a', 'click', (e)->
			e.preventDefault()
			$holder = $ "#webfonts-tutucu"
			$index = $(this).parent().children('a').index(this)
			$('#webfonts-tutucu').attr 'data-side', OnIzleme.side
			$('#webfonts-tutucu').attr 'data-line', $index
			$holder.find('h2 i').html YaziTipi.titlenumbers[$index]
			$('#webfonts-tasiyici').show().css 'overflow', 'visible'
			)

	setupFontholder: ()->
		$('#webfonts-tasiyici').click ()->
			$(this).hide()
		$('#webfonts-tutucu').click (e)->
		 	e.stopPropagation();
		$('#webfonts').delegate('a', 'click', (e) ->
			e.stopPropagation()
			e.preventDefault()
			id = $(this).attr('href').substring 1
			holder = document.getElementById 'webfonts-tutucu'
			side = holder.getAttribute 'data-side'
			line = holder.getAttribute 'data-line'
			fontclass = $(this).parent().attr('class')
			fontname = $(this).html()
			YaziTipi.update side, line, id, fontclass, fontname
			$('#webfonts-tasiyici').hide()
			YaziRengi.checkPrice()
			)
	update: (side, line, id, fontclass, fontname)->
		$('#' + side + ' .yazitipleri input').eq(line).val id
		$('#' + side + ' .yazitipleri a').eq(line).html fontname
		OnIzleme.changeFont(line, fontclass, side)

YaziRengi =
	init: ()->
		@setup '#on_taraf'
		@setup '#arka_taraf'
	setup: (taraf)->
		$(taraf + ' .yazirenkleri select').each(()->
			$id = $(this).attr('id')
			$(this).CustomCB({startValue:22})

			$customCB = $('#' + $id);
			$customCB.bind('CustomCB.valChanged', $.proxy((e, val)->
					$id = $(this).attr('id')
					taraf = $('#'+$id).closest('.sekme-panel').attr('id')
					number = $('#'+$id).parent().children('div').index($('#'+$id))
					$hex = $('#'+$id).find('.rt-secenekler li[data-value="' + val + '"]').attr('data-hex')
					OnIzleme.changeColor(number, $hex, taraf)

					if $('#' + taraf + ' .yazi input').eq(number).val() isnt '' and $('#' + taraf + ' .yazitipleri input').eq(number).val() isnt ''
						YaziRengi.checkPrice();
				, this)
			)
			$id = $customCB.attr 'id'

			taraf = $('#'+$id).closest('.sekme-panel').attr 'id'
			number = $('#'+$id).parent().children('div').index($('#' + $id))
			$hex = $('#'+$id).find('.rt-secenekler li[data-value="' + $customCB.find('input').val() + '"]').attr('data-hex')
			OnIzleme.changeColor number, $hex, taraf
		)
	checkPrice: ()->
		alert 'Fiyata Bak!'		
AsagiYukari = 
	jump: 1
	min: 10
	max: 100
	init: ()->
		$('.asagiyukari').each(()->
			$(this).append '<a href="#" class="yukari"></a>'
			$(this).append '<a href="#" class="asagi"></a>'

			$(this).find('input').val(AsagiYukari.min) if $(this).find('input').val() is ''			
			$(this).delegate 'a', 'click', (e)->
				e.preventDefault()
				$control = $(this).parent()
				if $(this).hasClass 'yukari'
					AsagiYukari.up $control
				else
					AsagiYukari.down $control
			$(this).delegate 'input', 'keydown', (evt)->
				$control = $(this).parent()

				e = evt || window.event
				key = e.keyCode || e.which
				if not e.shiftKey and not e.altKey and not e.ctrlKey and ((key >= 48 and key <= 57) or (key >= 96 and key <= 105) or key in [8,9,13,35,36,37,38,39,40,45,46])
					if key is 38
						AsagiYukari.up $control
					else
						AsagiYukari.down $control if key is 40
				else
					e.returnValue = false
					e.preventDefault() if e.preventDefault
			$(this).find('input').blur(()->
				$(this).val AsagiYukari.min if $(this).val() < AsagiYukari.min
				$(this).val AsagiYukari.max if $(this).val() > AsagiYukari.max
				$(this).trigger "valuechanged.updown", $(this).val()

				)
			)
	up: ($control)->
		$input = $control.find('input')
		if $input.val() < AsagiYukari.max
			$input.val(parseInt($input.val()) + AsagiYukari.jump)
			$input.trigger 'valuechanged.updown', $input.val()
		else
			$input.val AsagiYukari.max
	down: ($control)->
		$input = $control.find('input')
		if $input.val() > AsagiYukari.min
			$input.val(parseInt($input.val()) - AsagiYukari.jump)
			$input.trigger "valuechanged.updown", $input.val()
		else
			$input.val AsagiYukari.min

Buyukluk = 
	init: ()->
		if $('#kontroller .asagiyukari').exists()
			$('.buyukluk').delegate 'div', 'valuechanged.updown', (e,value)->
				OnIzleme.changeSize $(this).parent().children('div').index(this), value+'px'
		else
			$('.buyukluk').delegate 'select', 'change', ()->
				OnIzleme.changeSize $(this).parent().children('select').index(this), $(this).val() + 'px'


OnIzleme =
	side:'on_taraf'
	el: $ '#onizleme'

	init: ()->
		if $('#detaylar').exists()
			@changeProductColor $('#renk input').val()
			$('#on_taraf .yazilar input').each ()->
				value = $(this).val()
				if value?
					$index = $('#on_taraf .yazilar').children('input').index $(this)
					$('#onizleme .on_taraf .resim p').eq($index).html value
			$('#arka_taraf .yazilar input').each ()->
				value = $(this).val()
				if value?
					$index = $('#arka_taraf .yazilar').children('input').index $(this)
					$('#onizleme .arka_taraf .resim p').eq($index).html value
			$('#on_taraf .buyukluk input').each ()->
				value = $(this).val()
				index = $('#on_taraf .buyukluk').children('div').index $(this).parent()

				if value? then OnIzleme.changeSize index, value + 'px', 'on_taraf' else OnIzleme.changeSize index, AsagiYukari.min + 'px', 'on_taraf'
			$('#arka_taraf .buyukluk input').each ()->
				value = $(this).val()
				index = $('#arka_taraf .buyukluk').children('div').index $(this).parent()
				if value? then OnIzleme.changeSize index, value + 'px', 'arka_taraf' else OnIzleme.changeSize index, AsagiYukari.min + 'px', 'arka_taraf'
			$('.yazilar').delegate 'input', 'keyup', ()->
				$number = $(this).parent().children('input').index this
				$("#onizleme .#{OnIzleme.side} .resim p").eq($number).html $(this).val()
			$('.yazilar').delegate 'input', 'blur', ()->
				$number = $(this).parent().children('input').index this
				YaziRengi.checkPrice if $("##{OnIzleme.side} .yazitipleri input").eq($number).val() isnt ''
		$('#degistir a').click $.proxy (e)->
				e.preventDefault()
				@turn()
			,this
		$('#kumasyuzu .on_taraf a').click $.proxy (e)->
				e.preventDefault()
				@turnFront()
			,this
		$('#kumasyuzu .arka_taraf a').click $.proxy (e)->
				e.preventDefault()
				@turnBack()
			,this
		if Modernizr.csstransforms is false or Modernizr.csstransitions is false
			$('#onizleme .ecaf resim').css 'z-index', '1'
			$('#onizleme .ecaf resim p').css('z-index', '2').css 'position', 'relative'
			$('#onizleme .arka_taraf').hide()
	changeFont: (number, fontclass, taraf)->
		t = taraf ? OnIzleme.side
		$("#onizleme .#{t} .resim p").eq(number).attr 'class', fontclass
	changeProductColor: (id)->
		$('#onizleme .on_taraf .resim').css('background-image', "/assets/store/renk/#{$('#onizleme').attr('class').split(' ')[0]}/on_taraf#{id}.png")
		$('#onizleme .arka_taraf .resim').css('background-image', "/assets/store/renk/#{$('#onizleme').attr('class').split(' ')[0]}/arka_taraf#{id}.png")
	changeColor: (number, color, taraf)->
		t = taraf ? OnIzleme.side
		$("#onizleme .#{t} .resim p").eq(number).css('color', color)
	changeSize: (number, size, taraf)->
		t = taraf ? OnIzleme.side
		$("#onizleme .#{t} .resim p").eq(number).css('font-size', size)
	turn: ()->
		if @side is 'on_taraf' then @turnBack() else @turnFront()
	turnBack: ()->
		if Modernizr.csstransforms is false or Modernizr.csstransitions is false
			$('#onizleme .on_taraf').hide()
			$('#onizleme .arka_taraf').show()
		else
			@el.addClass 'rotate180'
		$('#kumasyuzu .on_taraf').removeClass 'active'
		$('#kumasyuzu .arka_taraf').addClass 'active'
		Sekmeler.switchTab 'arka_taraf'
		@side = 'arka_taraf'
	turnFront: ()->
		if Modernizr.csstransforms is false or Modernizr.csstransitions is false
			$('#onizleme .on_taraf').show()
			$('#onizleme .arka_taraf').hide()
		else
			@el.removeClass('rotate180')
		$('#kumasyuzu .on_taraf').addClass('active')
		$('#kumasyuzu .arka_taraf').removeClass('active')
		Sekmeler.switchTab('on_taraf')
		@side = 'on_taraf'
onlyNumbers = (selector, number)->
	$(selector).keydown((evt)->
		$control = $(this);
		e = evt or window.event;
		key = e.keyCode or e.which;

		if !e.shiftKey and !e.altKey and !e.ctrlKey and key >= 48 and key <= 57 or key >= 96 and key <= 105 or key in [8,9,13,35,36,37,38,39,40,46,45]
			l = $control.val().length;
			if l >= number and ((key>=48 and key<=57) or (key>=96 and key<=105))
				e.returnValue = false
				e.preventDefault();
		else
			e.returnValue = false;
			e.preventDefault() if e.preventDefault
		)

if $('#detaylar').exists()
	Details.init();
	YaziRengi.init();
if $('#sepet').exists()
	Sepet.init()