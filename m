Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F25728DF2E
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288469; cv=none; b=t4oUCfO23iz7063ApXPcDNksP9ISuOdKohT4ujWs9/ks9tV42q2RotrPD4HwISgDhzEizmvQEbEMFKwtcaJq8vDs0xiMpnI211FL6H3RCCw20Wmr87rxY/48nlUYajnTgDNWGmWcOWGRKOKzWCu6K2k71ne2wA83qyO3++ukwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288469; c=relaxed/simple;
	bh=E2Kk/3B1Zvc/DrpiBo6mfnVkxxScIN5ozXUblSaxVOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2LWekCGnUVZ3hMQW0Jbd5Qdto+A44LnKOuXy5axtMeDEgH6NLdGGrR2IXpyFsD9WbzB1OsxDqAmU8siU/5TZtco5MrUSGaO4EXFVivmEZosd7nmPV6GIJ4LNLwVEoYDU9Je+oUfMRKkU0aHp2PfZH3SyV1sVl0sHuGZu87lAPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AA/AaJ7g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AA/AaJ7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
	b=AA/AaJ7gfiYoz6uvuoPD+ZIm1XV1vBpkfoodqUIE79czjDPmUEGenZoHpRfLXlar56dsNp
	cdoaMEIoqbfU4EMIPDN1MuxOyOzXHempRWva0/Nnyg4WQ+5TVcPFl8Cg7LoaU3EliTPYp7
	/bCOaoHzIFIqzwiobmxHfaSdH7A5HuI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-MPKLGFgiPJCSdKwl5T8tIA-1; Mon, 30 Jun 2025 09:01:00 -0400
X-MC-Unique: MPKLGFgiPJCSdKwl5T8tIA-1
X-Mimecast-MFC-AGG-ID: MPKLGFgiPJCSdKwl5T8tIA_1751288459
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso13616995e9.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288459; x=1751893259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02uSef5lp6Y5cEfWyIGZlJA9ZbaH5mB3gdVPjlakXLo=;
        b=no9XoNIuuxsa0A30/YR2oJGRlN1kLGlKuUEUKHWPHaSBdgIPP55fKBhQNnqesn/LYc
         rAcD4RiF7OYVzVd++F/00stIvSA26aVpbV9si8aIpcPryW7rkfx1qlcErCgoA6z2PUtS
         1OaLDRDUiF4BIlEOiIE977ib9oWmjKfbakuIBEdMLXB+nPWvX3XyYIkwtgCMXZIAfbIJ
         YZHEM4tnr1VzpeiWnbI8y+D2NPOvm5oBTpzPKi97hlPxx/zWw/qGQMuqg98bez7OBV/e
         W/CLxK3Wrai555rgz4F15QePKQEzd4gdFA4deklUaRkdnkiIn517zMUa52/O9+NAJEnw
         ktzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtbPWGfx4Yyrty2ik0nNLUVZRtAMSOUxb12Kmpgo9KT+r6QlcVVFj5HJXLh4Cm/zER2S3Forc5evE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGiNzSa6O/MB8vRPYRlaxexL2Od1tEbrGRZ1M4jnz3fgMelGT
	uQWthkyW/VmRC8s3P/zq3F4Sxry1Dv+Pa01kcJVt47NdEEyVogPSnx0f9mCqUlSvXs/rlXcm4hq
	vVzfIxg7AKY+wDSUUeTC8ktqOWf19IaUrUrhjCY3HVNAlYAYromAdzRsOy0zpFA==
X-Gm-Gg: ASbGnctbNRzP9MEyDBs2Z9+EfTV6HnP3FMEpOeoMpz1iwfk5mjPKEti9Qy+mNQ3TgeD
	f+Lxpp7nT4EtBhAVvyb1gg2pw4UmE+IkTetH0Gh4EL+w61GS1FukdfI4nrkAXQEIIpHyGVIq0Is
	EvTLL3QBCD6OsgBFTyEqbE/F+eHYyx7HP8p+c8WjZ1xKEtTi3GIwWPUCKxRrKrPtgcEA5m7zQAp
	Dhhoe+glQlM5m/qcLE9Ekl5K0+cMC9Eoe+3NzRUOrOAAu5L6B3rPZtmL6SDwxMx5rx3OE+yiFY1
	IVNFFs9y7+0ZJlFwRGMmRqRZYRZ+5O33N5FogdV4uJ9+CfFr4th8V08c3kASXhZvCD/ziJV5IAz
	XQct4gNk=
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92868545e9.3.1751288457982;
        Mon, 30 Jun 2025 06:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCs0m13Yqq4GukWpM+4uHJmOOd6amI/nvHYcsB4z72aw1swyUlytQ8Ivx43yHYvtcBEII8eg==
