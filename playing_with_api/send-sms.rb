require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC9c6181ed3f1cea1e5d34daf71951e8d1'
auth_token = 'eb695e31060e34e970ddae2cd4590cb5'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  from: '+16475592418',
  to: '+14163003839',
  body: 'Robot invasion! Reply back with any sightings.'
)
