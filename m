Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8462D337119
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051593; cv=none; b=LjdA5XhZ1VqBD+p86lm3WioFY1CPxz49tpYI5LDXsPnUkTZy520bn/uowuzrKhGcpmXVJuq9SbsDDTrhCFNIeV2ifqFez+2jWsno16jLneHR+TiByBhek0iM7f+dBTAlw6rQvDisK0tOLjPq+Nldfd8xAIT63Fvz3FqOnCO7zlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051593; c=relaxed/simple;
	bh=XZj/6LkkjOgMnlFzr0MmN0PRPlNc6Qo/DW9DiPOOcnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xie2XPVK226OqvaEGtueXE7Z/bvs/PjjaXMOni+C6ZQTPBxhzDUnsQHKpfQOCgRfvyUCXAnvWVUWyOgxWCLw0w4tuslzEgeb4jujv7PrugkHculKwB3pHrduc0ptgt46hZtWlmN4j07UDio+BBlRn166OhcNDza4GzBlHds0wIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ee2eNV9e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ee2eNV9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
	b=Ee2eNV9e2RwUKDoSun2tjdXX4XkKlAtS1DrDA74BskbOxVXMy4FggscWyrblPRHZXM3Myr
	w54wi0J+v0XqKBkkhjEgZY2zV2oVt6vDs9d3UHSfM3kednkERSpRrahj/iH3DKBvVuDlXu
	RoAbHQVHXD7CX/wNbY6lGOx+d9mqABI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-Dtqp0ofSMSaDFDy_TFGWDA-1; Tue, 21 Oct 2025 08:59:49 -0400
X-MC-Unique: Dtqp0ofSMSaDFDy_TFGWDA-1
X-Mimecast-MFC-AGG-ID: Dtqp0ofSMSaDFDy_TFGWDA_1761051588
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so44395125e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051588; x=1761656388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5VcU60xQeN7ydJcNuOrJoqdazEeOf9bmMF6YJ9dhbk=;
        b=hu71XpDCEgvydbThv8ILEbOIx5/ZGuMv8HSYDkd1owlRg+W5OcTxnHij8ZiQUyOOdS
         eT21QQ8WgrIFsEL14aL3rsThOm+OOM45nKQ7w2CNu1LVQsUyoK/rm1RGxcvr5sZdg9jB
         fsrlPcyz72e8d3z+Qi0HN4tlL6N0ui6Y3m+MO4Jx1dFLKCKjSLf1n7d4QaJaxDukMtxh
         ajn2XZsLYpvMaZ9lnhkeClZDg2OHda1ajTzvdzUq0kOr23UjSeg9RJ2UWjdQ/jAjTvL+
         0YH3oEeeG3LG0OOc+IWsfJX75FNo5B0SszjUJUL5iqmcmUMFfq4ExoKm+qCiU4YCOo91
         +cIg==
X-Forwarded-Encrypted: i=1; AJvYcCUGMLRQKPNLdD/V1JD2N3PAY16QIlW+8a0BdUE2jBym+jr4Yd4VSEzuvH/0WGB65SICmc/Vr8+za9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQggIh8tr6khSDOI98nchtgADZUoM2+XQexg84SJjyqPWWs6u
	PdFVmbPCY2LJlYjYHZhrHgMkOVx5ktdsQTKgaP7NgSSZm3bGxC2Ird2i3vuYRwT0rlZ4XICiPKI
	Jz4kahrXNaHwRmZ/LQLwe1x/9Fjjiu5u3wDhf+uqR+thWmnhdSqqu6pCA5c6n8w==
X-Gm-Gg: ASbGnctIqVOIY1CeKtF5CayC/zxzWyh1XdMz4MtZNeoOwSzexxsfplo3fEHxMxOIjkf
	UdazOQEhT3IKuwU5lA+VhNqvkQjVN6BKNmSq8ZM+PqxRRQMtxVKOwAhQixlY/SgVyaAMwGe/W+d
	aDbn9URgrSk2Q4g93+nD3CRsOM3bh99Kok+QqPvWpCCQ/KlPNAVV9H6rm2bLcYA3zye5SUJxIwO
	UzX5dp/cZOYg27UiP9HFplMljT5pgWaIz7OuLBX/4+nvf1KDQBAWs1M7DJWs75EY256M0iBWe7T
	7s4Q/QGISdRvpZ0PBEtQAaXJSk3ysy6QKrHwyiGAPITO75IIQwwaRgrIC0kSqK1RUoDF4zKZgJM
	1XrjazasJzPsHZ4Lpdqj23yzyIRHnxaZfgQGuWV2LM+MROqwiL2MkwsN9MtfV
X-Received: by 2002:a05:600c:45ca:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-471178a4bb0mr123278005e9.16.1761051588089;
        Tue, 21 Oct 2025 05:59:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHERIP76djccuxwEVDdc3jxl3cHQS1Z1VLDzbGDsvVWwgXU4e20hoqSfb9F5zq9YX0z7BLvwQ==
