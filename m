Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A07289E3D
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288443; cv=none; b=tzExedJfOoUCMtjJBKEhjdL4G6OfReyz27GvWHc8IAg1O9zKO4hElJCxsssYhfc5Ik+whUQV8Uj6mHa814j6HWbKUcFGMM5F4n5kGKbdNeIOqQJdrZEJ44dyX6rwjtnOU4wCsg1kN7xHrYcanELpTlVxSo1pgppWDa8XZRlqrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288443; c=relaxed/simple;
	bh=VUTFI3+8sn+Bo7jfgsxfJB7XgkCxxsX8WPCDC/hYNNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3vuylfHgyRGTQgd6huFN3d3oqEyj6JTWrD9pEKpnvcMfpmW720MftPeOD/QcePFN7fY/MWsoOQBni2PccQTopgA5CydJNRoju5OTACFpCb1Wc8hyWDvxfygu4T/emOpCHlYFk+b0Fn4tq4y7wQeXZIe0md1AuI0DswfzrF/JsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GAwpKN63; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GAwpKN63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
	b=GAwpKN63xyOF9dPCYsoU3XtJA5ZbON68rSCLHgtQcUo3pSWFKOx3QVCQaCxWIIZZl4IxES
	9cB6S/P0RlKn+HKc3OH98Mx7gl8ArDz6h6e6kxzkjNay3Jprs6Uj9MLQ3ORsfZmByiLznr
	Wr6iAzhUCekWL0auPs2XSmXibEJtM2I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-kr_9wh-xNjKmRd5H81j4VQ-1; Mon, 30 Jun 2025 09:00:38 -0400
X-MC-Unique: kr_9wh-xNjKmRd5H81j4VQ-1
X-Mimecast-MFC-AGG-ID: kr_9wh-xNjKmRd5H81j4VQ_1751288437
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso25978095e9.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288437; x=1751893237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9VQLTS9DDIxmZmB+neo2FcUhAnDYm//4qg3iAtoZVM=;
        b=s4M0LAHWABj+jQcOQrzLFKn0MvgzBoa8NGSb8z/NqYaqx3cp552bIsRoHCbaP+BH32
         CDqfXKLWg5rRjNEDnTlI5xyC6lwQR/1HXfdF4qENEttjUeYYGaY+3x67YTgeDzmh4fVG
         S5fKQBHGHrOBZflGRAPMQ/InPOEo0eiSr/9saww3uy0ZwqVruBRRgDOOekczyUYmOClF
         rgL6hykHsb5Tz9ritAexZYLlP7z3R/SdWPRT0hiBUhtlf1mFp1vhTNHj1h4eT0FOrlrq
         /Tg9p1Wf4iBkPLePqrFM87Ekeewzac0NzJbbE/YMOSbKH+K6l3stMIxGI2iVOqBmlsx2
         mbfg==
X-Forwarded-Encrypted: i=1; AJvYcCW+TL5ejySwgCWq+hcP5FKOBjFsSX/jkQOco/Dks6zwfn42cTO4Bsa8FARUm3ApgXc8vmGZNBENBpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygszSEf3+HD7IahfVOGJcxdtWcc/b04OTIVHrv//cjqnpNY425
	/Bk7rUtVECvCGNvIUPQzdpN6izfEPpRmWRdMsGd/jGhe5S2rdl+BJgl8KsN5yXmUB//GfZG3oPE
	wAUgs0S+4k9XjPjpEn2u30+YdHxubf2FdSK5X22esbD74HCP58dA/DHivyJRfTg==
X-Gm-Gg: ASbGnct/5zwyo0ArCEYvaP9N2Agne82yGv87w4EJ246x91LMm0ytfVd9dg+EXiOfQpv
	nRhcRE5mSE2t19cp6sO/mhiFtywU7LPxMinCmMXBjVl9I3wihfvj2chQibBI8pSRKB7bagvlECw
	ITTdehlxdg34bYoBgzVpxuhK16HU04wcUNuUxJs2aZ0+nfeIfLqPEDUG/vmDRWOT0M11Uingwso
	RNbuPpfjU8o4BiVXB6Zl7l3acQjY6nzmfiY4sXJBw1qaiD8qW5UGZ5QmcZlzzPtceJPZ9CAjlWF
	KmDaeHZibDIqmFrgmklYsWHaobL6fNeOqw5sy5OnDZ5QBzCyoSua9YtHibw2BTxjiiES/qVU6VP
	DEbFTORU=
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116867445e9.4.1751288436047;
        Mon, 30 Jun 2025 06:00:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcKPudq4hAX3ZUQbBxj7a9OFNaExkIT0GfF2UdhGugpVpmsHfKtz6PBCtjyRSKpLMaHzgIYg==
