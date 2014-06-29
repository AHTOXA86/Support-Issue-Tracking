json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :subject, :text, :department, :status, :ownership, :customer_id, :unique
  json.url ticket_url(ticket, format: :json)
end
