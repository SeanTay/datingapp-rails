class ProfilesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json {render json: Profile.all}
    end
  end

  def create
    @profile = Profile.create(profile_params)
    render json: @product, status: :ok
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update!(profile_params)
    render json: @product, status: :ok
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :gender, :age, :location, :work, :school, :description, :profile_pic_url)
  end

end
