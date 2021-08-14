import numpy as np

class TLBO():
    def __init__(self, population, dimension, low, high, func, prec=16, iterations=1000, Tf=2):
        self.n = population
        self.d = dimension
        self.low = low
        self.high = high
        self.func = func
        self.prec = prec
        self.iterations = iterations
        self.Tf = Tf
        self.choose = [i for i in range(self.n)]
        self.X = np.random.uniform(low=self.low,high=self.high,size=(self.n,self.d))
        self.fitness = np.zeros(shape=(self.n,))
        self.Best_Solution = None
        self.Best_Fitness = np.inf
        self.Fitness_Iter = []
        self.No_of_Fitness_Value_Calc = 0
        self.Earliest_Best = 0
    
    def Calc_Initial_fitness(self):
        for i in range(self.n):
            self.fitness[i]=round(self.func(self.X[i]).item(),self.prec)
            self.No_of_Fitness_Value_Calc += 1
        self.Best_Solution = self.X[np.argmin(self.fitness)]
        self.Best_Fitness = np.min(self.fitness).item()
        self.Earliest_Best = np.argmin(self.fitness)+1
    
    def Teacher_Phase(self):
        X_teacher = self.X[np.argmin(self.fitness)]
        X_mean = np.mean(self.X,axis=0)

        r = np.random.uniform(low=0, high=1)
        diff = r*(X_teacher-self.Tf*X_mean)
        X_new = self.X + diff
        X_new = np.clip(X_new,a_min=self.low,a_max=self.high)

        for i in range(self.n):
            evaluation = round(self.func(X_new[i]).item(),self.prec)
            self.No_of_Fitness_Value_Calc += 1
            
            if evaluation<self.fitness[i]:
                self.X[i]=X_new[i]
                self.fitness[i]=evaluation
                
            if evaluation<self.Best_Fitness:
                self.Best_Fitness = evaluation
                self.Best_Solution = X_new[i]
                self.Earliest_Best = self.No_of_Fitness_Value_Calc
                
    def Learner_Phase(self):
        for i in range(self.n):
            j = np.random.choice(self.choose)
            while i==j:
                j = np.random.choice(self.choose)
            r = np.random.uniform(low=0, high=1)
            self.No_of_Fitness_Value_Calc += 2
            
            if self.fitness[i]<self.fitness[j]:
                
                self.X_new = self.X[i] + r*(self.X[i]-self.X[j])
                self.X_new = np.clip(self.X_new,a_min=self.low,a_max=self.high)
                self.val = round(self.func(self.X_new).item(),self.prec)
                self.No_of_Fitness_Value_Calc += 1
                
                if self.val<self.fitness[i]:
                    self.fitness[i] = self.val
                    self.X[i] = self.X_new
                    
                if self.val<self.Best_Fitness:
                    self.Best_Fitness = self.val
                    self.Best_Solution = self.X_new
                    self.Earliest_Best = self.No_of_Fitness_Value_Calc
            else:
                
                self.X_new = self.X[i] - r*(self.X[i]-self.X[j])
                self.X_new = np.clip(self.X_new,a_min=self.low,a_max=self.high)
                self.val = round(self.func(self.X_new).item(),self.prec)
                self.No_of_Fitness_Value_Calc += 1
                
                if self.val<self.fitness[i]:
                    self.fitness[i] = self.val
                    self.X[i] = self.X_new
                    
                if self.val<self.Best_Fitness:
                    self.Best_Fitness = self.val
                    self.Best_Solution = self.X_new
                    self.Earliest_Best = self.No_of_Fitness_Value_Calc
    
    def Run(self):
        self.Calc_Initial_fitness()
        
        start = time.time()
        for _ in tqdm(range(self.iterations)):
            self.Teacher_Phase()
            self.Learner_Phase()
            self.Fitness_Iter.append(self.Best_Fitness)
        end = time.time()
        
        print("Best_Fitness:",self.Best_Fitness)
        print("Mean_Fitness:",np.mean(self.fitness))
        print("Earliest Best:",self.Earliest_Best)
        print("No of evaluations:",self.No_of_Fitness_Value_Calc)
        print("Time:",end-start)
        print(self.Best_Solution)
