class @VariantOptions
	constructor: (@params) -> 
		@options = @params['options']
		@i18n = @params['i18n'];
		@allow_backorders = !@params['track_inventory_levels'] ||  @params['allow_backorders'];
		@allow_select_outofstock = @params['allow_select_outofstock'];
		@default_instock = @params['default_instock'];

	init: ()->
		alert @allow_backorders