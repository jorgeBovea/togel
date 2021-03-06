class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    if params[:project_id].nil?
      @project = Project.find_by(user_id:User.first.id, default: true)
    else
      @project = project.find(params[:project_id])
    end
    
    @instances = Instance.where(user_id:User.first.id)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    
  
  end

  # GET /projects/new
  def new
    @project = Project.new
  end



  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(name: project_params[:name], default:false )

    respond_to do |format|
      if @project.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :nothing }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project].permit(:name)
    end
end
