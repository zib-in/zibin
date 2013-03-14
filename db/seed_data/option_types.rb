# encoding: UTF-8
Spree::OptionType.delete_all
option_types = [
	{
		:name => 'renk',
		:presentation => 'Kumaş Rengi',
		:position => 1
	},
	{
		:name => 'beden',
		:presentation => 'Beden Ölçüsü',
		:position => 1
	}
].each do |option_types_attr|
	Spree::OptionType.create! option_types_attr, :without_protection => true
end
