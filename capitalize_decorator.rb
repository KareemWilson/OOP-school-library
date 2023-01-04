require './decorator'
require './person'

class CapitalizeDecorator < Decorator
  def initialize(person)
    super
    @persona = person
  end

  def correct_name
    @persona.correct_name.upcase
  end
end
