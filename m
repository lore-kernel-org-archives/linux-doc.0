Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FB1FBC8E
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587653; cv=none; b=QHyO/x4NgWfZNBS3QZ2xWJrq8qntOI22/9lmT3G0Zt8hOfWvT5Vyg5fDtAZoCpGSzqZOPgcMCeobAztPPiHWvwbfTo7/qUNAr8McykryuOzjS0PM26qfm+kulmNpm1c57WXs6Pt95IPi38Kb2EwmKudmHyTKg+TcKOIb8gvYeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587653; c=relaxed/simple;
	bh=LyOsg2Bu1m9/Q4KGCsDW7iDLciMuCVOGZhuLWbBDsng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6giNBs2Xj/HFnAlum7NhoV/g4b6rd61w6KeLn5yb64JJxWvUFlwaHkWJU25caRSvbbHSGVvun55UeIxTbf6MMZOGJDwuf19T/W84vO3NRTLaxknGUBN6AxNE37u4SfE+e/TGeFLMv7D5agz/MHjLv3MkNc95cdukwer63OBh3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNyewmMu; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNyewmMu"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77dedf198d4so5391648b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587650; x=1759192450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGUNyWs1OxmiVEgLdMH+/qyYZ15HscPzayJVEDJfjsE=;
        b=nNyewmMubgRg/htQHWcoavsVoAEtwnHksZchXXcjCh8pGiO6/RA/jhA95xj28ze9ti
         ha7PXccL8GJc1KpuE7wJtBUQzRcuTRqJsw4Q3W+aMGjLPnPqWJhlGd2uidjWQDOibyqd
         R9s0L2wL7P6diNmseMM5ataaEeG3aGPKvbsDT9+TIHUgg1PfUfv1pWOXZZ6zWkplstj+
         91WDVQbeLw/5wF1FECC5FbakEnRa4/4Z8Q5TTlYeXlVQyJ+wrquxMC4WY8KC0wCXaqtR
         R9b7YIbqpX5leriFdiNvyIT9Ot6LOg1ZTZ/SC1LPShsg41EDtTU/SrRddcABgXuwAos1
         RPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587650; x=1759192450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGUNyWs1OxmiVEgLdMH+/qyYZ15HscPzayJVEDJfjsE=;
        b=ljOIHAxkGVsZvR4R/xHWJkHbY+Tc1TKL+PvLqTLoc1aaYTxy5wit1KhdCC/A9awPUg
         h7DpZR2DVD/ooL8ob8nU1lZBvWpBgWye9ehnJMIYnDSeYbFHRhSnUeUdWOTwNXIl9baq
         Cs9J58kCOGiv2ybofzb7Pc7Ac6SQVnLvzFbBblY8//p3+Kgb6BtxbiHqYS+VIHUoRhiq
         ztHNsRPf5ZEmhNdXia2cN1z4swqodxT/b1hC8a157e0THPaZBhF41PlW6Sd1VWF219gy
         Oka/4H0casUyfleZli39VKdP6CAPnabdGOj85w/OR8DvXGGMnad6csw1MEcmwVFG6FBN
         KBQg==
X-Forwarded-Encrypted: i=1; AJvYcCVG6LTSCF8a5S7j0bcmdfBHNRIJfYgKK7EfkXTHhryO1kfD60PJX44vepMIgbZdSmmTcEpVUBmpcnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XpUnPSkc6hoVwr9nLXA6256BVPJrZ5HEJBRqEehLgxr+MEct
	+WT5BnUgsvxTiSL6c4oDEShiSw6Iu8TpYKyMCYo90nd3IcSH4NNZw2F0
X-Gm-Gg: ASbGnct2cVe/bX57yXYfReZqQZkdpQlm4HQnm4MBbEfUqKT0kEeglt/8v8YEgkx7dsb
	TjiuHdl3mez5hK0u0UTK4gByeQu1mMOymWYxeB0w8iNizRt676TUI7voVGU8avUvgE1AF0wNqkx
	hbJkhQ4WykNpF+2Aeg8DOpAk2I55620amQFBXsZKAywPnx80nvsK5Fdo7cS7SgoJE76GZFLvcbZ
	H5QN7LJFndAl16CQwd7dIF9j9Nr1jm8lvlsTPF1uCSptu/xJnh9HA9k8vaSiT8lq35MfNoVV+9r
	oKKAUmEFkOczCOutQnYJSegpy7NRlYGTyDqlAObai1D5q6CDruqRQ2sMuwE0EQesb8vesieVT1h
	nVdG5qI8JjMY/hS3Uas0cyA9sm7BfuoXjdVqPDA4GJjS1ai37
