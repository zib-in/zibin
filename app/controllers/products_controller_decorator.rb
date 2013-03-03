Spree::ProductsController.class_eval do
	def index
	  @searcher = Spree::Config.searcher_class.new(params)
	  @searcher.current_user = try_spree_current_user
	  @searcher.current_currency = current_currency
	  @products = @searcher.retrieve_products
	  respond_with(@products, @slider = true) do |format|
	    format.html { render :template => 'spree/home/index' }
	  end
	end
end