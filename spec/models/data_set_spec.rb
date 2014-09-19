require 'rails_helper'

describe DataSet do
  it { should validate_presence_of :name }
  it { should validate_presence_of :json_data }
  it { should validate_presence_of :node }

  describe "data_to_alchemy" do
    it "converts json data into useable format with node given" do
      data_set = DataSet.create(node: "hello", user_id: 1, json_data: [{"hello"=>"goodbye"}], name: "hi")
      expect(data_set.data_to_alchemy).to eq "{\"nodes\":[{\"hello\":\"goodbye\",\"caption\":\"goodbye\",\"id\":0}],\"edges\":[]}"
    end
  end

end
