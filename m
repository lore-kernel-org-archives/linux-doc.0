Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604D1EA7DF
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587645; cv=none; b=f05DwSQAsF0BQNt3thVeZpfgPE5cg3xBKRKaJqbZuZPrZRICYIYBywZMj6fVpvU3Pjf68qpVD2g4fBw1Y0xuhJ+NuCTK+GBIqYf46W/Nint0RWlRoHgqFVcGBzA+zWgaC938yT5b4XaLTHLa5RbNeFiQGOkYfvyvfD9Z1sXMkLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587645; c=relaxed/simple;
	bh=EYt7dCnbv1WdNsWBo8OON9ZEzcHLtnoEPgeM+z1gNyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gL5wjwUo7JnSlookYd0yIFyWqeaP2Q7LpCj6w50ApzlOl5+NZr+Mxfdbo0m5Fp+oCPJ+CIdwIePK+TJWTeg8WWQHm5EHY2oSp85wx8/RwVpEX6chse3jaxFk/3D10YDNC8+RqX4zXGQNctBhe5UgnmbE343lUA9yPU6Bq4G7ew4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3rIMnxy; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3rIMnxy"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-279e2554b6fso11703835ad.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587642; x=1759192442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U11mrEsklOyGoG+ah0Y0223e+PC7aMyCc8N4lhMP5fo=;
        b=Z3rIMnxya4iKX7Z+/h712th52teXNlvdERcFMuhf9pMoO7NjLoWuBY1VhuhRG+6Kwj
         HU+FB4Vpdbs25kscDmaawZjP5UV9arx3qFIOhekZ9X/Xu06Kol8GsHW8sA9F/jB+mnXa
         YUOz9VvEqfXDSLeWJ3EyUQqptSGYfXG9pKVJDyrqPKJAl/EiQtZJv3OiYujaBhJREqhG
         Tgslf4NQ0BqoDdOu7bsEzGQpqiALpoSxHeH7EcKUkxZnNuEClE2z1zbUHn9gD2eX52k8
         xJDcr3iYv+D9vng/ynW49l2a1HwCqz0de/yAd53ORa2dwez86NXqY6okNi74ZCbV2OKa
         JDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587642; x=1759192442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U11mrEsklOyGoG+ah0Y0223e+PC7aMyCc8N4lhMP5fo=;
        b=QOVoXxiRP1aHQ2ELnN6pVUCozsYazCPETMTR7zHV1HTrUMfHqLjzkJLYxAjLg+cnmY
         Wzj5u9jRrCPiq2if4JRCAM7tNYreWJyTwhREVX5bP0wj4gn5lw+NdpydMkxQzLkGUftd
         NINRxzGwZtYbzVpUCH1oA70ZGaU4n8XFVlXSE8YDaA9/gc4CGjdjIPIu5LzA8Q6LaMwt
         jiPkMj4D8UrfMY5Eth3AvUHXlxMAIOKdBMu+zH2i/zwnBZLzQvY21QQd+ZUd5P7bZXVJ
         ef5ZSpqM4mE+npE8+ECx7HaXeAw1yqDAAGR+qr4MneZnF3VZVmlgSD4yMT09MJMKZOh3
         Xotw==
X-Forwarded-Encrypted: i=1; AJvYcCWTKHxbD0V7vb6BuU9VFMQFkR808dypCb8bK5SKOhCsnv5gBVyVkUM9Z/k82Ko2MOodClYxuGfpEMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68uYYN+f3jWqUa3127FguyH0nNpPv/fBMU1R4J9P9um8Z33jf
	s/027ts7qz21zhJR1PyuaEcXo+Bpr9wiXyfmxqtSZCIL5hlgMZxPf1Pi
X-Gm-Gg: ASbGncsmfiBh3eKCi/Y++kpY40rbO2tvuJWgkhm8TyKkd/jcXG2R9ZBxvA4BChHB8Qv
	euBTQNZBJFnvIZH/u9G/6D3mx/pmlOKLXXEh/Ac+TjI13XXVIgNUlGVrW3qGmHk5QgIRpW8bK+L
	5Hi/vOyMLcB3RP0QS2CRUOMfFqRw4LGaddkvazOCxPK3AYWvlcGZpbYaVPnisT7hp9T0RHRgWsf
	8h9Nv9emc5l6MJPtWfo9vtuWIncFvY8u4P64uB5r3O4jarsVj9u3w2F/7b8HKz0hmym2jsEIykO
	GPdL7GImpPGZ4WLA9HJBUf9IJE5t1OG7FQVcHpF7oSnoOh1z0lZYHe2Jw/Gan3IhndoZH/Vkm7g
	jMPnRf9p4OUbWHdWxOx0B/ngukBgiEYmu6QkhLXvE4CkOp96Vh4UWgJKqvpk=
X-Google-Smtp-Source: AGHT+IGMA0cPE2R/eep3lFhZE4wE7iE8qhOhR6c724oiDvW6uLYQwIWJa0jSbnPosxnhtfnxB7mH6g==
X-Received: by 2002:a17:903:1904:b0:27a:6c30:49c with SMTP id d9443c01a7336-27cc2d8f60fmr7678505ad.27.1758587642453;
        Mon, 22 Sep 2025 17:34:02 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c076sm145590885ad.42.2025.09.22.17.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:02 -0700 (PDT)
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
	kernel-team@meta.com
