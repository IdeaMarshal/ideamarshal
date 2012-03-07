module ApplicationHelper
  def m(str)
    str.to_s.markdown.html_safe
  end
end
