class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters           = Character.order(:position)
    @main_characters      = Character.where(main_character: true).order(:position)
    @secondary_characters = Character.where(main_character: false).order(:position)
    @main_character       = Character.new(main_character: true)
    @secondary_character  = Character.new(main_character: false)
  end

  def show
  end

  def new
    @character = Character.new
  end

  def edit
  end

  def create
    @project = character_params[:project_id].present? ?
     current_user.projects.find_by(id: character_params[:project_id]) : nil

    @character = Character.new(character_params)
    (@project.present? && @project.characters.any?) ?
     @character.insert_at(@project.characters.last.position + 1) : @character.insert_at(1)

    if (!@character.valid? && @character.persisted?)
      @character.destroy!
      @character = Character.new(character_params)
    end

    respond_to do |format|
      if @character.save
        format.html { redirect_to :back, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to :back, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:order].each do |key, value|
      character = Character.find_by(id: value[:id])
      if character.reload && character.insert_at(value[:position].to_i)
        respond_to do |format|
          format.html { redirect_to :back, status: 301, notice: "#{character.full_name} moved to position #{character.position}" }
          format.json { head :no_content }
        end
      end
    end
  end


private
  def set_character
    @character = Character.find_by(id: params[:id])
  end

  def character_params
    params.require(:character).permit(:first_name, :last_name, :position,
      :project_id, :main_character, :chapter_id)
    end
end
