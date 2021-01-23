//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelH;
uniform float pixelW;

void main()
{
	vec2 offsetX;
	offsetX.x = pixelW;
	vec2 offsetY;
	offsetY.y = pixelH;
	
	/*NOTE!! Can I make it that if it finds a transparent pixel 
	around it, it makes it the colour and alpha I want it to be?*/
	
	/*if(texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a == 0.0) {
		texture2D( gm_BaseTexture, v_vTexcoord + offsetX).a = 255;
	}*/
	//alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX).a);
	//alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY).a);
	//alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY).a);
	
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
	//gl_FragColor.a = alpha;
}
