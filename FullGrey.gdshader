shader_type canvas_item;
uniform float GreyScale;
void fragment() {
	vec4 InputColor = texture(TEXTURE,UV);
	float ColorAverage = (InputColor.r + InputColor.g + InputColor.b) / 3.0;
	COLOR = vec4(ColorAverage + InputColor.r * GreyScale, ColorAverage + InputColor.g * GreyScale, ColorAverage + InputColor.b * GreyScale, InputColor.a);
}
