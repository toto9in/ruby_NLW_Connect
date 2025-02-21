module HttpParamsValidation
  extend ActiveSupport::Concern

  included do
    rescue_from InvalidParamsError, with: :handle_invalid_params
  end

  def validate_params!(validator, params)
    result = validator.call(params)

    if result.success?
      result.to_h
    else
      raise InvalidParamsError.new(result.errors.to_h)
    end
  end

  private

  def handle_invalid_params(exception)
    render json: { errors: exception.errors }, status: :unprocessable_entity
  end
end
