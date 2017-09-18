module ApplicationHelper
  def tags
    Tag.where(active: true)
  end

  def selected_tag
    Tag.find(params[:tag]).name if params[:tag]
  end

  def tag_status(status)
    return 'Active' if status
    'Not active'
  end
end
