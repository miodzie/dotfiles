# -*- coding: utf-8 -*-

SCRIPT_NAME = "commands"
SCRIPT_AUTHOR = "hue"
SCRIPT_VERSION = "0.0.7"
SCRIPT_LICENSE = "GPLv3"
SCRIPT_DESC = "some convenient commands"

import random

import_ok = True
try:
    import weechat
except ImportError:
    print("This script must be run under WeeChat")
    import_ok = False

weechat_version = 0


def shrug(data, buffer, args):
    weechat.command(buffer, "¯\_(ツ)_/¯")
    return weechat.WEECHAT_RC_OK

def wtf(data, buffer, args):
    weechat.command(buffer, "ಠ_ಠ")
    return weechat.WEECHAT_RC_OK

def lel(data, buffer, args):
    weechat.command(buffer, "lǝl")
    return weechat.WEECHAT_RC_OK

def lol(data, buffer, args):
    weechat.command(buffer, "█▄▄ ███ █▄▄")
    return weechat.WEECHAT_RC_OK

lennies = [
    '( ͡° ͜ʖ ͡° )',
    '( ͡⊙ ͜ʖ ͡⊙ )',
    '( ͡◉ ͜ʖ ͡◉ )',
    '( ͡ಠ ͜ʖ ͡ಠ)',
]

last_lenny = ''
def lenny_face(data, buffer, args):
    global last_lenny
    choice = random.choice([x for x in lennies if x != last_lenny])
    last_lenny = choice
    weechat.command(buffer, choice)
    return weechat.WEECHAT_RC_OK


flennies = [
    'ლ(   ͡° ͜  ͡°   ლ)',
    '(   ಠ  ͜  ಠ   )',
    '(    ͡^ ͜  ͡^    )',
    '(   ◕  ͜  ◕   )',
    '(   ⊙  ͜ʖ  ͡⊙   )',
]

last_flenny = ''
def fat_lenny(data, buffer, args):
    global last_flenny
    choice = random.choice([x for x in flennies if x != last_flenny])
    last_flenny = choice
    weechat.command(buffer, choice)
    return weechat.WEECHAT_RC_OK

bears = [
    'ʕ•ᴥ•ʔ',
    'ʕ •ᴥ•ʔ',
    'ʕ•ᴥ• ʔ',
    'ʕᵔᴥᵔʔ',
    'ʕʘᴥʘʔ',
    'ʕ¬ᴥ¬ʔ',
    'ʕಠᴥಠʔ',
    'ʕ◕ᴥ◕ʔ',
    'ʕ ◕ᴥ◕ʔ',
    'ʕ ♥ᴥ♥ʔ',
    'ʕ￫ᴥ￩ʔ',
    'ʕ╭ರᴥ•ʔ',
    'ʕ❍ᴥ❍ʔ',
]

last_bear = ''
def bear(data, buffer, args):
    global last_bear
    choice = random.choice([x for x in bears if x != last_bear])
    last_bear = choice
    weechat.command(buffer, choice)
    return weechat.WEECHAT_RC_OK

fat_bears = [
    'ʕ   • ᴥ •   ʔ',
    'ʕ    • ᴥ •   ʔ',
    'ʕ   • ᴥ •    ʔ',
    'ʕ   ᵔ ᴥ ᵔ   ʔ',
    'ʕ   ʘ ᴥ ʘ   ʔ',
    'ʕ   ¬ ᴥ ¬   ʔ',
    'ʕ   ಠ ᴥ ಠ   ʔ',
    'ʕ   ◕ ᴥ ◕   ʔ',
    'ʕ    ◕ ᴥ ◕   ʔ',
    'ʕ    ♥ ᴥ ♥   ʔ',
    'ʕ   ￫ ᴥ ￩   ʔ',
    'ʕ   ╭ರ ᴥ •   ʔ',
    'ʕ   ❍ ᴥ ❍   ʔ',
]

last_fbear = ''
def fat_bear(data, buffer, args):
    global last_bear
    choice = random.choice([x for x in fat_bears if x != last_fbear])
    last_bear = choice
    weechat.command(buffer, choice)
    return weechat.WEECHAT_RC_OK

diversity_bias = 0.5

def mock(text):
    out = ''
    last_was_upper = True
    swap_chance = 0.5
    for c in text:
        if c.isalpha():
            if random.random() < swap_chance:
                last_was_upper = not last_was_upper
                swap_chance = 0.5
            c = c.upper() if last_was_upper else c.lower()
            swap_chance += (1-swap_chance) * diversity_bias
        out += c
    return out

def mock_cb(data, buffer, args):
    # weechat.prnt("", "mock args: {}".format(args))
    # weechat.prnt("", "arg type: {}".format(type(args)))
    # args is a string
    output = mock(args)
    weechat.command(buffer, output)
    return weechat.WEECHAT_RC_OK

def zoop(data, buffer, args):
    weechat.command(buffer, "👉😎👉")
    return weechat.WEECHAT_RC_OK



if __name__ == '__main__' and import_ok:
    if weechat.register( SCRIPT_NAME, SCRIPT_AUTHOR, SCRIPT_VERSION,
            SCRIPT_LICENSE, SCRIPT_DESC, "", ""):
        weechat_version = weechat.info_get("version_number", "") or 0
        weechat.hook_command("shrug", "ascii shrug", "message", "", "", "shrug", "")
        weechat.hook_command("wtf", "ascii shrug", "message", "", "", "wtf", "")
        weechat.hook_command("lel", "ascii shrug", "message", "", "", "lel", "")
        weechat.hook_command("lol", "ascii lol", "message", "", "", "lol", "")
        weechat.hook_command("lenny", "lenny face", "message", "", "", "lenny_face", "")
        weechat.hook_command("flenny", "fat lenny face", "message", "", "", "fat_lenny", "")
        weechat.hook_command("bear", "fat bear face", "message", "", "", "bear", "")
        weechat.hook_command("fbear", "fat bear face", "message", "", "", "fat_bear", "")
        weechat.hook_command("mock", "mock", "message", "", "", "mock_cb", "")
        weechat.hook_command("zoop", "zoop", "message", "", "", "zoop", "")


# /script load commands.py

