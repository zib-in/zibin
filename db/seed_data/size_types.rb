# encoding: UTF-8
Spree::SizeType.delete_all

SizeTypes = [
	{:name => 'Boy'},
	{:name => 'Ağırlık'}
]

SizeTypes.each do |size_type_attr|
	SizeType = Spree::SizeType.create! size_type_attr
	SizeType.save
end

