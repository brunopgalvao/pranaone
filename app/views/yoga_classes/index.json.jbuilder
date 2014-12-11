json.array!(@yoga_classes) do |yoga_class|
  json.extract! yoga_class, :id, :name, :description, :user_id
  json.url yoga_class_url(yoga_class, format: :json)
end
