class Movie < ApplicationRecord
  RATINGS = %w[G PG PG-13 R].freeze

  def self.all_ratings
    RATINGS
  end

  def self.with_ratings(ratings_list)
    ratings = Array(ratings_list).map { |rating| rating.to_s.upcase }.uniq
    return all if ratings.empty?

    where("UPPER(rating) IN (?)", ratings)
  end
end
