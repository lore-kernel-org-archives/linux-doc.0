Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A9433BA8
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562079; cv=none; b=kFJEjuyczxhIE/eMS4QsmFYjRBofnCpcM4N/OpUZ80M4ZeV2r2dMz7JLabb/Xj0sFpzaTHNmBNXP5iOaAeGeC7eHik+PXsY3A1Opr5JHjH6Ng7+PKkZYvpGUOQQU30NClLvC7b1PzNq7L9lgfPEUnC+BLCOD6T+V8DkcfMU+vnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562079; c=relaxed/simple;
	bh=HdxpWSHVTZnagqWd9UGqEZtDSs8wJ971uoSLZwkj04A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ScmktSjpGbGgKHpKN59VLMJajrZDdoKZCNHw+wdIa1LHHW415rn0vDhjyvzcCsMm7YB4Me2mTBk7eeYUF0Qkok+RPru9keq48hzmAah96dq+JgGjPIQn/hK2nAWl+/nF3bn53GVLqv3Id9gi1Bz6PyLKTKoWYT3Dygww8FKHx0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifpynGoV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifpynGoV"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so9022939f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562073; x=1785166873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=ifpynGoV4SFFXmDXj/N0kA0WITPIodx5d6p8MSCd+9l/k+dvefMzB3LPNOn//ldTbp
         i3Et44uJZb0c9nahYz16xJbri7VTwvwb/u0qbjTAYYTxD1JkvDfGxhwPm04kniao2/B6
         xSW7/VmSe99yh4Ocm2FE5v1PqvFhc51R5BUMaOwBQgfjEYbRSUS/Px1rF/7E+QBUR0qd
         QwTWAAygOPxwrcWVqtnQQjKzLxFhRRV+e9G8KmRy48J+qvI85NMD0SBumBBZzgtwdXiq
         Dy0l6ZAmg/xAwfZIkVg1m0Aeb1eA14Y1bk7w0MHOxrA7aDOA5wbgjpUa6DhwJTftu65v
         9w9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562073; x=1785166873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ATiv+bDbiK4r8/Ev/Mp3rnzRTm75IqK6z6i5srau5Es=;
        b=H6ZPkKrCgu4IF+T7cJQ8dkCnGmF5eMZ7078wwC0JtnS5T9IpTuN9ob5C1mnqTzVp5X
         iXKjaT/cHghmVQUq136goa7JHhhK3agaNo7kXj4rv/206PkVHbMh8wS+ONxL+aaJPVVV
         Aq6R0kZmgf78o4XdA8wO3ldfT/74xi9icbi2T+4HThL1CdipyEk0cJCSW8lcrNTmTgjF
         En8w5m391K4DQnnb3WmhSyuSnrbQybGL9gpKW3DrNy7E+k6uJ8inZGWrYTi2LDzKVoQM
         nfdMoas8V1axePsIaCGuo+cyiUG2QREw+48bqBZKBDJELlbAtoa58r56XO2RLjzTigqv
         Z3mg==
X-Forwarded-Encrypted: i=1; AHgh+RrgZtD7/xNp4Fm7fRObpufNGgB+utFRSfg92KGzrHsWHDXcwXDb6ZFuaJY7SfVYy64PTMFZTR6EVvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsAO3NCwhQKsqVnsgXBJc5KSnmmoRPeX29MzX0SIy1MYH+UFH8
	/S86PlIbgc8snmUW6Fn493VaNIK0W6g/1D1bqY8k4dYR3qXno40njKO6
X-Gm-Gg: AR+sD12ZAore1WBWE2l+u1L5/IxgqOgcAqt7y+qr5/qh0aEfYqR4Kab6ms430/gxwdP
	CQ64r/m4yvkurQGlfgLuqX9jbeBB24kjbnB0fMFaTmuLR66Sl8FkJECnb/l1ROWbaipfQBQbkkR
	QlW1jKLLRMJ556+NsYIQqEL2FyYu7OVIXHeY20NC5YyOYRNpZWgc3enTMSUKkO+mgdWQq8S5y9c
	JyQBwtIs3GsnDFWaNEMUR0v/61osJzUz5SF0hqDHS/OCkp5X9XmLlfWGY/3Opens6SMcluqaHBF
	p9f78spUh7JaSY4UE3b/EaiXuEp1WtJzTlb+p4F4+d1mJlzAcPMEwicH7X+bXLyA4II/kLf1VOo
	HgcOsvrAKukM7bH4PhnBAppkSw5MNb9+tV3bLvTBQSxNBHjgECCweCtNqIsBm0oAm+SmaifxajR
	uYvxj3z4Q4Jw==
X-Received: by 2002:a5d:5d0e:0:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f6230389fmr18153184f8f.14.1784562072745;
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:12 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:39 +0200
Subject: [PATCH v2 07/15] drm/tidss: remove dependency on DRM simple
 helpers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-7-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 698f8d964ca0..10dbcc6cdf6a 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -9,11 +9,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +81,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +99,8 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_encoder_funcs, encoder_type, NULL);
 	if (ret)
 		return ret;
 

-- 
2.54.0

