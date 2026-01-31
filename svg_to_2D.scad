
// this doesn't work in openscad, import doesn't return the path or poly data
//poly = import("./airfoil.svg", center=true);

// the svg path is a 2D shape in x/y, extruded in z
module svg_wing() {
    linear_extrude(height=10, convexity=10) {
        scale(0.01)
            import("./airfoil.svg", center=true);
    }
}

// use projection to get a 2D slice of the shape in x,y
module svg_to_2D() {
    projection(cut = true) {
        svg_wing();
    }
}

// remember to use F6 to render real polygon representation
svg_to_2D();
rotate([0,0,45])
    svg_to_2D();
rotate([0,0,90])
    svg_to_2D();
