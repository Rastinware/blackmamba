class SalaryController < ApplicationController
  before_action :authenticate_personnel!
  def index
    @salaries = Salary.order("month").order("year").paginate(:page => params[:page])
  end

  def show
    @salary = Salary.find(params[:id])
  end
end
