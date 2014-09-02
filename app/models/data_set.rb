class DataSet < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :json_data, presence: true
  validates :node, presence: true
end
