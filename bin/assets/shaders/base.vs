#version 330

// Input vertex attributes
in vec3 vertexPosition;
in vec2 vertexTexCoord;
in vec3 vertexNormal;
in vec4 vertexColor;

// Input uniform values
uniform mat4 mvp;
uniform mat4 modelMatrix;
// uniform vec3 vertexNormal;

// Output vertex attributes (to fragment shader)
out vec2 fragTexCoord;
out vec4 fragColor;
out vec3 fragNormal;
out vec3 fragPos;

// NOTE: Add here your custom variables 

void main()
{
    // Send vertex attributes to fragment shader
    fragTexCoord = vertexTexCoord;
    fragColor = vertexColor;
    
    mat3 normalMatrix = transpose(inverse(mat3(modelMatrix)));
    fragNormal = normalize(normalMatrix*vertexNormal);
    // fragNormal =vertexNormal;
    
    fragPos = vec3(modelMatrix*vec4(vertexPosition, 1.0));
    
    // Calculate final vertex position
    gl_Position = mvp*vec4(vertexPosition, 1.0);
    gl_Position.xy = floor(gl_Position.xy*80)/80;
    // gl_Position.xy = floor(gl_Position.xy);
    // gl_Position.xy = floor(gl_Position.xy*gl_Position.w*(4*8))*(.25f/8)/gl_Position.w;
}
