Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F4EEC8
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208243; cv=none; b=kwPvr63WAkBT89STDtl7zpRNONc4BPSoFvq4Pa68H1tfhOrxo1Gx0CQeCNA4UhIJLIAzzgYT+pHfLiUjAVmabgyXW+jGwhKrYlFFxvzDSKcbmfRnA2ZyhDSh0gXeUBY4vNHXuVOTo+hxayH960lvuLGHrryxJrxliMtZYLHpuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208243; c=relaxed/simple;
	bh=8BnEj4YiBiI0B3sBEJVCvVdqfvxxIc83XX0bcNtcihI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shaXFiYhDzJF37ZJAoyl/0H175+IdYagV3hMa3WtD7RBMaE5+nWTckLFq9TqePbg4boMdHpv/qHMKeko02xpIwDpnoyrb7qtarRzt+oWlKaGUzls7vbc04bKZL3owhlWcMaq3WE3jAH5Vo2hVZac8qV+pfk5S+oSojbvvJWSCGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mEKqbB1c; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mEKqbB1c"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso132128906d6.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208240; x=1736813040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tds7HvhDScwv0+DAQP1llxCN/3UO28LajkOSfhGyREo=;
        b=mEKqbB1cgB3dElr2929/fwcIEzjMQFpILD4nSVafWzJik+kN6cUuMiFmvtj7/yKu8I
         fHpsf4ZBcvhdcqEjKYYJdlL06zJdnYUrhRkKxRB+Y4XDWo8HTaM1GbiR7jGGHuVqTyWR
         y4h5maJh2ErxnZtBieVwJAsw4BFERdUb4i+a2KlaxDS3Ji0RdAOZaERA4We6lV7PGsuv
         nNJr/H57IRjqkmORsdpfVu4Lt+UfvPFhKWfdZQ11ghP+VuJcwQ5U4X21bxzF4EL+VYYH
         sDweP7zLmn92H3Tvgz1U2v9AAsFEbcOOF/L9ec6UgaHwQMv55A/VsoVd386tKmj3my3J
         1XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208240; x=1736813040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tds7HvhDScwv0+DAQP1llxCN/3UO28LajkOSfhGyREo=;
        b=g2PSv+EOTKPTgEok7GwhEqbyjngmSA+U7nupYfzS9a0fswTd2TtGqVjixQR7cesIN2
         CThpoTZZNrog5RYlYW6aaJDJ5e5Xp2Xqih8PnExkoClVQupb8Y3lFsL1mI0AN5Z5Y1qz
         MalFr4VrcIizOQXViFs7SzQAcCnRihW2M+54y3QMe9Y01IG+xfA5x7rInYPN27A8Bnz9
         PLd/LfAV7kdlJsmlnf7aoUT5w+AHNtN7P6yY6G9cozUl7GZB1Vufy/L/p4mLFY/rryk/
         aFmTOfsMkuUpyXE+NYlTXK3hwYX+/CxrrHe6a2OpW1FmSFiHGj1/bbYLEIUFlPLtYDJn
         tD2w==
X-Gm-Message-State: AOJu0YypC+YoesFHYXs1I/5fomZTErZsuyUeux9pyg23MYvgUJscds2C
	zOnNvp59p2GH9hOMD9kk3VuF36ftvOHRk3IYV+CZlettSpUn+FXh07ir0O4y+nY=
X-Gm-Gg: ASbGncsMWVhKOjiOTtc3WVRd6q8SN15HCfDy1ktCNT0UUnfYHx3MooBKRQZO/ZdnwOV
	cedvx8b828Bbk9hTbokfSzHQBxzh+RvfHZnq1W3X8iDwI787t8b1Un6r3Y+6Uub5Mi/rt1BnZrc
	GitSdSw7S92WQye5Uq+xDBc/DW00pdRa1be7dKhMuuMOLO3/1GbXK8XqpBUKsPe1uhR9m6esZG7
	xTtN2JbzZZuYx3Sb6oMyVjgM7L3rZiNRTiHHtVwjsquhAWdF8OJw0KIzPTONqmF03DZqsneouf/
	+ioitwFaLFC2Vr48hC8/PQvT9kChGUW7YhU+SzI5WSDZ
X-Google-Smtp-Source: AGHT+IEehELWmcBbdecL9es36IQOdasnFILqW/uOVVAwd8+bi/x2W25liHS2wXN9vDABgW4tYHvLfg==
X-Received: by 2002:a05:6214:766:b0:6d4:1b2b:c836 with SMTP id 6a1803df08f44-6dd233b7f4cmr1061964726d6.47.1736208240369;
        Mon, 06 Jan 2025 16:04:00 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:04:00 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 5/6] migrate: implement migrate_misplaced_folio_batch
Date: Mon,  6 Jan 2025 19:03:45 -0500
Message-ID: <20250107000346.1338481-6-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A common operation in tiering is to migrate multiple pages at once.
The migrate_misplaced_folio function requires one call for each
individual folio.  Expose a batch-variant of the same call for use
when doing batch migrations.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/migrate.h |  5 +++++
 mm/migrate.c            | 31 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 29919faea2f1..3dfbe7c1cc83 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -145,6 +145,7 @@ const struct movable_operations *page_movable_ops(struct page *page)
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
 int migrate_misplaced_folio(struct folio *folio, int node);
+int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
 #else
 static inline int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node)
@@ -155,6 +156,10 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
 {
 	return -EAGAIN; /* can't migrate now */
 }
+int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
+{
+	return -EAGAIN; /* can't migrate now */
+}
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_MIGRATION
diff --git a/mm/migrate.c b/mm/migrate.c
index ea20d9bc4f40..a751a995f2d9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2705,5 +2705,36 @@ int migrate_misplaced_folio(struct folio *folio, int node)
 	BUG_ON(!list_empty(&migratepages));
 	return nr_remaining ? -EAGAIN : 0;
 }
+
+/*
+ * Batch variant of migrate_misplaced_folio. Attempts to migrate
+ * a folio list to the specified destination.
+ *
+ * Caller is expected to have isolated the folios by calling
+ * migrate_misplaced_folio_prepare(), which will result in an
+ * elevated reference count on the folio.
+ *
+ * This function will un-isolate the folios, dereference them, and
+ * remove them from the list before returning.
+ */
+int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
+{
+	pg_data_t *pgdat = NODE_DATA(node);
+	unsigned int nr_succeeded;
+	int nr_remaining;
+
+	nr_remaining = migrate_pages(folio_list, alloc_misplaced_dst_folio,
+				     NULL, node, MIGRATE_ASYNC,
+				     MR_NUMA_MISPLACED, &nr_succeeded);
+	if (nr_remaining)
+		putback_movable_pages(folio_list);
+
+	if (nr_succeeded) {
+		count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
+		mod_node_page_state(pgdat, PGPROMOTE_SUCCESS, nr_succeeded);
+	}
+	BUG_ON(!list_empty(folio_list));
+	return nr_remaining ? -EAGAIN : 0;
+}
 #endif /* CONFIG_NUMA_BALANCING */
 #endif /* CONFIG_NUMA */
-- 
2.47.1

