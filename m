Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933722A4EE
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758066633; cv=none; b=YyXMGRbsP/ay7JJlfYpgDHUeAP0bs8XBHfBZ9zoaSiyyVVfqpF9Gj4TFEwy6G6/BJ9dyEttFVEPEZ7x6iGB3nS11mjlaRivi7MVMYXeRr7q7Ne01V9qT6cBzcoavGCGLW0QNRfcHXA/A+XLILA0SlWcVhi5y2XrQP1inl9j8sic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758066633; c=relaxed/simple;
	bh=oQMvt3x5Q2N+uSt74k4pmpTEp6W00XYhfBugSskMdWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY3kJi5wUpLW9oeiO0K0yKUXJbpHevfMvtC8YOcTBhOzvgdJQcYgU1YWjourCa5zjvzWyuGFsikcJnu/PWozKkA5Znws4+s8mlJJlNQi/gySLWaf6kB278EP2S2xBUiQ6Utoir9kKlMXtevGvRV96eAW2Fg/qsvYsOrnTMJhc0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibE84cvN; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibE84cvN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b54a588ad96so289809a12.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 16:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758066630; x=1758671430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ad09+MQKPROP4xJOPPVDT/APdYePwOoTN3n11YylRQ=;
        b=ibE84cvNHpHe2yOPUS1s1jKOO+ztjpBHw/t3qKGb2i1FzRB1waAMhUFT1SggEHkxf4
         EKWJl7/5ye/RqcSI14hRRqYW4cG2Xgr7OtkEa17eOCyzfRR7PczlbmRdCP1juLsJSJzJ
         5ubYiHkijurimBzyN2CDTVgehM1UgE9YeglNwC3VeqAzHceAPkQ/PWi6BRIGSbK+3zPj
         PzJIF4ld81KLW5UzcugTztVyRwsidwkABVfxXKlY+33fNfiZAeTiMZ+H+HXh62SXm8IY
         jGxLLF3/tCjs7dtgkZfAx/dufr3wJ2DUKw66JZRaFUu2BU2XTbIIEfNQlgwYrxnEBp7C
         Haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758066630; x=1758671430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ad09+MQKPROP4xJOPPVDT/APdYePwOoTN3n11YylRQ=;
        b=OVvdarJSZIIG1Z5KbCPxvpxxrDvqETHktAja8+jvZu9uGkvTeAcEEibsSxMdReBO3c
         QXF714CfbZVaKRBUgDDheBz/NprwamDqZWKEBMdSCyS0smt8bx8hUNaDryHq2GnkjcZc
         e8Ikm01/nl1zLBkFkaxyoUty2GJNyLTRZQ397ZXmdNpDd5LhgJztTJ+bE3KUULAIAFYj
         W2jXs0PNJU5pmtWFThaK9FfGLZx/3qGKzPoSDSaGv7WlIfUS1KDUY2GA1GGiDu6Rf4Ph
         TYpqdWqOTd+62bPnTPc6HKB9zFmIRq8P5nRtlEqUDCts1aKPl/g1cT1bZsPySmBTMx19
         ZUpA==
X-Forwarded-Encrypted: i=1; AJvYcCXSkyPjnj8n25nq+IAiWEo6rHzf2fiUPHf18WssqKvvfgq4h1ezoeDxqNHtbrvF6LK7SMicOI3uvn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76c06RLd4ujyi5UeU2P9RKi/CKVveVCgdpJAn3KRQxR+hBPi9
	Q1quILMCmqc9YHRogdEaTKO/L7ZxAYXsUaLJ5CB6o8rlFSBhopoP+XrT
X-Gm-Gg: ASbGncsTOC7gHPqOq2ls6g6kQoBnIN3QfufEpaYNy6diWO48pY54xQN/NQswGovh3Fa
	OZjEETY7iXmtlnXcnyRzBQ3/AImXpk5Ryt2o39zaASO9hYdj/yB8qlJ1WwS2qsogaZvojqGWglm
	5906zN2K2AdpGBPaFZAnnbv/k6kZgpFK76NgXVvr2vP33SwvBgULNPas/QNEd40kpcdzfwSBz7d
	iK95wK0tmCN0C40fPkAnzZAgoO/ncT06ujm2exndgo2z2jlqH+yEbtB9IlkqDL2Do16GTSYjFVm
	zCQe7XQJhojU65tw+XP4f6RQp6IUIWcQN/0WqbjrDUk+8lend/H7A0U+GJOd5Z58Ba6+V2vyNCi
	iPrRnqGEnDA7x3ep/iSMgdloN/zskNH6bZ5blqB6nnNwBZiOG
X-Google-Smtp-Source: AGHT+IEBXsoPFEqPmLi3eim0ez8AD7ra+R5wqscn78wj7CppFc2BDvERHIUoydzeJ3XEBjfYKljMBg==
X-Received: by 2002:a05:6a20:3ca6:b0:261:ed47:c9b5 with SMTP id adf61e73a8af0-266e5bf9c68mr6068804637.13.1758066630224;
        Tue, 16 Sep 2025 16:50:30 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:7::])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a398aa76sm15413902a12.44.2025.09.16.16.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 16:50:29 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: hch@infradead.org,
	djwong@kernel.org,
	hsiangkao@linux.alibaba.com,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 02/15] iomap: move read/readahead bio submission logic into helper function
Date: Tue, 16 Sep 2025 16:44:12 -0700
Message-ID: <20250916234425.1274735-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250916234425.1274735-1-joannelkoong@gmail.com>
References: <20250916234425.1274735-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the read/readahead bio submission logic into a separate helper.
This is needed to make iomap read/readahead more generically usable,
especially for filesystems that do not require CONFIG_BLOCK.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 05399aaa1361..ee96558b6d99 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -357,6 +357,14 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
+static void iomap_bio_submit_read(struct iomap_readpage_ctx *ctx)
+{
+	struct bio *bio = ctx->bio;
+
+	if (bio)
+		submit_bio(bio);
+}
+
 static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx, loff_t pos, size_t plen)
 {
@@ -382,8 +390,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 		gfp_t orig_gfp = gfp;
 		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
 
-		if (ctx->bio)
-			submit_bio(ctx->bio);
+		iomap_bio_submit_read(ctx);
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
@@ -478,13 +485,10 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.status = iomap_read_folio_iter(&iter, &ctx);
 
-	if (ctx.bio) {
-		submit_bio(ctx.bio);
-		WARN_ON_ONCE(!ctx.cur_folio_in_bio);
-	} else {
-		WARN_ON_ONCE(ctx.cur_folio_in_bio);
+	iomap_bio_submit_read(&ctx);
+
+	if (!ctx.cur_folio_in_bio)
 		folio_unlock(folio);
-	}
 
 	/*
 	 * Just like mpage_readahead and block_read_full_folio, we always
@@ -550,12 +554,10 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 	while (iomap_iter(&iter, ops) > 0)
 		iter.status = iomap_readahead_iter(&iter, &ctx);
 
-	if (ctx.bio)
-		submit_bio(ctx.bio);
-	if (ctx.cur_folio) {
-		if (!ctx.cur_folio_in_bio)
-			folio_unlock(ctx.cur_folio);
-	}
+	iomap_bio_submit_read(&ctx);
+
+	if (ctx.cur_folio && !ctx.cur_folio_in_bio)
+		folio_unlock(ctx.cur_folio);
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-- 
2.47.3

