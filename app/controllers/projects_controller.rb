class ProjectsController < ApplicationController
 def index
   @projects = Project.all
   render :index
 end

 def new
   @project = Project.new
   render :new
 end

 def create
   @project = Project.new(project_params)
   if @project.save
     redirect_to projects_path
   else
     render :new
   end
 end

 def show
   @project = Project.find(params[:id])
   @available_employees = Employee.all
   @assigned_employees = @project.employees.distinct
   :show
 end

 def edit
   @project = Project.find(params[:id])
   :edit
 end

 def destroy
   @project = Project.find(params[:id])
   @project.destroy
   redirect_to projects_path
 end

 def update
   @project = Project.find(params[:id])
   @employee = Employee.find(params[:employee_id])
   @project.employees.delete(@employee)
   redirect_to projects_path
 end


 private
 def project_params
   params.require(:project).permit(:title)
 end
end
