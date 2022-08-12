Table = {"One"}
table.remove(Table,1)
rednet.open("back")
print("Waiting for request")
id,message = rednet.receive(mine, 30)
if message == "Im available" then
    write("Miner ")
    write(id)
    write(" available\n")
    table.insert(Table,id)
    rednet.send(id, "Got you", mine)
    write("Sending connection request to miner")
    print(id)
end
id,message = rednet.receive(mine, 30)
if message == "OK" then
    print("Connected succesfully!")
     while 1 do
        input = read()
        if input == "start" then
            rednet.send(id, "start", mine)
            id,message = rednet.receive(mine, 30)
            if message == "OK on" then
                print("OK on")
            end
        else if input == "stop" then
            rednet.send(id, "stop", mine)
            id,message = rednet.receive(mine, 30)
            if message == "OK off" then
                print("OK off")
            end
        end
     end
    end
end