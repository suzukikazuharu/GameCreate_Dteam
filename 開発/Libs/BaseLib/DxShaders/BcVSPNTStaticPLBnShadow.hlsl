
#include "BcINCParameters.hlsli"
#include "BcINCStructs.hlsli"
#include "BcINCCommon.hlsli"
#include "BcINCLighting.hlsli"

// Vertex shader: pixel lighting + texture.(biased vertex normals).
// VSBasicPixelLightingTxBn
VSOutputPixelLightingTxShadow main(VSInputNmTx vin)
{
	VSOutputPixelLightingTxShadow vout;

	float3 normal = BiasX2(vin.Normal);

	CommonVSOutputPixelLighting cout = ComputeCommonVSOutputPixelLighting(vin.Position, normal);
	SetCommonVSOutputParamsPixelLighting;

	vout.Diffuse = float4(1, 1, 1, DiffuseColor.a);
	vout.TexCoord = vin.TexCoord;

	//影用
	vout.norm = mul(vin.Normal, (float3x3)World);
	vout.norm = normalize(vout.norm);
	float4 LightModelPos = float4(vin.Position.xyz, 1.0f);
	//ワールド変換
	LightModelPos = mul(LightModelPos, World);
	float4 LightSpacePos = mul(LightModelPos, LightView);
	LightSpacePos = mul(LightSpacePos, LightProjection);
	vout.lightSpacePos = LightSpacePos;
	// Light ray
	vout.lightRay = LightPos.xyz - LightModelPos.xyz;
	//View
	vout.lightView = EyePos.xyz - LightModelPos.xyz;


	return vout;
}
