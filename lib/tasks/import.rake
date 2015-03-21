namespace :import do
  task :books => :environment do
    require 'csv'
    i = 0
    CSV.foreach('data/boeken_90k.csv', col_sep: ';', headers: true) do |row|
      year = row['year_published'].try(:to_i)
      if (isbn = row['ISBN'])
        book = Book.new(isbn: isbn.gsub('-', ''),
                     title: row['title'][0..1000],
                     year_published: year, 
                     book_type: row['type'],
                     language: row['language'],
                     author_firstname: row['author_firstname'],
                     author_lastname: row['author_lastname']
                    )
        if book.book_type == 'Boek' && book.year_published.is_a?(Integer) && book.year_published > 1950
          i+=1
          book.save!
          p i if i % 100 == 0
          if i > 9000
            puts "Enough books, stopping"
            exit(0)
          end
        end
      end
    end
  end
end
