class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save

    respond_to do |format|
      format.json { render json: { url: Refile.attachment_url(@image, :picture) } }
    end
  end
end

private

def image_params
  params.require(:image).permit(:name, :picture, :article_id, :user_id)
end
