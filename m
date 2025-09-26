Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A679136658
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846576; cv=none; b=d+4B0DWUCuIEhfF95Dfz9lv2iQcuT1e4v3lzLdI66Jo8zB03+gJdgVJDwwXncyQLFJo1oAarYKe1VJpu8JLXrI4ifdFF8Xi6A1WXWJ1EnB5y0jeQ6xmjBtUS3lfuMQczD6QVBqavZiDSHxu4CwgS6p0VwAgFUP8esjboqr2B9ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846576; c=relaxed/simple;
	bh=vIAY62bPonaFy7vGVNyvqO/mtaIvl07zVQLoOf2yQSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3vqaBfOASTAN/TxL9Kcra9C6+Kvrl9NrZKZ1gjDDWQlfqYljg48qGabw8Rwx/y1z1iwbReOkKHBd7tz5yuVdDA2wTBVckS9p3qXL1jbwbyMMGr3i2O2Vb7W77sJYWKW6fPm8/WxgBu5As2vHYU/ROkHszjf6Ud1UbIVeruXXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVhoifj2; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVhoifj2"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-330469eb750so1786601a91.2
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846575; x=1759451375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5+CvxTz0as+KK3qYoCdGCPxNBywOK1cIFwpk87cxKA=;
        b=BVhoifj2QvJEPBhUBsx+Z/o3VunIVABUfPNrHrFKDlFoLc6El5GjeeLWu75NgtOdhP
         FdlRRmBGPnDDFlSTJep2+2lp42UF24GPmp4qjD9j1LUwF3+NxHq8qEPkdmczwxblupvp
         weDbeymXApAW2snpoYCwtQv/h10r0aledVY/tRGZX5u/DOHUvYPGaE3NnFplZ9kUnJWV
         Hj3L8zNuFsYvCc93/wAbv/rGgGzJiDIitzQLQ0Obg3R0fTGU7zohowhw5PUxd2v6aTtV
         aA4Gs0DbD6EY412y+71v0ADSttQqq+4engj7a/79jit7YKZzAKKaR2JJTwKNqFCrTIxW
         bVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846575; x=1759451375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5+CvxTz0as+KK3qYoCdGCPxNBywOK1cIFwpk87cxKA=;
        b=AmgRvctTHKiqGpo0Ff9oqHWx5EOG2yd2lgA8lHiki7VomuhZ6hwMj3k1SBRfPmr1Tu
         I533Ys2Vzk/zoNcc4DiKkKAz9w6bKDA67TQYl5msk9cHCoqg2HE59RRGivfuTZoBkgH4
         +05xGEUmw6aNPDjnDd4dFnuPLy2RtGt2sLszb+qPioA7bibs1+wjslGI0vniWkwp4RMa
         XrSuy3FnsFD0cazphbpwtffWhXFsSts1ST4BEklnP8L/LrfdjlKfLTslEK4CrFiPrQan
         9R2s4uuRE564ff056l5CYIl3f3jSewtcN5b30KkLMie57Bx15kkpQAmA4UXc04JwWk9B
         ISAA==
X-Forwarded-Encrypted: i=1; AJvYcCVbYhzNCvKPF0wsTtrV98FLzKc3NTkAokyMYGF3qIpiEHHYJfzJyIXe8aIY9EKha5wF+LlYwLAeDOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlrHZa158NgHiND9zkDnXIGIzvAgUB5qIhiSTTO0FYkTO33dJJ
	1jpLhnRr16VcEyuKl6Q5Jd/zTC7W5L1S5ZoOfdYQNTMsMsvIv5EMBAZG
