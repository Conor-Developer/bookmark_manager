require_relative '../database_connection_setup'
require 'bcrypt'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    # encrypt the plain text password
    encrypted_password = BCrypt::Password.create(password)

    # insert the encrypted password into the database, instead of a plain text password
    result = DatabaseConnection.query(
      "INSERT INTO users (email, password) VALUES($1, $2) RETURNING id, email;",
      [email, encrypted_password]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE id = $1;",
      [id]
    )
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end
