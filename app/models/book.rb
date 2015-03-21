require 'open-uri'

class Book < ActiveRecord::Base
  has_many :user_swiped_ratings

  def self.random
    Book.find(self.random_id)
  end

  def self.random_id
    rand(Book.count)
  end

  def image_url
    "http://webservices.bibliotheek.be/index.php?func=cover&ISBN=#{isbn}&coversize=large"
  end

  def is_available
    doc = Nokogiri::HTML(open("http://obgent.staging.aquabrowser.be/api/v0/availability/?beid=#{beid}&authorization=26f9ce7cdcbe09df6f0b37d79b6c4dc2&lang=nl"))
    raise
  end
end
