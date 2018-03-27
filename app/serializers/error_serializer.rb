class ErrorSerializer
  attr_reader :errors

  def initialize(errors)
    @errors = errors
  end

  def serialized_json
    { errors: errors.messages }
  end
end
