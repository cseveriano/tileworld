% manhattanDistance
%   Calculate Manhattan Distance
%
% Input:  a: position of a two-dimensional point a
%         b: position of a two-dimensional point b
function [distance] = manhattanDistance(a, b)
 distance = abs(a(1) - b(1)) + abs(a(2) - b(2));
end