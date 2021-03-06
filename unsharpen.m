%% --------------------------------------------------------
%% unsharpen() function
% Code creates a blurry mask, subtracts it from image u to find the
% difference, then adds the difference to the image in order to sharpen it.

function [unsharp] = unsharpen(u,iterations)

[n,n2] = size(u);

e = ones(n,1);
L1 = spdiags([e  -2*e  e], [-1 0 1], n, n);

L1(1,1) = -1;   
L1(end,end) = -1;

I = speye(n,n);
L = kron(L1, I) + kron(I, L1);

v = reshape(u, n*n, 1);

for i=1:iterations
  v = v + 0.1*(L*v);
end

ublur = reshape(v, n, n);
%%
% This changes a blurring function to a unsharp mask.
edgemap = u - ublur;
unsharp = u + edgemap;

end
%% --------------------------------------------------------