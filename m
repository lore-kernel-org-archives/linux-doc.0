Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472281D432D
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846588; cv=none; b=Tfr1o90B7dEQbYZnaTWmyuaKBM9D7Pw30PITmi/3pRS4ZxyjhIznZ3rSuQ4jbNLVhvTy3OkuNjbtg2c6d6QlTwAZ0RBfvd0t8uuikgb/QGYhN8il/CpJ4CD/e7wpq9cdCpNG+vKbK3hSaGlfGDCyl98azS0hsg1kcbNcDSAE0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846588; c=relaxed/simple;
	bh=H1ag0vBhAcWoWZN0/4RsWhCnW5aIKcHArG6LWXaKcW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bIFHdJh0TLlPsXjOMHxhdCirO4FLnb/BBbLsxXyap7nKLb4MIj0ClOtkXFp12sWc2u1IluudH6lZXhHJV/lqrqL9YgJQoJcuJ9TlCwaXR2qOVfJG/nDF+M/Jlj0bNGb38+aqMDmfDzQWevCOT4DzG/h/eeJYHxHHvu8/Vk+ULqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejMYUdxz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejMYUdxz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eceb38eb1so18597345ad.3
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846585; x=1759451385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jqod/EVwNrso/Mq644OvCMd9TOzIUphjTEz6c9+8XEM=;
        b=ejMYUdxzwwJmo3KpRLahI9bg13O++5rUW27sh0rT2nzy4gKJ1Eym0jt6oEGTxRGzFJ
         9zrf/bwuvM7OdBgGU88pNkM6aOqyHOAuJFQfoXBEpZSQTXqpB8e3JvsujNTjOK9XLOKk
         GrOHrPV8VxasfIKavEuMWTSanUvs+TO87oPYXbingSzAH6Fpqlfw3eMOJpOyjGn3us9G
         xFeqzynwbcg7qHhPKUmlRNSwIhQoJHcHZFUTxOmaF8QzzoCA//FN6LC9cbThmt3FVdoT
         otQrr40p+t6v4Djeia8GMvqAOj5mD6R1/h+9R+yo+5jPx+UL3XhdKeVpgiN6hcaGV1Jc
         OENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846585; x=1759451385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jqod/EVwNrso/Mq644OvCMd9TOzIUphjTEz6c9+8XEM=;
        b=eSqPygobb3k+eWnr5zunPBqbM5pRs+tdnSidhgdkjjtH8fQ26qjuE+b3A3hwvcd7K2
         NOJUrXMSXcuSqTEglrlIBw5PBmIiiIAqJKr18oZ6D4BNb1CdhtT7+2IzI9kZYNtms0c+
         b5d2+Qq2njHjCSJfJw7LhbBiy/s6gcY4hYVxu00kIA0cjp3Qm9yR/Cx55iINDa4JUAJ8
         chmipimXjHWbSnc1gC1xTMEHQlvuNPzr/CI1ov4RqMfSVbE5wsOrN+DNYLdzMTPWWrPr
         OesJr5VLB+ebTmqi70q3OEFPitr0FjWhbW7N9vmHhyj/Y0YF0QxL8NTKWgVunKnJvOod
         Dnwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYtrAR4x+I4+OTYeM5mMPpiI6aLx+fS4Ztn91XyFU8UJ0OnrOkErMw0za5QLGdcclFWqFqzwzfsgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwDF8KxGJU1woRtMZr0EXJUHZxQbk+i4SFOzo1IftThdCME/Ed
	8Wqwrqty/bW4EqfaDsJleYCjXTUEzgKYkEA/gCrQGLD3Us2mdoarbi+a
X-Gm-Gg: ASbGncvuHJHyJOoWjY/KKSjOMavuAOI8shFt5AHi0CaxSYtN6UVgBuTBFKzf3nyhRsR
	e+LBjmdUhaQTt8k2Th9s3A7YFxnkiA2CW+dXDlWqKQPWZbTT+3321bJMoKEx3irs30ovJ2cAIJu
	kpcEh98pyHx4mm/4DS+K3dwbVQ5mBF4FIciEek8rIoj/uTnljRI4g04gxy6qZx2fEV+UHh5zIx+
	rGs6610eOvf4sf4ItdibvOJ9gDVUVMS4kHlOQpX9VrN6ZRCGXTw0k2yBpRnxanb3SH7p1/naspg
	OVkgmeUSuKvxMrjtdiIUxSvTm02INJnVZSj7uLy2H5EIFb4IouU/aQC0iadfDMlKxRuy2yjQVgt
	iFOgfeDIhJhYCmgwYycUT2cNMQzg5Wqk3hLQoYHazGJ1Jx6LcAc9WywKPyC4=
