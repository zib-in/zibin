# encoding: UTF-8
require 'ffaker'

namespace :seed_data do
	desc 'Loads seed data'
	task :load => :environment do
		if ENV['FILE'].nil?
			load_sample 'size_types'
			load_sample 'products'
			load_sample 'option_types'
			load_sample 'option_values'
			load_sample 'product_option_types'
			load_sample 'variants'
			load_sample 'size_charts'
		else
			load_sample ENV['FILE']
		end
	end

	desc 'Destroys seed data'
	task :destroy => :environment do
		destroy_seed_data
	end
end

def load_sample(file)
	seed_path = Pathname.new(File.join(File.dirname(__FILE__), '..', '..', 'db', 'seed_data'))
	path = File.expand_path(seed_path + "#{file}.rb")
	require path
	puts "Loaded #{file.titleize} samples"
end

def destroy_seed_data
	Spree::SizeType.delete_all
	Spree::Product.delete_all
	puts "Seed data destroyed!"
end