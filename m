Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EDE302CD0
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268482; cv=none; b=kUAf9yvBG7daxhCyTP+QtE5/vJ+mlg1f14awflslWCGCCjRG3ECMyVbabgBjdHC9VWZGcY+tJRyCOnozXqDpGoIqTN6GA0AAzXJ//48mpNBCp9jzlS2CUSfnrPD9djWNpupVmbQLpnhC+9err1lagOfx2nUeQzsmbh7dFSf5iMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268482; c=relaxed/simple;
	bh=/I2SWzcXvlUkl4dzsdwEhOqXgULSh4KVorXOxq8r2O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/Hb24dubs3fAha4R4GQarUNq+W3ijPuQG65CjVW/2TToMjT7t8QPvf6dcGcSgedFIg7mroleAyC5oLpLET4OJY4Q0hkdS3Mcn66gjLV4DFauIQu7//hppn2rb6hydTQwzraQ4BbhcSjT1cm4F9oWmfXayH2zRmdYAVbZ/2KgmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvQwj4Oj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvQwj4Oj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
	b=ZvQwj4OjPCnBsHzO2XNsfXhjr8t6N73pOSSwJJVFdzSmD2CU2uOsj9XIGtIUEV5ChzLTb2
	jJ46/gSt+oWoA+WVD+IKX0jP16o2h6gKT7Tp3ouKJB4duOCV/PGYVZwbVfiGgCjuVTh/Nl
	UFVAFNjPVvJ2c+qyLVtkfcTWCIMAZvk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-NTYbxtcDPQqPzNyvi05Alw-1; Wed, 18 Jun 2025 13:41:16 -0400
X-MC-Unique: NTYbxtcDPQqPzNyvi05Alw-1
X-Mimecast-MFC-AGG-ID: NTYbxtcDPQqPzNyvi05Alw_1750268474
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d290d542so43198725e9.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268474; x=1750873274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgDxyojJlL5XcnaJgd1JoaTm/pUk71nf1V9W9yKY0aE=;
        b=sKASzScUTNbHyUpaycoESQtBP5+eF5Gv9VywKWQYrB3qRFuR7thfWdabjr+8y6l6Zh
         r6fHikTt7gwQRQSPX+LLGxUI8aCgMq3YblNDLbCC7H5hKxOMthnpDsQQMzG8Et2/VclS
         ju1DOBxDFiJzS9qUdebBCM8K70ULGvpLJxPzsnxTs50zfQtYZP/6U/5ikH5Z4jO0hLCP
         QzL+DYbWcqqrjtd5Ut1eeZpZOc/R88WI7eCqPelA558BwNRQT+63Glon+SOGduGGBAP1
         R5cCmpVOEico66TgKg8xnAKUHa+bBKhLTfzPOZu7FAzoPrb37kXuaurPv/R0yYk4iyKi
         M2PA==
X-Forwarded-Encrypted: i=1; AJvYcCWdEDV/EMed9MGRInNPxMjMFZ/AbeiZF0U6i6M0oZymqEM6iQk37mCTYzUWjONjLymNsT4w5mXNy1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjJOWNal+j3ZCxwseUcf2mkdtvJTdivZnP97TDVav4Tih/+FE/
	MipzHBPu71A+nkSqB7qR5B1gPRCFi0z4vjyRX930b44E0W5+l3/xp7HhwuKB7cTU+7OU4Qa/IOk
	bg3Q+hc5Ox+I92fOKBbU2ev5Spn+ZzK7huUTTtjjmlRHCnefWVbP9DtJWoEmLKA==
X-Gm-Gg: ASbGnctHcp7EjMPl1C5NDveVUZJknmr2d5m6YOw6FQ/FMM1cdja3hkbKwcsB7y7OCpH
	Z+FHaN0YHOfyupLGB4+l3i087mugT3GVlQTccC+7yC23o3BEn2RN0LggDGGnzTZ+t4lVtqfzCMD
	l3bTg60nHddz5PRcWY4/mAR3GAzZE8zxD8FrGI63C33aRmuisiiaOL8PrfmzlfezUIJAroCKZdF
	xCWaExwQi1bQpZbhLxPEDHC+Yfp1EiNpPMCYD4um3OkaEhHuSCMp6Nb09ueghWDRdQPSLsWE3TF
	uWB25n0Vc/YT7tVAIHZdAMXmZn28LjscBhKbysNAclDhqdZO/EA3+Nckn0NRMTTf4hxUkcHXggR
	x00b1Sw==
X-Received: by 2002:a05:600c:3e19:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4533ca66cd0mr176797535e9.12.1750268474468;
        Wed, 18 Jun 2025 10:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIk5j0XUOc2qfzy9nY3G7Nge7jrVSGi6o08YDSv4Mte+xl8dtPQDJlCzuSsfiSc9/ShViabA==
X-Received: by 2002:a05:600c:3e19:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4533ca66cd0mr176797145e9.12.1750268473925;
        Wed, 18 Jun 2025 10:41:13 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e993c95sm3729315e9.26.2025.06.18.10.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:13 -0700 (PDT)
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
Subject: [PATCH RFC 21/29] mm: rename PG_isolated to PG_movable_ops_isolated
Date: Wed, 18 Jun 2025 19:40:04 +0200
Message-ID: <20250618174014.1168640-22-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
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
index 86d671a520e91..809e4395cadfc 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1051,7 +1051,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 		if (!PageLRU(page)) {
 			/* Isolation will grab the page lock. */
 			if (unlikely(page_has_movable_ops(page)) &&
-					!PageIsolated(page)) {
+			    !PageMovableOpsIsolated(page)) {
 				if (locked) {
 					unlock_page_lruvec_irqrestore(locked, flags);
 					locked = NULL;
diff --git a/mm/migrate.c b/mm/migrate.c
index a36030de94f30..f87a998b696e2 100644
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

