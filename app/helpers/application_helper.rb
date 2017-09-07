module ApplicationHelper
  def tags
    @tags = ActsAsTaggableOn::Tag.all.sample(5)
  end
end
