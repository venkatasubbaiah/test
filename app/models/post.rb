class Post < ActiveRecord::Base
  attr_accessible :name,:title, :content
  validates :name,:title,:content ,:presence =>true
end
