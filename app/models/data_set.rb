class DataSet < ActiveRecord::Base
  validates :name, presence: true
  validates :json_data, presence: true
  validates :node, presence: true
end
