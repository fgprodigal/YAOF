-- Copyright 2018-2020 Lienol <lawlienol@gmail.com>
module("luci.controller.blockp2p", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/blockp2p") then return end
    entry({"admin", "network", "blockp2p"}, cbi("blockp2p"), _("Block P2P"), 60).dependent =
        true

    entry({"admin", "network", "blockp2p", "status"}, call("action_status"))
end

local function isrunning() return
    luci.sys.call("pgrep blockp2p >/dev/null") == 0 end

function action_status()
    luci.http.prepare_content("application/json")
    luci.http.write_json({run_state = isrunning()})
end
