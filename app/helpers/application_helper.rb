module ApplicationHelper
  def icon(name, attributes = nil)
    attributes ||= {}
    attributes[:class] = "#{attributes[:class]} glyphicon glyphicon-#{name}".strip
    content_tag :i, '', attributes
  end

  def flash_type(name)
    case name
    when 'alert'
      'danger'
    when 'info'
      'info'
    else
      'success'
    end
  end

  def flash_icon(name)
    case name
    when 'alert'
      icon('remove-sign')
    when 'info'
      icon('info-sign')
    when 'notice'
      icon('ok-sign')
    else
      icon('question-sign')
    end
  end

end
