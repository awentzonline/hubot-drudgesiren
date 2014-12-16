# hubot-drudgesiren

This hubot script checks http://www.drudgereport.com to see if `siren.gif`
exists and, if so, echos the current headline to chat.

# Usage

Specify output room with HUBOT_DRUDGESIREN_ROOM env var.


### Running hubot-drudgesiren Locally

You can test your hubot by running the following.

You can start hubot-drudgesiren locally by running:

    % bin/hubot

You'll see some start up output about where your scripts come from and a
prompt:

    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading adapter shell
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/scripts
    [Sun, 04 Dec 2011 18:41:11 GMT] INFO Loading scripts from /home/tomb/Development/hubot/src/scripts
    Hubot>

Then you can interact with hubot-drudgesiren by typing `hubot-drudgesiren help`.

    hubot-drudgesiren> hubot-drudgesiren help

    hubot-drudgesiren> animate me <query> - The same thing as `image me`, except adds a few
    convert me <expression> to <units> - Convert expression to given units.
    help - Displays all of the help commands that Hubot knows about.
    ...
