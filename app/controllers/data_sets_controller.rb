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

  def show
    @data_set = DataSet.find(params[:id])
  end

  def edit
    @data_set = DataSet.find(params[:id])
  end

  def update
    @data_set = DataSet.find(params[:id])
    if @data_set.update(user_params)
      redirect_to data_set_path(@data_set), notice: "Thanks for updating!"
    else
      render 'edit'
    end
  end

private

  def user_params
    params.require(:data_set).permit(:name, :node, :json_data)
  end

end
