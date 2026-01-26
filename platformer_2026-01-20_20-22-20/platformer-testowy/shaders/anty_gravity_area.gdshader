shader_type canvas_item;

uniform sampler2D noise : repeat_enable;
uniform vec2 scroll = vec2(0.2, 0.2);

void fragment() {
	vec4 noise_col = texture(noise, UV + scroll * TIME);
	COLOR = noise_col;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
