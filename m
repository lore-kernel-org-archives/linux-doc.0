Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2F302CB1
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268478; cv=none; b=PVm+u2G6/O24LZ87qYJka6Dg4PcaKY1U0HkNKkSrIdu+2hi0pxwS3aerhJFIbEMfnnrGYIbXSoQ7wvgMSDJHt+YDuX2Q6HLmxKzDMaUL/aeCgXaFMMT7nytqsypiy+EpXO9LPksDuA7ZACdQJ8NTzj2ar3QB3fqkL9nhh6Lli+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268478; c=relaxed/simple;
	bh=mz892AAXYlO5CKl8RE5EQFbQoV+Cb7/Iv0Y/vIRyypU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lI0m/OEI3vYM2Ig8H/RwEQjV9IF4CuTJ/Nih1+oT6aGY+US9HxWduNgxZuudbrj+I+Y1580yudVd7kupeKUTNWoXuk2y7fEbBWyxthyHedATGDK71QuvNBKaeSePt58JR3To6G0et4ah8zenmAAWMwHooSLyqVGcJU/lCQBj+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/WdOcSG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/WdOcSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DzfM28AXUPw/AfYpLS1hZTUERIY8AF/rsj6KIsT8/ZY=;
	b=i/WdOcSGSkLAWDGy1Ear6xM8ZuaGRQf3dCptRUFwaR7FOS3YVx++30GUCASNZhU1tIS7u2
	DVx1tWNOkSCTzUWpdQDNidiSo4n5ONTH4MhcT0p61oldQ/6kv0XR3Rc9yz4p214FYdK7mm
	hwqr+LI98kx2aAw5ArQJvJIaDas5MIg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-YizRudxzNZ-NO1hJOICDMg-1; Wed, 18 Jun 2025 13:41:09 -0400
X-MC-Unique: YizRudxzNZ-NO1hJOICDMg-1
X-Mimecast-MFC-AGG-ID: YizRudxzNZ-NO1hJOICDMg_1750268468
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso37583605e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268468; x=1750873268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzfM28AXUPw/AfYpLS1hZTUERIY8AF/rsj6KIsT8/ZY=;
        b=UVL7x2PQlCQSReElZkr1BNjer6d+yK3TN0XLIUw423PkGPM0dAHx+YSFmDsDKzctB2
         QPJ/1Uu4nJ+N4V2UnAk7w5u79GPxglCTK2+ezUBJI/zZRh92fMAnKzpfWgiLL18NBDc4
         GD8TTaFWHNvKomQYgWorhSNlzMwPh7xBlqhwfePtp+TcoXNHHaKlxgQoNfY5iMlP2UCS
         v9K/71dPcfTX91KNLLv56V0G/vrrwE71lYjJfg3PaZdfxVqI4kXN5DGL06jAFmbwhiXn
         +SFVTlyTN07HrwgoGDjptoOzIYp5Xbyvi7Q+lkdoYWWfAWXE4BcX+Lj3D7072VnfatQ0
         N/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWfQ4Ahb1ChScDTHdyA9OX8gl0kx0wYZ/7xX2Mn3R91/LE2tA3/PcG2hRU7ivY0HMo6ZUuwTH7zM14=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7T87+0GysZzQKjNCXjBularHbCYN5uJx1VCiQWj4Amf4D9P/
	OI8LDCUKsxmFznUmlYEH9zkl7ltSCbDlAiB4YjIeX1h4nivedwNrem4bthIxItLcOr5T/Rwlkg/
	brShyoawY2RGYJxX7h2/G/nEabDkYgAG5SO8EbDqN5Xz8uDGlFp/BCSlBPHN5hg==