X-Received: by 2002:a05:600c:a46:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-4539726acc1mr92865605e9.3.1751288455974;
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f8absm10554612f8f.95.2025.06.30.06.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:55 -0700 (PDT)
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
Subject: [PATCH v1 15/29] mm/migration: remove PageMovable()
Date: Mon, 30 Jun 2025 14:59:56 +0200
Message-ID: <20250630130011.330477-16-david@redhat.com>
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

As __ClearPageMovable() is gone that would have only made
PageMovable()==false but still __PageMovable()==true, now
PageMovable() == __PageMovable().

So we can replace PageMovable() checks by __PageMovable(). In fact,
__PageMovable() cannot change until a page is freed, so we can turn
some PageMovable() into sanity checks for __PageMovable().

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  2 --
 mm/compaction.c         | 15 ---------------
 mm/migrate.c            | 18 ++++++++++--------
 3 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 6eeda8eb1e0d8..25659a685e2aa 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -104,10 +104,8 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #endif /* CONFIG_MIGRATION */
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
 #else
-static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
diff --git a/mm/compaction.c b/mm/compaction.c
index 889ec696ba96a..5c37373017014 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -114,21 +114,6 @@ static unsigned long release_free_list(struct list_head *freepages)
 }
 
 #ifdef CONFIG_COMPACTION
-bool PageMovable(struct page *page)
-{
-	const struct movable_operations *mops;
-
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	if (!__PageMovable(page))
-		return false;
-
-	mops = page_movable_ops(page);
-	if (mops)
-		return true;
-
-	return false;
-}
-
 void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 {
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
diff --git a/mm/migrate.c b/mm/migrate.c
index 22c115710d0e2..040484230aebc 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -87,9 +87,12 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 		goto out;
 
 	/*
-	 * Check movable flag before taking the page lock because
+	 * Check for movable_ops pages before taking the page lock because
 	 * we use non-atomic bitops on newly allocated page flags so
 	 * unconditionally grabbing the lock ruins page's owner side.
+	 *
+	 * Note that once a page has movable_ops, it will stay that way
+	 * until the page was freed.
 	 */
 	if (unlikely(!__PageMovable(page)))
 		goto out_putfolio;
@@ -108,7 +111,8 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	if (unlikely(!folio_trylock(folio)))
 		goto out_putfolio;
 
-	if (!PageMovable(page) || PageIsolated(page))
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
+	if (PageIsolated(page))
 		goto out_no_isolated;
 
 	mops = page_movable_ops(page);
@@ -149,11 +153,10 @@ static void putback_movable_ops_page(struct page *page)
 	 */
 	struct folio *folio = page_folio(page);
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(page), page);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
 	folio_lock(folio);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(page))
-		page_movable_ops(page)->putback_page(page);
+	page_movable_ops(page)->putback_page(page);
 	ClearPageIsolated(page);
 	folio_unlock(folio);
 	folio_put(folio);
@@ -189,10 +192,9 @@ static int migrate_movable_ops_page(struct page *dst, struct page *src,
 {
 	int rc = MIGRATEPAGE_SUCCESS;
 
+	VM_WARN_ON_ONCE_PAGE(!__PageMovable(src), src);
 	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
-	/* If the page was released by it's owner, there is nothing to do. */
-	if (PageMovable(src))
-		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	rc = page_movable_ops(src)->migrate_page(dst, src, mode);
 	if (rc == MIGRATEPAGE_SUCCESS)
 		ClearPageIsolated(src);
 	return rc;
-- 
2.49.0

