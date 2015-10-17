function [distance] = manhattan_distance(a, b)
 distance = abs(a(1) - b(1)) + abs(a(2) - b(2));
end