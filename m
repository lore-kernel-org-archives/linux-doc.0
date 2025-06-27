Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8F298CA0
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019024; cv=none; b=cMHKp0KoidIWP8Tp0ziXkfup/m0KUU8CwVdCeqiq4xC9qEgAXk3WzCMwOjGcKib0ZLfddWfm+34zC/WdzpaOCwaBtUvUF5IS6yLUWshJypcYB9hUmk1lSGejmthVHxCdBwkenI1wW+HZWvDD93NVu14UhJ5bWXk1hwk0JRxslGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019024; c=relaxed/simple;
	bh=BUrtkuU0GNtLGvxwO3DTlvmmCqCxudl5NEHe+to6l5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3AWxH31+Gd/36K/I9aGpKeO1yqPzKapmAhf9NQ0mFhWt+GucrkjqyDe/OU+JAuPAqZgP97Mw7xC9hKMYXUa85oxyAqsF9FuWs33dCATkUH1OAFI0ydBKJWRAIdPZEj8LSpAmgrr5lrKOMVLC+TdG+VVDbElESYslIAryyW852w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bmbuBhIu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bmbuBhIu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a577ab8c34so277109f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019021; x=1751623821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3xq9CnnryfUDxSUQF9GpV8PIE+GCE84sbP2gNrPwwc=;
        b=bmbuBhIu5GeV3m0+BYeroVFz+fQcxry1duItb2Wa5M+jWEwpi7eY5xCtQBE7kbIyjg
         SNvKJCcm4qFhPmfD1qTMPBZ4QjGat72dc9EKC5HcKLoPq5+JBvXKXlRl8FjqlEnrIirB
         UO6H3+jhyJp2Fh8twjXbQFOEmQ5tR9yIYYRvPhOffoWEwihLEU+YxfbFJ3XjncqqTdbU
         XVLwnkC3huHKwRQxSRUYzl/M7LIlxrF02nUL79tzn1HXw3tSI4xf2m9npsGGh/WkcvO4
         OhKJvTdcMSQwmCpdhb94QrT3E9kosaMZ2stMkdqpZAcd7s4FQelvhybOiFoLqQBGWZa4
         m36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019021; x=1751623821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3xq9CnnryfUDxSUQF9GpV8PIE+GCE84sbP2gNrPwwc=;
        b=dm5ew7EghcCekv14tjGESFp1ZmXm/5Jtfg0VeRf5ilDwHDZ5aW+gDBVQSr4cLfUf5W
         ORzymLsPlaz3jJhTpnoA3CdvZuu0uKXIjOqCvz6m73EUTgnL9eadmUiCNDkuJgqpMge8
         sxR4t8QmXMyZlkvQ7RTD7z9R4j1KWkL1d6P25OBbCPRMUjUj7U6s9iB7uMMdXR5i7h0T
         3F2YA06GsCZcke6LieFCCK9QGIZP9QokrWfB9zkKFNKpK3cM5Pb2rIgoWG2TTJHT+1I6
         vricy2QajdXZZ7fjxEt5F8MCouAdDegOUvxlJOaL6wt4+X86FXqf15F9lVph6j4eK6tm
         me7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9fKt3LsFgxCJ9G8wGtWj3sYvsYCrx1Nz/d36YPUtejXV5oCcA1EpIWPIm16Bh3k6hDfVAVMHtjgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6yWF6LOrilt3g0Ff1cfBUEieb/MhNeC80opQEWuHdHltWeCi
	xNFWn/ZkOhp60FQVAs/zbfleeTLAeFqSuS0y+c9SGNs5Ay+MeEG3uz4NIEq4OoiJZzE=
X-Gm-Gg: ASbGncvhTq+jPtYmHXwJDuBL8fCCMkMBiH3LNJ/GWCgy7eVG2i3k/Hlbz1eD8G3fqGR
	GsboRBOfyfkLfUJ8v7UbCcBaH/Y4LeWfgQFjuSET4LuVtwHRMSif2WAds0eFFxxnPHi6+O8VG5U
	AuJjOvDet4YcXv6Vl+lkT82/dLiuHT5vOeyg7upytdBoZCa0WX0GjUNYwXdhYpflyzNPmO7Zqvt
	upaoH5BKTS5LY+OAkXmWBd25Tx/rpj40QAdlo1QVlN2+fNnxjsrxATePKsmrey+9iPnLvxm37DZ
	SK5CDmOrArO4RLJMCFb7BohLQNQ3IdUDTxJQfJPysTaIwaWAiDMT/BxH5p2269HV9RJq7HDxAV/
	1hhWrhhQIrhSk2VpGKilsVNVz57vq05BcVd/T6NbyoSttSD5A1GxW
