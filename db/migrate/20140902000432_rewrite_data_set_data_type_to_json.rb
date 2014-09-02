class RewriteDataSetDataTypeToJson < ActiveRecord::Migration
  def change
    remove_column :data_sets, :json_data, :text
    add_column :data_sets, :json_data, :json
  end
end
