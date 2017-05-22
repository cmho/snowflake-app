class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.where(user: current_user)
  end

  def show
    @project = Project.find(params[:id])
    if (@project.user != current_user)
      redirect_to root_path
    end
		renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, filter_html: true)
		@markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(projects_params)
    if @project.save!
      flash[:success] = "Your new project, \"#{@project.title},\" has been saved."
      if params[:commit] == "save-exit"
        redirect_to project_path(@project)
      else
        redirect_to edit_project_path(@project)
      end
    else
      flash[:error] = "There was an error saving your new project. Please try again."
      redirect_to new_project_path
    end
  end

  def edit
    @project = Project.find(params[:id])
    if (@project.user != current_user)
      redirect_to root_path
    end
		renderer = Redcarpet::Render::HTML.new(no_links: true, hard_wrap: true, filter_html: true)
		@markdown = Redcarpet::Markdown.new(renderer, extensions = {})
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(projects_params)
      flash[:success] = "Your project, \"#{@project.title},\" was successfully updated."
      if params[:commit] == "save-exit"
        redirect_to project_path(@project)
      else
        redirect_to edit_project_path(@project)
      end
    else
      flash[:error] = "There was an error saving your project. Please try again."
      redirect_to edit_project_path(@project)
    end
  end

  def destroy
    @project = Project.find(params[:id])
    flash[:success] = "Your project, \"#{@project.title},\" has been deleted."
    Project.destroy(@project)
    redirect_to root_path
  end

  private

  def projects_params
    params.require(:project).permit(:title, :sentence_summary, :paragraph_summary, :page_summary, :long_summary, :user_id, :characters_attributes => [:id, :name, :sentence_summary, :paragraph_summary, :motivation, :goal, :epiphany, :long_synopsis, :additional_information, :project_id], :scenes_attributes => [:title, :description, :character_id, :project_id, :projected_pages])
  end
end
