class HorsesTags < ActiveRecord::Base
  belongs_to :horse
  belongs_to :tag
end
