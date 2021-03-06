# Controller for top-level pages of the site that do not have
# an associated model
class MainController < ApplicationController
  layout 'landing', only: [:index, :about_us]

  def index
    redirect_to :dashboard if user_signed_in?
  end

  def about_us
  end

  def privacyinfo
  end

  def dashboard
    return redirect_to new_user_session_path unless user_signed_in?

    @projects   = current_user.projects.all
    @chapters   = current_user.chapters.all
    @locations  = current_user.locations.all
    @scenes     = current_user.scenes.all
    @strands    = current_user.strands.all
    @characters = current_user.characters.all
  end
end
