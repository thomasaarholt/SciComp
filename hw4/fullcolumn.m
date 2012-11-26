function [A] = fullcolumn(A,firstcolumn,letter)
    A(letter+1:letter+8,firstcolumn:firstcolumn+1) = 1;
