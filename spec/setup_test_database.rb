require 'pg'

def setup_test_database
  puts "Setting up test database..."
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks and comments tables
  connection.exec("TRUNCATE bookmarks, comments;")
end
