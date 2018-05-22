module ApplicationHelper
  def line(*args)
    raw "<tr>#{args.map { |arg| "<td>#{arg}</td>" }.join('')}</tr>"
  end

  def title(value=nil)
    content_for :title, value
    raw "<h1>#{value}</h1>"
  end
end
