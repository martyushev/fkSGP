clear; clc;

sgpType = 1;
% 1:   general 6-6 (|^6) SGP
% 2:   semi-planar 6P-6 (|^6) SGP
% 3:   fully planar 6P-6P (|^6) SGP
% 4:   general 6-5 (/\ |^4) SGP
% 5:   semi-planar 6P-5 (/\ |^4) SGP
% 6:   fully planar 6P-5P (/\ |^4) SGP
% 100: general 6-6 (|^6) SGP with 40 real postures (by P. Dietmaier)

motionType = 1;
% 1:   generic motion
% 2:   pure translation
% 3:   pure z-translation

realOnly = 1;
% 0: return all complex postures
% 1: return real postures only

sgp = genSGP(sgpType,motionType);

tic;
[Rt,err] = feval(sgp.solver,sgp.X,sgp.x,sgp.L,realOnly);
tm = toc;

for i = 1:size(Rt,2)
    fprintf('\nSolution #%d:\n', i);
    disp(Rt{i});
    fprintf('Error: %.6g\n', err(i));
end
fprintf('\nGround truth:\n');
disp([sgp.Rgt sgp.tgt]);
fprintf('\nTime: %.2f ms\n', 10^3*tm);