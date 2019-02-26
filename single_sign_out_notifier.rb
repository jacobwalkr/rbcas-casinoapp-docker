# This is a replacement that prevents single sign out notifications.
# These causes errors in a Docker environment because it tries to send the notification to
# "localhost", which is not accessible to the cas service.
# Also we don't use single sign out anyway. You can comment this out in the Dockerfile if you've
# figured out a nice way to use it :)

class CASino::ServiceTicket::SingleSignOutNotifier
  def initialize(service_ticket); end

  def notify
    false
  end
end