X-Google-Smtp-Source: AGHT+IFDRYIdyBl04iBYoDUtSI9mRjhTN7zVi/dDiSEIGK216VfDG1RkUSAPcnJWtf4ohk7umhb2Jg==
X-Received: by 2002:a05:6a00:a93:b0:77f:4306:d248 with SMTP id d2e1a72fcca58-77f53ab8044mr872603b3a.22.1758587650623;
        Mon, 22 Sep 2025 17:34:10 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0ef2db80sm9374730b3a.24.2025.09.22.17.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:10 -0700 (PDT)
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
Subject: [PATCH v4 13/15] fuse: use iomap for read_folio
Date: Mon, 22 Sep 2025 17:23:51 -0700
Message-ID: <20250923002353.2961514-14-joannelkoong@gmail.com>
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

Read folio data into the page cache using iomap. This gives us granular
uptodate tracking for large folios, which optimizes how much data needs
to be read in. If some portions of the folio are already uptodate (eg
through a prior write), we only need to read in the non-uptodate
portions.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/fuse/file.c | 81 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 24 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 4adcf09d4b01..4f27a3b0c20a 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -828,23 +828,70 @@ static int fuse_do_readfolio(struct file *file, struct folio *folio,
 	return 0;
 }
 
+static int fuse_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+			    unsigned int flags, struct iomap *iomap,
+			    struct iomap *srcmap)
+{
+	iomap->type = IOMAP_MAPPED;
+	iomap->length = length;
+	iomap->offset = offset;
+	return 0;
+}
+
+static const struct iomap_ops fuse_iomap_ops = {
+	.iomap_begin	= fuse_iomap_begin,
+};
+
+struct fuse_fill_read_data {
+	struct file *file;
+};
+
+static int fuse_iomap_read_folio_range_async(const struct iomap_iter *iter,
+					     struct iomap_read_folio_ctx *ctx,
+					     size_t len)
+{
+	struct fuse_fill_read_data *data = ctx->read_ctx;
+	struct folio *folio = ctx->cur_folio;
+	loff_t pos =  iter->pos;
+	size_t off = offset_in_folio(folio, pos);
+	struct file *file = data->file;
+	int ret;
+
+	/*
+	 *  for non-readahead read requests, do reads synchronously since
+	 *  it's not guaranteed that the server can handle out-of-order reads
+	 */
+	iomap_start_folio_read(folio, len);
+	ret = fuse_do_readfolio(file, folio, off, len);
+	iomap_finish_folio_read(folio, off, len, ret);
+	return ret;
+}
+
+static const struct iomap_read_ops fuse_iomap_read_ops = {
+	.read_folio_range = fuse_iomap_read_folio_range_async,
+};
+
 static int fuse_read_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
-	int err;
+	struct fuse_fill_read_data data = {
+		.file = file,
+	};
+	struct iomap_read_folio_ctx ctx = {
+		.cur_folio = folio,
+		.ops = &fuse_iomap_read_ops,
+		.read_ctx = &data,
 
-	err = -EIO;
-	if (fuse_is_bad(inode))
-		goto out;
+	};
 
-	err = fuse_do_readfolio(file, folio, 0, folio_size(folio));
-	if (!err)
-		folio_mark_uptodate(folio);
+	if (fuse_is_bad(inode)) {
+		folio_unlock(folio);
+		return -EIO;
+	}
 
+	iomap_read_folio(&fuse_iomap_ops, &ctx);
 	fuse_invalidate_atime(inode);
- out:
-	folio_unlock(folio);
-	return err;
+	return 0;
 }
 
 static int fuse_iomap_read_folio_range(const struct iomap_iter *iter,
@@ -1394,20 +1441,6 @@ static const struct iomap_write_ops fuse_iomap_write_ops = {
 	.read_folio_range = fuse_iomap_read_folio_range,
 };
 
-static int fuse_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
-			    unsigned int flags, struct iomap *iomap,
-			    struct iomap *srcmap)
-{
-	iomap->type = IOMAP_MAPPED;
-	iomap->length = length;
-	iomap->offset = offset;
-	return 0;
-}
-
-static const struct iomap_ops fuse_iomap_ops = {
-	.iomap_begin	= fuse_iomap_begin,
-};
-
 static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
-- 
2.47.3

