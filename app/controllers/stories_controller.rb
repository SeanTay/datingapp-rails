class StoriesController < ApplicationController

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
