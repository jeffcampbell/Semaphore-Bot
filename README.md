# Semaphore-Bot
A Slack command that translates text into semaphore

![flag semaphore](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/US_Navy_051129-N-0685C-007_Quartermaster_Seaman_Ryan_Ruona_signals_with_semaphore_flags_during_a_replenishment_at_sea.jpg/1200px-US_Navy_051129-N-0685C-007_Quartermaster_Seaman_Ryan_Ruona_signals_with_semaphore_flags_during_a_replenishment_at_sea.jpg)

This is a silly little slash command that translates text into [flag semaphore](https://en.wikipedia.org/wiki/Flag_semaphore).

### What you will need
* A [Heroku](http://www.heroku.com) account
* A [slash command token](https://api.slack.com/slash-commands) for your Slack team
* [Custom emoji](https://get.slack.help/hc/en-us/articles/206870177-Create-custom-emoji) for the semaphore alphabet

### Setup
* Clone this repo locally
* Create a new Heroku app and initialize the repo
* Push the repo to Heroku
* Navigate to the settings page of the Heroku app and add the following config variables:
  * ```OUTGOING_WEBHOOK_TOKEN``` The token for your slash command integration in Slack
* Navigate to the integrations page for your Slack team. Create a slash command, use the URL for your heroku app, and copy the token to your ```OUTGOING_WEBHOOK_TOKEN``` config variable.
* Open the compressed ```semaphore-images.zip``` file and add them as custom emoji to your slack team 
