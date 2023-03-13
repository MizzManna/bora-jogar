class Field < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
