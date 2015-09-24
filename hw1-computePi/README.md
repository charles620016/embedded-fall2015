#### *Homework 1 Extension*

採用離散積分的方法求圓周率，並著手透過 SIMD 指令作效能最佳化。

![](https://raw.githubusercontent.com/charles620016/embedded-fall2015/master/hw1-computePi/screenshot/integral.png)

相關連結：[開發紀錄](https://charles620016.hackpad.com/Charles-Week-1-kBMD0GhbC7d)

相關連結：[Leibniz formula for π](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80)

**Performance**

```
`$ time ./main_clock`
N = 300000000
pi = 3.1415926569 ,           Baseline verison: 7.057064 sec
pi = 3.1415926569 ,  Openmp verison(2 threads): 7.542519 sec
pi = 3.1415926569 ,  Openmp verison(4 threads): 7.811580 sec
pi = 3.1415926569 ,                AVX verison: 3.092924 sec
pi = 3.1415926569 ,         AVX+unroll verison: 1.511960 sec

real    0m17.477s
user    0m27.004s
sys     0m0.012s
```

```
`$ time ./main_clock_gettime `
N = 300000000
pi = 3.1415926569 ,           Baseline verison: 7.068764 sec
pi = 3.1415926569 ,  Openmp verison(2 threads): 3.772730 sec
pi = 3.1415926569 ,  Openmp verison(4 threads): 2.049751 sec
pi = 3.1415926569 ,                AVX verison: 3.087221 sec
pi = 3.1415926569 ,         AVX+unroll verison: 1.511760 sec

real    0m17.493s
user    0m27.032s
sys     0m0.000s

```

![](https://raw.githubusercontent.com/charles620016/embedded-fall2015/master/hw1-computePi/screenshot/CPU_time.png)

![](https://raw.githubusercontent.com/charles620016/embedded-fall2015/master/hw1-computePi/screenshot/Wall-clock_time.png)

