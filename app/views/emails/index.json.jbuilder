json.received_emails @emails.where(to: current_user.email) do |email|
  json.extract! email, :title, :body, :is_read, :from, :to, :id
end

json.unread_emails @emails.where("is_read"=> false).where(to: current_user.email) do |email|
  json.extract! email, :title, :body, :from,:to, :id
end

json.total_unread_email @emails.where("is_read"=> false).where(to: current_user.email).count

json.total_received_email @emails.where(to: current_user.email).count

json.total_sent_email @emails.where(from: current_user.email).count

json.sent_emails @emails.where(from: current_user.email) do |email|
  json.extract! email, :title, :body, :from, :to, :id
end

json.current_email current_user.email