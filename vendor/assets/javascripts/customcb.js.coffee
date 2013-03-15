pluginName = 'CustomCB'
document = window.document
defaults =
	startValue: ''
$('html').click ()->
	$('.acik .cb-options').fadeOut().parent().removeClass('acik')
Plugin = (element, options)->
	@el = element
	@$el = $(element)
	@$items = null
	@savedVal = if @$el.attr('data-savedval')? then @$el.attr 'data-savedval'
	@options = $.extend({}, defaults, options)
	@_defaults = defaults
	@_name = pluginName
	@init()
Plugin.prototype.init = ()->
	$id = @$el.attr 'id'
	$name = @$el.attr 'name'
	$firstopt = @$el.find 'option:first'
	$container = "<div class='cb-tasiyici' id='#{$id}'><div class='ikon'></div><a href='#' class='cb-gorunum'>#{$firstopt.html()}</a><ul class='cb-secenekler'></ul><input type='hidden' id='hid#{@$el.attr('id')}' name='#{@$el.attr('id')}' /></div>"
	$firstopt.remove()
	$options = ''

	$('option', @el).each ()->
		$options += "<li data-value='#{$(this).val()}' data-hex='#{$(this).attr 'data-hex'}'><div class='renk' style='background-color:#{$(this).attr 'data-hex'};'></div><a href='#'>#{$(this).html()}</a>"
	@$el.hide().before($container)
	$container = @$el.prev()
	@$el.remove()
	@$el = $container
	@$el.find('.cb-secenekler').append $options
	@$items = @$el.find '.cb-secenekler'
	if @options.startValue isnt '' and @savedVal is '' then @setValue @options.startValue else if @savedVal isnt '' then @setValue @savedVal
	#EVENTS
	@$el.click (e)->
		e.stopPropagation()
	@$el.find('.ikon').click $.proxy (e)->
			e.preventDefault()
			e.stopPropagation()
			@toggle()
		,this
	@$el.find('.cb-gorunum').click $.proxy (e)->
			e.preventDefault()
			@toggle()
		,this
	@$items.delegate 'li', 'click', $.proxy (e)->
			e.preventDefault()
			$li = $(e.currentTarget)
			$value = $li.attr 'data-value'
			@setValue $value
			@$el.find('.cb-gorunum').html $li.html()
			@toggle() #T0-D0: Toggleclass olayını bastan yapmis! düzenle
			@$el.trigger 'CustomCB.valChanged', $value
		,this
Plugin.prototype.toggle = ()->
	if @$el.hasClass 'acik' then @$el.removeClass 'acik' else @$el.addClass 'acik'
	@$items.fadeToggle()
Plugin.prototype.setValue = (val)->
	@$el.find('input[type="hidden"]').val val
	@$el.find('.cb-gorunum').html @$el.find(".cb-secenekler li[data-value='#{val}'] a").html()
Plugin.prototype.getValue = ()->
	@$el.find('input[type="hidden"]').val()
$.fn[pluginName] = (options) ->
	@each ()->
		if not $.data this, "plugin_#{pluginName}" then $.data this, "plugin_#{pluginName}", new Plugin(this, options)