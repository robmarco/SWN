require 'test_helper'

class SwimmerMailerTest < ActionMailer::TestCase
  test "personal_message" do
    mail = SwimmerMailer.personal_message
    assert_equal "Personal message", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
