/*!
@file Character.cpp
@brief キャラクターなど実体
*/

#include "stdafx.h"
#include "Project.h"

namespace basecross{
	void Boxp::OnCreate() {
		auto Drow = AddComponent<PNTStaticDraw>();
		Drow->SetMeshResource(L"DEFAULT_CUBE");

		auto trans = GetComponent<Transform>();
		trans->SetPosition(Vec3(0, 0, 0));
<<<<<<< HEAD
<<<<<<< HEAD
		trans->SetScale(Vec3(10, 10, 10));
=======
		trans->SetScale(Vec3(1, 1, 1));
>>>>>>> 6ac3b086df7dab1b6e1b118eaf6c3a1dffe907db
=======
		trans->SetScale(Vec3(10, 10, 10));
>>>>>>> kazuharu
	}

}
//end basecross
