class Listing < ActiveRecord::Base
  has_many :pitis

  validates :mls, uniqueness: { message: "This listing has already been added" }
end
