Received: from outbound.pv.icloud.com (pv-2005g-snip4-11.eps.apple.com [57.103.66.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F8830DED1
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003641; cv=none; b=twJO5D8luXD231wrU2b6CajTxGhsrg39K9pVYMoDwXlxBlT/RR0sFgk/Tv+QuKSu3QD/84AB30O54l+ftccufHvu+hJ9YBDfJJhbvZDhiMYlY+DwFqEPmCVqhg3GsaKN1MhJNUAeVE88dHCWSyClKsZ2j6z2WCd2MBydZRuM8Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003641; c=relaxed/simple;
	bh=nP22jj1IlAjz+YBki7wpHIV1Nhe8Wwk9y4RCpnKXKJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mKBy9STvWN89wM1sZIR0joAdF848pWElHUpXhLv3MdcL2rxMCe41wrTfOjMUnu00UWbqWamFKHQwWtxfQiFfSpkkyeEO9mDiS5J/g+H+ol7sBkcOC5Ax0bvoyrQEDDRg4YhvpXxxNzPRR5nUqh8OBsnwD4YuY8vxqxd18w8iesA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=zzfi9vHz; arc=none smtp.client-ip=57.103.66.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="zzfi9vHz"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPS id D7272180010D;
	Sun, 17 May 2026 07:40:37 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpaBlBRHV8CCgRHBFsXRgNTRUIGFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXQJaBUAOTANfB0UHRgpLHlwaGEEYCEsBW3cCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1779003639; x=1781595639; bh=aNvb29xy+lV9pE+SL5VbNJWu0la3P/7Ev+VY2zxukOE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=zzfi9vHzak2GMtTVMp2F0bk8evPbPRHSLgTTiSJITBLBBnf3S+vlIQz69aH0pjemLPGsSAoyv2bbq0rmdPPSkdHfLKF2eTUcjfxHuVEAjYEChsql6U8lYafDhHxv/2FBSEVofRcpXsR2NYcShn3JfpblAycuPPL+pgvm3gCG73vn2kOyZabm4QC7zsrfbU2pl9Y/mM3o6PQxZWH7iI69VO28D1G5c7od+2Q7JzYmD+OsTvO0ccmyrsnlyFzYJiT7zkp3RHslnr7HXE7nKynfn2sMdMznJqyvNMSgGze/Ufmzez4ObOekVWRIaax1MfHNY8/SPZiYZX4GbInxseojyg==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-0 (Postfix) with ESMTPSA id 24A90180012E;
	Sun, 17 May 2026 07:40:33 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] docs: fix typo in mpo-overview.rst
Date: Sun, 17 May 2026 16:40:13 +0900
Message-ID: <20260517074020.5633-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=aahsXBot c=1 sm=1 tr=0 ts=6a0970f6
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=vi3RrHiwHXUnrlATKwIA:9 a=IxSG75etxsVYPPdR13TJ:22 a=lOdrInXjANxufYs0I0OZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4MCBTYWx0ZWRfX6mTTVoH5SiGQ
 aocRPE0aKlJMtW+3bXywpNlNeEAOpk4WyljpL7Q/aiJD/zNhycEmN+XKZOuGPguxaOSNuLMSIKH
 /18ohvGoNyTce5aZMOB4Nlg7XpaBqegdIj3XxyXUcEt5rTcDs4xOd62DwkAplQp4xnsl1PhMDrj
 cQmMbmlwspJKCqG39CQTyklbgwLwGRE6fjnuRLaYibrQN7klfBkt+mxA2OiaVlv7ASyis/WYQXm
 Z7ux6g2/mz/go3QZVhny641+vhZvLMFR0VvXTmn1fL5opuZP7+66Gb5vQjc0scQOg3KMTaXc9GT
 VS8SJLAe6SQZlAcf+B6PXYUVpzxnTHbX/HLnj/TSQNHZGRDUk7UM1ElAlZs+/0=
X-Proofpoint-GUID: ja6PTfVLb1Z_-8LArzE4K9bA2Oo9Xayc
X-Proofpoint-ORIG-GUID: ja6PTfVLb1Z_-8LArzE4K9bA2Oo9Xayc
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Replace "transparant" with "transparent"

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

