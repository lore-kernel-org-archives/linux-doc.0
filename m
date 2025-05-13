Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4853823C8A3
	for <linux-doc@vger.kernel.org>; Tue, 13 May 2025 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134622; cv=none; b=Ow8G2/k3r2jkPaXCHxmcM/JSYhxua3guUgshxH1AxdbV2ujOWcEVFoebtxEEtF3wK3/WUQ1+jztuQRvMuMO3i0u2/I9vw0Ie5ka0fB1sC53DVcc86VDMvDxDezLq9YCxHanatezkknzu/cDf818nxaQdnmVnxi9quLTg47te0zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134622; c=relaxed/simple;
	bh=vJ+aZs4J3I4B+KmzowPhOdBXKYIgIVVzFxRxaKSvLzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQvRQoINbgDWfUkERQu9ye2SSb/4tNVycOxXo+Mf+68QKoeakBHcnNkwC+XH5QHcCW+NVs0sekO1rUs02mbkLN+pUHC/Jg/iZMMV4nfkxXvfUiTjW4md5EXAVCC1z/J6s15S9F+cxiCl++QbSPkJIH42v1TI8H33Gz1i/rx5i/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=feOfwgzT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="feOfwgzT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf257158fso37641465e9.2
        for <linux-doc@vger.kernel.org>; Tue, 13 May 2025 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747134616; x=1747739416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xW5d22AyfE5WGuuD+WsgObkxfatUVH6GU6OG+OuxcAI=;
        b=feOfwgzTJUIcVXscQynE6z5Jm9pi+Lsjg1PsO/MN+5UlVz/XG5zdnQGjTYMqx8VKbz
         KK4Z0nmyUDYADLCC8fnbz8Qpqhavmeexhx6Qw2if+JgxVMMbUCBd00CEKSbBs5SfXSt1
         qD9T8I7wRw7DRXHYreEVlATugJzc/OHEnj+ssWuwWxtQn+LC2w32pGydxrZVXU2PWJjO
         U3KSl0MMiB6Uvvre4V30L5xEXG48BkoefApdmz0tVKWLPiws8xOLZYnGh1K2JqN4lRj8
         /bfCwQ8QsxpYG1sxStxAt6/fGS+YxOVirWNXGHyHK4MW9YdMTY9zT3ZpAipciaAkk+mC
         OfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134616; x=1747739416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xW5d22AyfE5WGuuD+WsgObkxfatUVH6GU6OG+OuxcAI=;
        b=eA3J1hoC8UpjzOcGvkUSuTt+Y1ByKTI/bQn9MWU+Oi0VThXU4IL4ykhOuM03vqHbGp
         GVldJuO4tt8hujeKlEPu/NkL3ToJT9SZzSce/JePsd0rui71bTMashPgrOP2MvUr5hUQ
         kiwNNerjHhLKuNwTOv77Y/u8vhG8IH08kGu9jvBLPIby0k1wGq7JwMspsAUivuAaMxlr
         CbpIZEAQ65cnqoK+ecpj8NNM4PXhbE0f/8FNFTME/3SxMy1wekezm/lXfmC6k6A3XiZG
         kEJY45oENAafzTlPlDoMzvKxjI12S1zAKsUV1Bo+o0Z1eeUzUDTa4tg3eoUusvusZDW5
         JRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzUZzIZLq/zlggTLD81J6mj+b4m9mdev4Ir4aCoHEsLI4odzrCDl0HxKLsK77fF1qbgyjOIqAYeXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkALY0T4siB/Pxw4GipmBhthQW66rsY284KjfWzrCNTDqqSWrY
	FiqClu9SZuhSsMzWxvYBTikNYx/aj0Y+EAKTS7Sh2lYq4zEhv85LYy6pmVwAZOw=
X-Gm-Gg: ASbGnctGTNoI+f6TvpwgHdUpEQYoaTHiPNkVK+kYVeuaUwXAdE8GEE9KNhSXiCPxwXn
	OoljJ+PSnrbFYUEJqfRFBwcQYCB1Lul0rql2zjWMoIgkyuRI051dWauyIw27kIILqaoenF/6rBR
	vBpcDZLGlLA2AsfNRdRyA9umyDwWeTj1zCU6biO8OsZICVMafidlYA4szr8gwLlPwn5M6ZB5UoF
	0RhuGe2u12KaYfNqOzgDjd6wkzuIsmyyLS9KMIdI4IVGoBtbSlaWzTfYPEk6sphiZHACDVhdYcD
	eeVwa67ZiH4TOKC8sQ8sx3DvQgagUCrBu8dU2c5IprlWaFWyzb8F1WdR/kz6j6+jMaoPq9cvLPW
	sBQd1O5JvXxg=
X-Google-Smtp-Source: AGHT+IFuIhHmYNLqyH+zu54PArNHeQDifEpT6IgxsW2fAt6qVuFPJEi1RiNOKS9sGvGl0NdPBZRNRQ==
X-Received: by 2002:a05:6000:200d:b0:3a0:6f92:ef7c with SMTP id ffacd0b85a97d-3a1f64314c7mr13612076f8f.17.1747134616347;
        Tue, 13 May 2025 04:10:16 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:849e:fc74:c88b:cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm16077941f8f.63.2025.05.13.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:10:15 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: corbet@lwn.net,
	suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	skhan@linuxfoundation.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] docs: fix "incase" typo in coresight/panic.rst
Date: Tue, 13 May 2025 13:09:31 +0200
Message-ID: <20250513110931.15072-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a spelling mistake in Documentation/trace/coresight/panic.rst
where "incase" was used instead of "in case".

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 Documentation/trace/coresight/panic.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/panic.rst b/Documentation/trace/coresight/panic.rst
index a58aa914c241..6e4bde953cae 100644
--- a/Documentation/trace/coresight/panic.rst
+++ b/Documentation/trace/coresight/panic.rst
@@ -67,8 +67,8 @@ Trace data captured at the time of panic, can be read from rebooted kernel
 or from crashdump kernel using a special device file /dev/crash_tmc_xxx.
 This device file is created only when there is a valid crashdata available.
 
-General flow of trace capture and decode incase of kernel panic
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+General flow of trace capture and decode in case of kernel panic
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1. Enable source and sink on all the cores using the sysfs interface.
    ETR sinks should have trace buffers allocated from reserved memory,
    by selecting "resrv" buffer mode from sysfs.
-- 
2.43.0

