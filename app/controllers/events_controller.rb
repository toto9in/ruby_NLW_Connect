class EventsController < ApplicationController
  include HttpParamsValidation
  def create
    params = validate_params!(CreateEventValidator.new, create_event_params)

    response = Events::EventsCreatorService.new.create(params[:name])

    render json: response[:body], status: response[:status_code]
  end


  private

  def create_event_params
    params.expect(data: [ :name ]).to_h
  end
end
