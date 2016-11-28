class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  def index
    @chapters = Chapter.order(:position)
    @chapter  = Chapter.new
  end

  def show
    @scenes = []#@chapter.scenes.order(:position)
  end

  def new
    @chapter = Chapter.new
  end

  def edit
  end

  def create
    @project = chapter_params[:project_id].present? ?
     current_user.projects.find_by(id: chapter_params[:project_id]) : nil

    @chapter = Chapter.new(chapter_params)
    (@project.present? && @project.chapters.any?) ?
     @chapter.insert_at(@project.chapters.last.position + 1) : @chapter.insert_at(1)

    if (!@chapter.valid? && @chapter.persisted?)
      @chapter.destroy!
      @chapter = Chapter.new(chapter_params)
    end

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to :back, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to :back, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key,value|
      chapter = Chapter.find_by(id: value[:id])
      if chapter.reload && chapter.insert_at(value[:position].to_i)
        respond_to do |format|
          format.html { redirect_to :back, status: 301, notice: "#{chapter.title} moved to position #{chapter.position}" }
          format.json { head :no_content }
        end
      end
    end
  end

private
  def set_chapter
    @chapter = Chapter.find_by(id: params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :position, :reason, :note, :project_id, :order)
  end
end
