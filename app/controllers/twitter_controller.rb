class TwitterController < ApplicationController
  def tweet_post
    message = 'Tweet successful'
    begin
      TwitterAPI.new.client.update(params[:art_url])
    rescue StandardError => e
      message = e.message
    end

    respond_to do |format|
      format.html { redirect_to :root, notice: message }
    end
  end
end
