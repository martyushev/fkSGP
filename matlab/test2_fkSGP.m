clear; clc;

% 6-6 SGP
X = [zeros(1,3); 4*rand(5,3)-2];
x = [zeros(1,3); 4*rand(5,3)-2];

p = randn(3,1);
T = [0 -p(3) p(2); p(3) 0 -p(1); -p(2) p(1) 0];
Rgt = (eye(3) - T)/(eye(3) + T);
tgt = randn(3,1);
A = Rgt*x' + repmat(tgt,1,6) - X';
L = sum(A.*A, 1)'; % squared leg lengths

realOnly = 1;

tic;
[Rt,err] = solver_fkSGP(X,x,L,realOnly);
tm = toc;

for i = 1:size(Rt,2)
    fprintf('Solution #%d:\n', i);
    disp(Rt{i});
    fprintf('Error: %.6g\n\n', err(i));
end
fprintf('Ground truth:\n');
disp([Rgt tgt]);
fprintf('Time: %.2f ms\n', 10^3*tm);