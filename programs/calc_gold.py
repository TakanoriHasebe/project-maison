#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 18 15:32:39 2017

@author: Takanori
"""

"""
黄金比を求める。
"""

import math
import numpy as np

# 金属比の計算
def calc(n):
    
    ans = (n + math.sqrt(n*n + 4)) / 2
          
    return ans

# 小さい長さ
px = 375

y = np.arange(0, 1, 0.1)

# 金属比を算出
for n in y:
    
    # print(calc(n))
    print(px * calc(n))
    
    




