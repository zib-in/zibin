# This migration comes from spree_size_chart (originally 20120421093828)
class AddUnitToSpreeSizeCharts < ActiveRecord::Migration
  def change
    add_column  :spree_size_charts, :unit, :string
  end
end
