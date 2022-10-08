#module
    #deffunc ca int rule_code, int cell_size, int is_rand, int boundary_condition
        randomize

        /*ルールの生成
        2のcnt乗のビットが1なら配列の対応する箇所に1を代入
        ただのintである筈のモノをビットごとに切り出して配列にする*/
        dim rule, 8
        repeat 8
            if rule_code and int(powf(2,cnt)) : rule(cnt) = 1
        loop

        /*状態遷移と表示
        なんとも言えないので逐行解説する*/
        size = ginfo_winx / cell_size
        height = ginfo_winy / cell_size

        dim cells, size

        //真ん中に1を置く
        cells(int(size/2)) = 1

        //ランダム化
        if is_rand {
            repeat size
                cells(cnt) = rnd(2)
            loop
        }

        //次のセルの状態を表す配列
        dim tmp, size
        //現在の表示座標
        x = 0 : y = 0

        repeat height
            redraw 0
                x = 0
                
                //端点の処理
                switch boundary_condition
                    case 0
                        //周期的境界条件
                        cells(0) = cells(size-2)
                        cells(size-1) = cells(1)
                        swbreak
                    case 1
                        //固定的境界条件(0)
                        cells(0) = 0
                        cells(size - 1) = 0
                        swbreak
                    case 2
                        //固定的境界条件(1)
                        cells(0) = 1
                        cells(size - 1) = 1
                        swbreak
                    case 3
                        //反射的境界条件
                        cells(0) = cells(1)
                        cells(size - 1) = cells(size - 2)
                        swbreak
                    case 4
                        //散逸的境界条件
                        cells(0) = rnd(2)
                        cells(1) = rnd(2)
                        swbreak
                swend
                
                repeat size - 2, 1
                    //出力
                    ;mes cells(cnt),1
                    if cells(cnt) == 0 {
                        color 255, 255, 255
                    } else : cells(cnt) == 1 {
                        color 0, 0, 0
                    }
                    boxf x * cell_size, y * cell_size, x * cell_size + cell_size, y * cell_size + cell_size
                    //現在のセルと両隣とを抜き出して数にし、ルールから対応する0或いは1を次の状態に代入
                    tmp(cnt) = rule((cells(cnt - 1) * 4) + (cells(cnt) * 2) + (cells(cnt+1) * 1))
                    x += 1
                loop
                repeat size - 2, 1
                    //次が現在になる
                    cells(cnt) = tmp(cnt)
                loop
                //y座標に1を足す
                y += 1
            redraw 1
            await 1
        loop
        return
#global

//ca 30, 1, 0, 0