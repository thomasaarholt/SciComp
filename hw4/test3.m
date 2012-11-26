[X,Y] = meshgrid(-2:.2:2, -4:.4:4);
        Z = X .* exp(-X.^2 - Y.^2);
        surf(X,Y,Z)