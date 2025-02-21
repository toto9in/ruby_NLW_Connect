class InvalidParamsError < StandardError
  attr_reader :errors

  def initialize(errors)
    @errors = errors
    super("Invalid parameters: #{errors}")
  end
end
