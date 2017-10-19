class DashboardsController < ApplicationController

  def index
    # @company = Company.all
    @jobs = Job.all
  end

end
