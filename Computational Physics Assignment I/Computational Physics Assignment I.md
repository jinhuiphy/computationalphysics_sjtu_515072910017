# Computational Physics Assignment I

学号：515072910017

姓名：李进辉

Note：All codes are in C language, using -std=c99 standard.

---

## 1. Detemine the value of A

e = 14  ;f = 0.625   
so mantissa = 1.f = 1.625000  ;true exponent =14 - 127 = -113  
so the full value:  $$A = 1.625000 * 2^{-113}$$


## 2. Find an equivalent formula 

（a）$$ln (1+1/x)$$

（b）$$\frac{1}{\sqrt{x^2+1}+x}$$

（c）$$cos(2x)$$

（d）$$cos(\frac{x}{2})$$

## 3. Write a program to determine limits
- For single precision:

```
#include<stdio.h>

int main(){
	int N = 200;
	float under = 1, over = 1;
	for (int i = 0; i<N; i++){
		under /= 2.0;
		over *= 2.0;
		printf("N = %d, under = %e, over = %e\n", i+1, under, over);
	}
	return 0;
}
```

**Result:**

![float_under](https://github.com/jinhuiphy/computationalphysics_sjtu_515072910017/raw/master/Computational%20Physics%20Assignment%20I/Picture/float_under.jpg)

![float_over](https://github.com/jinhuiphy/computationalphysics_sjtu_515072910017/raw/master/Computational%20Physics%20Assignment%20I/Picture/float_over.jpg)

As we can see int the result, the underflow of float is **1.401298e-045**, the overflow is **1.701412e+0.38**.

----------


- For double precision:
```
#include<stdio.h>

int main(){
	int N = 1500;
	double under = 1, over = 1;
	for (int i = 0; i<N; i++){
		under /= 2.0;
		over *= 2.0;
		printf("N = %d, under = %e, over = %e\n", i+1, under, over);
	}
	return 0;
}
```
**Result:**

![double-under](https://github.com/jinhuiphy/computationalphysics_sjtu_515072910017/raw/master/Computational%20Physics%20Assignment%20I/Picture/double_under.jpg)

![double-over](https://github.com/jinhuiphy/computationalphysics_sjtu_515072910017/raw/master/Computational%20Physics%20Assignment%20I/Picture/double_over.jpg)

As we can see int the result, the underflow of float is **4.940656e-324**, the overflow is **8.988466e+307**.

## 4. Write a program to determine your machine precision
- For single precision:
```
#include<stdio.h>

int main(){
	float eps = 1.0;
	while((1 + eps/2) != 1){
		eps /= 2;
	}
	printf("Eps = %e\n", eps);
	return 0;
}
```
We can get the single precision: **1.192093e-007**

----------
- For double precision:
```
#include<stdio.h>

int main(){
	double eps = 1.0;
	while((1 + eps/2) != 1){
		eps /= 2;
	}
	printf("Eps = %e\n", eps);
	return 0;
}
```
We can get the double precision: **2.220446e-016**

## 5. The value of $\pi$

### 1. Describe algorithm
 - **Step:**
```flow
st=>start: N=1, S=0

io1=>inputoutput: Number of items: MaxN
io2=>inputoutput: Result of Pi: Res

op1=>operation: posSum = posSum + 1/(2N-1)
op2=>operation: negSum = negSum + 1/(2N-1)
op3=>operation: N = N + 1
op4=>operation: Res = 4 * (posSum - negSum)

cond1=>condition: N is odd
cond2=>condition: N >= MaxN

e=>end

st->io1->cond1
cond1(no)->op2->op3->cond2
cond1(yes)->op1->op3->cond2
cond2(no)->cond1
cond2(yes)->op4->io2->e
```

### 2. Write a program
```
#include<stdio.h>

int main(){
	int MaxN;
	float posSum = 0;
	float negSum = 0; 
	printf("Please input the number of the items:");
	scanf("%d", &MaxN);
	for (int i=1; i<MaxN; i++){
		if (i%2 != 0){
			posSum += 1.0/(2*i-1);
		}else {
			negSum += 1.0/(2*i-1);
		}
	}
	printf("The value of Pi is %f", 4*(posSum-negSum));
	return 0;
}
```
The relative error is: $$\frac{Res-\pi}{\pi}$$
### 3. calculate $\pi$ and relative error
 - n=10, $\pi$ = 3.252367, relative error = 3.526%
 - n=20, $\pi$ = 3.194189, relative error = 1.674%
 - n=20, $\pi$ = 3.167231, relative error = 0.816%
 - n=1000, $\pi$ = 3.142588, relative error = 0.032%

### 4. Comment
As we can see, the relative error decreases as the n increases, in order to get a more accurate solution, we have to increase n as much as we can.
