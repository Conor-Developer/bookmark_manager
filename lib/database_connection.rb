require 'pg'

class DatabaseConnection

  def self.setup(database_name)
    @connection = PG.connect(dbname: database_name)
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end

end