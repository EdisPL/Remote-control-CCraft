Table = {"One"}
table.remove(Table,1)
rednet.open("back")
print("How many turtles to connect?")
write("Type the answer here: ")
NUT = read()

for i=1, NUT do
    print("Waiting for request")
    id,message = rednet.receive(remote, 30)
    if message == "Im available" then
        write("Miner ")
        write(id)
        write(" available\n")
        table.insert(Table,id)
        rednet.broadcast("Got you", remote)
        write("Sending connection request to miner")
        print(id)
    end
    id,message = rednet.receive(remote, 30)
    if message == "OK" then
        print("Connected succesfully!")
    end
end
j = #Table
while 1 do
        input = read()
        if input == "start" then
            for j=1, j do
                rednet.broadcast("start", remote)
                id,message = rednet.receive(remote, 30)
                if message == "OK on" then
                    print("OK on")
                end
            end
        else if input == "stop" then
            for j=1, j do
                rednet.broadcast("stop", remote)
                id,message = rednet.receive(remote, 30)
                if message == "OK off" then
                    print("OK off")
                end
            end
        end
        end
end
