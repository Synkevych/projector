# frozen_string_literal: true

module CardsHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column,
                     direction: direction,
                     load_new: true,
                     page: 1,
                     filter: sort_filter }, { remote: true }
  end

  def short_text(text)
    truncate(text, length: 17)
  end

  def style_for_deleted(card)
    card.discarded_at? ? 'background-color: #a9a9a959' : 'cursor: pointer'
  end

  def card_comment(card)
    unless card.comments.blank?
      "<div class=\"kanban-comment d-flex align-items-center mr-50\">
      <i class=\"bx bx-message font-size-small mr-25\"></i>
      <span class=\"font-size-small\">#{card.comments.count}</span>
    </div>".html_safe
    end
  end

  def card_date(card)
    full_date = nil
    if card.start_date.present?
      full_date = case card.start_date
                  when Date.today
                    'Today'
                  when Date.tomorrow
                    'Tomorrow'
                  when Date.yesterday
                    'Yesterday'
                  else
                    [card.start_date.strftime('%B'), card.start_date.day].join(' ')
                  end
    end

    "<div class=\"kanban-due-date d-flex mr-50\">
      <i class=\"bx bx-calendar-event mr-25\"></i>
      <span class=\"font-size-small\">#{full_date}</span>
    </div>

    <div class=\"kanban-due-date d-flex mr-50\">
      <i class=\"bx bxs-time-five mr-25\"></i>
      <span class=\"font-size-small\">#{card_duration(card)}</span>
    </div>".html_safe
  end

  def check_key_value(attribute, value)
    if attribute.include?('user_id') || attribute.include?('column_id')
      attribute_value(attribute, value)
    else
      value
    end
  end

  def attribute_value(attribute, value)
    case attribute
    when 'column_id'
      Column.find(value).name
    when 'user_id'
      User.find(value).full_name
    end
  end

  def event_color(card)
    today_date = Date.today
    card_date = card.start_date
    if card_date.nil?
      'info'
    elsif card_date == Date.tomorrow
      'warning'
    elsif card_date + (card.duration / (8 * 60)).days > today_date || today_date <= card_date
      'success'
    elsif today_date >= card_date
      'danger'
    else
      'info'
    end
  end

  def card_duration(card)
    return if card.duration == 0

    format('%2dd %2dh %2dm', card.duration / (8 * 60), (card.duration / 60) % 8, card.duration % 60)
  end
end
