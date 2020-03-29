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

class Playwright
    attr_accessor :id, :name, :birth_year

    def self.all
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum) }
    end

    def self.find_by_name(name)
        PlayDBConnection.instance.execute("SELECT * FROM playwrights WHERE name = ?")
    end

    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
    end

    def create
        return "#{self} already in database" if self.id
        PlayDBConnection.instance.execute(<<-SQL ,self.name, self.birth_year)
            INSERT INTO
                playwrights(name, birth_year)
            VALUES
                (?, ?)
        SQL
        self.id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
            UPDATE
                playwrights
            SET
                name = ?,
                birth_year = ?
            WHERE
                id = ?
        SQL
    end

    def get_plays
        PlayDBConnection.instance.execute(<<-SQL, self.name)
            SELECT
                *
            FROM
                plays
            JOIN
                playwrights ON plays.playwright_id = playwrights.id
            WHERE
            playwrights.name = ?
        SQL
        end
end
