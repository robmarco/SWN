module DashboardHelper
  # ==========================================================
  # NAME: days_from_today
  # RETURNS: String showing days from today 
  # ==========================================================
  def days_from_today(date)
    d = Date.today - date
    if d==0
      "Hoy"
    else
      pluralize(d.to_int, "day") +  " ago"
    end
  end
  
  def activity_title(action, assoc)
    str = "dashboard.index.has_"+action
    t(str) + " #{assoc.constantize.model_name.human}"
  end

  # ==========================================================
  # NAME: description_dashboard
  # RETURNS: String for description in RecentActivity table
  # ==========================================================
  def description_dashboard(hash, action, assoc_class)    
    if action == "create" || action == "destroy"
      if hash["place"].present?
        "#{hash["title"]} #{t('dashboard.index.article')} #{hash["place"]} (#{hash["category"]})"
      else
        if hash["date"].present?
          assoc_class.constantize.model_name.human + " " + t('dashboard.index.with_date') + " " + I18n.localize(hash["date"], :format => :short ) 
        else
          if hash["category"].present?
            hash["title"].to_s + hash["name"].to_s + " #{t('dashboard.index.article_category')} #{hash["category"]}"
          else
            hash["title"].to_s + hash["name"].to_s
          end
        end
      end
    else
      str = "dashboard.index."+action+"."+assoc_class.downcase
      if hash["date"].present?
        t(str) + " " + I18n.localize(hash["date"].to_date, :format => :short)
      else
        t(str) + " " + hash["name"].to_s + hash["title"].to_s
      end
      
    end
  end
  
end
