Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3564B2C375A
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 13:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772378; cv=none; b=AdPjR/cMDu8MHzlak4eetKm6o0h0AfJ4NYieXYYnNPzwiB5wi/Xz2CwzxdcHN7fB6KWP+DKfPsc+TArcIfdCLIhv9p9yseCKj22CYeqSuTB+vRgl42QnfdMJbDCZSiz6zZ7fWntc0B3NiiULbFZuctKgT5ARMUqjVR7oMu7I14k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772378; c=relaxed/simple;
	bh=VXYHGpM05rGE//h/apw7eqoewOcMeRXmxyRdC/GTHL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQnMue8a/8YAnmYVWKGuDDWTMoJ0qWMBGhhNsdCRIEdHrBAmcdXsRxi15an8i3tqGrK3roxyx/GR3hssn38BI+9h9Wd9u7Xykwwf8fIKtCvmvqn1s1yOljc4fDA+6IkA3zJ3w43Kfy65zmoLUXvXeWHdXDLZVHTcdh97VYqlDhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XS8120qE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XS8120qE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45362642f3bso6931855e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772373; x=1751377173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeJkbEKgM0HHbkRMH9B3w8A15xaUkHynZ4iVjI/7IZk=;
        b=XS8120qE/rfT4p73GPsmp98ILIOvAvl7fs27jSl/BWMt+3E/RflmdI/eP2+TihBq+e
         GGPnwTZmlpYs3HQsXp0UkXLzCQpg/kx0p7U0HUaMhyUly8xDTXiVgBTl/HFey1Up5QCD
         eTpx71aBFZP44DeZC+WiQAnvbtbNyczm1uvZfn/wbFkJlNhrpnS+RXxvtuZddohCum6g
         UdyukphSlzCH4IOUxk4/SN+Hs7bUV5+AsTt9o+7i/mU+AtHjEjBktZkP6E437hUUP6yy
         SpiCLdCVnKZnfMn8M/T0Kt9XYwZtUdoQTfZQ5F7OvC6ZWwqYX+wDOahw+bd7+vcSRPpC
         Hkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772373; x=1751377173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeJkbEKgM0HHbkRMH9B3w8A15xaUkHynZ4iVjI/7IZk=;
        b=uw8YUjVE8Rk6zIh69de2taDyFj6f6C7qX9swIXNQdbgryq6YpiJ3G3gNgs1qxaCuIM
         qx3ObQoQnajoG+Bs2dxkyLyNkY9AZ/zYDpo7py1d8nWTgV6YrQFNmMYqo3iOZhzJXy4J
         aWZJ0HHqdohplCBJvLI+9BlVP7fUVtMG6+spxq+lXGgSm1VkvePOu+OXsaFi1MB5eKMb
         egER2T6kPtv81x4SNK1lzYWKUNFrrPsP9cow5w8ASAyai8+hMurSSkdCCH5a58QXdn1F
         wgThg2ZzUuhjsHedEGnqGCLgr2TOEkHN73izRTwE2s4MEZ4JAF3KJJK1RYEYuBokktJw
         /0yA==
X-Forwarded-Encrypted: i=1; AJvYcCW17RtZfEBGz4QPLUTIUT2kUPM5dsYsAsd8JjS622PEKf2udzRmXHobZ6VE75GSy/ZdDQXqwLvnZac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo8fyVGClPk2i3hzCKtmEe5Ku8Ku35DZBC3mKeOzrjcOwWNFgI
	O6YTxzSr1V7LJi+x0zIpDBYyfUDIVMLaK85RjQsMkWlIuU0/MYRhH4wNzUD5i3fX9Mg=
X-Gm-Gg: ASbGncsFyp4vruzo5rQ6kM4ypLUcA3orRpt434Xkcznc5FqoJgZfKYCBBxXPZMemRAx
	nHjhQ4Fh/HLxgM2PABwg73XBVsf7LU7TDOLGDzd5P0qsA24cVF223vFRPf8mUT44RJttse2Kziy
	0uZQQhlSeFU2QRK2rOlNu4I+5+p2sPhBBfWGfWvHAB3Wa9rPrC/YyY7ldiTEer1awRFxouNra0i
	8McNaNkQ0cr8zeyInMf97vRsm7Oj/j6jl3XnJg7Mql40fdoUccQb39qePKxrJJqm2c1ankIhYyS
	vpabJhrAXqsCoN9k0t2N7jsfqFAJPlq8Ay51PuhNg4YvswaTm2nyLPjsgQaYRTfLQ+c+tHEZBAv
	EpN6WPiJDd8RcQzVj8T68+huT3HOTNcp6hCx5wW2HGyaCf1FGceEf
X-Google-Smtp-Source: AGHT+IGHQNhqIB3JgmwwepWbvWA2111RF5PUV4yxQGXON8tqDIklGy8e/Cjdf3HtwXlEs0xEqbFKrw==
X-Received: by 2002:a05:6000:430e:b0:3a6:d403:6429 with SMTP id ffacd0b85a97d-3a6d4036867mr5219824f8f.4.1750772373456;
        Tue, 24 Jun 2025 06:39:33 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453646d1391sm143209275e9.9.2025.06.24.06.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:32 -0700 (PDT)
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
Subject: [PATCH 4/8] docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
Date: Tue, 24 Jun 2025 15:39:19 +0200
Message-ID: <20250624133923.1140421-5-ptesarik@suse.com>
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

Document the dma_pool_zalloc() wrapper.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/mm-api.rst | 2 ++
 include/linux/dmapool.h           | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index af8151db88b2..a61766328ac0 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -97,6 +97,8 @@ DMA pools
 .. kernel-doc:: mm/dmapool.c
    :export:
 
+.. kernel-doc:: include/linux/dmapool.h
+
 More Memory Management Functions
 ================================
 
diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index 06c4de602b2f..c0c7717d3ae7 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -60,6 +60,14 @@ static inline struct dma_pool *dma_pool_create(const char *name,
 				    NUMA_NO_NODE);
 }
 
+/**
+ * dma_pool_zalloc - Get a zero-initialized block of DMA coherent memory.
+ * @pool: dma pool that will produce the block
+ * @mem_flags: GFP_* bitmask
+ * @handle: pointer to dma address of block
+ *
+ * Same as @dma_pool_alloc, but the returned memory is zeroed.
+ */
 static inline void *dma_pool_zalloc(struct dma_pool *pool, gfp_t mem_flags,
 				    dma_addr_t *handle)
 {
-- 
2.49.0

