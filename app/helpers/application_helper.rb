module ApplicationHelper
  def tags
    @tags = ActsAsTaggableOn::Tag.sample(5)
  end
end