X-Gm-Gg: ASbGnctZXzF5z2VgYSMzeyrPMBB6pHmIMK+EnZ2leAdzQIm4+1jS/XN243noIv7j0xg
	l2H+hkLACMuoPDGiOR16Bcu7ixkOqIUXSiGY4+SWIPD3vTjpezfgwkhWe/vi/YjGRNd1PY5O6AZ
	tsN1xZHUhXxCM4bmvlN4O7DZrVplc7v83yiB5xlxmky+QdW1WRE6VJtkua9Bpnye5GLLAnuzm62
	rUBrsRN/TgJwTrL1QdOvo4SMxPTDpQunNnrNrdJvBh3KBQhl0ExIQaLwiWhMfFFISdx+eUvxxqt
	WYkgcIpZieuWMQdwhsvRhcTtBcyiYfnevKjWDjbn4I/4NV14cfselz1bXLNPQsKpjlH9/saaXyW
	LikcvkCzgk/+CbfrUMm2fxUlow2zwnelTgXR5vtjNl9sUiBmlzA==
X-Google-Smtp-Source: AGHT+IFjaZEdrafbvd2zyiTkt6VCFBB0ZO2mwZEYv3mz1oaOZduHe0Q3Y+mjwZVDt2v6FhCaKr5ObQ==
X-Received: by 2002:a17:90b:4ac2:b0:32b:dfdb:b276 with SMTP id 98e67ed59e1d1-3342a3070d5mr5430211a91.34.1758846574661;
        Thu, 25 Sep 2025 17:29:34 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:72::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a339dsm3185031a12.40.2025.09.25.17.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:34 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	hsiangkao@linux.alibaba.com,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v5 06/14] iomap: rename iomap_readpage_ctx struct to iomap_read_folio_ctx
Date: Thu, 25 Sep 2025 17:26:01 -0700
Message-ID: <20250926002609.1302233-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926002609.1302233-1-joannelkoong@gmail.com>
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

->readpage was deprecated and reads are now on folios.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 23601373573e..09e65771a947 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -360,14 +360,14 @@ static void iomap_read_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
-struct iomap_readpage_ctx {
+struct iomap_read_folio_ctx {
 	struct folio		*cur_folio;
 	bool			cur_folio_in_bio;
 	void			*read_ctx;
 	struct readahead_control *rac;
 };
 
-static void iomap_bio_submit_read(struct iomap_readpage_ctx *ctx)
+static void iomap_bio_submit_read(struct iomap_read_folio_ctx *ctx)
 {
 	struct bio *bio = ctx->read_ctx;
 
@@ -376,7 +376,7 @@ static void iomap_bio_submit_read(struct iomap_readpage_ctx *ctx)
 }
 
 static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
-		struct iomap_readpage_ctx *ctx, loff_t pos, size_t plen)
+		struct iomap_read_folio_ctx *ctx, loff_t pos, size_t plen)
 {
 	struct folio *folio = ctx->cur_folio;
 	const struct iomap *iomap = &iter->iomap;
@@ -423,7 +423,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 }
 
 static int iomap_read_folio_iter(struct iomap_iter *iter,
-		struct iomap_readpage_ctx *ctx)
+		struct iomap_read_folio_ctx *ctx)
 {
 	const struct iomap *iomap = &iter->iomap;
 	loff_t pos = iter->pos;
@@ -479,7 +479,7 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 		.pos		= folio_pos(folio),
 		.len		= folio_size(folio),
 	};
-	struct iomap_readpage_ctx ctx = {
+	struct iomap_read_folio_ctx ctx = {
 		.cur_folio	= folio,
 	};
 	int ret;
@@ -504,7 +504,7 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 EXPORT_SYMBOL_GPL(iomap_read_folio);
 
 static int iomap_readahead_iter(struct iomap_iter *iter,
-		struct iomap_readpage_ctx *ctx)
+		struct iomap_read_folio_ctx *ctx)
 {
 	int ret;
 
@@ -551,7 +551,7 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 		.pos	= readahead_pos(rac),
 		.len	= readahead_length(rac),
 	};
-	struct iomap_readpage_ctx ctx = {
+	struct iomap_read_folio_ctx ctx = {
 		.rac	= rac,
 	};
 
-- 
2.47.3

