class Profile < ApplicationRecord
  # NHO: consider adding dependent: :destroy to this relationship so that whenever
  # a profile is a destroyed, all associated stories are also destroyed
  has_many :stories

  # NHO: since profiles are the crux of this application could be a good idea to
  # add some validations!
end
