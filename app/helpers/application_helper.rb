module ApplicationHelper
  def tags
    @tags = ActsAsTaggableOn::Tag.all
  end
end
