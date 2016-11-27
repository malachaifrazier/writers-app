class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = Location.order(:position)
    @location  = Location.new
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @project = location_params[:project_id].present? ?
     current_user.projects.find_by(id: location_params[:project_id]) : nil

    @location = Location.new(location_params)
    (@project.present? && @project.locations.any?) ?
     @location.insert_at(@project.locations.last.position + 1) : @location.insert_at(1)

    if (!@location.valid? && @location.persisted?)
      @location.destroy!
      @location = Location.new(location_params)
    end

    respond_to do |format|
      if @location.save
        format.html { redirect_to :back, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to :back, notice: "Location #{@location.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      location = Location.find_by(id: value[:id])
      if location.reload && location.insert_at(value[:position].to_i)
        respond_to do |format|
          format.html { redirect_to :back, status: 301, notice: "#{location.name} moved to position #{location.position}" }
          format.json { head :no_content }
        end
      end
    end
  end

private
  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:project_id, :name, :state, :city,
      :description, :position, :nation, :order)
  end
end
