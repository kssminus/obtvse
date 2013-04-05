class Category < ActiveRecord::Base
  has_many :post, :dependent => :destroy
  #attr_accessible :name

  validates :name, :presence => :true
end
