Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C1828C851
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288459; cv=none; b=KDEzbHieLO1Dr0cMjoZygsZQiNfUGB7jXe/l5v2nN1M3ua/hBTfm3ijKBH/hLqPZT74bVDkpQ2KKCE5Wmq/xZt+cxEQgOSogD/S1CJm+aS8fF1Eqjbq4/GmiLos2sQHU7xwwqJOE+14U8KSbhwsIFy+D0Yy4d7cs9xkzjM78Uek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288459; c=relaxed/simple;
	bh=bzT3f8SbOSFmP0mAT3t54D4YW+inx1tEVm83+OWEEC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JT+eccBIv04TIxZAA54UAIdwlydwzjNhMlRqURhOoNdIj8Lszdd14P+h4U+yCq4pK6WGskMY0fIQDRskL+IKXZf4i35Wd2x32mRMb2XjX3uaj8R/136NpBWm3FOd0MJ0nZ61FZb0uXSl4yisOVDWcOwT8jmyFvq+X7zT6sPll7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScEP0tK8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScEP0tK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
	b=ScEP0tK8+alAQQbzS6vmVOTrwQllssxXt+spIt+xagHmuUnhptC/BEMatnEWPRdqgAV6D3
	b8tKRttsXrP7jlhp1ILP7cl8JDxxNr5iO4F58v+CxVrWPNdJw7DjYveUDshLfjBD1zDRCq
	aRFl+snbokgQCFOKusdy1FXNEtc6e/I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-17c6WeyRMDuFN2XI19Fx3Q-1; Mon, 30 Jun 2025 09:00:49 -0400
X-MC-Unique: 17c6WeyRMDuFN2XI19Fx3Q-1
X-Mimecast-MFC-AGG-ID: 17c6WeyRMDuFN2XI19Fx3Q_1751288448
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so1134422f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288448; x=1751893248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLSy27pHIWSaumHdHZbZB7d4Xse7WARvWeqJ4bM0kJg=;
        b=F85BG6YnB5RxTKYFVcrrOkuqif0FmN8nxKnWmHH+Tve3MhALDy1NIXycMxY3qdt6Uq
         Pjrnvy7pGyQZgv+Cp1SQZop4v29qydW8GUt1L6UvFXIcAwuQ5tS3lOtAUNOU0I5x7lcb
         DRt0ZlSXPdHNXtZLibhcuiVM0DSg0izKgfH67QgQJg+U+Xg+LkX7uITge9rz5EYXBFaw
         dDncZP337DJIjqYaR7I4yIS9SjOmFLnhnZ4aO/CkjI58KYcw3SWDuTUczS2tBgsEC6tQ
         tCb/OCg8SLpQ/Nxw15YjrFomKL6cwkGxotkr0R8yv+EELqF19pm8UGu8BTMagf2rblm8
         MpCA==
X-Forwarded-Encrypted: i=1; AJvYcCWLBqpu4OhvsD9mnLWnbqaU7LIwjDjcgqU7DUiwsgesoxIvgVsK3a+2u/kLQVvdvb4W4rWR600Lul4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgTgDXMpNuLmy6v/2Wn9xSEcNEW9ppj54EOgbILH5dE+dOKBF
	uz/faEYe0fvXFB5XL50RwPmXjUhD81LgL1D9ek/V3h7nlRZISi/tCndrpoAVyH3F8QOdwN/iNHh
	7x7aGWcYSmcdQVnmmb4W4gCH2qqGgWFYeiBwe0cUxZcNKelKGaUbDobAg1mMTuQ==
X-Gm-Gg: ASbGncuMcErtw4PNBMIO+knHhEa2toqwpwuR/z4C8kklbHnI4J9aGNS1TuFET+8SrpZ
	CGoWFpDx/ki607plo33qOI/buSYwgL5tyzAbL+uCL1s98v5sQQB/3wm49w8l1CL/UuSPJswaDK5
	7h9r1jDjukkL9oOz592FtgS27EvKFOccgr72pw1dtAIq/tEXUs10JlTc3Dxn1LDhKlT1bjV6mx1
	70uqnz1VDrBkbi1zRhWO8ItIJusXivpXbzkB56PMVAMZxLUucC3VKSl7vngOKNdX9adTdMVYyzB
	1/SaaYHAqYUOl8MehPeZsffz8w6ODcWHxFpO94F1lnrHXmVNydUub/fRO4QivP5Cq/KEYGZP1d8
	WPaxatSY=
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883326f8f.40.1751288447619;
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZT4aB5+IKBjQnh+yncb7ZFTxj1NuN2dDZeVwVJqvRnlRrWkNRGfP/el4NU32fGgywSRoLtA==
X-Received: by 2002:a05:6000:440b:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a8fe4bd16fmr7883079f8f.40.1751288445063;
        Mon, 30 Jun 2025 06:00:45 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7e72c1sm10293032f8f.1.2025.06.30.06.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
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
Subject: [PATCH v1 11/29] mm/migrate: move movable_ops page handling out of move_to_new_folio()
Date: Mon, 30 Jun 2025 14:59:52 +0200
Message-ID: <20250630130011.330477-12-david@redhat.com>
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

