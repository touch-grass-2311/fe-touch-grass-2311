module PlantsHelper
  def display_or_not_available(values)
    return 'No data available' if values.nil? || values.empty? || values == 'N/A' || 'null'

    if values.is_a?(Array)
      formatted_months = values.map do |month|
        Date::ABBR_MONTHNAMES.index(month.capitalize).to_s.rjust(2, '0')
      end

      formatted_months.sort.map { |month| Date::MONTHNAMES[month.to_i] }.join(', ')
    else
      values
    end
  end

  def display_ph_range(min, max)
    if min.present? && max.present? && min != 'N/A' && max != 'N/A'
      "#{min} - #{max}"
    elsif min.present? && min != 'N/A'
      "#{min} - Not available"
    elsif max.present? && max != 'N/A'
      "Not available - #{max}"
    else
      'No data available'
    end
  end

  def display_precipitation(value)
    if value.present? && value != 'N/A'
      "#{value} mm"
    else
      'No data available'
    end
  end
end
