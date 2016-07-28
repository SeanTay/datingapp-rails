class StoriesController < ApplicationController
  # NHO: can clean this up a little by setting a before_action to find a profile for wherever necessary
  # GET /stories
  def index
    @profile = Profile.find(params[:profile_id])
    @stories = @profile.stories

    render json: @stories
  end

  def show
    @story = Story.find(params[:id])
    render json: @story
  end

  def create
    # NHO: how is a new story associated with a profile?
    @story = Story.new(story_params)

    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
  end

  private
  def story_params
    params.require(:story).permit(:content, :profile_id)
  end

end
