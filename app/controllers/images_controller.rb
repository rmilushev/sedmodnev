class ImagesController < ApplicationController
  protect_from_forgery except: :create

  def index
    @images = Image.desc_order
  end

  def create
    @image = Image.new
    @image.article_id = request.referer.try(:split, '/').try(:[], -2)
    @image.picture = params[:file]
    @image.user = User.last
    if @image.save!
      render json: {
        image: {
          url: rails_blob_url(@image.picture),
          width: '600',
          height: '400',
          picture_id: @image.picture_id
        }
      }, content_type: "text/html",
      status: :created, location: @image
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
    params.require(:image).permit(:file, :picture)
  end
end
