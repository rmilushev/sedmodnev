class ImagesController < ApplicationController
  protect_from_forgery except: :create

  def create
    @image = Image.new(image_params)
    @image.save

    respond_to do |format|
      format.json { render json: { url: Refile.attachment_url(@image, :picture), picture_id: @image.picture_id } }
    end
  end

  def destroy
    @image = Image.find_by(picture_id: params[:id])
    @image.destroy

    respond_to do |format|
      format.json { render json: { status: :ok } }
    end
  end

  private

  def image_params
    params.require(:image).permit(:picture, :article_id, :user_id)
  end
end
