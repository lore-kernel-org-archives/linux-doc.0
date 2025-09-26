Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9E284A3E
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846568; cv=none; b=WsVoroVJG4AJ06SW+wS4CQLEmIp8aycSZFTiyjOmGk0kB1tH8h7JVDU2yZxL1Dbm+2J48U/LFglNqxmh36/XzDrBewMN1kxNzrnLII1fuKArYja1LBY+hkvj7GRd0THgm0X8gv3wXEwya5OEnhiWpO/PgAUoWid2iZ4CZxLxUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846568; c=relaxed/simple;
	bh=CSiGtKrWb8zqpNUe8yL7Pevqy9qFJhFmaY58ZJGrYSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgfozFoq8OxlUlW3gIJEqxTtRopfoVIWLCEDgdUTgaHPb6vAQww2Z784SnM3ycg1g5VIqMGJLg84cOrTGJHfh+rbACA8Ejcoe/2ZY6Bh34afENXkMVB0qzv4HqR4u0Rhil+5+oY+i++GQjV82SjtGDBiX2o8NzngQj4iWUtz1fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8S+lD3d; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8S+lD3d"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26a0a694ea8so14807685ad.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846565; x=1759451365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8Zc1MP+97msutqoeYloSdkN6RJEwl1bHJXdXkLR+a8=;
        b=B8S+lD3dhzSUP09O2UevSQy9dxglRsq0XlUBNrJyWk0RM0pteAxqO1UD0d2AEP+VaC
         e6QMlr5A/P+I/SOyJ8sqe/VCx26ZyWVD/SL2Nf6PJxEnxPjHGYzBQMjam8iACnsTuySJ
         hWomCj3ltBaXIPEmjy9IhOcFnokdwu5Ezhw1D21k5q3Iu5e4vhuDx51euf27pUIyPrrB
         XuYTfphRdGXR8uoV9JUbC9M/IFNiNTWjsGDm6LXLRx5qzN6ny25XxgkMGHuIgdmoX0JH
         cpe77a2KeacbEtglivcxOsN8OWGf4E+otT0Vg7uuuptPpEKUEAENvAkHMXUC4yqeeXOX
         CTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846565; x=1759451365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8Zc1MP+97msutqoeYloSdkN6RJEwl1bHJXdXkLR+a8=;
        b=I564wnk5K9+FRIXoTpwXP/yKtrd90h2XStHiY2Ly59iMTrA/VQ1cowumZb292bofWT
         nz5H4VD2G7XeX5oj4m0owxfmMOhx9fi/50Cn/QVTjsDu61M1ldQ7b8DB6IERAEQaglOO
         msw7uVTyUnrzdC8PzeB7nWMgcW/zPFvVCtwBUxgC424LkUdg6wvAJW8y71enrwdS4QIG
         +qWIv6ofd1xXcIJwgoxFBgRm41wthvnkrTcetbkt8qlLNo7QnLu/b/Mt1dNHplNKEJ0/
         WrGu6qoedAF39ax4RuvLmK+urWfQEFSiKzbLI0U1EytIQrT9SSDZOA6kYXgbKh9oQvVb
         S+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUMTdoKlZBC9Xe9ynbxiCwzXrkRQuLvmGdXMASfreuBrXmbbhDj1NWT6M5TAzifHsX5EJl2v0lL6uI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29oLwdoop4Pk1T3EYqdA70yB6DX/qOmTViYwFGnA7mgZ9F8OP
	pYePKesXM3TJkHVwjknprHzBNHpTX8QsGZAdOJc4shWDyXIQia9HHDOtxn7c5A==
X-Gm-Gg: ASbGnctme8Iq2kgsaOzOhoP3u5CRsgXXLfj7OTGe3K8RjbJ4n03PilgsMMrVAnmFcn8
	deV0uvrI3Yf6aAa4gf73gLwibmhj0+kbcjuPe/Zh5QONmWzsYEBejQA1khFEh8zWMcUbSBRDJ2L
	tR6KlOhAeD796bxErcQxfNTVB9s2cdP5kdhfYF/4dZ7NRLXfmlOwRj2r5IzTi8q87NkSgOl54Q2
	8G+VoQklK9ctjnVnLJ5Qd7pIRiKR07+lm+On7ikER70W6xqOes5Li7g1vjTThPzQHw/PrSM2CcT
	ef6VuUpBfuYsqNSoLXH+LBj4zEs8gB0QnZYy+1YRQkqce/UN+/apgqX2jVfa3sf9AvUXUO7Rjdn
	p0bO/qPy+5JkMh0tjoasHv6emZSAjjgsCLxUxvnJ5YIvpvcOk
