class ScenesController < ApplicationController
  before_action :set_scene, only: [:show, :edit, :update, :destroy]

  def index
    @scenes = Scene.order(:position)
    @scene  = Scene.new
  end

  def show
  end

  def new
    @scene = Scene.new
  end

  def edit
  end

  def create
    @chapter = scene_params[:chapter_id].present? ?
     Chapter.find_by(id: scene_params[:chapter_id]) : nil

    @scene = Scene.new(scene_params)
    (@chapter.present? && @chapter.scenes.any?) ?
     @scene.insert_at(@chapter.scenes.last.position + 1) : @scene.insert_at(1)

    if (!@scene.valid? && @scene.persisted?)
      @scene.destroy!
      @scene = Scene.new(scene_params)
    end

    respond_to do |format|
      if @scene.save
        format.html { redirect_to :back, notice: 'Scene was successfully created.' }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to :back, notice: 'Scene was successfully updated.' }
        format.json { render :show, status: :ok, location: @scene }
      else
        format.html { render :edit }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Scene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key, value|
      scene = Scene.find_by(id: value[:id])
      if scene.reload && scene.insert_at(value[:position].to_i)
        respond_to do |format|
          format.html { redirect_to :back, status: 301, notice: "#{scene.title} moved to position #{scene.position}" }
          format.json { head :no_content }
        end
      end
    end
  end

private
  def set_scene
    @scene = Scene.find_by(id: params[:id])
  end

  def scene_params
    params.require(:scene).permit(:title, :position, :description, :chapter_id, :order)
  end
end
