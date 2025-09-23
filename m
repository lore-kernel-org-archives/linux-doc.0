Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B91BCA07
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587648; cv=none; b=anQwrour1QY1VkpGCn2Biy7gfVvHdE84gOnWiKC6HfvzOT7m/b54AZO9wmMpUdF5D2MzDAs6kRq3LW6vTciXRUOak58ARlZJ85HeCOUmLwDAt4zK2AvGpikw2z2FlGuafoeH7Cc/56drhPHeKXhVQAuNPwFUt9miDzLc2Wb1dVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587648; c=relaxed/simple;
	bh=yLj6g5WJ4PjAjFCvmn5JiB1GDCM8kZxAtJld1CzxfWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyRkEb6zoyW4Ii2QL53vKwlE9OxVcViha+Wp74IeYRhUOXx2BXUmJcGvjJCRjdAXqlhID6W/oSCik2Tlya5oH/eXG0oKsATjGlHtuZteIEu8BCiRKQM1Ireux12FALAiYsuXctGw2jCebvOORvkAscPM7mQSgR6QHUxQ9B+X32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAuFk/xk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAuFk/xk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-279e2554b6fso11704605ad.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587646; x=1759192446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntuDtvvcxXIwL9deTSqYzeD3zNqVLETNsiY99SSIRBw=;
        b=lAuFk/xkwmV/OfnNXgGzaP/4AdVxRMN5itT/Kp6SrTshXpvhWas+CzsIdXBBQLiBXS
         1rubIRGBSC6t1Jz1RUCWoRNzE+Ic0Wxwplt43D+tYRdheAyFNdl1bv+6Ohd/CJJpS/PM
         ubpp9sQMZr+Vu/l4C33Zj3wa22IrhsGjeBeUSvFzj+5DkI7v48KKiP+5KEYjHveAvyi9
         sruzeCTcJVoFNqsPfSUbbSX6RvSR8nUNr4IOD4y+KOwYveMtmC73wI0goYRSXPeYiBZ1
         swJ6QS3yL1IxH8K3d3vwJoJYnrJvbUJ+I76i3LD1Clj8TVyPLaqzhoHDrUerJLThH5C4
         K3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587646; x=1759192446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntuDtvvcxXIwL9deTSqYzeD3zNqVLETNsiY99SSIRBw=;
        b=CcqGmUDTdz6O5Gl3kM3KVkaPy3wRfE5d7QWXP4iLrxvYA+FuS87uPfZDBL3b23bP7V
         j4atcgVet/5Y9ks26TdeyebRMiTnJw6TgYxHyFLbsDrKQOtvi9L4rxI+QX7SqMHWEYDi
         3d74lKWd8gRZTf+7EYkAXvW4ccY0FW2wQpdFlDBhlrMlJS84dnjemUZX83HoWeiIxcF/
         /6zXv06ek1fOR4ejjrbPjdmUUovuKo6b67xF9CHHuWpcDCVxxncSAl1gOHAvgG8FVNOf
         3jvu1A6rmVg7HLiL6pHGl11Ap3Rw9Mq1KO0GujTMXK790hhkmLQKF1/4hGSLvgsUnzn+
         cVCw==
X-Forwarded-Encrypted: i=1; AJvYcCU+CrZYqYrLOIVTEQXwRdDRN01K0+mBMNu3TXEXah9qaHMGNk7Qo/iQEA2/QIjA1XT9US2LuF64V+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9n2N/MQGvC97WvcYJMSpzGhQmWBhVB916QBl9YzEhrLAyo9Or
	mxQPCc/rLWyUS2opbC1lt7XQabzKKkn3y2rpVKvFIZi9bj6APVapRZjI
X-Gm-Gg: ASbGncuh42wcaXUSmCGyesj9kGomQRBXIuoKXYjp02++0kUh/8PjpqYoQkAXq4O9tTU
	Lpb2aFi5XFb/HAmIoQJPqPfb0ocWr/AM4Y4UnX5N/qIurDbD09a/Nnx6oPRRPGRTHoyMP/ZMDPd
	WSaB24CqVMiq+A+Pkhm1NWxNXJzJW28FjnWy/0mXaRzQESyjOpJlhLPN5vPiptG5xJc8z2R8t5K
	UDLdkkK2zRdANK9TK+vWcZim9WIfgqD67xjpqM9/qaGxfJjN9RiP0BdDQo4U/Nl85M6dqNycEr5
	LGLUvlaJzsKMt+toLH+3sDwMwDKypK5v6YxEOTtj8RPr6x8TVeTkJpjctzs00eOZVqksJOTci1x
	/DXEsX7CMaWbxd3FMpHlH3zlJQUlh2XeXtGdO9odg+w79QYtR6YWyMrJAEEGZ
X-Google-Smtp-Source: AGHT+IEhTnBUYl+j3KLiqlpxHUCI/vnvNAMZQ6XSvAN+3hktfXKpSSHFQfOmtaK7JIZM3c79iCAhNw==
X-Received: by 2002:a17:902:ccd1:b0:269:74b6:8735 with SMTP id d9443c01a7336-27cc24e4231mr8951755ad.24.1758587646479;
        Mon, 22 Sep 2025 17:34:06 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053c88sm145125515ad.19.2025.09.22.17.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:06 -0700 (PDT)
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
Subject: [PATCH v4 10/15] iomap: add bias for async read requests
Date: Mon, 22 Sep 2025 17:23:48 -0700
Message-ID: <20250923002353.2961514-11-joannelkoong@gmail.com>
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

