class Voice < ApplicationRecord
  belongs_to :user
  validates :voice, presence: true

end
