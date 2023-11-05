Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B71864F
	for <linux-doc@vger.kernel.org>; Sun,  5 Nov 2023 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ncf.edu header.i=@ncf.edu header.b="LL8+sOjS"
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033CBDE
	for <linux-doc@vger.kernel.org>; Sun,  5 Nov 2023 13:01:10 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5b35579f475so44147607b3.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Nov 2023 13:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ncf.edu; s=google; t=1699218069; x=1699822869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IHNT0zTQnNcqPPjHsSZJukecZ6cg1UjZ8+XnwMd4fEU=;
        b=LL8+sOjSE1BRmbaCr13g/tkaW+e2gmtffWTLcjWCrFdK/lSS4Oy2IYkP3FvnrwhAmU
         I2g9FjdzEarMHHHtVVl+evs2fmEXs5GCMavbtsOX9DiH7w218IsMkeWGZ4ctAsiv1Tcc
         jam3Nc67dQhuYIOQlekY/LhQgguwSK59OvxW0fUElnCVFun6knYnF/xcr1zx0qn7ri28
         yLUW4343OXQAI+cp0rVzVKeBp1afg13+c7twMBS1KCVpE3VP38aJcN2j/2fhUEVrd+0D
         OTdXgLQluUe8vVC/tC614wD5PfW+eSKTILqs2IfMR7CUdpu3W1+VuX7Ss705bo+xS+PO
         BPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699218069; x=1699822869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHNT0zTQnNcqPPjHsSZJukecZ6cg1UjZ8+XnwMd4fEU=;
        b=FHie2JT08d9gddwYzGjjeBnabTSL5kYx9o0+k7ZDNDLz2Weo17lh1wG0dCAeq3qJEb
         72lZIudLjs97p6itTeBleWTC9DDZkGRRe7AOqr7J+cWvk+B+PlIfWVAw8Uqe0uaN/fNl
         3AqHZ1tQA0ihNCZpvicD9nrYZQNijy0Ozku+76mRCzgwd0M5JkqaaeVmE9+hDmc2LYKW
         iidI9AjpZdoiA8fe9ZDYgYSgB6Qw3rJRfQTnKb3QWMVurTAu4TqHTSr1TBP8lqsnadpa
         P33trtCkICR0xb6JVge41WaqvoszBhGol+Lr+a7iiL9h8g2zDQ/GOdjbv49ytE8IuVM+
         TdiQ==
X-Gm-Message-State: AOJu0YwfmvKMHKsHj6rhtpWCpC0k7icFaYLGnp5QyeLAe/HwP/bYlcR+
	77mcu2ZBuVG0EmI65glWk/z8yg==
X-Google-Smtp-Source: AGHT+IHTe+jz59X3TG5/BvLWO7twuGvFUqyXHcSTGVYZVIJwrYV1Qm7dBjwgblMISH1Ss4fexHRecQ==
X-Received: by 2002:a81:9290:0:b0:5a7:aaac:2bce with SMTP id j138-20020a819290000000b005a7aaac2bcemr9344504ywg.35.1699218068977;
        Sun, 05 Nov 2023 13:01:08 -0800 (PST)
Received: from localhost.localdomain ([2601:580:8201:d0::7d3d])
        by smtp.gmail.com with ESMTPSA id fc10-20020a05690c314a00b005afa4b9b049sm3486658ywb.42.2023.11.05.13.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 13:01:08 -0800 (PST)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	Xinhui.Pan@amd.com,
	christian.koenig@amd.com,
	alexander.deucher@amd.com,
	evan.quan@amd.com,
	Hunter Chasens <hunter.chasens18@ncf.edu>
Subject: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
Date: Sun,  5 Nov 2023 16:00:44 -0500
Message-Id: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolves Sphinx unexpected indentation warning when compiling
documentation (e.g. `make htmldocs`). Replaces tabs with spaces and adds
a literal block to keep vertical formatting of the
example power state list.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 517b9fb4624c..703fe2542258 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
  * the power state and the clock information for those levels. If deep sleep is
  * applied to a clock, the level will be denoted by a special level 'S:'
  * E.g.,
- *	S: 19Mhz *
- *	0: 615Mhz
- *	1: 800Mhz
- *	2: 888Mhz
- *	3: 1000Mhz
+ *
+ * ::
+ *
+ *  S: 19Mhz *
+ *  0: 615Mhz
+ *  1: 800Mhz
+ *  2: 888Mhz
+ *  3: 1000Mhz
  *
  *
  * To manually adjust these states, first select manual using
-- 
2.39.3