Non-block-based filesystems will be using iomap read/readahead. If they
handle reading in ranges asynchronously and fulfill those read requests
on an ongoing basis (instead of all together at the end), then there is
the possibility that the read on the folio may be prematurely ended if
earlier async requests complete before the later ones have been issued.

For example if there is a large folio and a readahead request for 16
pages in that folio, if doing readahead on those 16 pages is split into
4 async requests and the first request is sent off and then completed
before we have sent off the second request, then when the first request
calls iomap_finish_folio_read(), ifs->read_bytes_pending would be 0,
which would end the read and unlock the folio prematurely.

To mitigate this, a "bias" is added to ifs->read_bytes_pending before
the first range is forwarded to the caller and removed after the last
range has been forwarded.

iomap writeback does this with their async requests as well to prevent
prematurely ending writeback.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
---
 fs/iomap/buffered-io.c | 48 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 81ba0cc7705a..354819facfac 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -430,6 +430,38 @@ const struct iomap_read_ops iomap_bio_read_ops = {
 };
 EXPORT_SYMBOL_GPL(iomap_bio_read_ops);
 
+/*
+ * Add a bias to ifs->read_bytes_pending to prevent the read on the folio from
+ * being ended prematurely.
+ *
+ * Otherwise, if the ranges are read asynchronously and read requests are
+ * fulfilled on an ongoing basis, there is the possibility that the read on the
+ * folio may be prematurely ended if earlier async requests complete before the
+ * later ones have been issued.
+ */
+static void iomap_read_add_bias(struct iomap_iter *iter, struct folio *folio)
+{
+	ifs_alloc(iter->inode, folio, iter->flags);
+	iomap_start_folio_read(folio, 1);
+}
+
+static void iomap_read_remove_bias(struct folio *folio, bool folio_owned)
+{
+	struct iomap_folio_state *ifs = folio->private;
+	bool end_read, uptodate;
+
+	if (ifs) {
+		spin_lock_irq(&ifs->state_lock);
+		ifs->read_bytes_pending--;
+		end_read = !ifs->read_bytes_pending && folio_owned;
+		if (end_read)
+			uptodate = ifs_is_fully_uptodate(folio, ifs);
+		spin_unlock_irq(&ifs->state_lock);
+		if (end_read)
+			folio_end_read(folio, uptodate);
+	}
+}
+
 static int iomap_read_folio_iter(struct iomap_iter *iter,
 		struct iomap_read_folio_ctx *ctx, bool *folio_owned)
 {
@@ -448,8 +480,6 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
 		return iomap_iter_advance(iter, length);
 	}
 
-	ifs_alloc(iter->inode, folio, iter->flags);
-
 	length = min_t(loff_t, length,
 			folio_size(folio) - offset_in_folio(folio, pos));
 	while (length) {
@@ -505,6 +535,8 @@ int iomap_read_folio(const struct iomap_ops *ops,
 
 	trace_iomap_readpage(iter.inode, 1);
 
+	iomap_read_add_bias(&iter, folio);
+
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.status = iomap_read_folio_iter(&iter, ctx,
 				&folio_owned);
@@ -512,6 +544,8 @@ int iomap_read_folio(const struct iomap_ops *ops,
 	if (ctx->ops->submit_read)
 		ctx->ops->submit_read(ctx);
 
+	iomap_read_remove_bias(folio, folio_owned);
+
 	if (!folio_owned)
 		folio_unlock(folio);
 
@@ -533,6 +567,8 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
 	while (iomap_length(iter)) {
 		if (ctx->cur_folio &&
 		    offset_in_folio(ctx->cur_folio, iter->pos) == 0) {
+			iomap_read_remove_bias(ctx->cur_folio,
+					*cur_folio_owned);
 			if (!*cur_folio_owned)
 				folio_unlock(ctx->cur_folio);
 			ctx->cur_folio = NULL;
@@ -541,6 +577,7 @@ static int iomap_readahead_iter(struct iomap_iter *iter,
 			ctx->cur_folio = readahead_folio(ctx->rac);
 			if (WARN_ON_ONCE(!ctx->cur_folio))
 				return -EINVAL;
+			iomap_read_add_bias(iter, ctx->cur_folio);
 			*cur_folio_owned = false;
 		}
 		ret = iomap_read_folio_iter(iter, ctx, cur_folio_owned);
@@ -590,8 +627,11 @@ void iomap_readahead(const struct iomap_ops *ops,
 	if (ctx->ops->submit_read)
 		ctx->ops->submit_read(ctx);
 
-	if (ctx->cur_folio && !cur_folio_owned)
-		folio_unlock(ctx->cur_folio);
+	if (ctx->cur_folio) {
+		iomap_read_remove_bias(ctx->cur_folio, cur_folio_owned);
+		if (!cur_folio_owned)
+			folio_unlock(ctx->cur_folio);
+	}
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-- 
2.47.3

