Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADBF28FA9E
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288488; cv=none; b=Vw3+9CaGfx/Yi0niaEC6Wfl/H8tzM+eQwaGdNLy0RStnThaCrvKAo72DKjZLhWgn7DWEl/aso88yQhWE3kt0RXDQ9UeIXwXc7VwmR+TGve00/SK1huld/m2ugmp7A60pHAkdSsG1cOUgNJyBx54dwbKIZM5kj5d5tYjOqFnm61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288488; c=relaxed/simple;
	bh=spRVtsrXQeSiPctpyfXJIwnWB6OKPlVJ51M2oKx7H3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6W09ToBccjBGI7lEtA81ckcHtC9SUlJpZjBzj4r18vi8uVO0qZCciigRxg5UYtZm8vNIATGuo+K4+fdXvsZPLlmU9XQ0bbIPBIJ54+Ho+ITT8OqLraePfB6Gw3k9mgC1ugwExbdkehHdztVTa3Nd4k7SmBzxkVhbXDmdMTRZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eGiAqU4n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGiAqU4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
	b=eGiAqU4nGhB3vNjyJcZCfq0EqyTfAYGSZatgCzLgtl3sGsA2clz0dOIgM5v6Dw3SBeyHJ1
	qzytgQUMGuaBEv0cOqYz/T3XC6iaBP2Rx4fnYaF1YsajLdu1Zt/mDGjKZOzpTssq/1bt6u
	Pnm819RwkYk/54NRQpuinoCM/TLxRuQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-X2ojDlNwPoi8tgRN8Crrpg-1; Mon, 30 Jun 2025 09:01:20 -0400
X-MC-Unique: X2ojDlNwPoi8tgRN8Crrpg-1
X-Mimecast-MFC-AGG-ID: X2ojDlNwPoi8tgRN8Crrpg_1751288478
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso1305796f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288478; x=1751893278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh556eqkqkK5IlF5dOoZ8tKW5iYbjU9GjHiIRIfOQPo=;
        b=RIRUacacZ4J5zgfZwsdiObfdnAJZNhKXaOafwZGZTK+PnUmPNfnoPrHaWXDJJWHkO/
         oPLFQMUjvRDJQTY2JU3LUdCwXlSV7und2o3kg+17vI83sJIrPXjvME9yIIJNu14pVfc9
         5pD9pmWpj3TYQUDCWRaUHG3y1a2k8lGSKDPgqbEeu/C1wG1Eyel/4tPqkQL4nJpIks8x
         8bmQAwmSt8APMZZSf1hBsYDzH8XL7Tx+lyOPz4AKT6pNcAmd8YBUjDl9bb3zLbjtqrut
         iJaCkgmHZjGuKSD73tc1rMgmOxvTG4r9/WL06UR7cx7+w11jDy8ANWmlNzwlB2Yj7nwo
         SpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuIkj3mj8rB+OeCAjwTWMX1wdFiTJN3bW/3T1PCbOTjQmPg/jX2nxXTqLN7LwDPOdR+43dmijerTg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3Q6g5K0UAAxrzZYlyJJX5uQkUypN/1lcXteZzvpYHDk2VqEZ
	iaMqRapwNswCk2RRt+BmMK2ifqi5EUpH2GOCDYndZof3FGaRwOG2twVoB7d0Xxp3ly4lFXX3vSg
	XbE33MtsswWn6ZgicyeIifOPySDiVyz8IFLJiTT+qv/tnGef95omQg5qA6lzjCQ==
X-Gm-Gg: ASbGncvNCBBwaA6nzh56UJIigYIJ+R6DblbqMeo6v0e/WuXb/D6DSc3Z8dyf9yWi4p/
	daUWtgriGbe6EXKqwhhah3el6p/zpZOG5PVKNEhIUQ9atg28D04X8sTyMi8fkA6QdiMm4F2M5ZG
	1Ba0dy8FlFO/ufIlGfmJtGjftq963DtaXa1hJSgktTvBsqVZ0WYBxEPqWQ4+/mqgOSdd2Ukonea
	8H/kaDhpVlluIcWuwD7FZujk6bvopaz97n7AC4vDHbWrfql6A8gz0RaRDC2BdbgUd0D0uO4BUGq
	U2qOrXbNkk2G+gb6o69m7B0KIZrcpIRQQniSimE5KFC050RrNwMAucMN4ojCLZ0BtO0HQXUEY5b
	bgWIy7pQ=
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628962f8f.48.1751288477126;
        Mon, 30 Jun 2025 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9r1p0u/0kcCjG+nghTpHrdk2mNLfE9z/HI6liANtRmtIL3dMCa2Pbf5hTgLV/B0o5eULaw==
