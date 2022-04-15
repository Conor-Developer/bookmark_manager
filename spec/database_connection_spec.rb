require_relative '../lib/database_connection'

describe DatabaseConnection do
  context '#setup' do
    it 'Sets up a connection to a specified database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  context '#query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(connection).to receive(:exec_params).with("SELECT * FROM bookmarks;", [])
      DatabaseConnection.query("SELECT * FROM bookmarks;")
    end
  end
end
