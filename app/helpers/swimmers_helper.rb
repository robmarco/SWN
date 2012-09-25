module SwimmersHelper
  def increase_decrease_time(competition_result)
    if competition_result.is_disqualified?
      image_tag("widgets/widget_desc.png", :title => "Descalificado", :rel => 'tooltip')
    else
      competition_result.is_improved? ? image_tag("widgets/widget_downtime.png", :title => "Baja tiempo", :rel => "tooltip")
      																: image_tag("widgets/widget_uptime.png", :title => "Sube tiempo", :rel => "tooltip")
    end
  end

  def increase_decrease_time_pdf(competition_result)
    if competition_result.is_disqualified?
      image_tag("#{Rails.root}/public/images/widgets/widget_desc.png", :title => "Descalificado", :rel => 'tooltip')
    else
      competition_result.is_improved? ? image_tag("#{Rails.root}/public/images/widgets/widget_downtime_pdf.png", :title => "Baja tiempo", :rel => "tooltip")
      																: image_tag("#{Rails.root}/public/images/widgets/widget_uptime_pdf.png", :title => "Sube tiempo", :rel => "tooltip")
    end
  end
end
