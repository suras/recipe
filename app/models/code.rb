class Code
  class << self
    def [](k)
  	  code = {
         :wish_list_book => 'WB',
         :error_rescue => '103',
         :error_no_resource => '104',
         :error_email_taken => '102',
         :error_resource => '105',
         :status_error => 400,
         :status_success => "success"
        }
      if code[k.to_sym].present?
        return code[k.to_sym]
      else
        raise "Code not found"
      end
    end
   end
end