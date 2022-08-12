consoleID = 0
rednet.open("right")
rednet.broadcast("Im available", mine)
id, message = rednet.receive(mine, 30)
if message == "Got you" then
    consoleID = id
    rednet.send(consoleID, "OK", mine)
end
while 1 do
id,message = rednet.receive(mine, 30)
if message == "start" then
    redstone.setAnalogOutput("back",15)
    rednet.send(consoleID, "OK on", mine)
else if message == "stop" then
    redstone.setAnalogOutput("back", 0)
    rednet.send(consoleID, "OK off", mine)
end
end
end