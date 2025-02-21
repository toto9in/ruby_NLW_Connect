class EventsLinkController < ApplicationController
  include HttpParamsValidation

  def create
    params = validate_params!(CreateEventLinkValidator.new, create_event_link_params)

    response = EventLink::EventsLinkCreatorService.new.create(params)

    render json: response[:body], status: response[:status_code]
  end

  private

  def create_event_link_params
    params.expect(data: [ :event_id, :subscriber_id ]).to_h
  end
end
