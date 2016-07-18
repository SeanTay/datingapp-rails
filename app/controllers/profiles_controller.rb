class ProfilesController < ApplicationController
before_action :set_profile
  # GET Profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end


  # GET /Profiles/1
  def show
    render json: @profile
  end

  # POST /profiles
  def create
    @profile = Profile.create(profile_params)
    render json: @profile, status: :ok
  end

  # PATCH/PUT /profiles/1
  def update
    @profile = Profile.find(params[:id])
    @profile.update!(profile_params)
    render json: @product, status: :ok
  end

  #DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :gender, :age, :location, :work, :school, :description, :profile_pic_url)
  end

end
