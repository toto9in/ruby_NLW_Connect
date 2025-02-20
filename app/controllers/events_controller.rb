class EventsController < ApplicationController
  def create
    params = validate_params!(CreateEventValidator.new, create_event_params)

    response = Events::EventsCreatorService.new.create(params[:name])

    render json: response[:body], status: response[:status_code]
  end


  private

  def create_event_params
    params.expect(data: [ :name ]).to_h
  end


  def validate_params!(validator, params)
    result = validator.call(params)

    if result.success?
      result.to_h
    else
      raise InvalidParamsError.new(result.errors.to_h)
    end
  end
end

module Events
  class EventsController < ApplicationController
    def create
      params = validate_params!(CreateEventValidator.new, create_event_params)

      response = EventsCreatorService.new.create(params[:name])

      render json: response[:body], status: response[:status_code]
    end


    private

    def create_event_params
      params.expect(data: [ :name ]).to_h
    end


    def validate_params!(validator, params)
      result = validator.call(params)

      if result.success?
        result.to_h
      else
        raise InvalidParamsError.new(result.errors.to_h)
      end
    end
  end
end
