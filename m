Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3339FC5
	for <linux-doc@vger.kernel.org>; Sat,  6 Apr 2024 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712418189; cv=none; b=f+O8Kg3F7xBcFWgU8654qzIP8zO94cRYWaj7gf2cyuBpW5nlgEg0i2/44NM4UvG5Qbhd7aJ3B3FxHYTJ6mvaYvEnGiQ4W2na2U6G3ZOzVxDUWpEdv01x8mcuOYk3lUCYIEshjoHVK7zczTdqyJdK+HiEvx3to8vsLwfRrzNcfkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712418189; c=relaxed/simple;
	bh=KlnonV88efemHIAcJauLyXmI35h5Ofb30ye+h1O5iv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uJEZK5BYCRwYtGogGn8CKJCMU68PIqrIKh0Wqk9iJI5TkbsN7Xkqf9Sc2S9QXx4pg1adGjL6aqH7wgbhVSn488doiGxPU/b5M+TgRrgtaUsqzMeYvs5pAJ+Z5YdCP/6qrR4zxPx9wUyE7p6bVsIF4mjufMDbNyWkuy8TeshExwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONOYr+zK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONOYr+zK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD9BC433C7;
	Sat,  6 Apr 2024 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712418189;
	bh=KlnonV88efemHIAcJauLyXmI35h5Ofb30ye+h1O5iv8=;
	h=From:Date:Subject:To:Cc:From;
	b=ONOYr+zKX7FB4VAtyh2UVVDuuwqYFLnMyYfj9VKM/+6G9A7gFE8mjLRPg3eNaBgKA
	 qVRge+5eW0R4BKKivukxrgMifZ5+zZQohVSAqsRSe2+NJqreQsctTWTHQTBSEFsqVt
	 Ahl345RG4CKnYGMjjFbTqGrhltdGDBh/wckSOFdCLRrm/VDM150fLT73hxC0kqbfRt
	 A3uJ4BZhYiNBiIghQuRLj782yXY5j0uUrvVe0wuZwR4qhEuj4Ph6eXPyohLnKF/qnW
	 cdj5jIEWvs6+fmtperyHZIm7x6wCY3qZvPw/NNDfljU24laEEImUVpBmOiNH/k6S7i
	 1LX7y84zE6Z6A==
From: Simon Horman <horms@kernel.org>
Date: Sat, 06 Apr 2024 16:43:02 +0100
Subject: [PATCH] Documentation/gpu: correct path of reference
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240406-doc-gpu-v1-1-fe0ad057ac7e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAIVtEWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEwMz3ZT8ZN30glJdYyPLNMPkFANTo2RDJaDqgqLUtMwKsEnRsbW1AKQ
 g3oVZAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.12.3

The path to GPU documentation is Documentation/gpu
rather than Documentation/GPU

This appears to have been introduced by commit ba162ae749a5
("Documentation/gpu: Introduce a simple contribution list for display code")

Flagged by make htmldocs.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 Documentation/gpu/amdgpu/display/display-contributing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/display/display-contributing.rst b/Documentation/gpu/amdgpu/display/display-contributing.rst
index fdb2bea01d53..36f3077eee00 100644
--- a/Documentation/gpu/amdgpu/display/display-contributing.rst
+++ b/Documentation/gpu/amdgpu/display/display-contributing.rst
@@ -135,7 +135,7 @@ Enable underlay
 ---------------
 
 AMD display has this feature called underlay (which you can read more about at
-'Documentation/GPU/amdgpu/display/mpo-overview.rst') which is intended to
+'Documentation/gpu/amdgpu/display/mpo-overview.rst') which is intended to
 save power when playing a video. The basic idea is to put a video in the
 underlay plane at the bottom and the desktop in the plane above it with a hole
 in the video area. This feature is enabled in ChromeOS, and from our data

