Mail.register_interceptor(EmailSalesforceInterceptor) if ENV["SALESFORCE_BCC"].present?
