class Booking < ApplicationRecord
  belongs_to :user_id
  belongs_to :field_id
end
