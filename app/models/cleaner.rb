class Cleaner < ActiveRecord::Base 
  has_secure_password 
  has_many :pools
end 