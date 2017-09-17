module ApplicationHelper
  def tags
    @tags = @current_tag ? (Tag.all - @current_tag).sample(4) : Tag.all
  end
end
