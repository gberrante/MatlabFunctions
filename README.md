# MatlabFunctions
Repository of personal function developed in matlab

- ### Spike Removal function
  available for download also on [Matlab File Exchange](https://it.mathworks.com/matlabcentral/fileexchange/66316-spikeremoval-x-mu-) 
  
  This function removes spikes that go over the threshold value mu
  each array element that is over mu is averaged between previous and subsequent element
  if spikes occur in the first or last element of the array, it filters it using the nearest value
  
  Example:
  ``` matlab
  clear
  clc

  x=0.1*sin(2*pi*0.5*[0:0.01:20])+0.2*sin(2*pi*1*[0:0.01:20]);
  r=randi([1 length(x)],20,1);
  mu=2*std(x);

  x(r)=0.5;
  x(1)=1.5;
  x(end)=2;

  plot(x)
  hold on
  plot(spikeRemoval(x,mu),'r')
  hold off
  grid on
  ```
  ![alt text](https://github.com/gberrante/MatlabFunctions/blob/master/figures/spikeDemo.svg)


- ### Iterative Gauss-Seidel linear system solver
  available for download also on [Matlab File Exchange](https://it.mathworks.com/matlabcentral/fileexchange/48302-gauss-seidel-iterative-linear-system-solver) 
  
  This function solves linear system with gauss seidel method. Consider the linear system model: 
  A*x=b , the function sintax is: 
  [x,execution_time]=itergauss(A,b,n) 
  [x] is the solution vector 
  A is the linear matrix of the problem 
  b is the known term vector 
  n is the number of iterative approximation 
  execution_time is the time needed to solve the system
