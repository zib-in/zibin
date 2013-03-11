# This migration comes from spree_size_chart (originally 20120719204748)
class CreateSpreeSizePrototypes < ActiveRecord::Migration
  def change
    create_table :spree_size_prototypes do |t|
      t.string  :name
      t.timestamps
    end

    add_column  :spree_size_charts, :size_prototype_id, :integer
  end
end
