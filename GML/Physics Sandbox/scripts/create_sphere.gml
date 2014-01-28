//* Description *//
// Usage: create_sphere(x, y, density, friction, restitution, radius)
// Function: Creates a Sphere using the Physics Engine
// Arguments:
// 1) x : int - X Position to place Sphere
// 2) y : int - Y Position to place Sphere
// 3) density : real - Density of the Sphere
// 4) friction : real - Friction of the Sphere
// 5) resitution: real - Restitution of the Sphere
// 6) radius : real - Radius of the Sphere

//* Arguments *//
var xx, yy, density, frict, restitution, radius;

xx = argument0;
yy = argument1;
density = argument2;
frict = argument3;
restitution = argument4;
radius = argument5;

//* Main Body *//
var instance, fixture;

fixture = physics_fixture_create();

physics_fixture_set_circle_shape(fixture, radius);
physics_fixture_set_density(fixture, density);
physics_fixture_set_friction(fixture, frict);
physics_fixture_set_restitution(fixture, restitution);

instance = instance_create(xx, yy, phys_sphere);

physics_fixture_bind(fixture, instance);
instance.fixture = fixture;
instance.radius = radius;
instance.fill_color = c_white;
instance.fill_alpha = 1;
instance.outline_color = c_black;
instance.outline_alpha = 1;
instance.outline_thickness = 1;

return instance;
