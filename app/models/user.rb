class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :date_of_birth, :email_address, :gender

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :date_of_birth,  :presence => true
  validates :email_address, :presence => true, :email => true
  validates :gender, :presence => true, :inclusion => { :in => %w(male female),
                                        :message =>'gender should not be %{value}' }

  validate :date_of_birth_validation

  def date_of_birth_validation
      if self.date_of_birth.present?
        if self.date_of_birth.future?
          errors.add(:date_of_birth,"you have entered future date")
        end
      end
  end
    self.per_page =15

end
