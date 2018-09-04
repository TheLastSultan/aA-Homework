require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(the_title)
    data = PlayDBConnection.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      plays
    WHERE
      title LIKE #{the_title}
    SQL
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

end

class Playwright
  attr_accessor :id , :name , :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM Playwrights")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL)
    SELECT
      *
    FROM
      Playwrights
    WHERE
      name LIKE #{name}
    SQL
  end

  def initialize(options)
    @playwright_id = options['playwright_id']
    @title = options['name']
    @year = options['year']
  end

  def create;end

  def update;end

  def get_plays;end

end


# CREATE TABLE playwrights (
#   id INTEGER PRIMARY KEY,
#   name TEXT NOT NULL,
#   birth_year INTEGER
# );