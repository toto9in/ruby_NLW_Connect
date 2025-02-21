module Subscribers
  class SubscriberManagerService
    def get_subscribers_by_link(link, event_id)
      subscribers = Subscriber.where(link: link, event_id: event_id)

      return { body: { data: [] }, status_code: 200 } if subscribers.empty?

      format_subs_by_link_response(subscribers)
    end

    def get_event_ranking(event_id)
      result = Subscriber
                 .where(event_id: event_id)
                 .where.not(link: nil)
                 .group(:link)
                 .order("COUNT(id) DESC")
                 .count

      return { body: { data: [] }, status_code: 200 } if result.empty?

      format_event_ranking_response(result)
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

    def format_event_ranking_response(ranking)
      formatted_event_ranking = ranking.map do |link, value|
        {
          link:,
          total: value
        }
      end
        {
          body: {
            data: {
              Type: "Ranking",
              count: formatted_event_ranking.size,
              attributes: formatted_event_ranking
            }
          },
          status_code: 200
        }
    end
  end
end
