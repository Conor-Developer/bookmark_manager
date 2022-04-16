require 'pg'

def setup_test_database
  puts "Setting up test database..."
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # Clear the bookmarks, comments and bookmark_tags tables
  connection.exec("TRUNCATE bookmarks, comments, bookmark_tags;")
end
