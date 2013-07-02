class SwimmerMailer < ActionMailer::Base
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.swimmer_mailer.personal_message.subject
  #
  def personal_message(trainer, swimmer, message)
    @message = message

    mail( :from => trainer.email,
          :reply_to => trainer.email,
          :to => swimmer.email,
          :subject => "[QuSwimming] Mensaje privado de #{trainer.full_name}" )
  end

  def message_to(trainer,swimmers,message)
    @message = message
    swimmers_list = swimmers.map(&:email)*','

    mail( :from => trainer.email,
          :reply_to => trainer.email,
          :bcc => swimmers_list,
          :subject => "[QuSwimming] Mensaje privado de #{trainer.full_name}" )
  end

  def trainning_message(trainer, pdf, trainning)
    attachments["entrenamiento_#{trainning.date_trainning.strftime('%d%m%Y')}.pdf"] = pdf

    mail  :from => trainer.email,
          :replay_to => trainer.email,
          :bcc => trainer.swimmers.map(&:email).uniq*', ',
          :subject => "[QuSwimming] Entrenamiento #{trainning.date_trainning.strftime('%d %m %Y')}"
  end
end
