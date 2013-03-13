# encoding: UTF-8
Spree::Product.delete_all

default_attrs = {
  :description => Faker::Lorem.paragraph,
  :available_on => Time.zone.now
}

products = [
	{
		:name => "Zıbın",
		:price => 15.99,
		:cost_price => 10
	},
	{
		:name => "Şapka",
		:price => 10.99,
		:cost_price => 10
	},
	{
		:name => "Tişört",
		:price => 17.99,
		:cost_price => 10
	}
]

products.each do |product_attr|
	product = Spree::Product.create!(default_attrs.merge(product_attr), :without_protection => true)
	product.reload
	product.save!
end