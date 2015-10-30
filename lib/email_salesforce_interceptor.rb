module EmailSalesforceInterceptor
  def self.delivering_email(message)
    message.bcc = [*message.bcc, ENV["SALESFORCE_BCC"]]
  end
end
