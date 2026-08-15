Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F9D27467F
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786770515; cv=none; b=pkhn5AfS7Pr4n/EDhStTckT11BNBWUZZyU+sxqrdWCn2mB1Y2mYB3+Dys/YLz7TiebqN5tSbCHVeMjXpU0uIF5UFltr0ALa0AaK57uD2+XiooivL3bl9VUK5fZ6NxTqYR7XDNN6NBGh+gE8i6OQopW704IFvpRiYJrnbBB0l/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786770515; c=relaxed/simple;
	bh=RNy0Oc1b5YVJpZS5AO65ioCXwPG1K+v8mTvUlX+rTyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzgDOvAu+0aRQWoTp51ItWGpcklNYr7OEzqEmqFLTwDevEVOlqG8YfYL6U8yuJZqP8IH1QnVJm5MgaRKZmsxFdEiVlaTfZVZ8OfBw331aCZef2gFKdYcavHrAO3usZ5TzoA6ow78LbYfqfuTjDcA0TBbm/x3EE07NocvvsSC34o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsRDisr7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsRDisr7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b01910b499so1530153e87.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 22:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786770512; x=1787375312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=BsRDisr7X573Z13shKNL3Hmc0qYzP/gS8Zc+twBo+D/giYqckTW9MXO/HwC687ObKK
         6pLdIrVWtJNZLSOPXjzo/m+VudFPyrShUVwdryeLkJAfxqMgG1zH4oHWqYndGXOhVKsC
         y+BANMkCZq9kdLt32cyEOEiqk8ZTFlQUuQ4m9TQygZAfmVXHOtmTz8ob9z5JIXro7725
         kOe+Tmbu7tqRt8govU/axrum+4bd7M3uddC/FbGBUTdqzJrDLH8FaYI6ZWkJ5TmTo3Tm
         Lx23lDSv3JkYGtg4e1/j/+0kmACub49Hd4C21r1Fzlf3BW6g2MQDpoenE+AH1boAk6Zc
         E8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786770512; x=1787375312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgkFZajAQJmzi//1l9aIpRfIFvgCaKKT8i3Z0CDYaWs=;
        b=Yegey/u6t/fzterer/5BSg75eTI9OzqK1gd/fAtxWwlGbPGslSzpI79gNvja813xJS
         EBHvokCF6bGmn0goG8BrQXlEIj2bcZ+ey4R3nI/hjiMXufGJfjEEpJyjDlPceHIn4QDP
         YoLYA7HugKAnxCQqA/wUYATo3n1qElJ+KqoV6okQnSkBsI8cmtUBPotdbHf87qup1ctr
         2NLwGT9m5MPbwJBoLSnrYpDKPxYOevI8QecLOuusAuphua7jcz5739Z0PZ11yjfjlgCZ
         JmcNt/LtAZx7qv0eTZHWC3CoMbS6F99jCcpNIQ3EkDyMm5NdjHlu4FT3ocFsJDz2Q1D9
         H24g==
X-Forwarded-Encrypted: i=1; AHgh+RqccxyIr/f9OV+4WrpLEa1vTla8orJ95Moa6p7FI2UlPQ1aYQSiW+09CAZLKtGxm1nfk4ZynpJb/0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZx7yKex/gCBx/xa7s0iqIIZh5q0LQPb8wIybxmof4mHesliON
	IwdBUDf6xSi6r5otggXCcqXuoZNvvd2ZZjMsPOTMjkZ2Kj36eqqwk+G5zJPyao24Av5T6w==
X-Gm-Gg: AR+sD11s8jYkXH0kB1QIhAZOkMUDx2x77o/bwoWuDklhqPcB19g9k34/TIB6oWUI0xD
	c9U/9ZC9LMMsnNIi/mz3kFq65oFU6Vtb4/bwLDV0ARUMkDVXfcFqvRrogoRdJdabw/+yJXWTWTI
	BzTiW+g1vJaF2JDuyY9SoWtddm3plVsNGQtFoeaVYM8QP9+0WmocYaIa9lSyYbN2Q2NuQloP/ro
	v3lSQyUvNg2gJgRM8aw082oQVo697KDNzaYLNuzyY15mQzwFsFocZI7cBSBOU+2XIn0eTaVNkWR
	OxY0HHEL5TVq1hF3ZM+WKAyTQFXOMWRVbTT8vDIGYw1dYwV9KTX7YnAIwpkU7U01Fa+1crdHtCa
	SsJZZAmSeXN5tPdM8P4FXHuIHgjBDfxzwvzaIHO+7ODydhD30dJb9aKGTYy1Onrypyl93vnSCjk
	JWsMCYOhvPkXcII+Uyp6lmRJHbvTQuxAnMOKSpjFv+CSvObUv/FiIJqnhBnbdYM50zyio=
X-Received: by 2002:a05:6512:150e:20b0:5ad:68aa:8a78 with SMTP id 2adb3069b0e04-5b453b9adeemr2672003e87.5.1786770511539;
        Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9a7sm932354e87.13.2026.08.14.22.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v2 2/2] Documentation: nova: remove completed GSP log buffer task
Date: Sat, 15 Aug 2026 12:08:26 +0700
Message-ID: <20260815050826.306717-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815050826.306717-1-vladazaharova2018@gmail.com>
References: <20260815050826.306717-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..cae0578d32f1 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.55.0