Subject: [PATCH v4 07/15] iomap: track read/readahead folio ownership internally
Date: Mon, 22 Sep 2025 17:23:45 -0700
Message-ID: <20250923002353.2961514-8-joannelkoong@gmail.com>
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

The purpose of "struct iomap_read_folio_ctx->cur_folio_in_bio" is to
track folio ownership to know who is responsible for unlocking it.
Rename "cur_folio_in_bio" to "cur_folio_owned" to better reflect this
purpose and so that this can be generically used later on by filesystems
that are not block-based.

Since "struct iomap_read_folio_ctx" will be made a public interface
later on when read/readahead takes in caller-provided callbacks, track
the folio ownership state internally instead of exposing it in "struct
iomap_read_folio_ctx" to make the interface simpler for end users.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 09e65771a947..34df1cddf65c 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -362,7 +362,6 @@ static void iomap_read_end_io(struct bio *bio)
 
 struct iomap_read_folio_ctx {
 	struct folio		*cur_folio;
-	bool			cur_folio_in_bio;
 	void			*read_ctx;
 	struct readahead_control *rac;
 };
@@ -386,7 +385,6 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 	sector_t sector;
 	struct bio *bio = ctx->read_ctx;
 
-	ctx->cur_folio_in_bio = true;
 	if (ifs) {
 		spin_lock_irq(&ifs->state_lock);
 		ifs->read_bytes_pending += plen;
@@ -423,7 +421,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 }
 
 static int iomap_read_folio_iter(struct iomap_iter *iter,
-		struct iomap_read_folio_ctx *ctx)
+		struct iomap_read_folio_ctx *ctx, bool *folio_owned)
 {
 	const struct iomap *iomap = &iter->iomap;
 	loff_t pos = iter->pos;
@@ -460,6 +458,7 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
 			folio_zero_range(folio, poff, plen);
 			iomap_set_range_uptodate(folio, poff, plen);
 		} else {
+			*folio_owned = true;
 			iomap_bio_read_folio_range(iter, ctx, pos, plen);
 		}
 
@@ -482,16 +481,22 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 	struct iomap_read_folio_ctx ctx = {
 		.cur_folio	= folio,
 	};
+	/*
+	 * If an IO helper takes ownership of the folio, it is responsible for
+	 * unlocking it when the read completes.
+	 */
+	bool folio_owned = false;
 	int ret;
 
 	trace_iomap_readpage(iter.inode, 1);
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
-		iter.status = iomap_read_folio_iter(&iter, &ctx);
+		iter.status = iomap_read_folio_iter(&iter, &ctx,
+				&folio_owned);
 
 	iomap_bio_submit_read(&ctx);
 
-	if (!ctx.cur_folio_in_bio)
+	if (!folio_owned)
 		folio_unlock(folio);
 
 	/*
@@ -504,14 +509,15 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 EXPORT_SYMBOL_GPL(iomap_read_folio);
 
 static int iomap_readahead_iter(struct iomap_iter *iter,
-		struct iomap_read_folio_ctx *ctx)
+		struct iomap_read_folio_ctx *ctx,
+		bool *cur_folio_owned)
 {
 	int ret;
 
 	while (iomap_length(iter)) {
 		if (ctx->cur_folio &&
 		    offset_in_folio(ctx->cur_folio, iter->pos) == 0) {
-			if (!ctx->cur_folio_in_bio)
+			if (!*cur_folio_owned)
 				folio_unlock(ctx->cur_folio);
 			ctx->cur_folio = NULL;
 		}
@@ -519,9 +525,9 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
 			ctx->cur_folio = readahead_folio(ctx->rac);
 			if (WARN_ON_ONCE(!ctx->cur_folio))
 				return -EINVAL;
-			ctx->cur_folio_in_bio = false;
+			*cur_folio_owned = false;
 		}
-		ret = iomap_read_folio_iter(iter, ctx);
+		ret = iomap_read_folio_iter(iter, ctx, cur_folio_owned);
 		if (ret)
 			return ret;
 	}
@@ -554,15 +560,21 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 	struct iomap_read_folio_ctx ctx = {
 		.rac	= rac,
 	};
+	/*
+	 * If an IO helper takes ownership of the folio, it is responsible for
+	 * unlocking it when the read completes.
+	 */
+	bool cur_folio_owned = false;
 
 	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
 
 	while (iomap_iter(&iter, ops) > 0)
-		iter.status = iomap_readahead_iter(&iter, &ctx);
+		iter.status = iomap_readahead_iter(&iter, &ctx,
+					&cur_folio_owned);
 
 	iomap_bio_submit_read(&ctx);
 
-	if (ctx.cur_folio && !ctx.cur_folio_in_bio)
+	if (ctx.cur_folio && !cur_folio_owned)
 		folio_unlock(ctx.cur_folio);
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
-- 
2.47.3

