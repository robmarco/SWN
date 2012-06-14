module SwimmersHelper
<<<<<<< HEAD
  def increase_decrease_time(competition_result)
    if competition_result.is_disqualified?
      image_tag("widgets/widget_desc.png", :title => "Descalificado", :rel => 'tooltip')
    else
      competition_result.is_improved? ? image_tag("widgets/widget_downtime.png") : image_tag("widgets/widget_uptime.png")
    end
  end
=======
>>>>>>> origin/master
end
