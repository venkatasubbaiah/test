class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end	
class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :date_of_birth, :email_address
  validates :first_name, :last_name, :date_of_birth,  :presence => true
  validates :email_address, :presence => true, :email => true
end
