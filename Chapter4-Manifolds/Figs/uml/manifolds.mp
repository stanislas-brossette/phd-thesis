input metauml;
beginfig(1);
Class.Manifold("Manifold")
  ("#name: string",
   "#dimension: int", 
   "#tangentDimension: int", 
   "#representationDimension: int") 
  ("+Manifold(dim, tanDim, reprDim): Manifold",
   "+createPoint(x): Point",
   "+ virtual retractation(out, x, z): void = 0",
   "+ virtual pseudoLog(out, x, y): void = 0",
   "+ virtual distance(x, y): double",
   "+ virtual diffRetractation(x): matrix = 0",
   "+ virtual diffPseudoLog(x): matrix = 0",
   "+ virtual applyTransport(out, v, x, z): void = 0",
   "+ virtual applyInverseTransport(out, v, x, z): void = 0",
   "+ virtual projectOnM(out, in): void = 0",
   "+ virtual projectOnTxM(out, in, x): void = 0"
   );

Class.RealSpace("RealSpace")
  ()
  ();

Class.SO("SO3<Map>")
  ()
  ();

Class.Sphere("S2")
  ()
  ();

Class.CartProd("Cartesian Product")
  ("#vector<Manifold*> subManifolds")
  ("+multiply(Manifold: M)");

Class.Point("Point")
  ("-manifold: Manifold&",
   "-value: vector")
  ("-Point(Manifold M): Point",
   "+value(): vector",
   "+increment(z): void");

Note.n("Only method able to create a point");

topToBottom(25)(Manifold, CartProd);
leftToRight(25)(Manifold, Point);
leftToRight(20)(RealSpace, CartProd, SO, Sphere);
topToBottom(25)(n, Point);

drawObjects(Manifold, RealSpace, SO, Sphere, CartProd, Point, n);

clink(inheritance)(Manifold, RealSpace);
clink(inheritance)(Manifold, SO);
clink(inheritance)(Manifold, Sphere);
clink(inheritance)(Manifold, CartProd);clink(dashedLink)(Manifold.methodStack.pict[1], n);
endfig;
end
