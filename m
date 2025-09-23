Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC11E501C
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587643; cv=none; b=aXt8tfPuvNxk73HujwLzZvHYR+cuYpy0nGoeF01zN/yBjiazx5zu/Stt8JeTn7XlhjPLhTbd5hWCkuO9oVx8HbLK4w+Q6yRXwKXy1gbqe+DSX3AR8kxQWRw4OG7kyXsQZ1o74MepKdT+CN0xaWMDlPC9izREUsKjHwYiR1HNJz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587643; c=relaxed/simple;
	bh=vIAY62bPonaFy7vGVNyvqO/mtaIvl07zVQLoOf2yQSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GP0p616GcYJsfx85HuMp3gyWcRW3YhMaiCGBeKjE4v1DUjkzA8LxwAj43JYBDlQKnSPjsDqSwTRfieiSv3Ox1W/z/gEk/5rYWyJUBLoJsFQti+sp/8ZvtTo6c4fI4UMch6Mt9ottc3qSvmZfG9UbP6zyEiVsnukFufxL5Pto268=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEWacAz+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEWacAz+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b5506b28c98so3087285a12.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587641; x=1759192441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5+CvxTz0as+KK3qYoCdGCPxNBywOK1cIFwpk87cxKA=;
        b=FEWacAz+TzaAoR23MprISMWa/YYtoB6UqG0ltNJeol5EJy7I57pGWkQG2OFd29a28T
         pc+BmZFhySuus3qx2yfkC80uitS4LInaTzLJMoFYOZ/nU6ifHdV5J2cvoFO0Io0SFxnR
         foh0r5YpOzP9m3TcefmaPzZ1ZCVlesMjUvGNLxr/OFsVxdum5v87N8PguQSH/6lsnUPZ
         18krXn13eESq726MmDIrkCEtoKDpInztdYDpySR9tiBZUOImGEy9RSmT+KRim7GVPwtA
         Jkj1Do+gZFyujBrJB1iF84Ftw21RpXHnoTAVj7ZOysCpCYDGDEgbFfYUIrtg+Xd3wIFC
         yHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587641; x=1759192441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5+CvxTz0as+KK3qYoCdGCPxNBywOK1cIFwpk87cxKA=;
        b=CWkJABl9jrDNVJzWqgdtgZ/OOCkfbr0SCXuo++Ch0T4JxK2W/TYHwJnH8HEgNQdpSM
         gM9McbYJuSaNzx3dqBDSCNTAzNjBHsCflr/raocrltGnbumWIt7ylB0uHYHnRt35TijR
         pwIRigpWrA0r5gfGo849bJfBff1HrHVPusskJhwkPdrNBetVm1SX0MunxUvHQEMW2mly
         kXbPu6VXYSdQgEq8f0m6HfRdN4ghu6of4MPdZypYgMy3ipUQUzBtDHsHpMy7xxtE8+Rw
         snQVFWyxSslrAVAi2GNUt9jXkquVp0iQSb82LCsov7e0yPnFyrIuXNnH2LoWk/xzX3A3
         Q3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5kddZ1skkGq4TqX124vONkuUs/KWcI5Uy1zZQDvIJzu+StoZoZPTlH9X0+f5DE4ippQMma46ZSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+i4HteNzg+S2uCWAxtSLXTao5nXtmPlbtznilqQLDilvvReR
	4MELITSgRVWvGnXwh/5/vq90mqC4iMI5c7Ck9nmUzRV2HUo7L5ZKvZkL
X-Gm-Gg: ASbGncsc6UtzjP9lwiQo5JsGzoEeGcmU5BJ40J58R3JLjGs1d1vy0Ga28te4pukIF6d
	wx406lk7WrUPDucDIQsRpyJFLzPrm1kVswrLg4VevPDQGNRHs8zWe/cMqlTevWdx2ppBh2ZiPad
	B/ir47WcxL8vl9R14Z2ja7dQAAv3p/3IcWHThS4/FUB3h8O7h9Kmt03CK4PfIvI9BYxEOroDkRV
	rbr0w1gFuNvR+0MatJy5qsIV2bRO0WZZQdqRqRAuUNaqZDKeOgBztoHmHVNbMk7wAyjAyc53yKn
	UM5U3pXcu6wUlY8OBZEYM/eVRtpk4dC+Wfmq/RoizQ5r/jLXzmNMALK3RJc5rstxoaXDfmnnBaR
	t60fHyggYm7PMT17v+1sKBNQD4DPUDeOQVi3xfdgAsq5whi/C
X-Google-Smtp-Source: AGHT+IF5uyA51QP5B/v0aEpZwjC0gnuJm8CE+r/VEqv2kg+QAhCE4gI4DiBuU/4bl7VHU9GQ+zierw==
X-Received: by 2002:a17:902:f70b:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27cc5431730mr8985485ad.38.1758587641125;
        Mon, 22 Sep 2025 17:34:01 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698019821dsm144543225ad.64.2025.09.22.17.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:00 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	hsiangkao@linux.alibaba.com,
	kernel-team@meta.com,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 06/15] iomap: rename iomap_readpage_ctx struct to iomap_read_folio_ctx
Date: Mon, 22 Sep 2025 17:23:44 -0700
Message-ID: <20250923002353.2961514-7-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923002353.2961514-1-joannelkoong@gmail.com>
References: <20250923002353.2961514-1-joannelkoong@gmail.com>
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

