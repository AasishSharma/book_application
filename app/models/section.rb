class Section < ActiveRecord::Base
  belongs_to :article
  belongs_to :book
  has_many :comments
end
