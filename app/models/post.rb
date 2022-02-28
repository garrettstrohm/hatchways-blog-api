class Post < ApplicationRecord
    validates :sortBy, inclusion: { in: ["id", "reads", "likes", "popularity"] }
    validates :direction, inclusion: { in: ["desc", "asc"]}
    validates :tags, presence: true
end
