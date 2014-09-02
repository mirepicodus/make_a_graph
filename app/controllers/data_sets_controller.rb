class DataSetsController < ApplicationController
  def index
    @data_sets = DataSet.all
  end

  def new
    @data_set = DataSet.new
  end

  def create
    @data_set = current_user.data_sets.new(user_params)
    if @data_set.save
      redirect_to root_path, notice: "Thanks for submitting!"
    else
      render "new"
    end
  end

private

  def user_params
    params.require(:data_set).permit(:name, :json_data)
  end

end
