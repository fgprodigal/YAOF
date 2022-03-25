-- Copyright 2018-2020 Lienol <lawlienol@gmail.com>
module("luci.controller.blockp2p", package.seeall)

function index()
    entry({"admin", "network", "blockp2p"}, cbi("blockp2p"), _("Block P2P"), 60)
end