X-Google-Smtp-Source: AGHT+IHNIEbxa6UAWQsKzdL61JfAyD30h+IPFl21tAc/+urvhLse02Zgh6O344jn51W+QYvc3zIEvQ==
X-Received: by 2002:a17:902:db06:b0:25c:46cd:1dc1 with SMTP id d9443c01a7336-27ed4a2d078mr55247085ad.33.1758846565475;
        Thu, 25 Sep 2025 17:29:25 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671225fsm37637505ad.43.2025.09.25.17.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:25 -0700 (PDT)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v5 01/14] iomap: move bio read logic into helper function
Date: Thu, 25 Sep 2025 17:25:56 -0700
Message-ID: <20250926002609.1302233-2-joannelkoong@gmail.com>
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

Move the iomap_readpage_iter() bio read logic into a separate helper
function, iomap_bio_read_folio_range(). This is needed to make iomap
read/readahead more generically usable, especially for filesystems that
do not require CONFIG_BLOCK.

Additionally rename buffered write's iomap_read_folio_range() function
to iomap_bio_read_folio_range_sync() to better describe its synchronous
behavior.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 68 ++++++++++++++++++++++++------------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 9535733ed07a..7e65075b6345 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -367,36 +367,15 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
-static int iomap_readpage_iter(struct iomap_iter *iter,
-		struct iomap_readpage_ctx *ctx)
+static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx, loff_t pos, size_t plen)
 {
+	struct folio *folio = ctx->cur_folio;
 	const struct iomap *iomap = &iter->iomap;
-	loff_t pos = iter->pos;
+	struct iomap_folio_state *ifs = folio->private;
+	size_t poff = offset_in_folio(folio, pos);
 	loff_t length = iomap_length(iter);
-	struct folio *folio = ctx->cur_folio;
-	struct iomap_folio_state *ifs;
-	size_t poff, plen;
 	sector_t sector;
-	int ret;
-
-	if (iomap->type == IOMAP_INLINE) {
-		ret = iomap_read_inline_data(iter, folio);
-		if (ret)
-			return ret;
-		return iomap_iter_advance(iter, length);
-	}
-
-	/* zero post-eof blocks as the page may be mapped */
-	ifs = ifs_alloc(iter->inode, folio, iter->flags);
-	iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff, &plen);
-	if (plen == 0)
-		goto done;
-
-	if (iomap_block_needs_zeroing(iter, pos)) {
-		folio_zero_range(folio, poff, plen);
-		iomap_set_range_uptodate(folio, poff, plen);
-		goto done;
-	}
 
 	ctx->cur_folio_in_bio = true;
 	if (ifs) {
@@ -435,6 +414,37 @@ static int iomap_readpage_iter(struct iomap_iter *iter,
 		ctx->bio->bi_end_io = iomap_read_end_io;
 		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
 	}
+}
+
+static int iomap_readpage_iter(struct iomap_iter *iter,
+		struct iomap_readpage_ctx *ctx)
+{
+	const struct iomap *iomap = &iter->iomap;
+	loff_t pos = iter->pos;
+	loff_t length = iomap_length(iter);
+	struct folio *folio = ctx->cur_folio;
+	size_t poff, plen;
+	int ret;
+
+	if (iomap->type == IOMAP_INLINE) {
+		ret = iomap_read_inline_data(iter, folio);
+		if (ret)
+			return ret;
+		return iomap_iter_advance(iter, length);
+	}
+
+	/* zero post-eof blocks as the page may be mapped */
+	ifs_alloc(iter->inode, folio, iter->flags);
+	iomap_adjust_read_range(iter->inode, folio, &pos, length, &poff, &plen);
+	if (plen == 0)
+		goto done;
+
+	if (iomap_block_needs_zeroing(iter, pos)) {
+		folio_zero_range(folio, poff, plen);
+		iomap_set_range_uptodate(folio, poff, plen);
+	} else {
+		iomap_bio_read_folio_range(iter, ctx, pos, plen);
+	}
 
 done:
 	/*
@@ -559,7 +569,7 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-static int iomap_read_folio_range(const struct iomap_iter *iter,
+static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
 		struct folio *folio, loff_t pos, size_t len)
 {
 	const struct iomap *srcmap = iomap_iter_srcmap(iter);
@@ -572,7 +582,7 @@ static int iomap_read_folio_range(const struct iomap_iter *iter,
 	return submit_bio_wait(&bio);
 }
 #else
-static int iomap_read_folio_range(const struct iomap_iter *iter,
+static int iomap_bio_read_folio_range_sync(const struct iomap_iter *iter,
 		struct folio *folio, loff_t pos, size_t len)
 {
 	WARN_ON_ONCE(1);
@@ -749,7 +759,7 @@ static int __iomap_write_begin(const struct iomap_iter *iter,
 				status = write_ops->read_folio_range(iter,
 						folio, block_start, plen);
 			else
-				status = iomap_read_folio_range(iter,
+				status = iomap_bio_read_folio_range_sync(iter,
 						folio, block_start, plen);
 			if (status)
 				return status;
-- 
2.47.3

