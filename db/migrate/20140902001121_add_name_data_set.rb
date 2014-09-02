class AddNameDataSet < ActiveRecord::Migration
  def change
    add_column :data_sets, :name, :string
  end
end
