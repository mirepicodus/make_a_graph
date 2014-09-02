require 'rails_helper'

describe DataSet do
  it { should validate_presence_of :name }
  it { should validate_presence_of :json_data }
  it { should validate_presence_of :node }
end
