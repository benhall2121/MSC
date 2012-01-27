class Project < ActiveRecord::Base
  has_attached_file :photo, :styles => { :icon => "95>", :small => "150>", :medium => "250>", :large => "540>" }, #:styles      => {:icon => "50x50#", :thumb=> "100x100#", :small  => "190x190#", :large => "500x500>" },
  :url  => "/assets/project/:id/:style/:basename.:extension",
  :path => ":rails_root/public/assets/project/:id/:style/:basename.:extension",
  :default_url => "/assets/project/default/:style/default.png"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg', 'image/x-png']
end