X-Google-Smtp-Source: AGHT+IFHFyKvDb8nTXmM+1rG/lyOWXIeXrGCxZPO8ooQ7pRm8AHT43rmsSNmee1gQa0wBNNgWnYGzQ==
X-Received: by 2002:a17:902:ef0b:b0:248:7018:c739 with SMTP id d9443c01a7336-27ed4aab56fmr53058215ad.28.1758846584489;
        Thu, 25 Sep 2025 17:29:44 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68821desm37546005ad.91.2025.09.25.17.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:44 -0700 (PDT)
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
Subject: [PATCH v5 13/14] fuse: use iomap for readahead
Date: Thu, 25 Sep 2025 17:26:08 -0700
Message-ID: <20250926002609.1302233-14-joannelkoong@gmail.com>
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

Do readahead in fuse using iomap. This gives us granular uptodate
tracking for large folios, which optimizes how much data needs to be
read in. If some portions of the folio are already uptodate (eg through
a prior write), we only need to read in the non-uptodate portions.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/fuse/file.c | 220 ++++++++++++++++++++++++++++---------------------
 1 file changed, 124 insertions(+), 96 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index db93c83ee4a3..7c9c00784e33 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -844,8 +844,65 @@ static const struct iomap_ops fuse_iomap_ops = {
 
 struct fuse_fill_read_data {
 	struct file *file;
+
+	/* Fields below are used if sending the read request asynchronously */
+	struct fuse_conn *fc;
+	struct fuse_io_args *ia;
+	unsigned int nr_bytes;
 };
 
+/* forward declarations */
+static bool fuse_folios_need_send(struct fuse_conn *fc, loff_t pos,
+				  unsigned len, struct fuse_args_pages *ap,
+				  unsigned cur_bytes, bool write);
+static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
+				unsigned int count, bool async);
+
+static int fuse_handle_readahead(struct folio *folio,
+				 struct readahead_control *rac,
+				 struct fuse_fill_read_data *data, loff_t pos,
+				 size_t len)
+{
+	struct fuse_io_args *ia = data->ia;
+	size_t off = offset_in_folio(folio, pos);
+	struct fuse_conn *fc = data->fc;
+	struct fuse_args_pages *ap;
+	unsigned int nr_pages;
+
+	if (ia && fuse_folios_need_send(fc, pos, len, &ia->ap, data->nr_bytes,
+					false)) {
+		fuse_send_readpages(ia, data->file, data->nr_bytes,
+				    fc->async_read);
+		data->nr_bytes = 0;
+		data->ia = NULL;
+		ia = NULL;
+	}
+	if (!ia) {
+		if (fc->num_background >= fc->congestion_threshold &&
+		    rac->ra->async_size >= readahead_count(rac))
+			/*
+			 * Congested and only async pages left, so skip the
+			 * rest.
+			 */
+			return -EAGAIN;
+
+		nr_pages = min(fc->max_pages, readahead_count(rac));
+		data->ia = fuse_io_alloc(NULL, nr_pages);
+		if (!data->ia)
+			return -ENOMEM;
+		ia = data->ia;
+	}
+	folio_get(folio);
+	ap = &ia->ap;
+	ap->folios[ap->num_folios] = folio;
+	ap->descs[ap->num_folios].offset = off;
+	ap->descs[ap->num_folios].length = len;
+	data->nr_bytes += len;
+	ap->num_folios++;
+
+	return 0;
+}
+
 static int fuse_iomap_read_folio_range_async(const struct iomap_iter *iter,
 					     struct iomap_read_folio_ctx *ctx,
 					     size_t len)
