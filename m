Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995562F4A01
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268449; cv=none; b=ieSBrlUdPASkAD3+4GGx/sTDgLzpuqO5RTwE9UVnhUM70nCo3bUUr1FCuakgdsSxUOX96ZR+/kU4b9ms0Hxlr1GTOyvKVhmRXDzeopLJxMJfZNUxS1h6//KxH9kIfDWyE5lnP3bGiX8JyTpw10PgUR3Qy/zCTcdnAPmIzM51k4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268449; c=relaxed/simple;
	bh=aEP6DnjEOauJOFrkxr2zR+ZZpgBJ0tgUTK1LoPRl2/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKe9fkUi19O5SSDjUGdCkIGtbI0OkbtZ83I5dUMsXGbNFzAu80sdU6XaTPq1qtUYMbFsvferaE+go+43lGc11AkpaetgMl7yHsOfNhsr9kltrqrdr5puJXm8WApWoX4Lkjrs3qMbcNEkR0BXjVEHJ59TTRf4BMZ3/Y7kfngnj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0G6m8Tb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0G6m8Tb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
	b=Q0G6m8TbA1ZjvVryxveyfa/ejwdn2GMI9b4s1y7S7QULoikCIUQNnHSG+jB0J8+/YlUaYV
	6W+EhJBugQg9/U54KEM3ne6ADpswq4cqMlr0cBxDFz8UpwPwzqdi5XRGlOWV14F2y19KXU
	3MuqHnjtlDumdmSosroZ9N/jNIJrqhg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-CACYdrxcOpCScejrYMLxuA-1; Wed, 18 Jun 2025 13:40:42 -0400
X-MC-Unique: CACYdrxcOpCScejrYMLxuA-1
X-Mimecast-MFC-AGG-ID: CACYdrxcOpCScejrYMLxuA_1750268441
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso47059625e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268441; x=1750873241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8LuODrccx/EBs9A7vTNySqHbhe9k9tI08r8Ga0Xgcs=;
        b=jbrfVfetgjd6+luuzqbatCfpRzPgZfUK1OB0rq8KG7A8lIb1j+qCJ+bpivjdyVGq9C
         brUQTjHXWxE0kIFpzkbQly0w4KgVnG2WOTXqaIxNnJaWODVaHKzddeZC7IGzuFkQKBHw
         c1UBcV38lexicpLpIubu/SgSnZwj/4eHW1FZuh2btTcO+QbGzMPhqLFWi5U06CZXx/Ff
         ixWmR+mq8j+FacfU8RvPGRMSBr+3NF0bkBTdbFvzSgtTSHP4NSDOh03jzRLS9PkWbk+A
         Zj4cs9+1XdaLscwFllIutkFFTkMEVthMDPb6+B09ubnyvwjjFuV0rPYGV5+FDfDBmvCQ
         qxqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaPCmoS81hJwhOwaU0s1KNQ9h9k8OCUWAAH4z7Bx0eovWShDAafUIoT4RXTuAD7iAiM/kuhFUYRHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/PBD/TbCcCKW/+Y15KtlkgT3N8pot5AVn0Z7PDyDx3+5ewrL
	jJ4SDL1mvaqhxDWtDeoYBZimmkQGK10Ga63rG6F83Jr6jy0n/GR5t5S8TuCc89oFZGrGjxWGbXy
	vnTlGXVGiJiyaR8L0iFC9m7957M1TJaKi09hGEgfhYacjJ4areThDRNzaaaC9nQ==
X-Gm-Gg: ASbGnct/eKsJm+KUndhFCyQALqTbXYl70qr+QSX0pSCJfzp/23XA8AUKi9HkvFTfSul
	MgHjb076VfFpPOYHoJ9fGxc+/uHGompdMhBJ/LFvweLTHpODK+3sDYeECYR/OccqjDBzO6YQSJW
	RK4qqzCU9y3m1ZqxUe4eWFM8luKHzp9ZdfuU8QGyIMqsfOOnVoboz0eV9A/L8DQ6XsCVSvMY/f/
	JZeANl9LXyLb2C7w1cJSBT1gtCxFjMuPRGDgYn45ebfKdhSnq19KNDNQsmgrwcG8ry1zM8fZi8A
	PgUeNttnmmQ2D9dWhrDkLgDI5rytJnDivWymXARoT7F2Dfmr1JYdnV7CV/Buia3dGwtoFt8SjQC
	SKCq5lA==
