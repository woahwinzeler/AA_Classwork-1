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
  attr_accessor :fname, :lname, :id

  # def self.all
  #   data = QuestionsDatabase.instance.execute("SELECT * FROM users")
  #   data.map { |options| Users.new(options) }
  # end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM users
    WHERE id = ?
    SQL
    return nil unless user.length > 0
    Users.new(user.first)
  end

end

class Questions
  attr_accessor :title, :body, :id, :author_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM questions
    WHERE id = ?
    SQL

    return nil unless question.length > 0 
    Questions.new(question.first)
  end

end

class QuestionFollows
  attr_accessor :user_id, :question_id, :id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    follows = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_follows
    WHERE id = ?
    SQL

    return nil unless follows.length > 0 
    QuestionFollows.new(follows.first)
  end

end


class Replies
  attr_accessor :user_id, :question_id, :id, :body, :parent_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @body = options['body']
    @parent_id = options['parent_id']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM replies
    WHERE id = ?
    SQL

    return nil unless reply.length > 0 
    Replies.new(reply.first)
  end

end


class QuestionLikes
  attr_accessor :user_id, :question_id, :id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_id(id)
    like = QuestionsDatabase.instance.execute(<<-SQL, id)
    SELECT *
    FROM question_likes
    WHERE id = ?
    SQL

    return nil unless like.length > 0 
    QuestionLikes.new(like.first)
  end

end


p Users.find_by_id(1)