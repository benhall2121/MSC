module ApplicationHelper
	
  def home_page
    c = params[:controller]
    a = params[:action]
    
    if((c == "projects" && a == "index"))
      return true
    else
      return false
    end	
  end
	
end
