require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    self.class_name.downcase + "s"
  end
end

class BelongsToOptions < AssocOptions
  attr_accessor :class_name, :foreign_key, :primary_key
  def initialize(name, options = {})
    @class_name = name.to_s.camelcase
    @foreign_key = (name.to_s.singularize + "_id").to_sym
    @primary_key = "id".to_sym

    options.each do |option, val|
      self.send("#{option.to_s + "="}", val)
    end
  end
end

class HasManyOptions < AssocOptions
  attr_accessor :class_name, :foreign_key, :primary_key
  def initialize(name, self_class_name, options = {})
    @class_name = name.to_s.singularize.capitalize
    @foreign_key = (self_class_name.to_s.downcase.singularize + "_id").to_sym
    @primary_key = "id".to_sym

    options.each do |option, val|
      self.send("#{option.to_s+"="}", val)
    end
  end

end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    self.assoc_options[name] = BelongsToOptions.new(name, options)

    define_method(name) do
      options = self.class.assoc_options[name]

      key_val = self.send(options.foreign_key)
      options.model_class.where(options.primary_key => key_val).first
    end
  end

  def has_many(name, options = {})
    self.assoc_options[name] = HasManyOptions.new(name, self.name, options)

    define_method(name) do
      options = self.class.assoc_options[name]

      key_val = self.send(options.primary_key)
      options.model_class.where(options.foreign_key => key_val)
    end
  end

  def assoc_options
    @assoc_options ||= {  }
    @assoc_options
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
