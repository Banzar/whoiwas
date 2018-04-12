json.extract! assist_message, :id, :email, :subject, :content, :completed, :created_at, :updated_at
json.url assist_message_url(assist_message, format: :json)
