class WelcomeController < ApplicationController
  before_action :authenticate_personnel!
  def index
  end
end
