Received: from outbound.mr.icloud.com (mr-2001f-snip4-11.eps.apple.com [57.103.68.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ADF309F00
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778986761; cv=none; b=T2iOhFM0dw/+zWSccHhLgzLDss/FHl51e47x9Zf39c8aM+pBmR0jfXCzcGPApot4hRKyv+yhzjceC5/KwiImv4S9tjtIdirDKbi7osFZh9NqsCTy3mCwr9V5DhtIKXV0hFME6MKjtlziDh64ymWYSr/pzxBRvjGP8d9BHSZxKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778986761; c=relaxed/simple;
	bh=U0DYAyG6euQ4xmdG/H/zM0euRwa7QlRm1L2hEaV+8Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ei8SslcHmm9Sx0w86IlJwuDO22+DCupXSBp2l8awVKdNU8bso2U4yZR+FoJePZFpi2/RPyF24x6H0rYiMIkQOD//yuGhJsOJ2Eb3Plck4vhb6a4c/hEvEfgoH8e416Dv7d87tifvDzVci5mBRzuOLr45c1hMruhSFgBYTjwaHMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=SxhRbiF0; arc=none smtp.client-ip=57.103.68.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="SxhRbiF0"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id 62D1A1800151;
	Sun, 17 May 2026 02:59:18 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpaBlBRHV8CCgRHBFsXRgNTRV8CFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXQJaBUALTQteAEUDQQtBAEAGRkEDUUkAXwErWxNVF0YJGQhdHQdYRxRHDg8ZWhRcGFM=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1778986760; x=1781578760; bh=lbmFNnPw4b27+6TTwJDsAGRBV+m0IoJWa8wcjEhbmjo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=SxhRbiF0dcPzya1TBtjtNklY/whmYf3INvykbekPFcqu9v9ZZXIhyZd7GfMIpxlaSYChaa9NRdDnpjOaeerFcEkl75bFrY94OcDDvTZ/O8rvfGw8fuQOiZHDqVSuXbmy0MX4Mw0WyBSCgaPnWt+uaZK0b8AiB/QDjxhGx7w3Ra1wa/GhjBmRGiQ1zrMpnv78xhQydqUDghIEa+FqEBKDJJ8dDx1HoJf3qs9/0pDoooxUgAnWsyUcV1MPkJ70bmjWCj9pkgKF5XPDAMX5SogUWDmMaoT/GbjBKwDSX05TAaT/T7JJBDDyKOeQjoB73USC6AEGD7PjO0HWaUPJ3BAHjg==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id BE1A518000BF;
	Sun, 17 May 2026 02:59:14 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Replace "transparant" with "transparent"
Date: Sun, 17 May 2026 11:58:30 +0900
Message-ID: <20260517025837.11293-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87se7rmont.fsf@trenco.lwn.net>
References: <87se7rmont.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=F+Vat6hN c=1 sm=1 tr=0 ts=6a092f07
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=wGL9MbAH5B13jT6XI7IA:9 a=IxSG75etxsVYPPdR13TJ:22 a=ZjDq3gu30spcOt8FOK9Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDAyOSBTYWx0ZWRfX2ESVug4rkVZ+
 +/HvSi3VJGT+7jkHl8YmJeymKk97r9g68jswcPEC7tMxQ50wVKrVLA+5UmRa+fqtFa8zvvHOw2E
 zc/T3HMbZqlQ2S0iL252uqJsg2DdGntaQqc+YMNZgZEg2vAvsZdHjif7vYPRSRFwmcYEB6j+iES
 NAu3s8XTuog5Ooa32MHf0KObecuu23CiKlOSZMtkNjyeAR39KTCVrymV+pRMxPEeLtQMQ3/unsQ
 L1ItrSOW3TU8DxLvUMQEfjwtplTepdfgWVQhuOp98okagmJF3iLdRDwwe2dD7e/OMMCAf8d2xap
 PMJBUzdMikaWUcQFYgDDqfONkhkLJbmFemJ1J5v69GNWkzgFm33kq81tzhMC/s=
X-Proofpoint-GUID: LfPKRJHDOC-8twZ-oDtANFH585lXsGr8
X-Proofpoint-ORIG-GUID: LfPKRJHDOC-8twZ-oDtANFH585lXsGr8
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/gpu/amdgpu/display/mpo-overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/display/mpo-overview.rst b/Documentation/gpu/amdgpu/display/mpo-overview.rst
index 59a4f54a3..ed39e53ff 100644
--- a/Documentation/gpu/amdgpu/display/mpo-overview.rst
+++ b/Documentation/gpu/amdgpu/display/mpo-overview.rst
@@ -167,7 +167,7 @@ and interactions with operations such as DPMS and S3:
 - ``kms_plane_multiple@atomic-pipe-*-tiling-``
 - ``kms_plane_scaling@pipe-*-plane-scaling``
 - ``kms_plane_alpha_blend@pipe-*-alpha-basic``
-- ``kms_plane_alpha_blend@pipe-*-alpha-transparant-fb``
+- ``kms_plane_alpha_blend@pipe-*-alpha-transparent-fb``
 - ``kms_plane_alpha_blend@pipe-*-alpha-opaque-fb``
 - ``kms_plane_alpha_blend@pipe-*-constant-alpha-min``
 - ``kms_plane_alpha_blend@pipe-*-constant-alpha-mid``
-- 
2.54.0

