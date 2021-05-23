class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_job, only:[:edit, :show, :update]
  before_action :search_product, only: [:index, :search]

  protect_from_forgery :except => [:destroy]

  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def new
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    #@job = Job.find(params[:id])
    @comment = Comment.new
    @comments = @job.comments.includes(:user)
  end

  def edit
    #@job = Job.find(params[:id])
    unless current_user.id == @job.user_id  #ログインユーザーと投稿したユーザーが一致しなければ、トップページに遷移する
      redirect_to action: :index
    end
  end

  def update
    #@job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_path
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to root_path
  end

  def search
    @jobs = Job.search(params[:keyword])  #病院名検索

    @results = @p.result #.includes(:area)  #詳細検索
  end

  private
    def job_params
      params.require(:job).permit(:name, :salary_id, :area_id, :city, :address, :building, :phone, :map, :work1_id, :work2_id, :work3_id, :test_month_id, :test_day_id, :test_id, :image, :note, :image2).
      merge(user_id: current_user.id)
    end

    def set_job
      @job = Job.find(params[:id])
    end

    def search_product
      @p = Job.ransack(params[:q])
    end
  
end

