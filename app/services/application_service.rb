class ApplicationService
  class << self
    def call *args
      new(*args).call
    end
  end

  def mailer_enable?
    Settings.mailer.enable
  end

  def assist_admin_email
    Settings.mailer.assist_address
  end

  def content_mail template, locals = {}
    I18n.with_locale(I18n.default_locale) do
      ActionController::Base.new.render_to_string template: template,
                                                  format: :plain, locals: locals
    end
  end

  def send_mail to, subject, body, from = Settings.mailer.from_address
    Sendgrid::SendMail.execute from, to, subject, body
  end
end
