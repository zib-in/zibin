root = exports ? this
$.extend
	keys: (obj)->
		a = []
		$.each obj, (k)->
			a.push k
		a
if !Array.indexOf
	Array.prototype.indexOf = (obj)->
		(return _i if i is obj) for i in this
		-1
if !Array.find_matches
	Array.find_matches = (a)->
		m = []
		a = a.sort()
		i = a.length
		while i--
			m.push(a[i]) if a[i-1] is a[i]
		if m.length is 0
			return false
		m
root.VariantOptions = (params) ->
	options = params['options']
	i18n = params['i18n'];
	allow_backorders = !params['track_inventory_levels'] ||  params['allow_backorders'];
	allow_select_outofstock = params['allow_select_outofstock'];
	default_instock = params['default_instock'];

	selection = []
	$rbs = $fss = ""
	variant = 0
	init = ()->
		$rbs = $('.radiobuttonlar')
		$fss = $rbs.parent() #fieldsets
		toggle()
		$rbs.on "valuechanged.rb", handle_click

		$rbs.each (key,value)->
			if key is 0
				$(value).find('button:first').click()
			else
				$(value).find('.in-stock > button').click()
	handle_click = (element, value)->
		selection = []
		variant = null
		inventory()
		toggle()
	get_variant_objects = (rel)->
		variants = {}
		rel = [rel] if typeof(rel) is "string"
		i = rel.length
		try
			while i--
				ids = rel[i].split '-'
				[otid, ovid] = ids
				opt = options[otid]
				if opt
					opv = opt[ovid]
					ids = $.keys opv
					if opv and ids.length
						j = ids.length
						while j--
							obj = opv[ids[j]]
							if obj and $.keys(obj).length and 0 <= selection.indexOf(obj.id.toString())
								variants[obj.id] = obj
		catch error
			alert error
		variants
	toggle = ()->
		if(variant)
			$('#variant_id, form[data-form-type="variant"] input[name$="[variant_id]"]').val variant.id
			$('#sepetbilgi .fiyat').text variant.price
		else
			$('#variant_id, form[data-form-type="variant"] input[name$="[variant_id]"]').val ''
			#STOK YOK YaNi
	inventory = ()->
		count = 0
		selected = $rbs.find('.secili')
		selected_rels = $.map selected, (element,value)->
			return $(element).parent().attr 'rel'
		$.each selected_rels, (key, value)->
			key = value.split '-'
			v = options[key[0]][key[1]]
			console.log "v.id => #{v.id}"
			keys = $.keys v #yukarıdan seçtin, alttan hangiler var.
			console.log "keys => #{keys}"
			m = Array.find_matches(selection.concat(keys))
			console.log "selection => #{selection}"
			console.log "m => #{m}"
			if selection.length is 0
				selection = keys #selection yok iken, alttaki 3 varyantı da kontrol ediyor.
			else if m
				selection = m
			console.log "selection => #{selection}"
		#<bu_fonksiyona_ait_degil>
		rel = $(selected.get(0)).parent().attr 'rel'
		variants = get_variant_objects rel #Sonra, variant objesini rel'e göre al.
		$.each variants, (key,value)->
			console.log "VARIANTS[key=>#{key}, value=>#{value.id}]"
		variant = variants[selection[0]] #burda secili variant var, stokta olup olmadığı da içeride.
		#</bu_fonksiyona_ait_degil>
		$rbs.find('.secenek').removeClass('in-stock out-of-stock unavailable').prop('disabled', 0).each (key,value)->
			$button = $(value).find('button')
			variants = get_variant_objects $button.attr 'rel'
			#Her buton için variant bilgisi alınıyor neden?
			keys = $.keys variants
			console.log "#{$(value).parent().find('label').html()} icin rel => #{$button.attr('rel')}, keys => #{keys}"
			if keys.length is 0 #O buton seçili değil!!
				$(value).find('.secili').remove()
			else if keys.length is 1 #Seçili olan seçeneğin, karşı seçeneğinin düğmesi, 2 seçili varsa ilk değer seçili düğme, ikinci ikinci seçili düğme
				_var = variants[keys[0]]
				if allow_backorders or _var.count or _var.on_demand
					$(value).addClass('in-stock')
				else
					$(value).addClass('out-of-stock')
					$button.prop('disabled', 1)
			else if allow_backorders
				#Allow backorders aktifse, durumu belirt, onay iste.
				$(value).addClass 'in-stock'
			else #keys sayısı 1'den fazla, demek ki seçili düğmedeyiz.
				$.each variants, (key, value)->
					count += if value.on_demand then 1 else value.count
				$(value).addClass(if count then 'in-stock' else 'out-of-stock')
	$(document).ready init()


	#Sıkıntı her iki varyant seçiliyken oluyor, her ikisi de seçiliyken, in-stock, out-of stock olayları karışıyor.