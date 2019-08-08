class EmployeesController < ApplicationController
  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    if @employee.save
      redirect_to division_path(@division)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    :edit
  end

  def show
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    @projects = @employee.projects.distinct
    render :show
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to division_path(@employee.division)
  end

  def update
    @project = Project.find(params[:project_id])
    @employee = Employee.find(params[:id])
    @employee.projects.push(@project)
    @employee.save
    redirect_to division_employee_path(division_id: @employee.division_id, id: @employee.id, project_title: @project.title)
  end

  private
    def employee_params
      params.require(:employee).permit(:name)
    end
end
