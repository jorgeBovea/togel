class InstanceTimesController < ApplicationController
  before_action :set_instance_time, only: [:show, :edit, :update, :destroy]

  # GET /instance_times
  # GET /instance_times.json
  def index
    @instance_times = InstanceTime.all
  end

  # GET /instance_times/1
  # GET /instance_times/1.json
  def show
  end

  # GET /instance_times/new
  def new
    @instance_time = InstanceTime.new
  end

  # GET /instance_times/1/edit
  def edit
  end

  # POST /instance_times
  # POST /instance_times.json
  def create
    @instance_time = InstanceTime.new(instance_time_params)

    respond_to do |format|
      if @instance_time.save
        format.html { redirect_to @instance_time, notice: 'Instance time was successfully created.' }
        format.json { render :show, status: :created, location: @instance_time }
      else
        format.html { render :new }
        format.json { render json: @instance_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instance_times/1
  # PATCH/PUT /instance_times/1.json
  def update
    respond_to do |format|
      if @instance_time.update(instance_time_params)
        format.html { redirect_to @instance_time, notice: 'Instance time was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance_time }
      else
        format.html { render :edit }
        format.json { render json: @instance_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_times/1
  # DELETE /instance_times/1.json
  def destroy
    @instance_time.destroy
    respond_to do |format|
      format.html { redirect_to instance_times_url, notice: 'Instance time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance_time
      @instance_time = InstanceTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_time_params
      params.fetch(:instance_time, {})
    end
end
