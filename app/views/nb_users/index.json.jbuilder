json.array!(@nb_users) do |nb_user|
  json.extract! nb_user, :id, :email, :lastname, :firstname, :emailoptin, :updatedat
  json.url nb_user_url(nb_user, format: :json)
end
