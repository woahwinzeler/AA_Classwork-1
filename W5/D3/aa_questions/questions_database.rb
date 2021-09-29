require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end


end

class Users
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |options| Users.new(options) }
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def self.find_by_id()

  end

end

p Users.all