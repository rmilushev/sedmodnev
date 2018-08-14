module ArticlesHelper
  def tick_bool(val)
    val ? (haml_tag :i, class: 'fa fa-check-square-o') : (haml_tag :i, class: 'fa fa-times')
  end

  def artpic(klass, height, width)
    image_tag attachment_url(klass, :article_image, :fit, height, width), class: 'img-responsive'
  end

  def artitem_id(i)
    i < 10 ? "a#{i}" : nil
  end

  def featured_articles_for(current_tag)

  end
end
