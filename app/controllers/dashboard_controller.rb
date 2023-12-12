class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @tasks = current_user.tasks
  end
end
