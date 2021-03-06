class TtaNeedSerializer < BaseSerializer
  has_one :grantee
  has_one :context_link
  has_many :tasks

  attributes :narrative, :indicator, :specialist_types_needed, :start_date, :created_at, :updated_at
  attribute(:topics) { object.topic_list }

  def relationship_related_link(attribute_name)
    case attribute_name
    when :context_link
      if object.context_link_id.present?
        path_helper.monitoring_report_url(id: object.context_link_id, host: base_url)
      end
    else
      super
    end
  end
end
