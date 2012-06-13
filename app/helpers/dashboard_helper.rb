module DashboardHelper
  def days_from_today(date)
    d = Date.today - date
    if d==0
      "Hoy"
    else
      pluralize(d.to_int, "day") +  " ago"
    end
  end
  
  def activity_title(action, assoc)
    case assoc
      when "Competition"
        "has #{action} a #{assoc}"
      when "Trainning"
        "has #{action} a #{assoc}"
      when "Swimmer"
        "has #{action} a #{assoc}"
      when "Trial"
        "has #{action} a #{assoc}"
      when "Incident"
        "has #{action} a #{assoc}"
    end
  end
  
end
