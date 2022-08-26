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

rule_code = 30

# 状態遷移と表示
size = 300
height = 200

cells = Array.new(size)

# 真ん中に1を置く
cells[100] = 1

# ランダム化
# randomize
# size.times do
#     cells(cnt) = rand(2)
# loop

# 次のセルの状態を表す配列
tmp = Array.new(size)
# 現在の表示座標
x = 0 ; y = 0

height.times do
    x = 0
    
    # 端点の処理
    
    # 1.反射的境界条件
    # cells(0) = cells(1)
    # cells(size - 1) = cells(size - 2)
    
    # 2.周期的境界条件
    # cells(0) = cells(size-2)
    # cells(size-1) = cells(1)
    
    # 3.固定的境界条件
    
    
    (size - 2).times do |j|
        # 出力
        if cells[j] = 0 then pset(x, y, 0, 0, 0) end
        # 現在のセルと両隣とを抜き出して数にし、ルールから対応する0或いは1を次の状態に代入
        tmp[j] = rule_code[(4 * cells[j - 1]) + (2 * cells[j]) + (1 * cell[j + 1])]
        x += 1
    end

    size - 2.times do |j|
        # 次が現在になる
        cells[j] = tmp(j)
    end
    # y座標に1を足す
    y += 1
end

writeimage("ca30.ppm")
