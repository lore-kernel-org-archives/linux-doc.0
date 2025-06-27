Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBC2BF018
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019032; cv=none; b=pvCvYfYHNVxCIM0aHsqoJG95Fcy2frxVo2QiyBiTDSZKyQgB/xP1N9U1k/loRZgHC8iXXxlxPW0DXQQlYfaOKnoUHvbSm1amVkCeYv+RLc51nVHsfxjJkRUxK17lhhxIee5dJKfQrhsx/7v1ZBA7ut0j/O9hOO1s1USKhoE2wCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019032; c=relaxed/simple;
	bh=+x3y1vqW9Z5Car8CAaRNk20tbSowY5YAsoM75/r+qO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3OLXwyZibj+6O9L5P7xUOmFEc866Fj5om6Q0Cs7xlqGKku/p9Sd7QYzcuPvu65fhiymLB8SyqvKGHkL3UjKEraPwCXomD3e7tOdC59YmZ60Q38EfpWt0blp9DBJpp4YVUOJxBaMd/T5gmpVzWSBtp96YvOulIVrjg6dANQPyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bKsSAa+H; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bKsSAa+H"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a52878d37aso249241f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019029; x=1751623829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5atQvWZ5XtF65GtICFYcWzizaeglvYjKjJ357iLMqgU=;
        b=bKsSAa+HtNk1Fy6+0XLGMARaYyOGlRb8lAJbIYRcZyfC1jV5Y5SvH3HjEGOMnkBuW5
         zD5gstFkTWsa42wMr5/m1FsilGDrjLgroyE4N7p18yq+5uYwbiINcQ1gsKWd452NJW58
         R+i8EATQUHIg5ur00+aKLZzWecIWWRQTBoVl3bao0eYWLzb1fZI5ZtRa/OZP7MnpCad9
         MGzT6L8VJLmi+5Iz4d0YhFL2c8/uwOkSCoJBpTyLdSRzWBZMf6xvS0MTrIqFQGtUTQX1
         2tUJhOtAq5fsQQgtpc80waqRoDMsB04DTONVBC4gwa/UNv1Gj355a/Fw/OmJ+dhPrwbj
         VNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019029; x=1751623829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5atQvWZ5XtF65GtICFYcWzizaeglvYjKjJ357iLMqgU=;
        b=V3Qft4gGNdIhAUD4ALa8c5x+E82stwxnIfJsUXnu0z/BhrCatg0vf6d+PMzCYW4/zk
         ThLK1uI2U2V5RM6mvMyduGSK+3pyEFhKaVcu1ZK89sISTCKMnAZ21RmkmMPK62sFC/Lk
         UYCEGtbKn/TSJsxIQzQc0JbhS7frdBwcXg5e3WZnFiP/gOCMTdu3t3ZjP0TTI/yuvv0Z
         uKuBx/KYQQZwO0ydqN4wPw8C84mtWnFe7V+bCDrs2rvWzTBjS/WTUzm2o/JVI8kE7Va6
         IKpeej7yVrGVMGkHsxKZIrd4VZ6qv1k85QInbG7FHXQ+lzgwABNhTwihaf3BtYHN1B1k
         A9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Sd0p7YMbR51YPfGqlYUsfw3GbTH+y5TTW/K4uk2LWZfOjCj3WQ15+G41SFddL/LQg6p0GyceiRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsYHPUn2tZbQFxkRPlK9l8gqznwEoZQ+f2dC7GN4nAms5i8n6
	isgTBlki/wLL6oDeXQio0TGAocKkO+1NMw3dguv2lIyioxNM+qUBhtCrIY5DmmhXi8g=
X-Gm-Gg: ASbGncvnbNTojh1p6DbHHqWWEGjtrQbN9a3sdqIruPQeSkfQpY4jw82pu25xp+8D6fN
	MeJ+XeML4SpnX7Y8i9DBsfHZ8tD1U+8PeylMc287G9C7LsKEXuZiFLGsk2FJVp20pGyjwZiF72D
	ABvnHQTGvuPaCiviEfOz5Zrz+uKaxDYsb3lhoQmI5KW7ZiVgtDgGIr2nB7WChmzGXLrAQ0Repcu
	GPHU7amoEvkocXwieE7M3Ptd4Dt71iUNJObxyq41l3u5GfxHsQvNSxnFEJMiUDCYJhzArpqZyPe
	hQzKxaOOUxjU0p07tK9M3oSN6Jik08V2oGA+G7XYw3SY0osUOCGG0Oyc/FRK6QNiVI4b17Dad3Z
	YH/ZsU+GvQe6xvfHYxVzyojuhimMdkQXFtVqCXRrtzOBHuvRISn6fPUswhK9EEzk=
X-Google-Smtp-Source: AGHT+IGZE2klh6TBPD0rO9TA6JzZZw9l9tj4iEA/pqRFAVww2T2OERx45EFu4KjvgIYNex31bGtc7A==
X-Received: by 2002:adf:b612:0:b0:3a4:dc42:a09e with SMTP id ffacd0b85a97d-3a8fe1dee45mr758781f8f.5.1751019029122;
        Fri, 27 Jun 2025 03:10:29 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad20bsm76001965e9.20.2025.06.27.03.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:28 -0700 (PDT)
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
Subject: [PATCH v2 4/8] docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
Date: Fri, 27 Jun 2025 12:10:11 +0200
Message-ID: <20250627101015.1600042-5-ptesarik@suse.com>
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

Document the dma_pool_zalloc() wrapper.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 Documentation/core-api/mm-api.rst | 2 ++
 include/linux/dmapool.h           | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index af8151db88b28..a61766328ac06 100644
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
index 06c4de602b2f3..c0c7717d3ae7b 100644
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

