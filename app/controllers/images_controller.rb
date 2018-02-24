class ImagesController < ApplicationController
  protect_from_forgery except: :create

  def index
    @images = Image.all
  end

  def create
    @image = Image.new(image_params)
    @image.article_id = request.referer.try(:split, '/').try(:[], -2)
    respond_to do |format|
      if @image.save
        format.json { render :show, status: :created, location: @image }
      end
    end
  end

  def destroy
    @image = Image.find_by(picture_id: params[:id])
    @image.destroy

    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:picture, :article_id, :user_id)
  end
end
