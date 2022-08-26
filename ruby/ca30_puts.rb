cells = Array.new(22, 0)
tmp = Array.new(22, 0)

cells[10] = 1
rule = [0,0,0,1,1,1,1,0]

x = 2; y = 0

while y < 20 do
    x = 0
    while x < 20 do
        print cells[x]
        tmp[x] = rule[cells[x - 1] * 4 + cells[x] * 2 + cells[x + 1] * 1]
        x += 1
    end
    print "\n"
    cells = tmp.dup
    y += 1
end
