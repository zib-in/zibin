# encoding: UTF-8
Spree::Product.delete_all

default_attrs = {
  :description => Faker::Lorem.paragraph,
  :available_on => Time.zone.now
}

products = [
	{
		:name => "Zıbın",
		:price => 19,
		:eur_price => 10
	},
	{
		:name => "Şapka",
		:price => 19,
		:eur_price => 10
	},
	{
		:name => "Tişört",
		:price => 19,
		:eur_price => 10
	}
]

products.each do |product_attr|
	eur_price = product_attr.delete(:eur_price)
	Spree::Config[:currency] = "TRY"

	product = Spree::Product.create!(default_attrs.merge(product_attr), :without_protection => true)
	Spree::Config[:currency] = "EUR"
	product.reload
	product.price = eur_price
	product.save!
end

Spree::Config[:currency] = "TRY"