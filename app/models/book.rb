class Book < ActiveRecord::Base
  def self.random
    Book.find(self.random_id)
  end

  def self.random_id
    rand(Book.count)
  end

  def image_url
    "http://webservices.bibliotheek.be/index.php?func=cover&ISBN=#{isbn}&coversize=large"
  end
end
