class AddDataSets < ActiveRecord::Migration
  def change
      create_table :data_sets do |t|
      t.string :json_data
      t.string :node
      t.belongs_to :user
      t.timestamps
    end
  end
end
