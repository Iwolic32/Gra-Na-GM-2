shader_type canvas_item;

void fragment() {
	vec4 InputColor = texture(TEXTURE, UV);
	float ColorAverage = (InputColor.r + InputColor.g + InputColor.b) / 3.0;
	COLOR = vec4(ColorAverage, ColorAverage, ColorAverage, InputColor.a);
}
