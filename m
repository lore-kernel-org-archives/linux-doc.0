Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB151D5146
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587638; cv=none; b=G9XmudM4FRbPdfSpCcLV+Qted/53nLogL3CjFftwjFzQix0n+fM7k7GBJpwrWb3LIn3K3BVXWwqDFsrBcz235Pgkn/LLqPR1bHEOe2ZPnESEiKg/G4/SddLXKVfTI9ubZWt3euqnr4a5L6RgCnoSuZoVgh7rlTUVHzNc4nBqYzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587638; c=relaxed/simple;
	bh=Bb9XHeMlSIhgxocJi7zMkwUhCzQElY81IHbj2qnvjQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AhQbyFF1LaPtho6LFzk3lLTrK9ZYhuU0RfPxQzd+GgZpqBsxbb4YyOqiqppZdQhCuRiihe+BVXw9inYWWD9+/AKgc2VZ8jex/riSOa+2jibvTAMNYVpML8uCF9UvJS2Cd3P0dUY1NDKixyUQxfyhQOFTp99XtAoj5Oj+5DbH9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnNm45/r; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnNm45/r"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4674099a12.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587637; x=1759192437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcpVeAYougECMqYDjv+WTibeO0LuSWTiGkan9JcZFA0=;
        b=CnNm45/rYKBe2cFGbfrdHfEbrBLtkTehOjWd+YtbwYbKTms4+8PDfZidHWDv6DVD8c
         /JTco8yI0leuSEFrwhZl2C9vJZ1qrFSg24iTG3/W0VglCyFP7EG8Rv/ujMumVudNvtiP
         9OXqNq43++2UudwvJ6FknS48KVPHcDmGrBMLiTpNta1g4eFYlRqMVt94yF6JnUP7mraC
         b8YxvSVStYdlbJyGrtZHxdpZLnp+0WNv9jTTDIGGZHJZO4DNgi+Aguq5v/6nzZXCynTE
         Op4m7oiIMF32baJkv6Lyo119+CpOjoypPDDihBa5MFW9MRmOACo/nYIM7020EXmn4CAw
         jMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587637; x=1759192437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcpVeAYougECMqYDjv+WTibeO0LuSWTiGkan9JcZFA0=;
        b=Via4EHqSXwRbZNg0sb5IhKUrncYhyhG2ZGHoLSNxAjurvUAmk/G1xfKyRWC5Fqt3tr
         YrqQcWdNpQaPi35fcx7Qp89ZsAbw0qXBNlI1SZf7rf3GUZuHfa33RfJTxc2t++LX7KpF
         t7DnltB9AGqOJwzTQNeStaKShso4Mfywx59yJeI4NZrRO0z4/F4jtr9DoZXkuG1kFGGw
         mEuebIhhl/TewY+yp0Lil88WAg+nj2TpYMcQcrnBtGZ9khhP5ozWXLu23JnBKeRvw89W
         +5AvMkTVnlmOEVrbOhuiVsnmK6RhVtSZ6/XwfgOTGJNcAl3N9QfByi8bSBr/yl0iFfiA
         QMGw==
X-Forwarded-Encrypted: i=1; AJvYcCUUkAJI8/X1Xudq8hUde0XtNe0AWGm6+ldkSoQ2lC8Dn8RZO6XM7NNguEkRv9y0JSb5vDBsbHZei4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbabs4v4TsrzIozn6vBebEglKGsNJcIW5TWsD102Dwks2ytWRT
	g/kglgx15yzXNjeiWsREEDProRGMgabY93g0x2LGW/YvlR7F3snGZPNR
X-Gm-Gg: ASbGncurSd229HJRyVzt+BM8sQZr0JARotM7LnNehVfWqJgJU7w6CzeaP4sTNJaLa1r
	Z8um57hPce4SqG19z+VP+2+rANhyJLlRN5Cbj5B/EBO19EI3opA/6Re/BFjfDRHF7BeioXNzh9D
	Rn7KK0vwrl+i374FZoNk9MhQj5TE7QKMGeDES/8gS884rGgY+8qrNmOTyxj4FR8Cr8CJzdtKyDc
	YVpLY4r8AZO8UWJAf5RQp0YIT1UiAiP7jvz3XEkoTYAAr9l7NgukI0cteVvtyt15SpCtzVUyZ5+
	ykfmwUHRWI+jN7xMrHWSe6lHWda7fTPyJeT8F4Q5TnBm0iZhf2tvd3TPwH5QRoJNBNTll0GXp10
	ZEOn6aKTULRIUFFfqNir2Z42Ru9E1FyH82HHJHOKOJBlVMCqBoQ4IpflIyTc=
