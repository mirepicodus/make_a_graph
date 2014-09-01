class DataSet < ActiveRecord::Base
  validates :json_data, presence: true
  validates :node, presence: true
end
