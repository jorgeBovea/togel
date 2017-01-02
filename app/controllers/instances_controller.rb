class InstancesController < ApplicationController
  before_action :set_instance, only: [:show, :edit, :update, :destroy]

  # GET /instances
  # GET /instances.json
  def index
    @instances = Instance.all
  end

  # GET /instances/1
  # GET /instances/1.json
  def show
  end

  def project_create_instance

  project = Project.find(instance_params[:project_id])
  if Instance.find_by(project_id: project.id).nil?
   instance=Instance.create(description: instance_params[:description],project_id:project.id, user_id: 1);
  else
   instance = Instance.find_by(project_id: project.id)
  end
  time = params[:timer].split()
  time_unit = time[1]
  date_str = ""
  if time_unit == "sec"
    date_str = "0:0:"+time[0]
    sec = time[0].to_i
  else
   if time_unit == "min"
     time_min = time[0].split(":")
     date_str = "0:"+time_min[0]+":"+time_min[1]
     sec = time[1].to_i
     min = time[0].to_i
   else
     time_min = time[0].split(":")
     date_str = time_min[0]+":"+time_min[1]+":"+time_min[2]
     sec = time[2].to_i
     min = time[1].to_i
     hour = time[0].to_i
   end
  end
  
  date = date_str.to_time
 
  @instance_time=InstanceTime.create(time_mark:date_str,instance_id: instance.id, hour: hour ,minutes: min ,seconds: sec)
  redirect_to :back
  
  end

  
  # GET /instances/new
  def new
    @instance = Instance.new
  end

  # GET /instances/1/edit
  def edit
  end

  # POST /instances
  # POST /instances.json
  def create
    @instance = Instance.new(instance_params)

    respond_to do |format|
      if @instance.save
        format.html { redirect_to @instance, notice: 'Instance was successfully created.' }
        format.json { render :show, status: :created, location: @instance }
      else
        format.html { render :new }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instances/1
  # PATCH/PUT /instances/1.json
  def update
    respond_to do |format|
      if @instance.update(instance_params)
        format.html { redirect_to @instance, notice: 'Instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @instance }
      else
        format.html { render :edit }
        format.json { render json: @instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instances/1
  # DELETE /instances/1.json
  def destroy
    @instance.destroy
    respond_to do |format|
      format.html { redirect_to instances_url, notice: 'Instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instance
      @instance = Instance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instance_params
      params.fetch(:instance, {})
    end
end
