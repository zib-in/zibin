# encoding: UTF-8
Spree::OptionValue.delete_all

size = Spree::OptionType.find_by_presentation!("Beden Ölçüsü")
color = Spree::OptionType.find_by_presentation!("Kumaş Rengi")

option_values = [
  {
    :name => "yeni_dogan",
    :presentation => "Yeni Doğan",
    :position => 1,
    :option_type => size
  },
  {
    :name => "uc_aylik",
    :presentation => "3 Aylık",
    :position => 2,
    :option_type => size
  },
  {
    :name => "alti_aylik",
    :presentation => "6 Aylık",
    :position => 3,
    :option_type => size
  },
  {
    :name => "dokuz_aylik",
    :presentation => "9 Aylık",
    :position => 4,
    :option_type => size
  },  
  {
    :name => "oniki_aylik",
    :presentation => "12 Aylık",
    :position => 5,
    :option_type => size
  },  
  {
    :name => "onsekiz_aylik",
    :presentation => "18 Aylık",
    :position => 6,
    :option_type => size
  }, 
  {
    :name => "yirmidort_aylik",
    :presentation => "24 Aylık",
    :position => 7,
    :option_type => size
  },
  {
    :name => "beyaz",
    :presentation => "Beyaz",
    :position => 1,
    :option_type => color,
  },
  {
    :name => "turkuaz",
    :presentation => "Turkuaz",
    :position => 2,
    :option_type => color,
  },
  {
    :name => "pembe",
    :presentation => "Pembe",
    :position => 3,
    :option_type => color
  }
].each do |option_values_attr|
	Spree::OptionValue.create!(option_values_attr, :without_protection => true)
end