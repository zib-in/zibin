# encoding: UTF-8
Spree::OptionType.delete_all
option_types = [
	{
		:name => 'beden',
		:presentation => 'Beden',
		:position => 1
	},	{
		:name => 'renk',
		:presentation => 'Renk',
		:position => 1
	}
].each do |option_types_attr|
	Spree::OptionType.create! option_types_attr, :without_protection => true
end
