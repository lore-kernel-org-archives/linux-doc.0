Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D42264BA
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759732275; cv=none; b=GZ1i8KzyBygHBQ2Q6rmgKSBuR9VfCAt5Rp4FhgXzMtw97eo/3kX1g5qS4mwop7n3tC/+34hO+0OsSeERAfSjOgYzJKVDLRJK15Sdta9+yGfL/id5msaylZgsTwVsWZNa9x1Hq2xgC4KU0j5dd+G5INTcTVKVlqzFTn50AXrhofE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759732275; c=relaxed/simple;
	bh=H3X73yEWW5xnMRSc/VOILo4P2AJ07gDRT0jl3xbbPJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiYo0iBq3xZgTFDHFafOZJW9w4tJ5XFnkYqkp7HZX9M/xI23yib8wNu64xCEeCZVJxzCKz33xcF/zwlyF6h4JV69XLqzFlfcy6Andt7NqcT41R7RmkhAqZBSVzGexsn5iSc8zJ/cO1mHY3sgCbx/pZs+AwX7ggywi9Cb9H1R1Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTp9J3PJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTp9J3PJ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2698384978dso32060575ad.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759732273; x=1760337073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAl5ud0fiOLEIeLKR9WAaQrnRBmvWYDt4oevdTsfy9Y=;
        b=NTp9J3PJX4R5/e9GEJZPd/WZdXgnME11ExEEwiGH/NqB353SnZvHlLXrwoQw6oO2vw
         yylCHLzPd+PyTVqUoykpbfXi90Ht+QeHPF/Tp0AEff4subWBuvi8EAZXVwRGXFec37XB
         gMXOPBZApayFUfDM4sp0Z4RiPm2nSQrTdAHpDqcdj0oTUOTJxCYjNUy2uMtunKl21ruL
         YeL9Cn4U/IcSS4z6P3TC3Tv8MEgGwI+wfCZKuJW/2o7fUK32j4pfDIPZAEWw/ES2CEDY
         2zHGLyYfpPPc5GZj2o3D/8mej42pgNq01239g5PmMW93xOx0F3cc6lUqVpoZyM5DnsyH
         9DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759732273; x=1760337073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAl5ud0fiOLEIeLKR9WAaQrnRBmvWYDt4oevdTsfy9Y=;
        b=SPyAbZLz5KPrB8JcmGbr2RRKq9tvZllg3fvoVHMlmXGdw2zbBRZXFmxfijM+sQfM7y
         FBwX3O8Q194VYCzRhABN3rYWGjE2n1TMS1vOXOHBjbVONXrebC1XoNSAZcq2Vi/tjbg4
         7wmiAzmHUvuHMFigkG/ylHMnOUjfwtdfgi8EfQDZmAPesFiqFMcQuakbilQXRsPbMBdb
         WA4aEuHwVxOrFxVH8Pe6gt6Yj9m/WHGxVBd8f7uvGSjOG+tczA2OjGWGjyUpvDsmB8TP
         qNPfv33dg7NM6NzOBuqgGY40LRYeP3W7XVteKiaBLrQdeK9edIvAleR6/XFJPaVOgGz1
         cr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrLsGFsbW3nHOHYio2Dbu07N8NkwocWlTArrfWxm8GvHQ5I8AfCgkFBw6+PlVkGJLrYgRZq6SJ7tk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaO1UcyL2tx0uGfeiuGP+U8eafiIBP8PrR2M+V4MtPP7g5I7v1
	9NH2O5tzHxfpSmH2RzPkuWU+c3Z1edj/0ABBr+dxa9txMm7hBgpsFNRx
X-Gm-Gg: ASbGncuJ+wyLG0LsRc/6L3nz1y8eirNDXqYMok2f2qquCalC3wHD0fb1mtWl5XYT2UD
	HQxVWtMhGN6TDUjV8fxZihkRE0zcTCAkdC/y9QIobaw+QV1JHbM21BmsYBHxUjzbAaVl7VJRfTN
	xZwT7BQxDdRMeSmJiS1hSKI/ZqNGvt+NzAQXXyDFMOK7iRvgVYo4U+DgUwfx9YQhast5SDKxNqy
	kiE449AauUqauqMjgT4qcL33pdgd7T09P9b4wqmQ/zO327yzf6jDsf/x/c0uQKdi8MkSVQ+30W2
	LDiU7zaAhlZh9Z9h8qr90D4/Kk00Ch4kZa5C2CWPnpDpMrvjWk9jwgwhEMXNXy2BG0kZHb0gqoS
	FQJrNtmzIawg81KAxhgeDhDksloc2S5x/6qZyzCEonOPilOI2FItzNKi8oNai+ugNgw==
X-Google-Smtp-Source: AGHT+IGMU7hrj7U1FkXheOsivtz2T+wK280erwvJlu/0py0PentU5hAcc1tVeLRVpzJrKs2Jah4LwA==
X-Received: by 2002:a17:902:c94a:b0:267:776b:a315 with SMTP id d9443c01a7336-28e9a61a914mr137570535ad.32.1759732272761;
        Sun, 05 Oct 2025 23:31:12 -0700 (PDT)
Received: from LilGuy ([2409:40c2:504c:58f0:9c58:4a8b:65a6:88b4])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-28e8d1ba184sm121008085ad.89.2025.10.05.23.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 23:31:12 -0700 (PDT)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] Documentation/gpu: Remove duplicate kernel-doc exports in drm-uapi.rst
Date: Mon,  6 Oct 2025 12:00:09 +0000
Message-ID: <20251006120010.17976-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate redundant `:export:` kernel-doc directive in
Documentation/gpu/drm-uapi.rst to fix duplicate C declaration warnings
during Sphinx builds.

warning before this patch:

  WARNING: Duplicate C declaration, also defined at gpu/drm-kms:35
  Declaration is '.. c:function:: const struct drm_format_info *
  drm_format_info (u32 format)'. [duplicate_declaration.c]

The removed export was already documented elsewhere, so this patch
does not remove any meaningful documentation. Post-change, both
`make htmldocs` and targeted builds with `make htmldocs
SPHINXDIRS=Documentation/gpu`

complete cleanly without warnings.

Based on commit 47a8d4b89844

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..80cfd9b7c908 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -604,9 +604,6 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
-   :export:
-
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
 
@@ -761,4 +758,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
-- 
2.51.0

