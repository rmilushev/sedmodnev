module ApplicationHelper
  def tags
    return Tag.all.except(@current_tag).sample(4) if @current_tag
    Tag.all.sample(5)
  end
end
