module ApplicationHelper
  def tags
    return (ActsAsTaggebleOn::Tag.all - @current_tag).sample(4) if @current_tag
    ActsAsTaggableOn::Tag.all.sample(5)
  end
end