Let's move that handling directly into migrate_folio_move(), so we can
simplify move_to_new_folio(). While at it, fixup the documentation a
bit.

Note that unmap_and_move_huge_page() does not care, because it only
deals with actual folios. (we only support migration of
individual movable_ops pages)

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 63 +++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 0898ddd2f661f..22c115710d0e2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1024,11 +1024,12 @@ static int fallback_migrate_folio(struct address_space *mapping,
 }
 
 /*
- * Move a page to a newly allocated page
- * The page is locked and all ptes have been successfully removed.
+ * Move a src folio to a newly allocated dst folio.
  *
- * The new page will have replaced the old page if this function
- * is successful.
+ * The src and dst folios are locked and the src folios was unmapped from
+ * the page tables.
+ *
+ * On success, the src folio was replaced by the dst folio.
  *
  * Return value:
  *   < 0 - error code
@@ -1037,34 +1038,30 @@ static int fallback_migrate_folio(struct address_space *mapping,
 static int move_to_new_folio(struct folio *dst, struct folio *src,
 				enum migrate_mode mode)
 {
+	struct address_space *mapping = folio_mapping(src);
 	int rc = -EAGAIN;
-	bool is_lru = !__folio_test_movable(src);
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
 	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
 
-	if (likely(is_lru)) {
-		struct address_space *mapping = folio_mapping(src);
-
-		if (!mapping)
-			rc = migrate_folio(mapping, dst, src, mode);
-		else if (mapping_inaccessible(mapping))
-			rc = -EOPNOTSUPP;
-		else if (mapping->a_ops->migrate_folio)
-			/*
-			 * Most folios have a mapping and most filesystems
-			 * provide a migrate_folio callback. Anonymous folios
-			 * are part of swap space which also has its own
-			 * migrate_folio callback. This is the most common path
-			 * for page migration.
-			 */
-			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
-								mode);
-		else
-			rc = fallback_migrate_folio(mapping, dst, src, mode);
+	if (!mapping)
+		rc = migrate_folio(mapping, dst, src, mode);
+	else if (mapping_inaccessible(mapping))
+		rc = -EOPNOTSUPP;
+	else if (mapping->a_ops->migrate_folio)
+		/*
+		 * Most folios have a mapping and most filesystems
+		 * provide a migrate_folio callback. Anonymous folios
+		 * are part of swap space which also has its own
+		 * migrate_folio callback. This is the most common path
+		 * for page migration.
+		 */
+		rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+							mode);
+	else
+		rc = fallback_migrate_folio(mapping, dst, src, mode);
 
-		if (rc != MIGRATEPAGE_SUCCESS)
-			goto out;
+	if (rc == MIGRATEPAGE_SUCCESS) {
 		/*
 		 * For pagecache folios, src->mapping must be cleared before src
 		 * is freed. Anonymous folios must stay anonymous until freed.
@@ -1074,10 +1071,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
-	} else {
-		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
-out:
 	return rc;
 }
 
@@ -1328,20 +1322,23 @@ static int migrate_folio_move(free_folio_t put_new_folio, unsigned long private,
 	int rc;
 	int old_page_state = 0;
 	struct anon_vma *anon_vma = NULL;
-	bool is_lru = !__folio_test_movable(src);
 	struct list_head *prev;
 
 	__migrate_folio_extract(dst, &old_page_state, &anon_vma);
 	prev = dst->lru.prev;
 	list_del(&dst->lru);
 
+	if (unlikely(__folio_test_movable(src))) {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
+		if (rc)
+			goto out;
+		goto out_unlock_both;
+	}
+
 	rc = move_to_new_folio(dst, src, mode);
 	if (rc)
 		goto out;
 
-	if (unlikely(!is_lru))
-		goto out_unlock_both;
-
 	/*
 	 * When successful, push dst to LRU immediately: so that if it
 	 * turns out to be an mlocked page, remove_migration_ptes() will
-- 
2.49.0

