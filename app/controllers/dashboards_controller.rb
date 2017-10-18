# controller... is a controller needed? it seems like it.
#
# needs just 1 show page.
class DashboardsController < ApplicationController

  def index
    @company = Company.all
    @job = Job.all
  end

end
