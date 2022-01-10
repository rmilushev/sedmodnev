class AuthorProfilesController < ApplicationController
  before_action :set_author_profile, only: [:show, :edit, :update, :destroy]

  # GET /author_profiles
  # GET /author_profiles.json
  def index
    @author_profiles = AuthorProfile.all
  end

  # GET /author_profiles/1
  # GET /author_profiles/1.json
  def show
  end

  # GET /author_profiles/new
  def new
    @author_profile = AuthorProfile.new
  end

  # GET /author_profiles/1/edit
  def edit
  end

  # POST /author_profiles
  # POST /author_profiles.json
  def create
    @author_profile = AuthorProfile.new(author_profile_params)

    respond_to do |format|
      if @author_profile.save
        format.html { redirect_to @author_profile, notice: 'Author profile was successfully created.' }
        format.json { render :show, status: :created, location: @author_profile }
      else
        format.html { render :new }
        format.json { render json: @author_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /author_profiles/1
  # PATCH/PUT /author_profiles/1.json
  def update
    respond_to do |format|
      if @author_profile.update(author_profile_params)
        format.html { redirect_to @author_profile, notice: 'Author profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @author_profile }
      else
        format.html { render :edit }
        format.json { render json: @author_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /author_profiles/1
  # DELETE /author_profiles/1.json
  def destroy
    @author_profile.destroy
    respond_to do |format|
      format.html { redirect_to author_profiles_url, notice: 'Author profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author_profile
      @author_profile = AuthorProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def author_profile_params
      params.require(:author_profile).permit(:admin_id, :name, :image, :description, :enabled)
    end
end
