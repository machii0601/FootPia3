json.array!(@events) do |event|
  json.id event.id
  json.title "#{event.title} (#{event.group.group_name})"
  json.start event.start_time
  json.end event.end_time
  json.url group_url(event.group_id, format: :html)
end