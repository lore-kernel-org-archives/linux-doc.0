Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691D2F0C5B
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758066642; cv=none; b=m2JwE0YpiPmcVF9989BNh02NmQucwSWKCcqgSUcM0R0894/GHj2dDlMGyANYb/JylDeell44jB5sUKhNG4eumceppGqMW7BRsoGHlP5XDWGC3QfiW+2PXAtV0pKK6neJ3O6NY43iQcR+qBNwH8mC7YRsJFwJ1xMzlxZ6dd7mVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758066642; c=relaxed/simple;
	bh=VGunh0uENs1oKVEipOlQeeSZnl9YmLScA2w1/AQ6cfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQH8nrf46cL8cU9wLZJdmepR7aznW/CWoyim+fTsyxV1kXV11gmuG1MJmXgSXGTL2C17TfSiUhXCcbaSPDXt69OmPvQjDqqiuEraiKTwemh2N9+TPUtqLOdkUlFb6gv7gFkjz9+qCdyrKUn2trKy5Wypk3+weSs38DTF2YB5Nd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4xui5Z6; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4xui5Z6"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b54c707374fso2086764a12.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758066640; x=1758671440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gu5+EirSaOm4rVQJq+asKnmescHkhWbNcqUv5AEv4JM=;
        b=f4xui5Z6Bex2u4OM8MAMuqRy+WEX6XuktJZz2qoG1L1o9d0khx92oQDknljPYOWYtu
         2JwoR58f2H2aSzlF/Q6dmOQqJ0hh0Y0Udjm3DVaUq4rFhEcXWoxOuOLMbXMstuOT07jO
         Oap5wNgYzI+B9hwqZFgk2zAWFWG+ggdgCngdUtJAVgzn2W8aXOTDDsUgTYIThou9bRJb
         Szn76SKjd0+/cjnRjNabDjIW4plVbEErMocYrOKlX/TeF1xfTosl1SB032YzHr52nxUF
         b2CjNyGPc820G3fzqNkvkvkw4EV3PMF6mIT1xZOC8aExYSjtVK5/SqKK3h4D/eISD3n6
         ys2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758066640; x=1758671440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gu5+EirSaOm4rVQJq+asKnmescHkhWbNcqUv5AEv4JM=;
        b=WNft0SMnC2gIrD0z0Xc0KNq+QVgF48M83HrcXhjGqANDT1h609YkxVhjZ/jNXpPHcZ
         0/aASY+CU2VVHkICnfHuZdcq5iZfBqV1v+csIWw+ADKkDI+ZXSxHlRbcCanEgDppMo2x
         KIcS7CBcriZ0Ehe1kG+6bP7Amh25wpNy8JEaZpgddNwvNDScJrKq+M5H6bAUrth7Vp0K
         AI/cmTvxlOjGGC1m2cp/8MyQasEjBK9N2uWgg2DTyRSJ7MEH6iM2q1tb1PFrUBjRGubH
         +5Yp+cHBjEXbygVRm1KHGqWE+ID+u6EbQ/i7+abdWqmJVg47QAv2YGaXXgkXdLNRq21r
         GyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvHmczpPAu1DDTmb0zF2qXFluSolj8rLCwqbvLsE1TKjgOrntxktMhe+8MQo7c9VcFOrHPzZiXpug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAFoMpmOy7M+SR0kQT6AZ8L0XuwepARF5oyqbaRM3IOetQb8i
	yeRJXQfw19UgHK+5Qyp/pdhPUvjxx5qrAyQYz9XAJgW0jPesJ/EdKi/o
X-Gm-Gg: ASbGnctg7aF2KRdfx+x7lcujD1VuUq9hB8AJv3eGDYsidXH5mAC0EPTNE4afaBigXi4
	5EFnx6Kjy1XzHcCHO7PD1zcRm8wbK+9jsR3+nYsDNenr2sP+yu2ByCj+FxhU2OwEZayVeilO1vJ
	GMDF92S7OPjHSqkSygjVhNlASzYXqu8yDMgYZnACUZhPhGpO1LP2gk/NJHqhPX4kI3rTHJycIJ3
	6jfIVZCnci4wsR79Z8FYGBN4tPEoZhZlha5XLAMzoKrd2E8AEL6fCw92sSy1h8RTam17UbFa8Zo
	sOVMW5X1//P6mkx3yR1/mc9PgY9PeDWIZDx1k7EejZ3fD2Pg4pnwArS9g/NTR9ncX8xeRe7dIaQ
	IdF0zNZVmtswFRep3yKclwUiogCdDDcdOFeQvqSRbdgz2dWBNfQ==
X-Google-Smtp-Source: AGHT+IHXWaeobMccRHFmyjLsVkTTEzUvEQdZmGHGgnJY3NdcpQ/VkaAqzQfWkHRXLscEGvW5AibjWQ==
X-Received: by 2002:a17:903:11cc:b0:262:661d:eb1d with SMTP id d9443c01a7336-268118b9516mr1315115ad.1.1758066639177;
        Tue, 16 Sep 2025 16:50:39 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:55::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2631ee2ceb2sm100151495ad.141.2025.09.16.16.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 16:50:38 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 08/15] iomap: add public start/finish folio read helpers
Date: Tue, 16 Sep 2025 16:44:18 -0700
Message-ID: <20250916234425.1274735-9-joannelkoong@gmail.com>
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
index 587bbdbd24bc..379438970347 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -317,9 +317,20 @@ static int iomap_read_inline_data(const struct iomap_iter *iter,
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
@@ -339,7 +350,9 @@ static void iomap_finish_folio_read(struct folio *folio, size_t off,
 	if (finished)
 		folio_end_read(folio, uptodate);
 }
+EXPORT_SYMBOL_GPL(iomap_finish_folio_read);
 
+#ifdef CONFIG_BLOCK
 static void iomap_read_end_io(struct bio *bio)
 {
 	int error = blk_status_to_errno(bio->bi_status);
@@ -369,17 +382,12 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
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
index 73dceabc21c8..0938c4a57f4c 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -467,6 +467,9 @@ ssize_t iomap_add_to_ioend(struct iomap_writepage_ctx *wpc, struct folio *folio,
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

