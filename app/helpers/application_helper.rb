module ApplicationHelper
  def flash_class_for(type)
    case type
    when 'success' then 'text-green-700'
    when 'notice' then 'text-blue-700'
    when 'alert' then 'text-yellow-700'
    when 'error' then 'text-red-700'
    else 'text-gray-700'
    end
  end

  def flash_bg_class_for(type)
    case type
    when 'success' then 'bg-green-100'
    when 'notice' then 'bg-blue-100'
    when 'alert' then 'bg-yellow-100'
    when 'error' then 'bg-red-100'
    else 'bg-gray-100'
    end
  end
end