X-Gm-Gg: ASbGnctVh9uevu6G4VGx0SuqxyzHK+BNaTH6/rqIU/d0JTHtFz6rp+Gs6N6PDwnGT7M
	V5FNI1TmGb9lgW6IPwjRx8PbuJrNtay+W0o/X0S82DkNn8P0iJK4sub/7JNfpzgRljy8EMi7EdQ
	Z+TQPHl2N2LPHsEzGausSEh4BIZGVE24pEo+TyRiRZ2J5LjH6IlWrHoaQQcO7nVbVnuSgAqO0wd
	Vj+1qm0EVGewK88x1onpsBqm08pQtHKEWhbmfe+pc0I7LMV6awKO27CI0T4fyoH3at3l4L4bYgP
	I7o3VA7+chnrJBa9e2vz9yGenokxDdoXncTqKTPmTPXkp/jmZScW30vgpAV1vMd/Bgq6/3WFz5D
	60Tg4EA==
X-Received: by 2002:a05:600c:820c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-4533caa2186mr184242945e9.17.1750268468359;
        Wed, 18 Jun 2025 10:41:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKEjDqAoZjEM/lQyE0UXotydmkpa81gpxxIPt+zLIqzN6Ot9NSYzqnSxIiiN03uF8vCn5Ghw==
X-Received: by 2002:a05:600c:820c:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-4533caa2186mr184242395e9.17.1750268467893;
        Wed, 18 Jun 2025 10:41:07 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b087b4sm17884528f8f.51.2025.06.18.10.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:07 -0700 (PDT)
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
Subject: [PATCH RFC 19/29] mm: stop storing migration_ops in page->mapping
Date: Wed, 18 Jun 2025 19:40:02 +0200
Message-ID: <20250618174014.1168640-20-david@redhat.com>
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

... instead, look them up statically based on the page type. Maybe in the
future we want a registration interface? At least for now, it can be
easily handled using the two page types that actually support page
migration.

The remaining usage of page->mapping is to flag such pages as actually
being movable (having movable_ops), which we will change next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  2 +-
 include/linux/migrate.h            | 14 ++------------
 include/linux/zsmalloc.h           |  2 ++
 mm/balloon_compaction.c            |  1 -
 mm/compaction.c                    |  5 ++---
 mm/migrate.c                       | 23 +++++++++++++++++++++++
 mm/zpdesc.h                        |  5 ++---
 mm/zsmalloc.c                      |  8 +++-----
 8 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 9bce8e9f5018c..a8a1706cc56f3 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -92,7 +92,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	__SetPageMovable(page, &balloon_mops);
+	__SetPageMovable(page);
 	set_page_private(page, (unsigned long)balloon);
 	list_add(&page->lru, &balloon->pages);
 }
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c575778456f97..64639dab92b91 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -104,23 +104,13 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_COMPACTION
-void __SetPageMovable(struct page *page, const struct movable_operations *ops);
+void __SetPageMovable(struct page *page);
 #else
-static inline void __SetPageMovable(struct page *page,
-		const struct movable_operations *ops)
+static inline void __SetPageMovable(struct page *page)
 {
 }
 #endif
 
