# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

OptionType = Spree::OptionType

OptionType.delete_all #Önce siliyorlar adetten.

{
	:yazi => [['o_satir_1', 'Ön taraf birinci satır yazısı'],['o_satir_2', 'Ön taraf ikinci satır yazısı'],['o_satir_2', 'Ön taraf üçüncü satır yazısı'],['a_satir_1', 'Arka taraf birinci satır yazısı'],['a_satir_2', 'Arka taraf ikinci satır yazısı'],['a_satir_3', 'Arka taraf üçüncü satır yazısı']],
	:yazitipi => [['o_satir_1', 'Ön taraf birinci satır yazıtipi'],['o_satir_2', 'Ön taraf ikinci satır yazıtipi'],['o_satir_2', 'Ön taraf üçüncü satır yazıtipi'],['a_satir_1', 'Arka taraf birinci satır yazıtipi'],['a_satir_2', 'Arka taraf ikinci satır yazıtipi'],['a_satir_3', 'Arka taraf üçüncü satır yazıtipi']],
	:yazi_rengi => [['o_satir_1', 'Ön taraf birinci satır yazı rengi'],['o_satir_2', 'Ön taraf ikinci satır yazı rengi'],['o_satir_2', 'Ön taraf üçüncü satır yazı rengi'],['a_satir_1', 'Arka taraf birinci satır yazı rengi'],['a_satir_2', 'Arka taraf ikinci satır yazı rengi'],['a_satir_3', 'Arka taraf üçüncü satır yazı rengi']],
	:yazi_boyutu => [['o_satir_1', 'Ön taraf birinci satır yazı boyutu'],['o_satir_2', 'Ön taraf ikinci satır yazı boyutu'],['o_satir_2', 'Ön taraf üçüncü satır yazı boyutu'],['a_satir_1', 'Arka taraf birinci satır yazı boyutu'],['a_satir_2', 'Arka taraf ikinci satır yazı boyutu'],['a_satir_3', 'Arka taraf üçüncü satır yazı boyutu']],
}.each do |k,v|
	option_type = OptionType.create! :name => k.to_s, :presentation => k.to_s.humanize
	if v.kind_of? Array
		v.each{|k,v| option_values = option_type.option_values.create :name => k, :presentation => v}
	end
	option_type.save
end