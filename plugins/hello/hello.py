from errbot import BotPlugin, botcmd, arg_botcmd

class hello(BotPlugin):
    """Example 'Hello, world!' plugin for Errbot"""

    @botcmd
    def hello(self, msg, args):
        """Say hello to the world"""
        yield "Hello, world!"

    @arg_botcmd('name', type=str)
    def saymyname(self, msg, name=None):
        """Say the entered name"""
        yield "Hello, {first_name}".format(
            first_name=name
        )
