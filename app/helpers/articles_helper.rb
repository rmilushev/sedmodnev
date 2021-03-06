module ArticlesHelper
  def tick_bool(val)
    val ? (haml_tag :i, class: 'fa fa-check-square-o') : (haml_tag :i, class: 'fa fa-times')
  end

  def artpic(klass, height, width)
    if klass.main_image.attached?
      image_tag klass.main_image.variant(combine_options: {
        auto_orient: true,
        gravity: "center",
        resize: "#{height}x#{width}^",
        # crop: "#{height}x#{width}+0+0"
      }), class: 'img-fluid'
    end
  end

  def img_tag(inst, height, width)
    if inst.picture.attached?
      image_tag inst.picture.variant(combine_options: {
        auto_orient: true,
        gravity: "center",
        resize: "#{height}x#{width}^",
      }), class: 'img-fluid'
    end
  end

  def url_pic(klass, height, width)
    if klass.main_image.attached?
      rails_representation_url(klass.main_image.variant(resize: '400x300'))
    end
  end

  def artitem_id(i)
    i < 10 ? "a#{i}" : nil
  end

  def clct(index)
    return index if index < tags.length - 1
    -1
  end
end
