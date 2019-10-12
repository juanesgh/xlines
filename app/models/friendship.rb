class Friendship < ApplicationRecord
  belongs_to :sender, :class_name => 'Player'
  belongs_to :receiver, :class_name => 'Player'
end
