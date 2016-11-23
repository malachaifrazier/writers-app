class StrandsController < ApplicationController
  before_action :set_strand, only: [:show, :edit, :update, :destroy]

  def index
    @strands = Strand.all
  end

  def show
  end

  def new
    @strand = Strand.new
  end

  def edit
  end

  def create
    @strand = Strand.new(strand_params)

    respond_to do |format|
      if @strand.save
        format.html { redirect_to :back, notice: 'Strand was successfully created.' }
        format.json { render :show, status: :created, location: @strand }
      else
        format.html { render :new }
        format.json { render json: @strand.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @strand.update(strand_params)
        format.html { redirect_to :back, notice: 'Strand was successfully updated.' }
        format.json { render :show, status: :ok, location: @strand }
      else
        format.html { render :edit }
        format.json { render json: @strand.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @strand.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Strand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_strand
    @strand = Strand.find_by(id: params[:id])
  end

  def strand_params
    params.require(:strand).permit(:name, :position, :description, :project_id)
  end
end