X-Received: by 2002:a05:600c:45ca:b0:46e:59dd:1b4d with SMTP id 5b1f17b1804b1-471178a4bb0mr123277565e9.16.1761051587656;
        Tue, 21 Oct 2025 05:59:47 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471556e17afsm190432085e9.17.2025.10.21.05.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:47 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 07/23] mm/balloon_compaction: use a device-independent balloon (list) lock
Date: Tue, 21 Oct 2025 14:59:12 +0200
Message-ID: <20251021125929.377194-8-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to remove the dependency on the page lock for balloon
pages, we need a lock that is independent of the page.

It's crucial that we can handle the scenario where balloon deflation
(clearing page->private) can race with page isolation (using
page->private to obtain the balloon_dev_info where the lock currently
resides).

The current lock in balloon_dev_info is therefore not suitable.

Fortunately, we never really have more than a single balloon device
per VM, so we can just keep it simple and use a static lock to protect
all balloon devices.

Based on this change we will remove the dependency on the page lock
next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  6 ++---
 mm/balloon_compaction.c            | 36 +++++++++++++++++-------------
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 3109d3c43d306..e2d9eb40e1fbb 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -21,10 +21,10 @@
  *   i. Setting the PG_movable_ops flag and page->private with the following
  *	lock order
  *	    +-page_lock(page);
- *	      +--spin_lock_irq(&b_dev_info->pages_lock);
+ *	      +--spin_lock_irq(&balloon_pages_lock);
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
- *      device page list under b_dev_info->pages_lock.
+ *      device page list under &balloon_pages_lock
  *
  * The functions provided by this interface are placed to help on coping with
  * the aforementioned balloon page corner case, as well as to ensure the simple
@@ -52,7 +52,6 @@
  */
 struct balloon_dev_info {
 	unsigned long isolated_pages;	/* # of isolated pages for migration */
-	spinlock_t pages_lock;		/* Protection to pages list */
 	struct list_head pages;		/* Pages enqueued & handled to Host */
 	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
 			struct page *page, enum migrate_mode mode);
@@ -71,7 +70,6 @@ extern size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 {
 	balloon->isolated_pages = 0;
-	spin_lock_init(&balloon->pages_lock);
 	INIT_LIST_HEAD(&balloon->pages);
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index fd9ec47cf4670..97e838795354d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -11,6 +11,12 @@
 #include <linux/export.h>
 #include <linux/balloon_compaction.h>
 
+/*
+ * Lock protecting the balloon_dev_info of all devices. We don't really
+ * expect more than one device.
+ */
+static DEFINE_SPINLOCK(balloon_pages_lock);
+
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
@@ -47,13 +53,13 @@ size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
 	unsigned long flags;
 	size_t n_pages = 0;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_for_each_entry_safe(page, tmp, pages, lru) {
 		list_del(&page->lru);
 		balloon_page_enqueue_one(b_dev_info, page);
 		n_pages++;
 	}
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 	return n_pages;
 }
 EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
@@ -83,7 +89,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 	unsigned long flags;
 	size_t n_pages = 0;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_for_each_entry_safe(page, tmp, &b_dev_info->pages, lru) {
 		if (n_pages == n_req_pages)
 			break;
@@ -106,7 +112,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		dec_node_page_state(page, NR_BALLOON_PAGES);
 		n_pages++;
 	}
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	return n_pages;
 }
@@ -149,9 +155,9 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	balloon_page_enqueue_one(b_dev_info, page);
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 }
 EXPORT_SYMBOL_GPL(balloon_page_enqueue);
 
@@ -191,11 +197,11 @@ struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
 		 * BUG() here, otherwise the balloon driver may get stuck in
 		 * an infinite loop while attempting to release all its pages.
 		 */
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 		if (unlikely(list_empty(&b_dev_info->pages) &&
 			     !b_dev_info->isolated_pages))
 			BUG();
-		spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+		spin_unlock_irqrestore(&balloon_pages_lock, flags);
 		return NULL;
 	}
 	return list_first_entry(&pages, struct page, lru);
@@ -213,10 +219,10 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	if (!b_dev_info)
 		return false;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	return true;
 }
@@ -230,10 +236,10 @@ static void balloon_page_putback(struct page *page)
 	if (WARN_ON_ONCE(!b_dev_info))
 		return;
 
-	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+	spin_lock_irqsave(&balloon_pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 }
 
 static int balloon_page_migrate(struct page *newpage, struct page *page,
@@ -253,7 +259,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	rc = b_dev_info->migratepage(b_dev_info, newpage, page, mode);
 	switch (rc) {
 	case 0:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 
 		/* Insert the new page into the balloon list. */
 		get_page(newpage);
@@ -272,7 +278,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 		}
 		break;
 	case -ENOENT:
-		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
+		spin_lock_irqsave(&balloon_pages_lock, flags);
 
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
@@ -285,7 +291,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	}
 
 	b_dev_info->isolated_pages--;
-	spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
+	spin_unlock_irqrestore(&balloon_pages_lock, flags);
 
 	/* Free the now-deflated page we isolated in balloon_page_isolate(). */
 	balloon_page_finalize(page);
-- 
2.51.0

