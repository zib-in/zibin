# encoding: UTF-8
size = Spree::OptionType.find_by_presentation!("Beden Ölçüsü")
color = Spree::OptionType.find_by_presentation!("Kumaş Rengi")

zibin = Spree::Product.find_by_name!("Zıbın")
zibin.option_types = [size, color]
zibin.save!

tisort = Spree::Product.find_by_name!("Tişört")
tisort.option_types = [size, color]
tisort.save!

sapka = Spree::Product.find_by_name!("Şapka")
sapka.option_types = [color]
sapka.save!
