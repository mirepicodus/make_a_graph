class DataSetsController < ApplicationController
  def index
    @data_sets = DataSet.all
  end

end
