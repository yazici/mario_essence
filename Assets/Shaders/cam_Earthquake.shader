﻿Shader "Camera/EartQuake"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;

			fixed4 frag (v2f IN) : SV_Target
			{
				//IN.vertex.y
				float2 finalPos = IN.uv - float2(0,sin(IN.uv.x + _Time[1] * 80 )/100);


				fixed4 col = tex2D(_MainTex, finalPos);

				// COLORS

				return col;
			}
			ENDCG
		}
	}
}