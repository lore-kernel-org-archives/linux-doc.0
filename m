Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FC4192F9
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562103; cv=none; b=SOUAq0pbguuor7mr0cMHklb+BBaDpi/8siGOya6e3dqRbpY6FebtASb7RDysy4MM5fP99rY6jHxsxQFEoZ+BMZcS7Ykfe4HhE5QuaNgCj1H9VQLHLbUcIwxnwB4OI6130tU+x63RxQZxmAK4hKAxssOQD/dJ+tyC31G/dwWbR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562103; c=relaxed/simple;
	bh=bMs/03E/pLT09J4z4UiyyuHjtplBVReDGtgMdQzn3hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cN1KNi3fVhyHV64i0Q8GjNwwhjAaRp+AWXWFLJEANckJHCTgmd+MeyVkwpogYjovqimlNwOOyRTHJPqF7x+Qm8xPHZ7mwtYz+GFowaGBDMbIr75ftZUtDzhmg1rO8XhmeXbIgCV+GBbrzEQ1kJJDNJNQTmuUJYZak1c5g1eGAec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWmMJTpk; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWmMJTpk"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso6738762f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562099; x=1785166899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=VWmMJTpkEKEYTYiEghxZdfOKcSv37ci+3ri1jshAFOVvq8hExThRLCqUNgaC/xubDS
         KyCTIBH1J3QuXvDwnkASDjvB6e/jocO9NVWJWciFuM8wToWXOjpCfQF7jgiWwb3UP1LZ
         6M3sUdBXaOp1mGgXXwuDb3+g0eyLDJHH/GHkjurKMdvFAn6hUjKq7uf0sP8G85nLMLGq
         ipXQjN+TpEPzEmrKYe2UE+EOdFUkyq6/1x1KlhV2YFKGQPKt5NTYslf8zCu8ibBU8QwN
         4RjPrBq1yVGcgr5rXpAfBxi8Ywaf1+WSuANm8od4KSKq0Twr3+OWxcHkTC7N8lsZMlh2
         ZfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562099; x=1785166899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYdVSEJYSxlpPRyHCi7r5tN2RJPa+UFv81a3Ufh1joM=;
        b=UxEE/ewVEQxOshHIFoCnipexxTrRL1Mn3qmeyUbuOnDmF7H7qxcsN0R56PkMZXF7QZ
         QHpxs/LSg91x6UiDQNL90M29g5pv40VArllfDja7OkuFOO/AmcFew7gPaoNMbxLBARki
         FVr6K97whjOGXRSPwKKCvX5CzIJwGhn/pwlEWk5O0R6GwUYF8kqXa/mFrf9B+bz5mheG
         QoXY+Qvrj4pURoKxJ5r+9BQ/lcxr/n3Dm8Xsrc8wPyWbPfDoASRUwN+1WXED1sgCFrbY
         XtWqAshRMojE4FuR/b0mEuL1fjGs/3s9bJ/kcxkxdKPDQC3A6YCkZa68wst2Xw+NJd2q
         GZQg==
X-Forwarded-Encrypted: i=1; AHgh+Rqga3b8Htjrznws+dHVOy/puRG2ucmv71oDs96f/Ki3pKu+IXJPNEdW8Ehif6PMileyxBg9Sb9dqjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3e2r2isbEByH/k9ak1whqECw6bSxQX0E2S6F99UQsMC2WrhYV
	eXIVN0pF0icdXoCAu2NbqiXSq6gAHpRSVOPrBQSMvk9sC4OOk0dNKtt9
X-Gm-Gg: AR+sD13KOElnffJ3n4B94B51emEOd9fGXqTJjAqpGFHMIqHDjFJIoRB/qmFtNAkpbHi
	WQB72J48Mlx3pvSyM+N9qY58Ax/tkL8+pieNv6t4LyXhT5Frggpq4z8gs8Yc/P6J4r8ItEl8AHm
	WFiMG6jAnIJaKREXlLHPlqsgIfwE5KWWEHW4iHck22VKk3NlCC4Qmod/8VmMOMn0sXGdPv1r9DE
	OV8d0ERUJv8w1U4eGd7OZvjAvWC+Qb21th3pgyFCpK6DagrEZR2brK8ZkZHbt5yGscSJ3Lyxnku
	PULZBK9KoIRnIvGRxtVkiMJ9arDjB+4prW7JSUur42cU3hNqBNAbArf3v5NIs6Tu1IXRmK7YRdB
	hOvt97W3ZTxbzVRu09rGj+/B580vGKbYskj27v4Q9dxswLCM11vU9M3i9raulPg8CmFoiPiwcqD
	zuThy2yGdlaA==
X-Received: by 2002:a5d:5f91:0:b0:46f:7d90:8121 with SMTP id ffacd0b85a97d-47f62305661mr18563371f8f.14.1784562099337;
        Mon, 20 Jul 2026 08:41:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:38 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:46 +0200
Subject: [PATCH v2 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-14-5020b630668a@gmail.com>
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

All driver users of drm_simple_encoder_init() have been converted to
drm_encoder_init(). Drop the helper and open-code its remaining internal
use in drm_simple_display_pipe_init() to prevent new users.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 13 ++-----------
 include/drm/drm_simple_kms_helper.h     |  4 ----
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 8e1d07b9f1e3..7878b9d7d524 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -20,16 +20,6 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type)
-{
-	return drm_encoder_init(dev, encoder,
-				&drm_simple_encoder_funcs_cleanup,
-				encoder_type, NULL);
-}
-EXPORT_SYMBOL(drm_simple_encoder_init);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type)
 {
@@ -363,7 +353,8 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_NONE, NULL);
 	if (ret || !connector)
 		return ret;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index cb672ce0e856..c95f86ff355f 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *dev,
 			const uint64_t *format_modifiers,
 			struct drm_connector *connector);
 
-int drm_simple_encoder_init(struct drm_device *dev,
-			    struct drm_encoder *encoder,
-			    int encoder_type);
-
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 

-- 
2.54.0

