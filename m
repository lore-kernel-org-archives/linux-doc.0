Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54EF269CE6;
	Sat, 23 May 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565713; cv=pass; b=tdGOm3ygbsLLwSJ+LPDoKEl9EqKbaj+xetHKGXKJPylKSix9EH6RvrcPe2mOaiT6ft2S3uCzHb2ssX/rGmZOBgcwcTaN7UU7i7Vps+dWyr2qxpwELkZa42geqvAIGSOi3t29ZAi9WtGQiT5AA2utK2R71cORraOy/RxNk/MUfIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565713; c=relaxed/simple;
	bh=DkfTOE5laOYp2BPqnPrfU9IGzOEletpskdQnWtyGMZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GVVGb7UTrde7DGSHILDxqqESBMSdVq510uf5zs6eIJa0JefLjr/dvpdknYrWbo5EnmxTan5Z/NklgXW7CNv2rOKyqZWSmQ7j2JIXzRqsuysNCyyuzTaGwzkusILxfRi5S+yz91JZb/9ko+0cb5nIl5jYhVMfIL/W3t+Ww1B3VYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=bN5BrvNG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="bN5BrvNG"
ARC-Seal: i=1; a=rsa-sha256; t=1779565674; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Kh6Yvw7RKaiCyS9jdXSq1VyRQRRgUalqymu9Ac5ojYjUCJGQBSxAZm1s+8gDPTlkZq1hs0VMtVn5/dLDFgX0ZrsT8EUZCCzNCpoci3Gr3p8frraWwZ5rY3hBx9NI71gVCB+J594Hx8vlo/IEYutCUkrSgEiXTCuKJUBZz1aH12Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565674; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1sGW+tPnNSizcPI0m2XOxdkkJX8AbpVVx8duPF0GM7E=; 
	b=aY84VP6tujzrl8VVjTzlXVKUcyZkukxzkdp6+wiS/GHFMO0pxOppmrrBtdjvjCPTivf1+bIvXh/u6F7USNq9a+8LnncjVQq7QHjo1I3kbGv0W/3yoBb/eN894wEwSr2IFk92hagvWw3h8LiH0byQu7R3azdIFVcTzJbpAkogTYE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565674;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=1sGW+tPnNSizcPI0m2XOxdkkJX8AbpVVx8duPF0GM7E=;
	b=bN5BrvNGOMh5BEpWxWhLqp1XyJLKFVC1vzCQDW7yE/xzCrpUTB3SMmsQB/XyiGYo
	43onLJ+3axS3Um48as063n35rFvM6BJnfsaDvYoAuL4I9LiM2y/QlPkueYKWYRxp5qS
	AZvGIqfELIF1f8oDUlWqecANQMyQE01NLm7rjZlE=
Received: by mx.zohomail.com with SMTPS id 177956567228682.31806498197341;
	Sat, 23 May 2026 12:47:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:43:57 +0200
Subject: [PATCH v16 22/28] drm/connector: Register color format property on
 HDMI connectors
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-22-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 41a5ab1e563e..b91c1f76355e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -627,6 +627,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	ret = drm_connector_attach_color_format_property(connector, supported_formats);
+	if (ret)
+		return ret;
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.54.0

