class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :tasks
end
