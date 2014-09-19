class ValidNode < ActiveModel::Validator
  def validate(data_set)
    if !data_set.json_data.nil?
      unless data_set.json_data.first.has_key?(data_set.node)
        data_set.errors[:node] << 'Node not included as key in JSON'
      end
    end
  end
end

class DataSet < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :json_data, presence: true
  validates :node, presence: true
  include ActiveModel::Validations
  validates_with ValidNode

  def data_to_alchemy
    nodes = self.json_data.each_with_index do |element, index|
        element["caption"] = element[self.node]
        element["id"] = index
    end
    node_index = []
    nodes.each {|node| node_index << node["id"]}
    permutated_nodes = node_index.permutation(2).to_a
    edges = permutated_nodes.map {|node1, node2| {source: node1, target: node2}}
    alchemy_data = {nodes: nodes, edges: edges}
    alchemy_data.to_json
  end

end

