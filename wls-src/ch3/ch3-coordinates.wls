o = {0,0,0};
x = {1,0,0};
y = {0,1,0};
z = {0,0,1};
textOffset = {0,0,0.1};
xaxis = Arrow[{o, x}]
yaxis = Arrow[{o, y}]
zaxis = Arrow[{o, z}]

genGraph[xLabel_, yLabel_, zLabel_] := Graphics3D[{
      {Purple, Thickness -> 0.01, xaxis},
      {Text[xLabel, x + textOffset]},
      {Purple, Thickness -> 0.01, yaxis},
      {Text[yLabel, y + textOffset]},
      {Purple, Thickness -> 0.01, zaxis},
      {Text[zLabel, z + textOffset]},
      {Line[{{0.1,0,0}, {0.1,0.1,0}, {0,0.1,0}, {0.1,0.1,0}}]},
      {Line[{{0,0.1,0}, {0,0.1,0.1}, {0,0,0.1}, {0,0.1,0.1}}]},
      {}
    },{
     BoxStyle -> Directive[Dashed],
     BaseStyle -> { FontSize -> 22, FontWeight -> "Bold" }
    }];

Export["ex3-coord-1.png", Show[genGraph["y", "z", "x"]]]
Export["ex3-coord-2.png", Show[genGraph["z", "y", "x"]]]
Export["ex3-coord-3.png", Show[genGraph["x", "z", "y"]]]

arc = Function[{s,e, l},
  n = 10;
  delta = (e - s) / N@n;
  angles = s + # * delta & /@ Range[0,n];
  pts = {l*Cos[#], l*Sin[#], 0}& /@ angles
]

Export["ex3-coord-4.png", Show[
  Graphics3D[{
      {Purple, Thickness -> 0.01, Arrow[{o, N@Normalize[{1,1,0}]}]},
      {Text["x", N@Normalize[{1,1,0}] + textOffset]},
      {Purple, Thickness -> 0.01, yaxis},
      {Text["y", y + textOffset]},
      {Purple, Thickness -> 0.01, zaxis},
      {Text["z", z + textOffset]},
      {Line[arc[Pi/4,Pi/2, 0.1]]},
      {Line[{{0,0.1,0}, {0,0.1,0.1}, {0,0,0.1}, {0,0.1,0.1}}]},
      {}
    },{
     BoxStyle -> Directive[Dashed],
     BaseStyle -> { FontSize -> 22, FontWeight -> "Bold" }
    }]
]]
