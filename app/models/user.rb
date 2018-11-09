class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
