classdef HomeworkEight
    properties
        stepsize
        f
        fPrime
        x
        temp
        error
        ratio
    end
    methods
        %class constructor
        function obj = HomeworkEight(stepsize, x)
            obj.stepsize = stepsize;
            obj.f = @(x) cos(x);
            obj.fPrime = @(x) -sin(x);
            obj.x = x;
            obj.temp;
            obj.error;
            obj.ratio;
        end
        function forward = ForwardDifference(obj)
            obj.temp = (obj.f(obj.x + obj.stepsize) + obj.f(obj.x))/(obj.stepsize);
            fprintf('\nForward Approximation: %s.\n',obj.temp);
            ResultError(obj);
        end
        function backward = BackwardDifference(obj)
            obj.temp = (obj.f(obj.x) - obj.f(obj.x - obj.stepsize))/obj.stepsize;
            fprintf('\nBackward Approximation: %s.\n',obj.temp);;
            ResultError(obj);
        end
        function central = CentralDifference(obj)
            obj.temp = ((obj.f(obj.x + obj.stepsize) - obj.f(obj.x - obj.stepsize))/(2*obj.stepsize));
            fprintf('\nCentral Approximation: %s.\n',obj.temp);
            ResultError(obj);
        end
        function error = ResultError(obj)
            obj.error = obj.fPrime(obj.x) - obj.temp;
            obj.ratio = (obj.error / obj.fPrime(obj.x));
            fprintf('Error: %s.\n',obj.error);
            fprintf('Ratio: %d.\n',(obj.ratio));
        end
    end
end

%{
example input for the program, using a step size of 10^-1 to 10^-14

>> for i = 1:14
fprintf('\nCurrent stepsize: %s.\n',(10^-i));
a = HomeworkEight((10 ^ -i),pi/6);
for res = 1:3
switch res
case 1
ForwardDifference(a);
case 2
BackwardDifference(a);
case 3
CentralDifference(a);
end
end
end}%