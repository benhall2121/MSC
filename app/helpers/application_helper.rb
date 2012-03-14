module ApplicationHelper
	
  def not_pop_up	
    c = params[:controller]
    a = params[:action]
    
    if((c == "messages" && a == "new"))
      return false
    else
      return true
    end	
  end 
  
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
