module ErrorsHelper
  def error_code name
    I18n.t  name,
            locale: :api,
            scope: [:api, :errors, :code]
  end

  def error_message name
    I18n.t  name,
            scope: [:api, :errors, :messages]
  end
end
