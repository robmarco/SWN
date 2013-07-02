module IncidentsHelper
	include ActsAsTaggableOn::TagsHelper
	
  def remove_html_tag(string)
    string.gsub(/<[a-zA-Z]+>/,"").gsub(/<\/[a-zA-Z]+>/,"")
  end
end