X-Google-Smtp-Source: AGHT+IHVFfzg8x4eRcM+QJ3isKvKIKmIsBBStLAEhVGVKIoSb3CxXZfaFZoSTi2VN706ZbNtC20t5w==
X-Received: by 2002:a17:903:11c3:b0:270:ba81:14d9 with SMTP id d9443c01a7336-27cc5434ee4mr9156995ad.36.1758587636816;
        Mon, 22 Sep 2025 17:33:56 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deea6sm141157835ad.75.2025.09.22.17.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:33:56 -0700 (PDT)
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
Subject: [PATCH v4 03/15] iomap: store read/readahead bio generically
Date: Mon, 22 Sep 2025 17:23:41 -0700
Message-ID: <20250923002353.2961514-4-joannelkoong@gmail.com>
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

Store the iomap_readpage_ctx bio generically as a "void *read_ctx".
This makes the read/readahead interface more generic, which allows it to
be used by filesystems that may not be block-based and may not have
CONFIG_BLOCK set.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index f8b985bb5a6b..b06b532033ad 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -363,13 +363,13 @@ static void iomap_read_end_io(struct bio *bio)
 struct iomap_readpage_ctx {
 	struct folio		*cur_folio;
 	bool			cur_folio_in_bio;
-	struct bio		*bio;
+	void			*read_ctx;
 	struct readahead_control *rac;
 };
 
 static void iomap_bio_submit_read(struct iomap_readpage_ctx *ctx)
 {
-	struct bio *bio = ctx->bio;
+	struct bio *bio = ctx->read_ctx;
 
 	if (bio)
 		submit_bio(bio);
@@ -384,6 +384,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 	size_t poff = offset_in_folio(folio, pos);
 	loff_t length = iomap_length(iter);
 	sector_t sector;
+	struct bio *bio = ctx->read_ctx;
 
 	ctx->cur_folio_in_bio = true;
 	if (ifs) {
@@ -393,9 +394,8 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 	}
 
 	sector = iomap_sector(iomap, pos);
-	if (!ctx->bio ||
-	    bio_end_sector(ctx->bio) != sector ||
-	    !bio_add_folio(ctx->bio, folio, plen, poff)) {
+	if (!bio || bio_end_sector(bio) != sector ||
+	    !bio_add_folio(bio, folio, plen, poff)) {
 		gfp_t gfp = mapping_gfp_constraint(folio->mapping, GFP_KERNEL);
 		gfp_t orig_gfp = gfp;
 		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
@@ -404,22 +404,21 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
-				     REQ_OP_READ, gfp);
+		bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs), REQ_OP_READ,
+				     gfp);
 		/*
 		 * If the bio_alloc fails, try it again for a single page to
 		 * avoid having to deal with partial page reads.  This emulates
 		 * what do_mpage_read_folio does.
 		 */
-		if (!ctx->bio) {
-			ctx->bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ,
-					     orig_gfp);
-		}
+		if (!bio)
+			bio = bio_alloc(iomap->bdev, 1, REQ_OP_READ, orig_gfp);
 		if (ctx->rac)
-			ctx->bio->bi_opf |= REQ_RAHEAD;
-		ctx->bio->bi_iter.bi_sector = sector;
-		ctx->bio->bi_end_io = iomap_read_end_io;
-		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
+			bio->bi_opf |= REQ_RAHEAD;
+		bio->bi_iter.bi_sector = sector;
+		bio->bi_end_io = iomap_read_end_io;
+		bio_add_folio_nofail(bio, folio, plen, poff);
+		ctx->read_ctx = bio;
 	}
 }
 
-- 
2.47.3

