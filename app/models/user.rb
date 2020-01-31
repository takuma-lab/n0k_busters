class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :voices
  
  def voices
    return Voice.where(user_id: self.id)
  end

end