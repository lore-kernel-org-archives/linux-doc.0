Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FCD1F4165
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587646; cv=none; b=JNzzgu0oCrKdrwerhadqHI/MqpdRb1427Ij/wv7jEIhT7mmNHmvZbIuKoApLWv/BKXkMJgFzlLZy7xeWTsgVpIdnvahekOn8eIp05mzpx566+XWWkwhXNH4ZnQMTSoN3ntzMAOCIMk1uVzgHPA32e3fpJplpXQYlzCJ0vqc8Iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587646; c=relaxed/simple;
	bh=wL9lZimimYPepUkw6uokO76yAdo/rrFpXRGxdT20nX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GOYUTn39e3Wl1OKOsZcjiaiJQUJ9iznA/ZyAhrkfs1uKojAu4oL+fmQ4ySNrf+yYKxAVa0KNNpcHCR1owLpqsYMoSs9ZBWWk+/gSf0m3Tvaw4aScwCImnl24k2UPswIYkf2VceNvq5LhMPj8rK92qka9rWLGLPRxrtZfBKZTw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCcGPBPf; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCcGPBPf"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b555ed30c1cso425030a12.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587644; x=1759192444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5LoytNdOZjWYJW/+eSct1yfmQv94J0ZLKj78CJDynY=;
        b=aCcGPBPfMr2uG6WKESyUGdPsgiiIahPLQgBbCQOS7q9zHQsyIDd9McjV8lgKSENFq/
         7OdYCJglsYyXBIjxndB+wk/mlX7PBguZB7P5WmklHea0OB1rdk+nVb+Dgw6AaEIS6esh
         7g/COTeCpOdU8UeGgYtRj43Kl5PDdaGtyzJ91fTVbxLdBhyJmE7H9/Ah5+j9O5n/hNDY
         I8L93nQieGJ+FacpgRM0pbgPFkthIQGUSeRljqtautCI++B4VAZPNPSKTagylzjAsZOs
         WPPqnZUKSYsl/p7cbFPuEKXoAfJtqtemmYkwpm805L8Ajk0S9ycxEWnhWnePtM8eSSMP
         KpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587644; x=1759192444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5LoytNdOZjWYJW/+eSct1yfmQv94J0ZLKj78CJDynY=;
        b=l3xLphihzOf71Ye64hYSA7aJe2eHTRmI3oFRTTG+lPFGP+SBda82Uxc2a1gpUKmHR7
         /xBwBlvE/S5TSNgC+b0NgDLmnR4ZMd23xz5fwGEaGGh2agg1xzwcb+rkM/gVDnGOGArv
         hA4LiDqgsW+4PUNImAa7a8b5IYdcQ9s+NLDmEy4vT/isGxahqZhZdFfHlHH2liopaPI0
         g+dWdQQdmypKbzOXlcjtkgMgqSY7BklhftVGPjTnmVgIpJw6BahQhGdMjXZtusvPOYw+
         S0kIHhVCqkMQOM4sPKZnDJGzeReCU/WBpoLeSkEyHdxhgO44w9s3KwDbuZHgXfhx2/rg
         Nbgw==
X-Forwarded-Encrypted: i=1; AJvYcCWGO4hrXAkS2af0m1GDG9omeqljMF/KmumuWc4sBeS/d82RCTZ+j23a3m3xQOfzkLCv4banLxjxCbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwcubczb6+RxqScragmXGJf3oGLLDA2mcETekvQfrYeCM/FvfU
	ev3xczS8rVjt1/6FyZnDMeyB9Vw7yK2EqoS1+zmk5fjou+KQ4kY/Npyy
X-Gm-Gg: ASbGncts2biBcmPkXqnC4GPy4M/pUZcvoPN8w09qA37ZnOZyEYZnwc4ZgMckTCUoM7I
	jeDg/0Pvb9jQPN0lC6I8+STyNWpxD8BLs2j0PTYeZXFcDXkCiGswIUCtKZPkhukDn2ND17kadti
	RMiqz6H6YBT3s/rv3gXZsl4mqW0+246jbV7+pV0tPyUJCdddhnpGodHMl2GZt61PXaYDYOGEE7+
	iasu580GMbJCwyIzxTDbw602xyjJIGNBizuJRpcr1sntB0nDL000pHJFZ8H8QT5KO0jzLcQz/qZ
	nEmmp9WRSO2NNbMEQakfyOqZmYhHhS5atvMaP5fxMEehylCIh3d47wiXxGBdcwwX0IdUDn35QRl
	nlCZ4bmT3/1KuWVL6HF4bFh2H621PCgpwXEmQyBPTIDl/jXVnbQ==
