Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B633C1408;
	Tue, 10 Mar 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158864; cv=none; b=BLJ3hGhf1+4f3GkfbltjOeY7HV+6ADq5Zf0E5hdXiXhi5SK+YuNvHANmKWoYlCmmNClSwiJLQYaYZrYx07DS+SGM3TSbNGuB+z8MSorJ03vbBFSc+2HDorR5jhJsNe9mzT2Mm1cQD3reqRspfG8ZMe6BDwzDBQsh8XbtF3nHO0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158864; c=relaxed/simple;
	bh=XqnM/u74MfAcBsfSF1rVN29p3I/8qj96BIXAEgUA4Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vA3dbmW9ah7QWtxQWhkwKyne+IM1XH1Q+JsP2Na6Jhkr5MAMrUuGM7zPxVgXCZsuiXQQx98yxIMxGHumFbfFKIvMjgWiqQypgV/mHU+DQVShP5IU+BbPC2R/ppvbptmvVeNeY6I66XFpNo+tOR2Ofle2Tie0QdimDca2rKjTndQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gw9A/FvQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gw9A/FvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C16BC19425;
	Tue, 10 Mar 2026 16:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158863;
	bh=XqnM/u74MfAcBsfSF1rVN29p3I/8qj96BIXAEgUA4Ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gw9A/FvQt0LInEjiatujfOPtHDO2pe9pB+2nbKNJDHWjH+M7Ru/Nxpbv2acNWK9sA
	 kaLJhbl/fYBx3FF1ge1F12uxcVgLCtU8SrhN95H9WlFhoc4ChYHYnJjDmZutdBIyQw
	 81xyidVS4NdeB6H30pHfEeoxHGNUPxH/K27iYete6rZ4Iu9cF6aUSHlVyh+lif35eB
	 KSL5+auBH88x+6Kdyl1PSwK9QkB+jioNJtXpPwjLxti2JeM22JxW2qvqDU4ndUyzwJ
	 1ekLqkbpbEVQF3d95WCxZ2NOMbJqRTu2EBsSERAdQjyTn4TCXp7YPOupz84P+QM9NH
	 Khnv1aHyxh9UQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:04 +0100
Subject: [PATCH 12/14] drm/tidss: Drop call to drm_mode_config_reset at
 probe time
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-12-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=861; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XqnM/u74MfAcBsfSF1rVN29p3I/8qj96BIXAEgUA4Ss=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHFfKa8vsYHwuPm1ldmmijxSrS/Qp0afCcoYM6y4I1
 +9rZD7aMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbi38TY0Omi/totL3hjwkn9
 wt87TJnz2Zfv6e7fPeHxH7PZNzo2Pmr2mLQw/I8C/8Z1hxadc8qyZ2z4Xf6Pt4pR+YHj1RZ3oTi
 9UxM9J8ddrbw44Z7Jtdkz92/WZmr/2KLtdNY0kWOy+ftLXbUA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that we have drm_mode_config_create_state() to create the initial
state called as part of drm_dev_register(), we don't need to call
drm_mode_config_reset() during the driver probe.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 8bb93194e5ac686050c47f986b8cb6063eae22d3..b4779c09a1bfa5be7010bcd7d4f1379362996d2e 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -285,11 +285,9 @@ int tidss_modeset_init(struct tidss_device *tidss)
 
 	ret = drm_vblank_init(ddev, tidss->num_crtcs);
 	if (ret)
 		return ret;
 
-	drm_mode_config_reset(ddev);
-
 	dev_dbg(tidss->dev, "%s done\n", __func__);
 
 	return 0;
 }

-- 
2.53.0