@@ -857,17 +914,39 @@ static int fuse_iomap_read_folio_range_async(const struct iomap_iter *iter,
 	struct file *file = data->file;
 	int ret;
 
-	/*
-	 *  for non-readahead read requests, do reads synchronously since
-	 *  it's not guaranteed that the server can handle out-of-order reads
-	 */
-	ret = fuse_do_readfolio(file, folio, off, len);
-	iomap_finish_folio_read(folio, off, len, ret);
+	if (ctx->rac) {
+		ret = fuse_handle_readahead(folio, ctx->rac, data, pos, len);
+		/*
+		 * If fuse_handle_readahead was successful, fuse_readpages_end
+		 * will do the iomap_finish_folio_read, else we need to call it
+		 * here
+		 */
+		if (ret)
+			iomap_finish_folio_read(folio, off, len, ret);
+	} else {
+		/*
+		 *  for non-readahead read requests, do reads synchronously
+		 *  since it's not guaranteed that the server can handle
+		 *  out-of-order reads
+		 */
+		ret = fuse_do_readfolio(file, folio, off, len);
+		iomap_finish_folio_read(folio, off, len, ret);
+	}
 	return ret;
 }
 
+static void fuse_iomap_read_submit(struct iomap_read_folio_ctx *ctx)
+{
+	struct fuse_fill_read_data *data = ctx->read_ctx;
+
+	if (data->ia)
+		fuse_send_readpages(data->ia, data->file, data->nr_bytes,
+				    data->fc->async_read);
+}
+
 static const struct iomap_read_ops fuse_iomap_read_ops = {
 	.read_folio_range = fuse_iomap_read_folio_range_async,
+	.submit_read = fuse_iomap_read_submit,
 };
 
 static int fuse_read_folio(struct file *file, struct folio *folio)
@@ -929,7 +1008,8 @@ static void fuse_readpages_end(struct fuse_mount *fm, struct fuse_args *args,
 	}
 
 	for (i = 0; i < ap->num_folios; i++) {
-		folio_end_read(ap->folios[i], !err);
+		iomap_finish_folio_read(ap->folios[i], ap->descs[i].offset,
+					ap->descs[i].length, err);
 		folio_put(ap->folios[i]);
 	}
 	if (ia->ff)
@@ -939,7 +1019,7 @@ static void fuse_readpages_end(struct fuse_mount *fm, struct fuse_args *args,
 }
 
 static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
