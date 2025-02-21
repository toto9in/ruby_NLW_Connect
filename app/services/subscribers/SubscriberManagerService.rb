module Subscribers
  class SubscriberManagerService
    def get_subscribers_by_link(link, event_id)
      subscribers = Subscriber.where(link: link, event_id: event_id)

      return { body: { data: [] }, status_code: 200 } if subscribers.empty?

      format_subs_by_link_response(subscribers)
    end

    private

    def format_subs_by_link_response(subscribers)
      formatted_sub_list = subscribers.map do |sub|
        {
          name: sub.name,
          email: sub.email
        }
      end
      {
        body: {
          data: {
            Type: "Subscriber",
            count: formatted_sub_list.size,
            attributes: formatted_sub_list
          }
        },
        status_code: 200
      }
    end
  end
end
