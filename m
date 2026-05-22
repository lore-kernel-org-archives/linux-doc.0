Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99426395AFB;
	Fri, 22 May 2026 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453211; cv=pass; b=S1BP9DVKTdyNiF8f328oHjueSE1ObqgTsmfYsJAQfeQ3G21jVKfJebMpuVsUb58PXwvxQDxk1cMuUm4/1DyNXRRaQhYilZ5dQwyl3MJ6pvkNf/vcFCRK+HDB5DDqzNiN3mOCzKbQ8+B/mGGrZrEjM3L/1eKA7FVDf6CDMFjw/UM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453211; c=relaxed/simple;
	bh=f4bvB+xBvgXE3NXJVtQocdi4wlyhWDs2k5QCvnMUyvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdgrAc/825Cx1XMhYvtwaT1OMm54Jx4gpPuu6AeIdABhZEg8cu5u16G6fDXvoscwROfn5P99hY8lO/4CgWTF6xkDQ1J9PEl5Jstuu5+tT6mQj1y7BLyXkykrl1geSQfSg9ebxrdptLi/2LSjuHUD45z9LQjXSrMpsGCa/BhgZFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=RFYC6G16; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="RFYC6G16"
ARC-Seal: i=1; a=rsa-sha256; t=1779453168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FwjIaJl5qeaR82F3bzSTfhhJBI5R32zASblBu7pn1fJYXHUiglbQcFr/gQPeHjTwQjlxkHQ/Aa1o0f2oPSeR2y306b7bvSPBDvPcy7hhTVPXUhpjBWmeGUMxVAZVBPFXq/JV416+CrtiOeSBqUBC38V3kaBlYH+myQiKQV368n4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453168; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rn3P+1HjcNDik0Ghl9x1nmsSuObudzrApaXdu1dLsLg=; 
	b=N9EcGzs41hT5OCwjTeuUNsmEsTjWw/8YToyd8TqzoSU4JSnmVYlhdSFl/O2iz9hc+c49f2pt36yuxHzJwcgw8pPb9Z3hTCGOUG1nOOsh3WwAURSxVSX8r3Ro/SHPLzBNJev4D+JKKKW/mCQFCIERFTWY0bVksFLTCxKpQzL+0qU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453168;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rn3P+1HjcNDik0Ghl9x1nmsSuObudzrApaXdu1dLsLg=;
	b=RFYC6G16VoV/GIc05E+u2kUmoX5sGOA1RTZK8bNAb/Tt4FzEJAVGHpGyxSwutYhH
	BVmr/VCI9GEU7tqgJHpuoLv8RnXLRPz+fCMliw62XSiJ+wEQDUCvNM2IiCu3JqDH8zX
	U1o3XQpuJ7ftYyTLxjomMHwVQzLdh9PUebzm99l4=
Received: by mx.zohomail.com with SMTPS id 177945316693849.19297575297696;
	Fri, 22 May 2026 05:32:46 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:31:53 +0200
Subject: [PATCH v15 02/28] drm/display: hdmi-state-helper: Use default case
 for unsupported formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-2-21fb136c9df2@collabora.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
In-Reply-To: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2

Switch statements that do not handle all possible values of an
enumeration will generate a warning during compilation. In preparation
for adding a COUNT value to the end of the enum, this needs to be dealt
with.

Add a default case to sink_supports_format_bpc's DRM_OUTPUT_COLOR_FORMAT
switch statement, and move the log-and-return unknown pixel format
handling into it.

No functional change.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 4867edbf2622..3ba47564caad 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -541,10 +541,11 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		drm_dbg_kms(dev, "YUV444 format supported in that configuration.\n");
 
 		return true;
-	}
 
-	drm_dbg_kms(dev, "Unsupported pixel format.\n");
-	return false;
+	default:
+		drm_dbg_kms(dev, "Unsupported pixel format.\n");
+		return false;
+	}
 }
 
 static enum drm_mode_status

-- 
2.54.0

