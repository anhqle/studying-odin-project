require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing"
    @client = JumpstartAuth.twitter
  end

  def tweet(message)
    if message.length <= 140
      @client.update(message)
    else
      puts "Message too long!"
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message:"
    screen_names = @client.followers.collect { |follower| follower.screen_name }
    if screen_names.include?(target)
      self.tweet("d #{target} #{message}")
    else
      puts "You can only send message to followers"
    end
  end

  def followers_list
    screen_names = []
    @client.followers.users.each { |follower| screen_names << follower["screen_name"]}
    return screen_names
  end

  def spam_my_followers(message)
    my_followers = followers_list
    my_followers.each { |follower| self.dm(follower, message) }
  end

  def everyones_last_tweet
    friends = @client.friends
    friends.sort_by! { |friend| friend.screen_name.downcase }
    timestamp = friend.status.created_at

    friends.each do |friend|
      puts "#{friend.screen_name}, #{friend.status.text}, #{timestamp.strftime("%A, %b %d")}"
    end
  end

  def shorten(original_url)
    puts "Shortening this URL: #{original_url}"
    Bitly.use_api_version_3
    bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
    return bitly.shorten(original_url).short_url
  end

  def run
    puts "Welcome to to JSL Twitter Client!"
    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp
      parts = input.split(" ")
      command = parts[0]
      case command
      when 'q' then puts "Goodbye!"
      when 't' then self.tweet(parts[1..-1].join(" "))
      when 'dm' then self.dm(parts[1], parts[2..-1].join(" "))
      when 'spam' then self.spam_my_followers[parts[1..-1].join(" ")]
      when 'elt' then self.everyones_last_tweet
      when 's' then self.shorten(parts[-1])
      when 'turl' then self.tweet("#{parts[1..-2].join(' ')} #{self.shorten(parts[-1])}")
      else
        puts "Sorry, I don't know how to #{command}"
      end
    end
  end
end

blogger = MicroBlogger.new
# blogger.tweet("MicroBlogger Initialized")
# blogger.tweet("".ljust(141, "abcd"))

blogger.run