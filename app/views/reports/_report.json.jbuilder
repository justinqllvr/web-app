json.extract! report, :id, :title, :text, :latitude, :longitude, :created_at, :updated_at
json.url report_url(report, format: :json)
