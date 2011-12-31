module AboutsHelper
	
  def about_exists
    @about = About.find(:first, :order => "created_at DESC")
  	  
    if(!@about.blank?)
      return true
    else
      return false
    end
  	  
  end
	
end
