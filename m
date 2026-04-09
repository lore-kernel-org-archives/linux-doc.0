Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261E3DBD71;
	Thu,  9 Apr 2026 15:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749753; cv=pass; b=gzHn9RVUDN4asT2HTejqVLUMvpznuG5K654cHThIYGlg13JUfWJSVDawhuYeWig4fmIvLmHMqzMf3zZK/2NbkMueC9Jn4ZUBsokFm02GdfsHtjFvGvwKwAnBH0MpnZbUkvdDSD05XcEdqNZEfsLOT4DzdoYVk/96irZFfr0Digk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749753; c=relaxed/simple;
	bh=RkpTQtoiQ71Zb7rCs3rDW6ujUd7pqlIri4p2KeUUnrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZHQewC/01fhnKLBUluDj85TmI1qxQH55s9i6KIYAy7g9phDTOT7KvPRbFYUdqaz1PVjxRseGtUslHrR99RBdclY99R2rUVIIPIbrMDAVeO6Zq5rpO3jz24uNeHoXpT0a2vYkS2HlYAtPCozrJVbxxDXX0oP/Ib6zE+APd6m+ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=b6cQ1MND; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="b6cQ1MND"
ARC-Seal: i=1; a=rsa-sha256; t=1775749708; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HZ7UC2u8ytn5vUFVNHy7j4Ta5t5PJzFVU3rLMYP4yOfUNB4iuMO6tu9gO/0h0Acm9nZnQG9iF/oRLK5c/NaNmOvrBx2e5jR3PUgjxSDa6yTq82Q9fbsNT2iGYoore6x/kwklmluGq/G51DcT7mO114IX8kyJ1N3EPyk+C/k7mjA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749708; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LBk/DR4fSC6qCd6jwGfcqZk47KlihYhACpKua31EgFU=; 
	b=fvPOCFnU/F9WAJqEYLJPA82LwQxpPBRXKkxyWMkg+X0WJFSS8x54sCatwZN0ArciAi9oJdObA/rAIqw3d1VFy7C2K4hvfeufaD4xYZPnfpzEu4nUg1lXDCE5A6WcEB2Aros/yN0V6w4wWTI7cKh420JfdPFjoZyyxSRmwybzltA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749708;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LBk/DR4fSC6qCd6jwGfcqZk47KlihYhACpKua31EgFU=;
	b=b6cQ1MND96Mc353Vuuj0Piw9j25Xrqos6zBnKKLH4dHbqwI634+U/aik3J1N2TIF
	/7LUlD2cayug2M4zZqA004DZ80DWBsqxXCsLoZxb9DmxKv2U96vkY8wzLEccVyEdomB
	y6eNxWkAilr+Vl9nPtsk6VgRL+7z2x4jZKwyxfEc=
Received: by mx.zohomail.com with SMTPS id 1775749706968386.2922289978144;
	Thu, 9 Apr 2026 08:48:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:15 +0200
Subject: [PATCH v12 25/25] drm/connector: Update docs of "colorspace" for
 color format prop
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-25-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.1

The colorspace property's documentation states that BT2020_RGB and
BT2020_YCC are equivalent, and the output format depends on the driver.

Now that there is a "color format" property that userspace can use to
explicitly set a format, update the colorspace docs to mention this.

The behaviour here is not changed for userspace that doesn't know about
the color format property yet, as the color format property defaults to
"AUTO", where the choice of output format is left up to drivers.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 0da136a93dd6..71c58fa15aa0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2573,7 +2573,8 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  *		conversion matrix and convert to the appropriate quantization
  *		range.
  *		The variants BT2020_RGB and BT2020_YCC are equivalent and the
- *		driver chooses between RGB and YCbCr on its own.
+ *		driver chooses between RGB and YCbCr based on the color format
+ *		property.
  *
  *	SMPTE_170M_YCC:
  *	BT709_YCC:

-- 
2.53.0

