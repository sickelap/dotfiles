#!/usr/bin/env python3

import json

BROWSER_APPS = [
    "^com\\.brave\\.Browser$",
    "^org\\.mozilla\\.firefox$",
    "^com\\.apple\\.Safari$",
    "^com\\.microsoft\\.edgemac$",
]

TERMINAL_APPS = ["^com\\.apple\\.Terminal$", "^net\\.kovidgoyal\\.kitty$"]

NOT = "frontmost_application_unless"
ONLY = "frontmost_application_if"

NOT_TERMINALS = {
    "bundle_identifiers": TERMINAL_APPS,
    "type": NOT,
}

BROWSERS = {
    "bundle_identifiers": BROWSER_APPS,
    "type": ONLY,
}

KEYS = {
    "Ctrl": "left_control",
    "Option": "left_alt",
    "Cmd": "left_command",
    "Shift": "left_shift",
}


def resolve(modifiers):
    return list(map(lambda x: KEYS[x], modifiers))


def remap(map_from, map_to, conditions=[]):
    key_from = map_from.split("+")[-1]
    modifiers_from = map_from.split("+")[:-1]
    key_to = map_to.split("+")[-1]
    modifiers_to = map_to.split("+")[:-1]
    return [
        # create the actual mapping
        {
            "conditions": conditions,
            "from": {
                "key_code": key_from,
                "modifiers": {"mandatory": resolve(modifiers_from)},
            },
            "to": {
                "key_code": key_to,
                "modifiers": resolve(modifiers_to),
            },
            "type": "basic",
        },
        # disable the original key combination
        {
            "conditions": conditions,
            "from": {
                "key_code": key_from,
                "modifiers": {"mandatory": resolve(modifiers_to)},
            },
            "type": "basic",
        },
    ]


mappings = {
    "description": "Linux mappings",
    "manipulators": [
        # toggle dev tools in browser
        *remap("Ctrl+Shift+i", "Cmd+Option+i", [BROWSERS]),
        # reload browser tab (no cache)
        *remap("Ctrl+Shift+r", "Cmd+Shift+r", [BROWSERS]),
        # reopen closed browser tab
        *remap("Ctrl+Shift+t", "Cmd+Shift+t", [BROWSERS]),
        # select all
        *remap("Ctrl+a", "Cmd+a", [NOT_TERMINALS]),
        # copy
        *remap("Ctrl+c", "Cmd+c", [NOT_TERMINALS]),
        # paste
        *remap("Ctrl+v", "Cmd+v", [NOT_TERMINALS]),
        # cut
        *remap("Ctrl+x", "Cmd+x"),
        # undo
        *remap("Ctrl+z", "Cmd+z"),
        # find
        *remap("Ctrl+f", "Cmd+f", [NOT_TERMINALS]),
        *remap("Ctrl+l", "Cmd+l"),
        *remap("Ctrl+n", "Cmd+n", [NOT_TERMINALS]),
        *remap("Ctrl+q", "Cmd+q"),
        *remap("Ctrl+r", "Cmd+r", [NOT_TERMINALS]),
        # save
        *remap("Ctrl+s", "Cmd+s"),
        *remap("Ctrl+t", "Cmd+t"),
        # close window
        *remap("Ctrl+w", "Cmd+w", [NOT_TERMINALS]),
    ],
}

print(json.dumps(mappings))
