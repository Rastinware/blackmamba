class SalaryController < ApplicationController
  before_action :authenticate_personnel!
  def index
    @salaries = Salary.order("month").order("year").order("is_read").page params[:page]
  end

  def show    
    @salary = Salary.find(params[:id])
    @salary.is_read = true
    @salary.save()
  end
end