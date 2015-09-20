#### *Homework 1 Extension*

採用離散積分的方法求圓周率，並著手透過 SIMD 指令作效能最佳化。

![](https://raw.githubusercontent.com/charles620016/embedded-fall2015/master/hw1-computePi/screenshot/integral.png)

相關連結：[開發紀錄](https://charles620016.hackpad.com/Charles-Week-1-kBMD0GhbC7d)

相關連結：[Leibniz formula for π](https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80)


**Usage**

```c
make

# Get the value of pi
./main

# Get the execution time of each version of compute_pi(), it may take a few minutes to complete the benchmark 
make run
```

**Performance**

```
`$ ./main`
N = 300000000 , max threads = 4
pi = 3.1415926569 ,   Baseline verison: 7.042201 sec
pi = 3.1415926569 ,     Openmp verison: 7.868701 sec
pi = 3.1415926569 ,        AVX verison: 3.093771 sec
pi = 3.1415926569 , AVX+unroll verison: 1.515055 sec
```

![](https://raw.githubusercontent.com/charles620016/embedded-fall2015/master/hw1-computePi/screenshot/performance.png)