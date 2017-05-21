class ProjectController < ApplicationController
  def index
    @projects = Project.where(user: current_user)
  end

  def show
    @project = Project.find(params[:id])
    if (@project.user != current_user)
      redirect_to root_path
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)

  end

  def edit
    @project = Project.find(params[:id])
    if (@project.user != current_user)
      redirect_to root_path
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(projects_params)

    else

    end
  end

  def destroy
    Project.destroy(params[:id])
    redirect_to root_path
  end

  private

  def projects_params
    params.require(:project).permit(:title, :sentence_summary, :paragraph_summary, :page_summary, :long_summary, :characters_attributes => [:id, :name, :sentence_summary, :paragraph_summary, :motivation, :goal, :epiphany, :long_synopsis, :additional_information, :project_id], :scenes_attributes => [:title, :description, :character_id, :project_id, :projected_pages])
  end
end