-				unsigned int count)
+				unsigned int count, bool async)
 {
 	struct fuse_file *ff = file->private_data;
 	struct fuse_mount *fm = ff->fm;
@@ -961,7 +1041,7 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
 
 	fuse_read_args_fill(ia, file, pos, count, FUSE_READ);
 	ia->read.attr_ver = fuse_get_attr_version(fm->fc);
-	if (fm->fc->async_read) {
+	if (async) {
 		ia->ff = fuse_file_get(ff);
 		ap->args.end = fuse_readpages_end;
 		err = fuse_simple_background(fm, &ap->args, GFP_KERNEL);
@@ -978,81 +1058,20 @@ static void fuse_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
 	struct fuse_conn *fc = get_fuse_conn(inode);
-	unsigned int max_pages, nr_pages;
-	struct folio *folio = NULL;
+	struct fuse_fill_read_data data = {
+		.file = rac->file,
+		.fc = fc,
+	};
+	struct iomap_read_folio_ctx ctx = {
+		.ops = &fuse_iomap_read_ops,
+		.rac = rac,
+		.read_ctx = &data
+	};
 
 	if (fuse_is_bad(inode))
 		return;
 
-	max_pages = min_t(unsigned int, fc->max_pages,
-			fc->max_read / PAGE_SIZE);
-
-	/*
-	 * This is only accurate the first time through, since readahead_folio()
-	 * doesn't update readahead_count() from the previous folio until the
-	 * next call.  Grab nr_pages here so we know how many pages we're going
-	 * to have to process.  This means that we will exit here with
-	 * readahead_count() == folio_nr_pages(last_folio), but we will have
-	 * consumed all of the folios, and read_pages() will call
-	 * readahead_folio() again which will clean up the rac.
-	 */
-	nr_pages = readahead_count(rac);
-
-	while (nr_pages) {
-		struct fuse_io_args *ia;
-		struct fuse_args_pages *ap;
-		unsigned cur_pages = min(max_pages, nr_pages);
-		unsigned int pages = 0;
-
-		if (fc->num_background >= fc->congestion_threshold &&
-		    rac->ra->async_size >= readahead_count(rac))
-			/*
-			 * Congested and only async pages left, so skip the
-			 * rest.
-			 */
-			break;
-
-		ia = fuse_io_alloc(NULL, cur_pages);
-		if (!ia)
-			break;
-		ap = &ia->ap;
-
-		while (pages < cur_pages) {
-			unsigned int folio_pages;
-
-			/*
-			 * This returns a folio with a ref held on it.
-			 * The ref needs to be held until the request is
-			 * completed, since the splice case (see
-			 * fuse_try_move_page()) drops the ref after it's
-			 * replaced in the page cache.
-			 */
-			if (!folio)
-				folio =  __readahead_folio(rac);
-
-			folio_pages = folio_nr_pages(folio);
-			if (folio_pages > cur_pages - pages) {
-				/*
-				 * Large folios belonging to fuse will never
-				 * have more pages than max_pages.
-				 */
-				WARN_ON(!pages);
-				break;
-			}
-
-			ap->folios[ap->num_folios] = folio;
-			ap->descs[ap->num_folios].length = folio_size(folio);
-			ap->num_folios++;
-			pages += folio_pages;
-			folio = NULL;
-		}
-		fuse_send_readpages(ia, rac->file, pages << PAGE_SHIFT);
-		nr_pages -= pages;
-	}
-	if (folio) {
-		folio_end_read(folio, false);
-		folio_put(folio);
-	}
+	iomap_readahead(&fuse_iomap_ops, &ctx);
 }
 
 static ssize_t fuse_cache_read_iter(struct kiocb *iocb, struct iov_iter *to)
@@ -2083,7 +2102,7 @@ struct fuse_fill_wb_data {
 	struct fuse_file *ff;
 	unsigned int max_folios;
 	/*
-	 * nr_bytes won't overflow since fuse_writepage_need_send() caps
+	 * nr_bytes won't overflow since fuse_folios_need_send() caps
 	 * wb requests to never exceed fc->max_pages (which has an upper bound
 	 * of U16_MAX).
 	 */
@@ -2128,14 +2147,15 @@ static void fuse_writepages_send(struct inode *inode,
 	spin_unlock(&fi->lock);
 }
 
-static bool fuse_writepage_need_send(struct fuse_conn *fc, loff_t pos,
-				     unsigned len, struct fuse_args_pages *ap,
-				     struct fuse_fill_wb_data *data)
+static bool fuse_folios_need_send(struct fuse_conn *fc, loff_t pos,
+				  unsigned len, struct fuse_args_pages *ap,
+				  unsigned cur_bytes, bool write)
 {
 	struct folio *prev_folio;
 	struct fuse_folio_desc prev_desc;
-	unsigned bytes = data->nr_bytes + len;
+	unsigned bytes = cur_bytes + len;
 	loff_t prev_pos;
+	size_t max_bytes = write ? fc->max_write : fc->max_read;
 
 	WARN_ON(!ap->num_folios);
 
@@ -2143,8 +2163,7 @@ static bool fuse_writepage_need_send(struct fuse_conn *fc, loff_t pos,
 	if ((bytes + PAGE_SIZE - 1) >> PAGE_SHIFT > fc->max_pages)
 		return true;
 
-	/* Reached max write bytes */
-	if (bytes > fc->max_write)
+	if (bytes > max_bytes)
 		return true;
 
 	/* Discontinuity */
@@ -2154,11 +2173,6 @@ static bool fuse_writepage_need_send(struct fuse_conn *fc, loff_t pos,
 	if (prev_pos != pos)
 		return true;
 
-	/* Need to grow the pages array?  If so, did the expansion fail? */
-	if (ap->num_folios == data->max_folios &&
-	    !fuse_pages_realloc(data, fc->max_pages))
-		return true;
-
 	return false;
 }
 
@@ -2182,10 +2196,24 @@ static ssize_t fuse_iomap_writeback_range(struct iomap_writepage_ctx *wpc,
 			return -EIO;
 	}
 
-	if (wpa && fuse_writepage_need_send(fc, pos, len, ap, data)) {
-		fuse_writepages_send(inode, data);
-		data->wpa = NULL;
-		data->nr_bytes = 0;
+	if (wpa) {
+		bool send = fuse_folios_need_send(fc, pos, len, ap,
+						  data->nr_bytes, true);
+
+		if (!send) {
+			/*
+			 * Need to grow the pages array?  If so, did the
+			 * expansion fail?
+			 */
+			send = (ap->num_folios == data->max_folios) &&
+				!fuse_pages_realloc(data, fc->max_pages);
+		}
+
+		if (send) {
+			fuse_writepages_send(inode, data);
+			data->wpa = NULL;
+			data->nr_bytes = 0;
+		}
 	}
 
 	if (data->wpa == NULL) {
-- 
2.47.3

