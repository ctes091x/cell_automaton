width = 50
height = 50

cells = Array.new(width + 2, 0)
tmp = Array.new(width + 2, 0)

cells[width / 2] = 1

rule = 90

x = 2; y = 0

while y < height do
    x = 2
    while x < width do
        print cells[x]
        tmp[x] = rule[cells[x - 1] * 4 + cells[x] * 2 + cells[x + 1] * 1]
        # pset(x - 1, y + 1, 255 - tmp[x] * 255, 255 - tmp[x] * 255, 255 - tmp[x] * 255)
        x += 1
    end
    print "\n"
    cells = tmp.dup
    y += 1
end

# writeimage("ca" + rule.to_s + ".ppm")
