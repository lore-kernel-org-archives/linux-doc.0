Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716D52C08C8
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772373; cv=none; b=MZ1PrJ5XRL7t2RD9kZqXDTMY2E22ybS3ssbWiAVx7Y7xHsQ7svhcBMhduE6ZmY0kABWeWOhq20l5zCKOxHbhpmfkyvRBGauKBUMfESEMwXgu+0WwTlWw2nCbHIL9EfZdrkUVd208pAbnuUpes4NJD3ItAuep8unjwL9TrtSXCU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772373; c=relaxed/simple;
	bh=A6LKHXBUG4iUTzGnKK5661G16ikKPC/56/HUtV07NJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7YVzcTxvPyoMc5gPh8ijX1S3NL/H6JiX7s6bMeXKmlLSwzEF/lcw61L3O3jPUpBPNUzOQ4H+sTK0rtrhs9lo9m7z7q+ChY9F4M2lr4hKPdo6ool+A9X77YGI7SYh7oujKexg3n7bHwK98mIPTnF/lYGi50eslELwnnH5IVjaGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FRHzr7Du; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FRHzr7Du"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4eb4acf29so332656f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772370; x=1751377170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8OYkNwJziYcgoiRcCAHS+W9j9ESRdVu8lYPwRcMBHY=;
        b=FRHzr7DuAjoRUeQd9yt5fimv/BBC54RLBV9boEgV+68y7uaZjiiXy2ioPwOmXcHfHu
         iTX0LzwpY+157yynfG7qTV3rPUup0gXBjNot9+6lc57/tJ02hFZoYDKMst2ByG0pYHrk
         vB9eUX62ouS1sNms8PJ6S3JMZXq18a+aE7IlJ5HbOeI/rTSTpXVL2Yny9XuEMKyQvXU2
         jobFpZcer2CMqemG3eNXseGV8NBgnRaDdzeDx9DW54GXC30kLNb1Z6BfNCgUizFIZB8a
         +MEHG/D4PUoU4cSzy40/aiz6qDq9RCyVmAOtDVf1GWSKsdFGfTHAJnQ2Cv9+nwiL1taI
         evDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772370; x=1751377170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8OYkNwJziYcgoiRcCAHS+W9j9ESRdVu8lYPwRcMBHY=;
        b=E4zxfjCL6CRQ1l8ARgN1SigvYf+g048lcOA+t1NuFXHjYhBJFIgll1iUKgPawhYVyy
         hvjkuFbP9roQKuhu3HTyyR9Onqf32+SxIBLZf1vFeHNzuD01otEKjNSllF3kEeJeDxYl
         L2JTrFx6fitFhNVkTUOUFjGVsifUovpf6kMjwi9PfUI02jHglFq1WbtPczxtlvxlxj2K
         iTgU3XXkPiVJT8yYvhulhd5Ee8xLsJ6hw1GnTMutS8bgDq5g8tHm/maD2alFPr4BWPfl
         oiy/RKb5GfUOCEN1EYdX8MCArwmYJwDynmrYKML5SLH1E+81tfYs8fsT87l32/s17YY4
         8BXw==
X-Forwarded-Encrypted: i=1; AJvYcCUs5Xz0bXXI+IKn5PEDs26lowSasY5rB6nxtmpec7GGxkEh1Vpj1CdjfFueQWoTjZD6+dzNEWAde8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWN6/lfgb/G2sdUxuhgc4GdYCNJFT9RuvZFUNLD4sDtVscSSev
	Ir+8/96y09F/6JrtoEK+WnPhocLKqavPLVTa4BPEILK80CPg0ZVCev1+JmAqTya4eq4=
X-Gm-Gg: ASbGncuAgibQnx/3uDWPAkMM0bPABys9CaGmViJIXGv/ju7CO7/qhd38RKB4/6oqDsy
	uhG3wMhX2G5Irv1YWPvkgWqn4YjXRaqs9fV0TTa5m3FjyB4WQNR738wmWt3YTHF8gbD9ldISbI+
	i0pKoaAA0eCigu8dVc9IbB6KSgPd3lrXfNpu4XhWVgmfRZGNVwbejG6g6PdmNxUlt7Do1wdk9i3
	1E6Yu8/5Eb3Izls9LBVX+tZG8b79oMbz13WmmHbdzQpjYxJNcTXkNNdh5yvi4oObKgEGZVRQWY1
	FARhNQnMt4WrKzKfIInN4l+ZVo234Rovq9pjNCVSzA4guYL9DfybUeXOu3ug3zCXr5s3BAksLOI
	XSdlxrNDGuIAC2EXtKhplZ/tijfMQ0Yaw5IlAoWcrlNF3YonAGiRQ
X-Google-Smtp-Source: AGHT+IEIwFSHwaoj31PtLeuWDl43hdEdyv9aVZ6WqShd2YpoPc0pFXp6GwtI5lbLwyI31derXkrYlg==
X-Received: by 2002:a5d:5f4b:0:b0:3a4:da29:d13f with SMTP id ffacd0b85a97d-3a6d12e1dc6mr5124726f8f.3.1750772369659;
        Tue, 24 Jun 2025 06:39:29 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e805d5f4sm1928629f8f.27.2025.06.24.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:29 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 1/8] docs: dma-api: use "DMA API" consistently throughout the document
Date: Tue, 24 Jun 2025 15:39:16 +0200
Message-ID: <20250624133923.1140421-2-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624133923.1140421-1-ptesarik@suse.com>
References: <20250624133923.1140421-1-ptesarik@suse.com>
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
---
 Documentation/core-api/dma-api.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 2ad08517e626..97f42c15f5e4 100644
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

