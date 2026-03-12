shader_type canvas_item;

uniform vec2 AreaShape = vec2(0,0); //shape of the affected area. 0,0 covers the full sprite.
uniform float IntensityCap = 1; //so it looks nicer near the center. Default of 1.
uniform float FinalIntensityMultiplier = 5; //how strong the effect is. Default of 5.

uniform float Angle = -40; //At what angle the slice is rotated in degrees.

uniform float PushStrength = 3; //How much seperation there is between cut sections, in pixels. Default of 3.
uniform float LeftSideMultiplier = 1; //How much extra push one side of the slice has.
uniform float RightSideMultiplier = 1; //How much extra push the other side of the slice has.
uniform float LeftSideAngleOffset = 0; //How much to offset the angle of the first slice's shift.
uniform float RightSideAngleOffset = 0; //How much to offset the angle of the second slice's shift.

const float PI = 3.14159265; //Pie!

void fragment() {
	vec2 screenUV = SCREEN_UV;
	
	float distanceFromCenterOfObject = length((vec2(0.5,0.5) - UV) * AreaShape);
	float weakenOffCenterOfObject = min(IntensityCap, max(1.0 - pow(distanceFromCenterOfObject, 0.5) * 1.5,0));
	
	float polarTheta = atan(UV.x - 0.5, UV.y - 0.5);
	float correctedAngle = mod(polarTheta, PI);
	
	float TiltAsRadians = mod(Angle / 180.0 * PI, PI * 2.0);
	
	bool onFirstSide = (polarTheta < TiltAsRadians && polarTheta >= TiltAsRadians - PI) || polarTheta <= TiltAsRadians - PI * 2.0;
	
	float leftSideAngle = PI / 2.0 + TiltAsRadians - LeftSideAngleOffset/ 180.0 * PI;
	float rightSideAngle = PI / -2.0 + TiltAsRadians - RightSideAngleOffset/ 180.0 * PI;
	
	float usedAngleOffset = mix(leftSideAngle, rightSideAngle, float(onFirstSide));
	
	vec2 usedOffset = vec2(cos(usedAngleOffset), sin(usedAngleOffset)) * PushStrength * mix(LeftSideMultiplier, RightSideMultiplier, float(onFirstSide));
	usedOffset = vec2(round(usedOffset.x), round(usedOffset.y)) * SCREEN_PIXEL_SIZE;
	
	usedOffset *= weakenOffCenterOfObject;
	
	vec4 screenColor = texture(SCREEN_TEXTURE, screenUV + usedOffset );
	
	COLOR = screenColor;

	//COLOR = vec4(float(onFirstSide),0,0,1);
}