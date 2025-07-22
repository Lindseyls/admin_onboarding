class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update update_onboarding destroy]

  def index
    @employees = Employee.all
  end

  def show; end

  def new
    @employee = Employee.new
    load_deps
  end

  def edit
    load_deps
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.onboarding_status = "Not Started"

    if @employee.save
      redirect_to @employee, notice: "Employee created."
    else
      load_deps
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee updated."
    else
      load_deps
      render :edit
    end
  end

  def update_onboarding
    if @employee.update(onboarding_status: params[:employee][:onboarding_status])
      redirect_to @employee, notice: "Status updated"
    else
      redirect_to @employee, alert: "Invalid status change"
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Employee deleted"
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def load_deps
    @departments = Department.all
    @roles = Role.all
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :hire_date, :department_id, :role_id)
  end
end
