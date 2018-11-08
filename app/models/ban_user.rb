class BanUser < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
