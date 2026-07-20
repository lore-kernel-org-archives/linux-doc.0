Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD73438479
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562107; cv=none; b=CZmy+tGGT1Bj0jgbeehIeBg706LOmVroBNUDkLoP0DyAReuRdzpTWEwnlDk24LrQqHfKG0bnV2vKo6FA5Zz7//9c0t29tKPq3W3wmPhfSM5QEYy/X4s/y19IkN7zjFjm99znYa3qLt66dqLJhpp6XXaLlldFPtw2G+6wxq0XwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562107; c=relaxed/simple;
	bh=EhmF3j+M4AduWGCg7EqLVWPIxAwmTTCxT2Gz0yXqaxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scvsGOFWCsRUDu/gD+tllTspY5Zhs4BG6k4hXzAz3DQMoHdIZmW83DMAuUQmACkCfgaGlPARKhAdUmknzUNEtpGFFTGOsYAhyZt2bOyhJR1ox6SmutqFDJX2tFyMCmlXwmQ81rI5Is1oxxBXa8Fr6ynsspPrZHyIsQRAy07v7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3D/Gzzg; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3D/Gzzg"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-471eeac43bfso9603419f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784562104; x=1785166904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=K3D/Gzzg+DgwpeE6nhV/L26cQNnwefMDgGkbnZCmXDGSVz+9rlelZDlGwMPzQF5hX9
         rSVwXNeY6uGISdebBs6PlCjJVMmvyKLdIldiNa71ZVMO3fBxJypUhLgtcI9znFEZRgfL
         GcxsINcNRGbsrMxuK80iPk+SRQ/lIYOlQL/UuJ3nycyVD1uIduQiSAZbboa1WDM10QBk
         PBAY1E5mPpzyUBJVAwbAjB0Ex8SLkcGUMQaArIO/oYeTftJOMvub99ypqdJq5On4B5MY
         zdO+gKaiz1CjwH9JXA1r/HHu5NNslcxgQvQqo9XRBxKoyNavg+zi1ld8Tns104hF8dpc
         9TsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784562104; x=1785166904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77r3PWO7yo5+W5LQS9FlqiYUpbSGXMMaR8d5GZmSOF4=;
        b=GSdrvGyg+iKcJ6i2TQGddr6HESS8K1N2V/0Px2NkO/8Sk+U8x/SidkoLmaU0+gZtxH
         5E1HbKX1rK2kmEvpXsW3inavRMgshY7bdl5snlS/eqKG5z0p9gSJlRUvebEs8hKXv49Z
         hx9T/v4t9YOaFOiZn9heG21OEikQOhEwSH95v2Qz8TSgUESgUgadHBMqzVhtw5YCywnB
         pQ6G9YY8aijQeFUcG1CH4bbrysAOSkZF4vtNGwarCx0VxHaXQpIWwcoDFFFm82u3bBI3
         drSG48ELCdkf3UFmwahoCWtFX1IjDIKV9dO9hUgfb3HoBpbwCzmiRp0u3MkwiOMSUb3K
         NFzA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs1atzoS2mXdq23n0ZdeK6tCL86G4FbvsTi/hVeuCVDBGyWKQaghP0ScN20ruhRrHqkb/BYbxVx3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTe6dausELG/SB927nJ8dWtQmL04vQzgx0cm/JYatNxMo7c1Ka
	64UrdlujnQ1D/kJVgFluTbKMWvAfLaeVAI5muUqbJh2c1sjjWnrdj3Jx
X-Gm-Gg: AR+sD110sqK0Muz8qV2RjupC92v/doyl0ora9ubcMLqeug1ju/xZ3UfootD687k45dI
	2BfKwJG3rqb1brlBrpNWZoShJE8jctNzlp2BKIjTSTr0odOR2pOfcxsxl45OO1XxLs1YseidjdE
	W/ziCl4o7IGQnKMfSlKTIMgmjTQLbBZ0a2mWvRmoKkzciEw5w2ljpMUbGmx1S9nIa1T4ihnO7yZ
	PHKd4Ax6uLzZ/GYWY+pPe3LUEDKT09ZCzo66nKA7J1K+XugQ623GoxbLp2+2bAj53HfXa4xXI7d
	imOpsnT3AY4Jjo5fmpCnq2Ik3pOkT7ueWBsJvFGZnaI43pf611zirsS5zoP4fcrfjziMgQxrYDG
	8vsHzmb3J5WcQzkFva2U3k5YjyNgfdfATvyk7C2dJHxVKJc72vdpbM14DtRC7rMYrMy9XasBrGm
	qwj62Om0t2EQ==
X-Received: by 2002:a5d:584f:0:b0:47f:6d57:5a93 with SMTP id ffacd0b85a97d-47f6d575ccbmr10955450f8f.38.1784562103442;
        Mon, 20 Jul 2026 08:41:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:e9c1:2f80:10a9:c708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32667936f8f.21.2026.07.20.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 08:41:42 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:40:47 +0200
Subject: [PATCH v2 15/15] Documentation/gpu: remove completed
 drm_simple_encoder_init() todo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-drm_simple_encoder_init-v2-15-5020b630668a@gmail.com>
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

All drm_simple_encoder_init() users have been removed, so drop the
completed todo item.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 Documentation/gpu/todo.rst | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 14cf37590fc7..b7351467dc74 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,21 +29,6 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
-Open-code drm_simple_encoder_init()
------------------------------------
-
-The helper drm_simple_encoder_init() was supposed to simplify encoder
-initialization. Instead it only added an intermediate layer between atomic
-modesetting and the DRM driver.
-
-The task here is to remove drm_simple_encoder_init(). Search for a driver
-that calls drm_simple_encoder_init() and inline the helper. The driver will
-also need its own instance of drm_encoder_funcs.
-
-Contact: Thomas Zimmermann, respective driver maintainer
-
-Level: Easy
-
 Replace struct drm_simple_display_pipe with regular atomic helpers
 ------------------------------------------------------------------
 

-- 
2.54.0

