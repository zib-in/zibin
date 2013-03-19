# encoding: UTF-8
Spree::Variant.all.each do |variant|
	if !variant.is_master?
		variant.delete
		variant.save
	end
end

sizes = [:yeni_dogan, :uc_aylik, :alti_aylik, :dokuz_aylik, :oniki_aylik, :onsekiz_aylik, :yirmidort_aylik].map {|a| Spree::OptionValue.find_by_name(a.to_s)}
colours = [:beyaz, :pembe, :turkuaz].map {|a| Spree::OptionValue.find_by_name(a.to_s)}

zibin = Spree::Product.find_by_name! "Zıbın"
sapka = Spree::Product.find_by_name! "Şapka"
tisort = Spree::Product.find_by_name! "Tişört"

variants = []
i = 1
count = [10,5,0]
sizes.product(colours).each do |combine|
	variants << {:product => zibin, :option_values => combine, :sku => "ZIBIN-" + i.to_s, :cost_price => 17, :count_on_hand => count.sample()}
	variants << {:product => tisort, :option_values => combine, :sku => "ZIBIN-" + i.to_s, :cost_price => 17, :count_on_hand => count.sample()}
	i += 1
end

variants.each do |variant_attr|
	Spree::Variant.create(variant_attr, :without_protection => true)
end