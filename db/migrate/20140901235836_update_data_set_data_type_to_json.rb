class UpdateDataSetDataTypeToJson < ActiveRecord::Migration
  def change
    change_column :data_sets, :json_data, :text
  end
end
