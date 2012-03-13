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
  
  def phoneNumber
    return "602-796-9855"  
  end
  
  def emailAddress
    return "michellessweetcakes@gmail.com"  
  end
	
end
