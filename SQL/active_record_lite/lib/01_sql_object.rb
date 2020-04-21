require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @symbols if @symbols

    table = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{ self.table_name }
        LIMIT 0
    SQL

    @symbols = []
    table[0].map { |ele| @symbols << ele.to_sym }
    @symbols
  end

  def self.finalize!
    self.columns.each do |symbol|
      define_method(symbol) do
        self.attributes[symbol]
      end

      define_method(symbol.to_s + "=") do |value|
        self.attributes[symbol] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    unless @table_name
      @table_name = self.to_s.tableize
    end
    @table_name
  end

  def self.all
  results = DBConnection.execute(<<-SQL)
        SELECT
          #{table_name}.*
        FROM
          #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end

  def self.find(id)
    result = DBConnection.execute(<<-SQL, id)
           SELECT
             *
           FROM
             #{table_name}
           WHERE id = ?
    SQL

    return nil if result.length == 0
    self.new(result[0])
  end

  def initialize(params = {  })
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", val)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end

  end

  def attributes
    @attributes ||= {  }
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.length).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
        INSERT INTO
          #{self.class.table_name} (#{col_names})
        VALUES
          (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(" = ?,")
    col_names += " = ?"
    DBConnection.execute(<<-SQL, *attribute_values.drop(1), attribute_values[0])
        UPDATE
          #{self.class.table_name}
        SET
          #{col_names}
        WHERE
          id = ?
    SQL
  end

  def save
    columns = self.class.columns
    if attribute_values[0] == nil
      insert
    else
      update
    end
  end
end