X-Google-Smtp-Source: AGHT+IE2rDd9Yyv5lah4zvV6w6qJu6a1A3PLSQl9h6wVx4RGpLkLw8rukfKuDkaefPlT+C3jXqTA3w==
X-Received: by 2002:a17:903:2ac5:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-27cc22efd33mr7650465ad.19.1758587643804;
        Mon, 22 Sep 2025 17:34:03 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:41::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698030ee20sm145121615ad.109.2025.09.22.17.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:34:03 -0700 (PDT)
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
Subject: [PATCH v4 08/15] iomap: add public start/finish folio read helpers
Date: Mon, 22 Sep 2025 17:23:46 -0700
Message-ID: <20250923002353.2961514-9-joannelkoong@gmail.com>
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

Move ifs read_bytes_pending increment logic into a separate helper,
iomap_start_folio_read(), which will be needed later on by
caller-provided read callbacks (added in a later commit) for
read/readahead. This is the counterpart to the currently existing
iomap_finish_folio_read().

Make iomap_start_folio_read() and iomap_finish_folio_read() publicly
accessible. These need to be accessible in order for caller-provided
read callbacks to use.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/iomap/buffered-io.c | 26 +++++++++++++++++---------
 include/linux/iomap.h  |  3 +++
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 34df1cddf65c..469079524208 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -327,9 +327,20 @@ static int iomap_read_inline_data(const struct iomap_iter *iter,
 	return 0;
 }
 
-#ifdef CONFIG_BLOCK
-static void iomap_finish_folio_read(struct folio *folio, size_t off,
-		size_t len, int error)
+void iomap_start_folio_read(struct folio *folio, size_t len)
+{
+	struct iomap_folio_state *ifs = folio->private;
+
+	if (ifs) {
+		spin_lock_irq(&ifs->state_lock);
+		ifs->read_bytes_pending += len;
+		spin_unlock_irq(&ifs->state_lock);
+	}
+}
+EXPORT_SYMBOL_GPL(iomap_start_folio_read);
+
+void iomap_finish_folio_read(struct folio *folio, size_t off, size_t len,
+		int error)
 {
 	struct iomap_folio_state *ifs = folio->private;
 	bool uptodate = !error;
@@ -349,7 +360,9 @@ static void iomap_finish_folio_read(struct folio *folio, size_t off,
 	if (finished)
 		folio_end_read(folio, uptodate);
 }
+EXPORT_SYMBOL_GPL(iomap_finish_folio_read);
 
+#ifdef CONFIG_BLOCK
 static void iomap_read_end_io(struct bio *bio)
 {
 	int error = blk_status_to_errno(bio->bi_status);
@@ -379,17 +392,12 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 {
 	struct folio *folio = ctx->cur_folio;
 	const struct iomap *iomap = &iter->iomap;
-	struct iomap_folio_state *ifs = folio->private;
 	size_t poff = offset_in_folio(folio, pos);
 	loff_t length = iomap_length(iter);
 	sector_t sector;
 	struct bio *bio = ctx->read_ctx;
 
-	if (ifs) {
-		spin_lock_irq(&ifs->state_lock);
-		ifs->read_bytes_pending += plen;
-		spin_unlock_irq(&ifs->state_lock);
-	}
+	iomap_start_folio_read(folio, plen);
 
 	sector = iomap_sector(iomap, pos);
 	if (!bio || bio_end_sector(bio) != sector ||
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 4469b2318b08..edc7b3682903 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -465,6 +465,9 @@ ssize_t iomap_add_to_ioend(struct iomap_writepage_ctx *wpc, struct folio *folio,
 		loff_t pos, loff_t end_pos, unsigned int dirty_len);
 int iomap_ioend_writeback_submit(struct iomap_writepage_ctx *wpc, int error);
 
+void iomap_start_folio_read(struct folio *folio, size_t len);
+void iomap_finish_folio_read(struct folio *folio, size_t off, size_t len,
+		int error);
 void iomap_start_folio_write(struct inode *inode, struct folio *folio,
 		size_t len);
 void iomap_finish_folio_write(struct inode *inode, struct folio *folio,
-- 
2.47.3

