class SalaryController < ApplicationController
  before_action :authenticate_personnel!
  def index
  end
end
