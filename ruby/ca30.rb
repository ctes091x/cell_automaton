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

# 30 = 0b00011110

rule = [0,0,0,1,1,1,1,0]

cells = Array.new(300,0)
tmp = Array.new(300,0)

cells[150] = 1

x = 1 ; y = 0

while y < 200
    while x < 298
        bit3 = 4 * cells[x - 1]
        bit2 = 2 * cells[x]
        bit1 = 1 * cells[x + 1]
        if rule[bit3 + bit2 + bit1] = 1 then
            pset(x, y, 0, 0, 0)
            tmp[x] = 1
            puts 1
        end
        x += 1
    end
    cells = tmp.dup
    y += 1
end

writeimage("ca30.ppm")
