class EventsCreatorService
  def create(event_name)
    existing_event_response = check_event(event_name)
    return existing_event_response if existing_event_response

    event = Event.create(name: event_name)
    format_response(event_name) if event.valid?
  end

  private

  def check_event(event_name)
    result = Event.find_by(name: event_name)
    if result.present?
      return {
        body: {
          errors: [ "Event with that name already exists" ]
        },
        status_code: 409
      }
    end
    nil
  end

  def format_response(event_name)
    {
      body: {
        data: {
          Type: "Event",
          count: 1,
          attributes: {
            event_name: event_name
          }
        }
      },
      status_code: 201
    }
  end
end
