class User < ActiveRecord::Base
  attr_accessor :password

  validates :name,  :presence => true, 
                              :length      => { maximum: 50 }

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,   :presence      => true, 
                               :format          => { with: email_regex }, 
                               :uniqueness  => { case_sensitive: false }
  validates :password, :presence      => true,
                                    :confirmation => true
end
