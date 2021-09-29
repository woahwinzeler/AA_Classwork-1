require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include singleton


end

class Users

  def self.find_by_id()

  end

end