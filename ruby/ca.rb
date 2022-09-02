Pixel = Struct.new(:r, :g, :b)

$img = Array.new(200) do
    Array.new(300) do Pixel.new(255,255,255) end
end

def pset(x, y, r, g, b)
    if 0 <= x && x < 300 && 0 <= y && y < 200
        $img[y][x].r = r; $img[y][x].g = g; $img[y][x].b = b
    end
end

def writeimage(name)
    open(name, "wb") do |f|
        f.puts("P6\n300 200\n255")
        $img.each do |a|
            a.each do |p|
                f.write(p.to_a.pack("ccc"))
            end
        end
    end
end

width = 300
height = 200

cells = Array.new(width + 2, 0)
tmp = Array.new(width + 2, 0)

cells[150] = 1

rule = 90

x = 2; y = 0

while y < height do
    x = 2
    while x < width do
        # print cells[x]
        tmp[x] = rule[cells[x - 1] * 4 + cells[x] * 2 + cells[x + 1] * 1]
        pset(x - 1, y + 1, 255 - tmp[x] * 255, 255 - tmp[x] * 255, 255 - tmp[x] * 255)
        x += 1
    end
    # print "\n"
    cells = tmp.dup
    y += 1
end

writeimage("ca" + rule.to_s + ".ppm")
