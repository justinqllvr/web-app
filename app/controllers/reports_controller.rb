class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  # GET /reports
  # GET /reports.json

  def index
    @cities = City.all
    @reports = Report.all
    if params.has_key? :state
      @state = params[:state]
      @reports = @reports.send(@state)
    end
    @reports = @reports.ordered_by_likes
  end

  def my
    @reports = current_user.reports
  end
  # GET /reports/1
  # GET /reports/1.json
  def show
    @cities = City.all
    @can = current_user && @cities.find(@report.city_id).users.first().id === current_user.id
    get_address
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
    redirect_to @report unless (@report.user == current_user) or (current_user.admin == true)
  end

  # report /reports
  # report /reports.json
  def create
    @report = Report.create(report_params)
    @report.user = current_user
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update 
    respond_to do |format|
      if params[:update_type] == 'accepted' #UPDATE REPORT STATE TO ACCEPTED
        @updated = Report.where(:id => params[:id]).update_all(:state => 10)
      elsif params[:update_type] == 'not_fixed' #UPDATE REPORT STATE TO NOT FIXED
        @updated = Report.where(:id => params[:id]).update_all(:state => 30)
      elsif params[:update_type] == 'fixed' #FIXED REPORT
        @updated = @report.update(fixed_report_params)
      elsif params[:update_type] == 'not_fixed' #REPORT WAS PASSED TO NOT FIXED
        @updated = @report.update(not_fixed_report_params)
      else #CLASSICAL UPDATE
        @updated = @report.update(report_params)
      end
      if @updated
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_report
      # @city = City.find(current_user.id)
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:title, :text, :latitude, :longitude, :picture)
    end

    def fixed_report_params
      params.require(:report).permit(:state, :done_picture, :resolution_description, :resolution_date)
    end

    def not_fixed_report_params
      params.require(:report).permit(:state, :infeasible_reason)
    end

    def already_liked?
      Like.where(user_id: current_user.id, report_id:
      params[:report_id]).exists?
    end

    def get_address
      result = Geocoder.search([@report.latitude, @report.longitude])
      begin
        @address = result.first.address.split(', ')[0, 3].join(', ')
      rescue
      end
    end

end
