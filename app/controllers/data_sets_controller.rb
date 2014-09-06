class DataSetsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @data_sets = DataSet.all
  end

  def new
    @data_set = DataSet.new
  end

  def create
    if !(JSON.is_json?(data_set_params[:json_data]))
      redirect_to :back, notice: "Not JSON format."
    elsif !(JSON.parse(data_set_params[:json_data]).first.has_key?(data_set_params[:node]))
      redirect_to :back, notice: "Node not included as key in JSON."
    else
      @data_set = current_user.data_sets.new(data_set_params)
      if @data_set.save
        redirect_to root_path, notice: "Thanks for submitting!"
      else
        render "new"
      end
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
    if !(JSON.is_json?(data_set_params[:json_data]))
      redirect_to :back, notice: "Not JSON format."
    else
      if @data_set.update(data_set_params)
        redirect_to data_set_path(@data_set), notice: "Thanks for updating!"
      else
        render 'edit'
      end
    end
  end

  def destroy
    @data_set = DataSet.find(params[:id])
    @data_set.destroy
    redirect_to root_path, notice: "Data Set deleted"
  end

private

  def data_set_params
    params.require(:data_set).permit(:name, :node, :json_data)
  end

end
