mp = Map("blockp2p", translate("Block P2P"))
mp:append(Template("blockp2p/status"))

s = mp:section(TypedSection, "settings")
s.anonymous = true

enable = s:option(Flag, "enable", translate("Enable"))
enable.default = 1
enable.rmempty = false

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

local apply = luci.http.formvalue("cbi.apply")
if apply then
    luci.sys.exec("rm -f /tmp/iptables_nat_sum")
    luci.sys.exec("rm -f /tmp/iptables_mangle_sum")
end

return mp
