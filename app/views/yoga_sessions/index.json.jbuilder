json.array!(@yoga_sessions) do |yoga_session|
  json.extract! yoga_session, :id, :session_date, :session_time, :yoga_class_id
  json.url yoga_session_url(yoga_session, format: :json)
end
