module PlantsHelper
  def display_or_not_available(values)
    return 'Not available' if values.nil? || values.empty?
    values.join(', ')
  end

  def display_ph_range(min, max)
    if min.present? && max.present?
      "#{min} - #{max}"
    elsif min.present?
      "#{min} - Not available"
    elsif max.present?
      "Not available - #{max}"
    else
      "Not available"
    end
  end

  def display_precipitation(value)
    if value.nil?
      'Not available'
    else
      "#{value} mm"
    end
  end
end
