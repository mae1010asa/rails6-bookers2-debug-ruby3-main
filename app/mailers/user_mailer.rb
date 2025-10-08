class UserMailer < ApplicationMailer

  def send_notification(group_user, event)
    @title = event[:title]
    @body = event[:body]
    
    @mail = UserMailer.new()
    mail(
      from: ENV['MAIL_ADDRESS'],
      to:   group_user.email,
      subject: "#{@group.name} の新しいイベント"
    )
  end

  def send_notifications_to_group(event)
    group = event[:group]
    group.users.each do |group_user|
      UserMailer.send_notification(group_user, event).deliver_now
    end
  end
    
end
