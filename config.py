import logging
import os

AUTOINSTALL_DEPS = True
BACKEND = 'Slack'
BOT_ADMINS = ('@damian.burne',)
BOT_ALT_PREFIXES = ('@r2d2',)
BOT_ALT_PREFIX_SEPARATORS = (':', ',', ';')
BOT_ALT_PREFIX_CASEINSENSITIVE = True
BOT_DATA_DIR = './data'
BOT_EXTRA_PLUGIN_DIR = './plugins'
BOT_IDENTITY = { 'token': os.environ['slack_api_key'] }
BOT_LOG_FILE = './data/err.log'
BOT_LOG_LEVEL = logging.DEBUG
BOT_PREFIX = '!'
CHATROOM_PRESENCE = ()
DIVERT_TO_PRIVATE = ('')

ACCESS_CONTROLS = {
#    'services': {'allowusers': ('@damian.burne',) }
}