X-Google-Smtp-Source: AGHT+IFl9NeQHOTdy/+Ly2ukX55GHMuwNJpmvj1Ce+Om/UQDamucwxW4fiFQPB/A8qZbOum6aIcqTw==
X-Received: by 2002:a5d:5f53:0:b0:3a3:584b:f5d7 with SMTP id ffacd0b85a97d-3a90c551c42mr942241f8f.5.1751019020637;
        Fri, 27 Jun 2025 03:10:20 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52ca4sm2286180f8f.58.2025.06.27.03.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:20 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 1/8] docs: dma-api: use "DMA API" consistently throughout the document
Date: Fri, 27 Jun 2025 12:10:08 +0200
Message-ID: <20250627101015.1600042-2-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627101015.1600042-1-ptesarik@suse.com>
References: <20250627101015.1600042-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that all occurrences are spelled "DMA API" (all uppercase, no
hyphen, no underscore).

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/core-api/dma-api.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 2ad08517e626e..97f42c15f5e43 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -13,10 +13,10 @@ machines.  Unless you know that your driver absolutely has to support
 non-consistent platforms (this is usually only legacy platforms) you
 should only use the API described in part I.
 
-Part I - dma_API
+Part I - DMA API
 ----------------
 
-To get the dma_API, you must #include <linux/dma-mapping.h>.  This
+To get the DMA API, you must #include <linux/dma-mapping.h>.  This
 provides dma_addr_t and the interfaces described below.
 
 A dma_addr_t can hold any valid DMA address for the platform.  It can be
@@ -76,7 +76,7 @@ may only be called with IRQs enabled.
 Part Ib - Using small DMA-coherent buffers
 ------------------------------------------
 
-To get this part of the dma_API, you must #include <linux/dmapool.h>
+To get this part of the DMA API, you must #include <linux/dmapool.h>
 
 Many drivers need lots of small DMA-coherent memory regions for DMA
 descriptors or I/O buffers.  Rather than allocating in units of a page
@@ -247,7 +247,7 @@ Maps a piece of processor virtual memory so it can be accessed by the
 device and returns the DMA address of the memory.
 
 The direction for both APIs may be converted freely by casting.
-However the dma_API uses a strongly typed enumerator for its
+However the DMA API uses a strongly typed enumerator for its
 direction:
 
 ======================= =============================================
@@ -775,19 +775,19 @@ memory or doing partial flushes.
 	of two for easy alignment.
 
 
-Part III - Debug drivers use of the DMA-API
+Part III - Debug drivers use of the DMA API
 -------------------------------------------
 
-The DMA-API as described above has some constraints. DMA addresses must be
+The DMA API as described above has some constraints. DMA addresses must be
 released with the corresponding function with the same size for example. With
 the advent of hardware IOMMUs it becomes more and more important that drivers
 do not violate those constraints. In the worst case such a violation can
 result in data corruption up to destroyed filesystems.
 
-To debug drivers and find bugs in the usage of the DMA-API checking code can
+To debug drivers and find bugs in the usage of the DMA API checking code can
 be compiled into the kernel which will tell the developer about those
 violations. If your architecture supports it you can select the "Enable
-debugging of DMA-API usage" option in your kernel configuration. Enabling this
+debugging of DMA API usage" option in your kernel configuration. Enabling this
 option has a performance impact. Do not enable it in production kernels.
 
 If you boot the resulting kernel will contain code which does some bookkeeping
@@ -826,7 +826,7 @@ example warning message may look like this::
 	<EOI> <4>---[ end trace f6435a98e2a38c0e ]---
 
 The driver developer can find the driver and the device including a stacktrace
-of the DMA-API call which caused this warning.
+of the DMA API call which caused this warning.
 
 Per default only the first error will result in a warning message. All other
 errors will only silently counted. This limitation exist to prevent the code
@@ -834,7 +834,7 @@ from flooding your kernel log. To support debugging a device driver this can
 be disabled via debugfs. See the debugfs interface documentation below for
 details.
 
-The debugfs directory for the DMA-API debugging code is called dma-api/. In
+The debugfs directory for the DMA API debugging code is called dma-api/. In
 this directory the following files can currently be found:
 
 =============================== ===============================================
@@ -882,7 +882,7 @@ dma-api/driver_filter		You can write a name of a driver into this file
 
 If you have this code compiled into your kernel it will be enabled by default.
 If you want to boot without the bookkeeping anyway you can provide
-'dma_debug=off' as a boot parameter. This will disable DMA-API debugging.
+'dma_debug=off' as a boot parameter. This will disable DMA API debugging.
 Notice that you can not enable it again at runtime. You have to reboot to do
 so.
 
-- 
2.49.0