X-Received: by 2002:a05:6000:2112:b0:3a5:298a:3207 with SMTP id ffacd0b85a97d-3a8ffadfademr8628767f8f.48.1751288474943;
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52a35sm10528754f8f.57.2025.06.30.06.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:14 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v1 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Mon, 30 Jun 2025 15:00:02 +0200
Message-ID: <20250630130011.330477-22-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's rename the flag to make it clearer where it applies (not folios
...).

While at it, define the flag only with CONFIG_MIGRATION.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 16 +++++++++++-----
 mm/compaction.c            |  2 +-
 mm/migrate.c               | 14 +++++++-------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 016a6e6fa428a..aa48b05536bca 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -167,10 +167,9 @@ enum pageflags {
 	/* Remapped by swiotlb-xen. */
 	PG_xen_remapped = PG_owner_priv_1,
 
-	/* non-lru isolated movable page */
-	PG_isolated = PG_reclaim,
-
 #ifdef CONFIG_MIGRATION
+	/* movable_ops page that is isolated for migration */
+	PG_movable_ops_isolated = PG_reclaim,
 	/* this is a movable_ops page (for selected typed pages only) */
 	PG_movable_ops = PG_uptodate,
 #endif
@@ -1126,8 +1125,6 @@ static inline bool folio_contain_hwpoisoned_page(struct folio *folio)
 
 bool is_free_buddy_page(const struct page *page);
 
-PAGEFLAG(Isolated, isolated, PF_ANY);
-
 #ifdef CONFIG_MIGRATION
 /*
  * This page is migratable through movable_ops (for selected typed pages
@@ -1146,8 +1143,17 @@ PAGEFLAG(Isolated, isolated, PF_ANY);
  * page_has_movable_ops() instead.
  */
 PAGEFLAG(MovableOps, movable_ops, PF_NO_TAIL);
+/*
+ * A movable_ops page has this flag set while it is isolated for migration.
+ * This flag primarily protects against concurrent migration attempts.
+ *
+ * Once migration ended (success or failure), the flag is cleared. The
+ * flag is managed by the migration core.
+ */
+PAGEFLAG(MovableOpsIsolated, movable_ops_isolated, PF_NO_TAIL);
 #else
 PAGEFLAG_FALSE(MovableOps, movable_ops);
+PAGEFLAG_FALSE(MovableOpsIsolated, movable_ops_isolated);
 #endif
 
 /**
diff --git a/mm/compaction.c b/mm/compaction.c
index 349f4ea0ec3e5..bf021b31c7ece 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1051,7 +1051,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!PageLRU(page)) {
 			/* Isolation code will deal with any races. */
 			if (unlikely(page_has_movable_ops(page)) &&
-					!PageIsolated(page)) {
+			    !PageMovableOpsIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
diff --git a/mm/migrate.c b/mm/migrate.c
index c6c9998014ec8..62a3ee590b245 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -135,7 +135,7 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_putfolio;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	if (PageIsolated(page))
+	if (PageMovableOpsIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -146,8 +146,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
-	SetPageIsolated(page);
+	VM_WARN_ON_ONCE_PAGE(PageMovableOpsIsolated(page), page);
+	SetPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -177,10 +177,10 @@ static void putback_movable_ops_page(struct page *page)
 	struct folio *folio = page_folio(page);
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(page), page);
 	folio_lock(folio);
 	page_movable_ops(page)->putback_page(page);
-	ClearPageIsolated(page);
+	ClearPageMovableOpsIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
 }
@@ -216,10 +216,10 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 	int rc = MIGRATEPAGE_SUCCESS;
 
 	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(src), src);
-	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	VM_WARN_ON_ONCE_PAGE(!PageMovableOpsIsolated(src), src);
 	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
-		ClearPageIsolated(src);
+		ClearPageMovableOpsIsolated(src);
 	return rc;
 }
 
-- 
2.49.0

