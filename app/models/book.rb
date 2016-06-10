class Book < ActiveRecord::Base
  has_many :articles
  has_many :sections, through: :articles
end
