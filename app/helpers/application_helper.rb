module ApplicationHelper
  def line(*args)
    raw "<tr>#{args.map { |arg| "<td>#{arg}</td>" }.join('')}</tr>"
  end
end
