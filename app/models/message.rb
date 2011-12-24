class Message < ActiveRecord::Base
  attr_accessible :email, :name, :number, :message, :message_type
end
