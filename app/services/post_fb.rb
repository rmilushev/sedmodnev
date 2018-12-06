class PostFb
  class << self
    def post(group_id, status)
      @logger = Logger.new(STDOUT)
      agent = Mechanize.new
      agent.get('https://mbasic.facebook.com')
      login_form = agent.page.form_with(method: "POST")
      login_form.email = ENV['FACEBOOK_EMAIL']
      login_form.pass = ENV['FB_PASS']
      agent.submit(login_form)

      group_page = agent.get("https://mbasic.facebook.com/groups/#{group_id}/")
      form = group_page.form_with(method: "POST")
      form['xc_message'] = status
      button = form.button_with(value: 'Публикуване')
      resp = agent.submit(form, button)
      # puts "RESPONSE: #{resp}"
      puts "RESP> TITLE: #{resp.title}"
      st = resp.title == "Action Blocked" ? "Blocked..." : "Posted to #{group_id}"
      @logger.debug "Post to fb status: #{st}, resp. title: #{resp.title}"
    end
  end
end
