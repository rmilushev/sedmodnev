module ArticlesHelper
  def tick_bool(val)
    val ? (haml_tag :i, class: 'fa fa-check-square-o') : (haml_tag :i, class: 'fa fa-times')
  end

  def artpic(klass, height, width)
    attachment_image_tag(klass, :article_image, :fit, height, width, class: 'img-fluid img-round')
  end

  def artitem_id(i)
    i < 10 ? "a#{i}" : nil
  end

  def clct(index)
    return index if index < tags.length - 1
    -1
  end
end
