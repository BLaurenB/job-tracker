class JobsController < ApplicationController
  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params[:sort]  #sort=location and sort=interest
      if params[:sort] == "location"
        @company = Company.all
        @jobs = Job.order(:city)
      else
        @company = Company.all
        @jobs = Job.order("level_of_interest DESC")
      end
    elsif params[:location]
      @company = Company.all
      @jobs = Job.where(city: params[:location])
    else
      @company = Company.all
      @jobs = Job.all
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @category = Category.all
    @job = Job.new()
  end

  def create
    @category = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save!
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.create
    @job = Job.find(params[:id])
    @comment = Comment.create
    @comment.job_id = @job.id
  end

  def edit
    @category = Category.all
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
  end


  def update
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    flash.notice = "job '#{@job.title}' was updated!"
    redirect_to article_path(@job)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])

    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
