# encoding: UTF-8
Spree::SizeChart.delete_all

zibin = Spree::Product.find_by_permalink! 'zibin'
tisort = Spree::Product.find_by_permalink! 'tisort'

beden = Spree::OptionType.find_by_name! 'beden'

size_types = Spree::SizeType.all

size_charts = [
	{
		:option_type => beden,
		:unit => 'cm',
		:product => zibin,
		:size_types => Spree::SizeType.all,
	},
	{
		:option_type => beden,
		:unit => 'cm',
		:product => tisort,
		:size_types => Spree::SizeType.all,
	}
]
size_charts.each do |size_chart_attr|
	Spree::SizeChart.create!(size_chart_attr, :without_protection => true)
end

size_values = []
values = {
	:boy => ["55 cm'e kadar","55 – 61 cm","61 – 67 cm","67 – 72 cm","72 – 78 cm","78 – 83 cm","83 – 86 cm"],
	:ağırlık => ["2.3 – 3.6 kg","3.6 – 5.7 kg","5.7 – 7.5 kg","7.5 – 9.3 kg","9.3 – 11.1 kg","11.1 – 12.5 kg","12.5 – 13.6 kg"]
}
Spree::SizeChart.all.each do |size_chart|
	size_types.each do |size_type|
		i = 0
		beden.option_values.each do |option_value|
			size_values << {:size_chart => size_chart, :size_type_id => size_type.id, :option_value_id => option_value.id, :value => values[size_type.name.downcase.to_sym][i]}
			i += 1
		end
	end
end

size_values.each do |size_value_attr|
	Spree::SizeValue.create!(size_value_attr, :without_protection => true)
end