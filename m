Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C65437DE8D
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417799; cv=none; b=BISAwgOC52Se/232rqkndv+OEVz0PUqit3jf9hoaZ3mtrMdVXCvMtLZLwEMHPxkWMmgzSBkC8m01sZp/SpyAJSg/KaeXuI6QXntBfVWS3o+G8E/SDI2XfGDtdxCMCjpDWENk/8TT/c5/ZQf4j+SusUfKVyOy3QORPHdDg9Mwj44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417799; c=relaxed/simple;
	bh=b45v6y+LLUGyopM335rc2RHdtrcJI8ZwsczKTNDgp+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4j/Giadddj4cSBrEzr4ukD5+FZEeH0pLovH4GqJVwegVjs3NlazKPvHbKYIcGuOpd5qg5K/bweZ0b8x2Fut6iyr8XgexlFiEWxHVqH6/OSzqoFsk+yTx/esspASWyx049Hbui5ok7jj/4jtDbVYMHuLRuA2xiziPNWM5nygELI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaAfHGWG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaAfHGWG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so62569245e9.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417796; x=1785022596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=JaAfHGWG6TvBmkJTBMbup4QSWXEEO7R7E0EtGsSCvezJh1T4RzGoe5aPk6jWJAbie0
         CEpxXQIF8MH845KBUddkDsMu2KYM8vRELPhHv4H8fQqzUSNbiqWVxylhjuwS8SgGjfQc
         S590pMS0qBw73IPh4p83yZAAZMR12OlUxwTIHf1hNlvlToEH2tR3gyGuJSLLZX3xkQ/0
         wrUNALT28M2DxM/Z8/pB+/7+HNy6sSIUKWz2lmKpP9/atNVCahWwe11MhHcyn2RJAqOv
         qyN1pQhNumP73TylfFDfaUlzs+FWIB50AmAq+GQf/7Hb8pUc1mU/sqVz+0+97upvk4hy
         guDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417796; x=1785022596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCTzuFV7eFCGxIzO9ORcmzHtSM3Ggk/jrKBR0xDgYaA=;
        b=ZWGqjNv0td1kwel9CEHV7HqZF2hsytwY44S9tS00GdTeWpwdJP0JcIlrz8q0yDM5s8
         L3tNrEo8kl6JBT9jbIoIx7BI0HHgQN3ucb7aO/edqZflnjNdm5g+v749nbZDbha6KtPN
         yjtCfMZgV0AJW9sTQmcmim9EYzR4FwHSGW1d6T932IoodubBdQTOWvDIEw3hz7VEU+4u
         HJ0jcqwleu+NhELYUfBXiiouMSfQ47RUwehOMaFFTrdiJz0mgj+3i7nmykkHsg/t6onb
         Jh2NI4nvck74Vb3t9x2U4jaGpDMS6gOzgUnubHupWHqPkdD2M/6/WuPa8r142aYYjJdy
         qu1w==
X-Forwarded-Encrypted: i=1; AHgh+RpjW7CVBYq0V/EcjdRV2H6MYE5g4tIFtpHMQ0+8R8Ho3H/Zz0zI7kvKFPbdvlfQUjpmEUDCvsWsCps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz57Va1fyiv3bmANWBfE16L//+HnJbMiplVZsFOYgguefX7Fe3U
	f5Gl0Jk0aKBRU7IsosPOKe/gctZrP2lrZxerKMeBb8qXuWWOcv8kUmTM
X-Gm-Gg: AfdE7clHIWpMk5F2T31JDd5jUq0wLo/y6V2q/K6boBVDKUUAwFhISfswTMZu1qk+TRm
	h9cDv2fjMRO6ZvZD4yjSb3lOQ2oapLdSG7ulDLPrzfwlUb9IzOgUgeV56hS0fk4gZXBXLOivgVY
	+9oevTJ6Sy8uI6eaiERwx3I/utxSCbXJ03rXs26rl6FsJwxWf62RsJKyMaGY61N3DJOaxTbqK7P
	JW0k1zcIgE5nq5NE+kPl8KpNicmoRbwZ7RF+NXmh4PS+pwNVsNlCMSJwISkwa/qmvJQoXlJwc0Q
	0O9yXJ/ihrAqqdlFnTKLOgw7T+6IEDtKteqWdJyvgKBxRDiiYH5Km7kDjCx+Zh9HYTpZ8fnfFNw
	5RyttjepP9g2HV200eCcjxjKFIVenUSL5TaXnyJuAdNSV0ysGAtmlhrxGlvOGanODpzLGzGCAhS
	+I5VBNoAGb6g==
X-Received: by 2002:a05:600c:3b91:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-4954c629e5emr98503215e9.34.1784417796224;
        Sat, 18 Jul 2026 16:36:36 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:35 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:42 +0200
Subject: [PATCH 11/15] drm/hisilicon/kirin: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-11-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 15042365dec0..62c5bd3277da 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,11 +20,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dw_dsi_reg.h"
 
@@ -687,6 +687,10 @@ static int dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static const struct drm_encoder_funcs dw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.atomic_check	= dsi_encoder_atomic_check,
 	.mode_valid	= dsi_encoder_mode_valid,
@@ -708,7 +712,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;

-- 
2.54.0