X-Received: by 2002:a05:600c:1ca1:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4533cae6605mr166407415e9.8.1750268441167;
        Wed, 18 Jun 2025 10:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc4TaNXORzdooVLODlvwGNYZ3WZPNGmS5C2sKfTSdPVLBbA2Ps3b4UKdLfdRWvy1N8seVTmg==
X-Received: by 2002:a05:600c:1ca1:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4533cae6605mr166407185e9.8.1750268440690;
        Wed, 18 Jun 2025 10:40:40 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e97ab95sm3814165e9.7.2025.06.18.10.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:40 -0700 (PDT)
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
Subject: [PATCH RFC 09/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
Date: Wed, 18 Jun 2025 19:39:52 +0200
Message-ID: <20250618174014.1168640-10-david@redhat.com>
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

Let's factor it out, simplifying the calling code.

The assumption is that flush_dcache_page() is not required for
movable_ops pages: as documented for flush_dcache_folio(), it really
only applies when the kernel wrote to pagecache pages / pages in
highmem. movable_ops callbacks should be handling flushing
caches if ever required.

Note that we can now change folio_mapping_flags() to folio_test_anon()
to make it clearer, because movable_ops pages will never take that path.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 82 ++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 32e77898f7d6c..456e41dad83a2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -159,6 +159,45 @@ static void putback_movable_ops_page(struct page *page)
 	folio_put(folio);
 }
 
+/**
+ * migrate_movable_ops_page - migrate an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Migrate an isolated movable_ops page.
+ *
+ * If the src page was already released by its owner, the src page is
+ * un-isolated (putback) and migration succeeds; the migration core will be the
+ * owner of both pages.
+ *
+ * If the src page was not released by its owner and the migration was
+ * successful, the owner of the src page and the dst page are swapped and
+ * the src page is un-isolated.
+ *
+ * If migration fails, the ownership stays unmodified and the src page
+ * remains isolated: migration may be retried later or the page can be putback.
+ *
+ * TODO: migration core will treat both pages as folios and lock them before
+ * this call to unlock them after this call. Further, the folio refcounts on
+ * src and dst are also released by migration core. These pages will not be
+ * folios in the future, so that must be reworked.
+ *
+ * Returns MIGRATEPAGE_SUCCESS on success, otherwise a negative error
+ * code.
+ */
+static int migrate_movable_ops_page(struct page *dst, struct page *src,
+		enum migrate_mode mode)
+{
+	int rc = MIGRATEPAGE_SUCCESS;
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(src))
+		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	if (rc == MIGRATEPAGE_SUCCESS)
+		ClearPageIsolated(src);
+	return rc;
+}
+
 /*
  * Put previously isolated pages back onto the appropriate lists
  * from where they were once taken off for compaction/migration.
@@ -1023,51 +1062,20 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 								mode);
 		else
 			rc = fallback_migrate_folio(mapping, dst, src, mode);
-	} else {
-		const struct movable_operations *mops;
 
-		/*
-		 * In case of non-lru page, it could be released after
-		 * isolation step. In that case, we shouldn't try migration.
-		 */
-		VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-		if (!folio_test_movable(src)) {
-			rc = MIGRATEPAGE_SUCCESS;
-			folio_clear_isolated(src);
+		if (rc != MIGRATEPAGE_SUCCESS)
 			goto out;
-		}
-
-		mops = folio_movable_ops(src);
-		rc = mops->migrate_page(&dst->page, &src->page, mode);
-		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
-				!folio_test_isolated(src));
-	}
-
-	/*
-	 * When successful, old pagecache src->mapping must be cleared before
-	 * src is freed; but stats require that PageAnon be left as PageAnon.
-	 */
-	if (rc == MIGRATEPAGE_SUCCESS) {
-		if (__folio_test_movable(src)) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-
-			/*
-			 * We clear PG_movable under page_lock so any compactor
-			 * cannot try to migrate this page.
-			 */
-			folio_clear_isolated(src);
-		}
-
 		/*
-		 * Anonymous and movable src->mapping will be cleared by
-		 * free_pages_prepare so don't reset it here for keeping
-		 * the type to work PageAnon, for example.
+		 * For pagecache folios, src->mapping must be cleared before src
+		 * is freed. Anonymous folios must stay anonymous until freed.
 		 */
-		if (!folio_mapping_flags(src))
+		if (!folio_test_anon(src))
 			src->mapping = NULL;
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
+	} else {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
 out:
 	return rc;
-- 
2.49.0

