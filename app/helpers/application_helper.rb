module ApplicationHelper
  def flash_class(key)
    case key.to_sym
    when :success
      "bg-green-500"
    when :error
      "bg-red-500"
    when :notice
      "bg-blue-500"
    when :warning
      "bg-yellow-500"
    else
      "bg-gray-500"
    end
  end
end
