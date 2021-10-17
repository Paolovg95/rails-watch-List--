class List < ApplicationRecord
  GENRES = ['Comedy','Action','Drama','Romance','Horror','Thriller','Suspense','Documentary','Sci-fi']
  has_many :bookmarks, dependent: :destroy # Delete all associated bookmarks
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
end
