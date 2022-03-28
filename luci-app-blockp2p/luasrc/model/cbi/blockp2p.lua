mp = Map("blockp2p", translate("Block P2P"))

s = mp:section(TypedSection, "settings")
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
enable.default = 1
enable.rmempty = false

action = s:option(ListValue, "action", translate("Action"))
action:depends('enable', '1')
action:value('RETURN', 'RETURN')
action:value('ACCEPT', 'ACCEPT')
action:value('DROP', 'DROP')
action:value('REJECT', 'REJECT')

filter = s:option(MultiValue, "filter", translate("Filter"))
filter:depends('enable', '1')
filter.default = '--edk --kazaa --gnu --bit --apple --winmx'
filter:value('--edk', 'eDonkey/eMule/Overnet')
filter:value('--dc', 'Direct Connect packets')
filter:value('--kazaa', 'KaZaA packets')
filter:value('--gnu', 'Gnutella packets')
filter:value('--bit', 'BitTorrent packets')
filter:value('--apple', 'AppleJuice packets')
filter:value('--winmx', 'WinMX')
filter:value('--soul', 'SoulSeek')
filter:value('--mute', 'Mute packets')
filter:value('--waste', 'Waste packets')
filter:value('--xdcc', 'XDCC packets (only xdcc login)')

return mp
