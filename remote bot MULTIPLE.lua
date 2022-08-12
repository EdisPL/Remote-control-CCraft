consoleID = 0
rednet.open("right")
rednet.broadcast("Im available", remote)
id, message = rednet.receive(remote, 30)
if message == "Got you" then
    consoleID = id
    rednet.send(consoleID, "OK", remote)
end
while 1 do
id,message = rednet.receive(remote, 30)
if message == "start" then
    redstone.setAnalogOutput("back",15)
    rednet.send(consoleID, "OK on", remote)
else if message == "stop" then
    redstone.setAnalogOutput("back", 0)
    rednet.send(consoleID, "OK off", remote)
end
end
end
