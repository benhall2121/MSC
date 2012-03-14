class Message < ActiveRecord::Base
  attr_accessible :email, :name, :number, :message, :message_type, :delivery_time, :delivery_date, :delievery_type, :flavor, :design, :special_instruction
end
