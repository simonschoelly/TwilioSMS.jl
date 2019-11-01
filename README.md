# TwilioSMS.jl

[![Build Status](https://travis-ci.com/simonschoelly/TwilioSMS.jl.svg?branch=master)](https://travis-ci.com/simonschoelly/TwilioSMS.jl)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![GitHub](https://img.shields.io/github/license/simonschoelly/TwilioSMS.jl)

## Introduction
TwilioSMS.jl is micro-package that provides a single function for sending text messages using the Twilio api. If there is interest, then further functionaliy can be added in the future. PRs are welcome.

## Setup

Adding the package to Julia is easy, in the REPL simply type:
```julia
]add TwilioSMS
```
After that, an account has to be created on [Twilio.com](https://www.twilio.com/) and a sid, an authentication token and a sender number has to be set up there. While this service costs, there is also a free trial that allows one to send sms. For the free trial it is also necessary that the receivers number is registered on their website.

The easiest way to store the the sid and auth token is in the environment variables `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN`. It is also possible to pass those values explicetly in the code but for security reasons it is better not to have such values in code.

## Usage

Assuming that the correct values have been stored in the environment variables `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` one can then simply write:

```julia
using TwilioSMS

from = "+1-202-555-0107"
to   = "+1-512-555-0180"

sendsms("Did you know that you can send emojis in SMS? 🥦🦒", from=from, to=to)
```

For passing them explicitely one has to write:
```julia
using TwilioSMS

sid        = "d5d7b014b05d54fa52647820a035089e"
auth_token = "bed7fe1af0d18dfd-100972663d58f196"

from = "+1-202-555-0107"
to   = "+1-512-555-0180"

sendsms("🛎️ Compilation is done, get back to work!", from=from, to=to, sid=sid, auth_token=auth_token)
```

## Similar Julia packages
* [Twilert.jl](https://github.com/glesica/Twilert.jl) Also allows one to send text messages using Twilio. Has not been updated in 6 years so it will not run on current Julia versions.
* [Pushover.jl](https://github.com/scls19fr/Pushover.jl) is a Julia packge for sending notifcations using the [Pushover Notification Service](https://pushover.net/).
* [BulkSMS.jl](https://github.com/scls19fr/BulkSMS.jl) is a Julia package for sending notifications using [BulkSMS](https://www.bulksms.com).

There seem to be multiple packages for [Telegram](https://telegram.org/):

* [Telegram.jl](https://github.com/Arkoniak/Telegram.jl)
* [JuliaIO/Telegram.jl](https://github.com/JuliaIO/Telegram.jl)
* [TelegramAPI.jl](TelegramAPI.jl)
