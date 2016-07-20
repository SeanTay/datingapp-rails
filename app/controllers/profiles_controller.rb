class ProfilesController < ApplicationController
before_action :authenticate_user!,:set_profile, only: [:show, :update, :destroy]


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
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end

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
