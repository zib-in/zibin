# encoding: UTF-8
Spree::SizeChart.delete_all

zibin = Spree::Product.find_by_permalink! 'zibin'
tisort = Spree::Product.find_by_permalink! 'tisort'

size_charts = {
	
}