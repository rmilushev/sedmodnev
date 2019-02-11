class ImagesController < ApplicationController
  protect_from_forgery except: :create

  def index
    @images = Image.desc_order
  end

  def create
    @image = Image.new
    @image.picture = params[:file].tempfile
    @image.article_id = request.referer.try(:split, '/').try(:[], -2)
    @image.user = User.last
    if @image.save!
      render json: {
        image: {
          url: Refile.attachment_url(@image, :picture, :fill, 600, 400),
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
end
