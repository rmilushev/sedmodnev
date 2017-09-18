module ApplicationHelper
  def tags
    Tag.all
  end

  def selected_tag
    Tag.find(params[:tag]).name if params[:tag]
  end
end
