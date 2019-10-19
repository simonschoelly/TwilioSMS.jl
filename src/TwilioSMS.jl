"""
    TwilioSMS

A small package that provides a function `sendsms` for sending text messages using Twilio.
"""
module TwilioSMS

using HTTP
using JSON

export sendsms




"""
    sendsms(msg; from, to, sid, auth_token)

Send a text message using Twilio.

## Arguments
- `msg` The message to send
- `from` The phone number from which to send
- `to` The recipient's phone number
- `sid` The Account SID of your Twilio account. If not specified try to read the environment variable `TWILIO_ACCOUNT_SID`
- `auth_token` The Auth Token of your Twilio account. If not specified try to read the environment variable `TWILIO_AUTH_TOKEN`

## Examples
```julia-repl
julia> sendsms("Hello, World 🌍!", from="+1-202-555-0107", to="+1-512-555-0180")

julia> sendsms("With explicit sid and access token", from="+1-202-555-0107", to="+1-512-555-0180",
                sid="d5d7b014b05d54fa52647820a035089e", auth_token="bed7fe1af0d18dfd-100972663d58f196")
```
"""
function sendsms(msg; from, to, sid=_from_env("TWILIO_ACCOUNT_SID"), auth_token=_from_env("TWILIO_AUTH_TOKEN"))

    payload = HTTP.URIs.escapeuri(Dict(:To => to, :From => from, :Body => msg))

    url = "api.twilio.com/2010-04-01/Accounts/$sid/Messages.json"
    full_url = "https://$sid:$auth_token@$url"

    response = HTTP.post(full_url, ["Content-Type" => "application/x-www-form-urlencoded"], payload, basic_authorization=true)
    response.status == 201 || error("Something went wrong. Respone was:\n$(string(response))")

    return nothing
end

function _from_env(key)

    !haskey(ENV, key) && error("Environment variable \"$key\" could not be found, must be manually specified.")
    return ENV[key]
end


end # module
