# controller... is a controller needed? it seems like it.
#
# needs just 1 show page.
class DashboardsController < ApplicationController

  def index
    @company = Company.all
    @jobs = Job.where(company_id: @company.id)
  end

end