-static inline
-const struct movable_operations *page_movable_ops(struct page *page)
-{
-	VM_BUG_ON(!page_has_movable_ops(page));
-
-	return (const struct movable_operations *)
-		((unsigned long)page->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 #ifdef CONFIG_NUMA_BALANCING
 int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
index 13e9cc5490f71..f3ccff2d966cd 100644
--- a/include/linux/zsmalloc.h
+++ b/include/linux/zsmalloc.h
@@ -46,4 +46,6 @@ void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
 void zs_obj_write(struct zs_pool *pool, unsigned long handle,
 		  void *handle_mem, size_t mem_len);
 
+extern const struct movable_operations zsmalloc_mops;
+
 #endif
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index e4f1a122d786b..2a4a649805c11 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -253,6 +253,5 @@ const struct movable_operations balloon_mops = {
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
 };
-EXPORT_SYMBOL_GPL(balloon_mops);
 
 #endif /* CONFIG_BALLOON_COMPACTION */
diff --git a/mm/compaction.c b/mm/compaction.c
index f8b7c09e2e48c..a10f23df9396e 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,11 +114,10 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-void __SetPageMovable(struct page *page, const struct movable_operations *mops)
+void __SetPageMovable(struct page *page)
 {
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	VM_BUG_ON_PAGE((unsigned long)mops & PAGE_MAPPING_MOVABLE, page);
-	page->mapping = (void *)((unsigned long)mops | PAGE_MAPPING_MOVABLE);
+	page->mapping = (void *)(PAGE_MAPPING_MOVABLE);
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 37e722fbfee70..a36030de94f30 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -43,6 +43,8 @@
 #include <linux/sched/sysctl.h>
 #include <linux/memory-tiers.h>
 #include <linux/pagewalk.h>
+#include <linux/balloon_compaction.h>
+#include <linux/zsmalloc.h>
 
 #include <asm/tlbflush.h>
 
@@ -51,6 +53,27 @@
 #include "internal.h"
 #include "swap.h"
 
+static const struct movable_operations *page_movable_ops(struct page *page)
+{
+	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
+
+	/*
+	 * If we enable page migration for a page of a certain type by marking
+	 * it as movable, the page type must be sticky until the page gets freed
+	 * back to the buddy.
+	 */
+#ifdef CONFIG_BALLOON_COMPACTION
+	if (PageOffline(page))
+		/* Only balloon compaction sets PageOffline pages movable. */
+		return &balloon_mops;
+#endif /* CONFIG_BALLOON_COMPACTION */
+#ifdef CONFIG_ZSMALLOC
+	if (PageZsmalloc(page))
+		return &zsmalloc_mops;
+#endif /* CONFIG_ZSMALLOC */
+	return NULL;
+}
+
 /**
  * isolate_movable_ops_page - isolate a movable_ops page for migration
  * @page: The page.
diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 5763f36039736..6855d9e2732d8 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -152,10 +152,9 @@ static inline struct zpdesc *pfn_zpdesc(unsigned long pfn)
 	return page_zpdesc(pfn_to_page(pfn));
 }
 
-static inline void __zpdesc_set_movable(struct zpdesc *zpdesc,
-					const struct movable_operations *mops)
+static inline void __zpdesc_set_movable(struct zpdesc *zpdesc)
 {
-	__SetPageMovable(zpdesc_page(zpdesc), mops);
+	__SetPageMovable(zpdesc_page(zpdesc));
 }
 
 static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 72c2b7562c511..7192196b9421d 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1684,8 +1684,6 @@ static void lock_zspage(struct zspage *zspage)
 
 #ifdef CONFIG_COMPACTION
 
-static const struct movable_operations zsmalloc_mops;
-
 static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 				struct zpdesc *newzpdesc, struct zpdesc *oldzpdesc)
 {
@@ -1708,7 +1706,7 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 	set_first_obj_offset(newzpdesc, first_obj_offset);
 	if (unlikely(ZsHugePage(zspage)))
 		newzpdesc->handle = oldzpdesc->handle;
-	__zpdesc_set_movable(newzpdesc, &zsmalloc_mops);
+	__zpdesc_set_movable(newzpdesc);
 }
 
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
@@ -1815,7 +1813,7 @@ static void zs_page_putback(struct page *page)
 {
 }
 
-static const struct movable_operations zsmalloc_mops = {
+const struct movable_operations zsmalloc_mops = {
 	.isolate_page = zs_page_isolate,
 	.migrate_page = zs_page_migrate,
 	.putback_page = zs_page_putback,
@@ -1878,7 +1876,7 @@ static void SetZsPageMovable(struct zs_pool *pool, struct zspage *zspage)
 
 	do {
 		WARN_ON(!zpdesc_trylock(zpdesc));
-		__zpdesc_set_movable(zpdesc, &zsmalloc_mops);
+		__zpdesc_set_movable(zpdesc);
 		zpdesc_unlock(zpdesc);
 	} while ((zpdesc = get_next_zpdesc(zpdesc)) != NULL);
 }
-- 
2.49.0

