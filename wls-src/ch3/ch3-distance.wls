x1 = Subscript[x,1];
x2 = Subscript[x,2];
y1 = Subscript[y,1];
y2 = Subscript[y,2];
z1 = Subscript[z,1];
z2 = Subscript[z,2];
f = Sqrt[(x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2];

Export["book-src/assets/ch3-distance-formula.svg", f // TraditionalForm]
