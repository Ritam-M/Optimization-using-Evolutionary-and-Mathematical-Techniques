import numpy as np

# Ackley
def f1(x):
    a = 20
    b = 0.2
    c = 2*np.pi
    val1 = np.exp(-b*np.sum(x**2)/x.shape[0])
    val2 = np.exp(np.sum(np.cos(c*x))/x.shape[0])
    return(-a*val1 - val2 + a + np.exp(1))

## Beale
def f2(x):
    val = 0
    for i in range(x.shape[0]):
        for j in range(i+1,x.shape[0]):
            val+= ((1.5-x[i]+x[i]*x[j])**2 + (2.25-x[i]+x[i]*x[j]**2)**2 + (2.625-x[i]+x[i]*x[j]**3)**2)
    return val

## Rastringen
def f3(x):
    return (10*x.shape[0]+np.sum(x*x-10*np.cos(2*np.pi*x)))

## Crossintray
def f4(x):
    val = 0
    for i in range(x.shape[0]):
        for j in range(i+1,x.shape[0]):
            val += -0.0001 * np.power(1+np.abs(np.sin(x[i])*np.sin(x[j])*np.exp(np.abs(100-np.sqrt(x[i]**2+x[j]**2)/np.pi))),0.1)
    return val

## Griewank
def f5(x):
    val1 = np.sum(x*x/4000)
    val2 = np.prod(np.cos(np.array([x[i]/(i+1) for i in range(x.shape[0])])))
    return val1-val2+1

## Rosenbrock
def f6(x):
    val = 0
    for i in range(x.shape[0]-1):
        val += 100*(x[i+1]-x[i]**2)**2+(x[i]-1)**2
    return val

## Zettl
def f7(x):
    val = 0
    for i in range(x.shape[0]):
        for j in range(i+1,x.shape[0]):
            val += 1/(4*x[i]) + (x[i]**2-2*x[i]+x[j]**2)**2
    return val

## Schweffl
def f8(x):
    return (418.9829*x.shape[0] - np.sum(x*np.sin(np.sqrt(np.abs(x)))))

## Sphere
def f9(x):
    return (np.sum(x*x))

## Benchmark_Function_1
def f10(x):
    penalty = 10**5
    val = -np.power(np.sqrt(x.shape[0]),x.shape[0])*np.prod(x)
    cons = x[0]*x[0]+x[1]*x[1]+x[2]*x[2]+x[3]*x[3]-1
    
    if abs(cons)>1e-5:
        return(val+penalty)
    else:
        return(val)

## Benchmark_Function_2
def f11(x):
    val = -(100-(x[0]-5)**2-(x[1]-5)**2-(x[2]-5)**2)/100
    const = 0
    for i in range(10):
        const += (x[i]-i)**2
    penalty = 10**5

    if const>0:
        return(val+const**5)
    else:
        return(val)

## Alpine_1    
def f12(x):
    return np.sum(np.abs(x*np.sin(x)+0.1*x))
    
## Alpine_2
def f12(x):
    return np.prod(np.sqrt(x)*sin(x))

## Powell
def f13(x):
    val = [np.power(np.abs(x[i]),i+1) for i in range(x.shape[0])]
    return(sum(val))

## Schwifel
def f14(x):
    return (np.sum(x**10))

## Zakharov
def f15(x):
    val1 = np.sum(x*x)
    val2 = np.sum(np.array([i*x[i] for i in range(x.shape[0])])**2)
    val3 = np.sum(np.array([i*x[i] for i in range(x.shape[0])])**4)
    return val1+val2+val3
  
 class Pressure Vessel():
    fx = 0.6224*x[0]*x[2]*x[3]+1.778*x[1]*x[2]**2+3.1661*x[0]**2*x[3]+19.84*x[0]**2*x[2]
    gx1 = -x[0]+0.0193*x[2]
    gx2 = -x[1]+0.0095*x[2]
    gx3 = -np.pi*x[2]**2*x[3]-4/3*np.pi*x[2]**3+1296000
    gx4 = x[3]-240
    c1 = 0<=x[0]<=99
    c2 = 0<=x[1]<=99
    c3 = 10<=x[2]<=200
    c4 = 10<=x[3]<=200

class Spring():
    fx = (N+2)*D*d**2
    gx1 = 1-D**3*N/(71785*d**4)
    gx2 = (4*D**2-d*D)/(12566*(D*d**3-d**4))+1/(5108*d**2)-1
    gx3 = 1 - 140.45*d/(D**2*N)
    gx4 = (D+d)/1.5-1
    c1 = 0.05<=x[0]<=2
    c2 = 0.25<=x[1]<=1.3
    c3 = 2<=x[2]<=15    
