Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E42D3EDC
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019042; cv=none; b=VDEyJfc0nUVYzh8mYTm10+YU59t6Iwn4S3o9SyvcNeZIOCxqIQeo3aPb9/7mOHzffUkWX8TNXcGQDcDUVDMMlMdc1raN6zYJwEHvgtl4cJK7PlLiwNOJLxY4u8MvpoOms56otemyaM6fq/1YRhGWHpsT409sqKVDcbV9xTUI1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019042; c=relaxed/simple;
	bh=PY7MCM4FXuwFMl63xmFYQRu/KWGisjazEhN6tbWGbm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyVaG5KruINwL6qCgFYVD5KdPU+SAwvTZm4Lka4xx/EBz1tJxDzbtRB/NK7F8uFsltuGsZvGVqQN4G8aBwV348Si2qwY3BnydrkId34GC4742BE8zlfe4vCc92HUp9CNTJwHPqF3FnsjFTtpaGzXVtBO7g8cxGgJMQAVapNwe+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GTkBwrvX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GTkBwrvX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso2759745e9.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019039; x=1751623839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4D/AiHSkh+69Es8gMfweA+RJzsnoZRpe3Ttw4Zd1mI=;
        b=GTkBwrvXOARO/FKqqBUgWxCtGjIIoFE2vfqAt+pmKhYlk6e0plTyzEqonnPv+yljVC
         lyuTNQhXS/idjKrgB/NqTJ1fEOsDoEicThZdoHtSjDjPTlWX6jzao7iXChqdk2w0R6NE
         n74qxZvqLxB1r4f7U0gx0IN8xKsn/g95Jjx5aX6WUyWsVK7P1wJr4x/HjvRfxMjqaqQb
         We7frVBa213i30v7ArbhI7vC+kjOiSePD2Hg6UipPV8IWA3rvUQShtrWVTMyl/1Aya0j
         n076V/mHVAMnS64LXaG8FvRmzGJGcuyf+LumuZq6skjBhmd0zFKEqZhDi5tBRUjggNrw
         L1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019039; x=1751623839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4D/AiHSkh+69Es8gMfweA+RJzsnoZRpe3Ttw4Zd1mI=;
        b=cgY2oDlYzGUxay8/hRPcU7nX0KdyI08kQ0kbvebg9HQesPlTKDa+WyBpWOT01Ef/9z
         xBZwskI1oMVXw75SVrN2jfvya1ZQXfNhOiIMlddHxSLnLeiuMNJjXKzVg1fGBzubERG8
         f/mG4asAklL76ePD3BPy2iPIFRx7qX8u6Y/0jT3zeYy84pA4Ok7c1HYTevdS2vCZTT95
         p3bYhXVe92m7HYyAe/Ixvs8sHkrdowgfqm5t/Z+Orj2AXhVtkZ0Ao4uaCqZN7+0Nux9q
         cSfMJbO0cSA2k42XVeY0jM3wA3/eOBlPHBumlmxJASPfvwG40+Jkj1vjAtchdgmMdfFB
         3Dsw==
X-Forwarded-Encrypted: i=1; AJvYcCW1cJh4BVPgPblsvgrO27+GLGkF9sB37bFcTxlRBbcZveHVyj4ty28c9FXjE8yPr54HxLWvVaPMUrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrRML1BK4dduf3jBuWoGBj/xo91dH/lZ7KjNwS8sYpk8mTr/1
	DRroKCFOPIWLB9/dCZKvYbRjoxTT8BLTfxmvVNV1Yl8jx9o+fFnun4Oy19RfQHRqfKMg/dQMIPV
	dmBue
X-Gm-Gg: ASbGncsbA+65NcT8L4zrA5LUlc79jZBb/BOodO5wRM9EAVJyhO4lOkPcYCPivoN55Nu
	6ydjsGPtZgF5qrod1CVC27YMbwBqYCI174eeWEJXesrXu4P5YHFoEmQQzM/r54b4UF4c4Ml/FCi
	BQn/pOKNZA6m2f6ZmwZ8poPIpupYjwpbYJmF4GlSWGizgbpTFb1IKvKQBLFjFU4GCtRvY1WuY+O
	3vdzoLU7vo4y+GaPsdP6GIkW3+Njq6nXblcLCLDuTx6ZilDTbplTagYmusZTH3QUyJX6Q86jqyg
	JvcQNT8lhpNnxBVHrR1ul0Fp+w3G2HlHiLPmu7ASVQMNbiTr62NC7gB8svFR21tXZcLAFSjZGzt
	gINML+PS9nGflKc1SaTuZ+03/zzevfnWhWMh0z7PG0ZT9i/a00PWz
X-Google-Smtp-Source: AGHT+IFhGjN5+1VG4TKQb30R0Dc6Kgtf1mHBD0dtlQDL49I+8wxvgFwjsJemxuxfEbYHyeyL9tfPrA==
X-Received: by 2002:a05:600c:a08b:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4538ee7446fmr10977035e9.6.1751019038988;
        Fri, 27 Jun 2025 03:10:38 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538327fed8sm37178605e9.1.2025.06.27.03.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:38 -0700 (PDT)
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
Subject: [PATCH v2 8/8] docs: dma-api: clean up documentation of dma_map_sg()
Date: Fri, 27 Jun 2025 12:10:15 +0200
Message-ID: <20250627101015.1600042-9-ptesarik@suse.com>
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

Describe in one sentence what the function does.

Do not repeat example situations when the returned number is lower than
the number of segments on input.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/dma-api.rst | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index a075550ebbb54..6a57618118fd4 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -322,10 +322,10 @@ action (e.g. reduce current DMA mapping usage or delay and try again later).
 	dma_map_sg(struct device *dev, struct scatterlist *sg,
 		   int nents, enum dma_data_direction direction)
 
-Returns: the number of DMA address segments mapped (this may be shorter
-than <nents> passed in if some elements of the scatter/gather list are
-physically or virtually adjacent and an IOMMU maps them with a single
-entry).
+Maps a scatter/gather list for DMA. Returns the number of DMA address segments
+mapped, which may be smaller than <nents> passed in if several consecutive
+sglist entries are merged (e.g. with an IOMMU, or if some adjacent segments
+just happen to be physically contiguous).
 
 Please note that the sg cannot be mapped again if it has been mapped once.
 The mapping process is allowed to destroy information in the sg.
@@ -349,9 +349,8 @@ With scatterlists, you use the resulting mapping like this::
 where nents is the number of entries in the sglist.
 
 The implementation is free to merge several consecutive sglist entries
-into one (e.g. with an IOMMU, or if several pages just happen to be
-physically contiguous) and returns the actual number of sg entries it
-mapped them to. On failure 0, is returned.
+into one.  The returned number is the actual number of sg entries it
+mapped them to. On failure, 0 is returned.
 
 Then you should loop count times (note: this can be less than nents times)
 and use sg_dma_address() and sg_dma_len() macros where you previously
-- 
2.49.0

