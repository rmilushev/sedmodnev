module ArticlesHelper
  def tick_bool(val)
    val ? (haml_tag :i, class: 'fa fa-check-square-o') : (haml_tag :i, class: 'fa fa-times')
  end
end
