class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # 현재 사용자의 알림 스트림을 구독
    stream_for current_user
  end

  def unsubscribed
    stop_all_streams
  end
end