X-Received: by 2002:a05:600c:5251:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-4538f2c6a5bmr116864905e9.4.1751288433794;
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136741305e9.27.2025.06.30.06.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:33 -0700 (PDT)
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
Subject: [PATCH v1 07/29] mm/migrate: rename isolate_movable_page() to isolate_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:48 +0200
Message-ID: <20250630130011.330477-8-david@redhat.com>
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

... and start moving back to per-page things that will absolutely not be
folio things in the future. Add documentation and a comment that the
remaining folio stuff (lock, refcount) will have to be reworked as well.

While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
it gracefully (relevant with further changes), and convert a
WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().

Note that we will leave anything that needs a rework (lock, refcount,
->lru) to be using folios for now: that perfectly highlights the
problematic bits.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ++--
 mm/compaction.c         |  2 +-
 mm/migrate.c            | 39 +++++++++++++++++++++++++++++----------
 3 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index aaa2114498d6d..c0ec7422837bd 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -69,7 +69,7 @@ int migrate_pages(struct list_head *l, new_folio_t new, free_folio_t free,
 		  unsigned long private, enum migrate_mode mode, int reason,
 		  unsigned int *ret_succeeded);
 struct folio *alloc_migration_target(struct folio *src, unsigned long private);
-bool isolate_movable_page(struct page *page, isolate_mode_t mode);
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode);
 bool isolate_folio_to_list(struct folio *folio, struct list_head *list);
 
 int migrate_huge_page_move_mapping(struct address_space *mapping,
@@ -90,7 +90,7 @@ static inline int migrate_pages(struct list_head *l, new_folio_t new,
 static inline struct folio *alloc_migration_target(struct folio *src,
 		unsigned long private)
 	{ return NULL; }
-static inline bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+static inline bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	{ return false; }
 static inline bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	{ return false; }
diff --git a/mm/compaction.c b/mm/compaction.c
index 3925cb61dbb8f..17455c5a4be05 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1093,7 +1093,7 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 					locked = NULL;
 				}
 
-				if (isolate_movable_page(page, mode)) {
+				if (isolate_movable_ops_page(page, mode)) {
 					folio = page_folio(page);
 					goto isolate_success;
 				}
diff --git a/mm/migrate.c b/mm/migrate.c
index 767f503f08758..d4b4a7eefb6bd 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -51,8 +51,26 @@
 #include "internal.h"
 #include "swap.h"
 
-bool isolate_movable_page(struct page *page, isolate_mode_t mode)
+/**
+ * isolate_movable_ops_page - isolate a movable_ops page for migration
+ * @page: The page.
+ * @mode: The isolation mode.
+ *
+ * Try to isolate a movable_ops page for migration. Will fail if the page is
+ * not a movable_ops page, if the page is already isolated for migration
+ * or if the page was just was released by its owner.
+ *
+ * Once isolated, the page cannot get freed until it is either putback
+ * or migrated.
+ *
+ * Returns true if isolation succeeded, otherwise false.
+ */
+bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 {
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
 	struct folio *folio = folio_get_nontail_page(page);
 	const struct movable_operations *mops;
 
@@ -73,7 +91,7 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
 	 */
-	if (unlikely(!__folio_test_movable(folio)))
+	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
 
 	/*
@@ -90,18 +108,19 @@ bool isolate_movable_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!folio_test_movable(folio) || folio_test_isolated(folio))
+	if (!PageMovable(page) || PageIsolated(page))
 		goto out_no_isolated;
 
-	mops = folio_movable_ops(folio);
-	VM_BUG_ON_FOLIO(!mops, folio);
+	mops = page_movable_ops(page);
+	if (WARN_ON_ONCE(!mops))
+		goto out_no_isolated;
 
-	if (!mops->isolate_page(&folio->page, mode))
+	if (!mops->isolate_page(page, mode))
 		goto out_no_isolated;
 
 	/* Driver shouldn't use the isolated flag */
-	WARN_ON_ONCE(folio_test_isolated(folio));
-	folio_set_isolated(folio);
+	VM_WARN_ON_ONCE_PAGE(PageIsolated(page), page);
+	SetPageIsolated(page);
 	folio_unlock(folio);
 
 	return true;
@@ -175,8 +194,8 @@ bool isolate_folio_to_list(struct folio *folio, struct list_head *list)
 	if (lru)
 		isolated = folio_isolate_lru(folio);
 	else
-		isolated = isolate_movable_page(&folio->page,
-						ISOLATE_UNEVICTABLE);
+		isolated = isolate_movable_ops_page(&folio->page,
+						    ISOLATE_UNEVICTABLE);
 
 	if (!isolated)
 		return false;
-- 
2.49.0

