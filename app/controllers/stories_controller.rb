class StoriesController < ApplicationController
before_action :authenticate_user!

  # GET /stories
  def index
    @stories = Story.all

    render json: @stories
  end

  def show
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
    if @story.update(story_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @story.destroy
  end

  private
  def story_params
    params.require(:story).permit(:content, :profile_id)
  end

end
