class ProfilesController < ApplicationController

  # GET Profiles
  def index
    respond_to do |format|
      format.html
      format.json {render json: Profile.all}
    end

    @profiles = Profile.all
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
  def profile_params
    params.require(:profile).permit(:name, :gender, :age, :location, :work, :school, :description, :profile_pic_url)
  end

end
