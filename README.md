# DCS_Data_management


# basic.miz:
in Mission editor -> triggers -> repetitve action - Do script - change file location to where your 'script.lua' file.
when the mission is running: in radio -> F10 -> choose 'run script'.

# server/index.js
node.js code that listen to lua socket and trasmit result.

# index.html
client that listen to node.js result.


# required is disabled by default

goto: C:\Program Files\Eagle Dynamics\DCS World OpenBeta\Scripts\MissionScripting.lua
and comment this lines:

sanitizeModule('os')
sanitizeModule('io')
sanitizeModule('lfs')
require = nil
loadlib = nil
