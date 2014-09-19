class DataSetsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @data_sets = DataSet.all
  end

  def new
    @data_set = DataSet.new
  end

  def create
    begin
      @data_set = current_user.data_sets.new(data_set_params)
    rescue JSON::ParserError => error
      redirect_to :back, notice: "Not JSON format."
      return
    end
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
    begin
      DataSet.new(data_set_params)
    rescue JSON::ParserError => error
      redirect_to :back, notice: "Not JSON format."
      return
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
