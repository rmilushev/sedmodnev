class AuthorProfile < ApplicationRecord
  belongs_to :admin, dependent: :destroy
end
