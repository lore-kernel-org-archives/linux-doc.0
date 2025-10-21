Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D967334370
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051622; cv=none; b=L65jitu2nQUalzyT1q3BBgTpHKyEbnUpmT1iqwW6BLbBkXnfYQOfLS3lTfEWH3lmhOSzBBcGl3ClglN7HdjeMGqpJ8Z4e/m310My4bff+RbtiR5Rad5uxhKoIV93K5x+iO5jT84XsUpCQ+JnI18sj74zsAcAkslcUCXJDokU0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051622; c=relaxed/simple;
	bh=+Psx8bKEdpkhNgbqNOO4RXL6S6LqLj+1jmmuZEFx8qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tF3r6WbIenZl8EKIy4dBv3COUsOKDpKYQvW45UeVg2qm3Qrkb9m6qfBp8vUXa+QrItl11unSnvN4h9ERYC2nijQ0X3HToTCtxt9c/QEuRaqngBd+8jy4RZnwcOZxHvknEbRjZu+hX8qwpZJuSR3Xae9HletS0rC1ViR9TPwfeaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLp8rOJG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLp8rOJG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
	b=XLp8rOJGOYSSvK/XcC4EXN80qT/JxIZGWy+zzcu+40cyMHkUO5Rak34ZlQBtG1oTri6x7T
	mdOb0AQCQgcDfugurXc0KN8GyURSP4btGdYA3S2GUZ0nOCYVUXtGHtG34x03O3ECl45YAn
	qx3K3V49CCnonq7yWQlZ5V30hCgMyHU=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-VChNcyanP9WnLrpW_mIh2w-1; Tue, 21 Oct 2025 09:00:17 -0400
X-MC-Unique: VChNcyanP9WnLrpW_mIh2w-1
X-Mimecast-MFC-AGG-ID: VChNcyanP9WnLrpW_mIh2w_1761051616
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-591eb009929so478264e87.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051616; x=1761656416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+OTVNr68Ud6e3V7gLc8dmSyyby2S+Q4hsUbFdDpNzM=;
        b=iwinNc6i2UYl+ouI6qNIpu7BHPrXcKLVMZ2lspKzJMUxoxUu2xEZwkIciqaQXa6vCl
         cI17H0jNHD2ARbaqui0lbBFIRPpxn3/w5kSaYvz9EzvKAXO8MR3JxtkFX01hvBHz642P
         0KjKD32DkfhoxrdovR/wsvC9HuQeZDBmF3/hvrPRyDtJjUd2szuQX6oNEhHlYf9HccJQ
         nakfg1TyBDoxeAyjI/QXxsgRkvzrlSLGTr+QSqaSZKScmyYSP6G7ldLYjgLStb77WYjw
         e2KrnLHW2Mdb2SKPdTRKgDW4QxvSfGb6NHsHAAdkpMmRaKvAv7a75ge5BJ8Hqc40lAQ6
         788w==
X-Forwarded-Encrypted: i=1; AJvYcCVrjGH8j3ePOxd+tEVv8DpaogZ3bmeWIzxi+D1Ea+GxTa81BB8ygoZ5zNvGwYRT4eJpkfZU11rL/H4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZl3bdcjH1bpaMUtejYux3QJP+geHKPLmPRhb0ro+gESl9q1g
	3DtGaSjHRKRxbbYDvRseNDn2tSxfCSaHr3MMDjj3f+hT3HdxrY3ehGI759lXsrahPf78bEuvZMb
	693jK8KQKawLO14D/nDjXOhSK/syk0KrdgPy2qH/BbRH4X5EPecdVklbSNXhxLA==
X-Gm-Gg: ASbGncuZazQGCKwKo6dCyjo+5C/ZCaobmdz+6/wlN3guPbQdSRVZcHZrZT12UKZFSIO
	oGixqLrHZRzgZjRVk8fvZp/EKu7mSbUOArE2vXfL0XXsVT3eSsE+i0B8alyq2/9YVmlFCrp4Tvu
	scJiro0IWiTdl6lJZxVZdZ8omww5vjUinVX1I76QrklxZjy3e5pHhZTgAALK5uUOYB1HyjtIk+e
	7oEKnJfWAsexTK8JDbs35z8mcHkKxn44NBFwzNUa1ureevS481L0EVgIEIEM+9GAUKLE9Or32AD
	l3iUZkrRkeZt5BT5t/tGNvfOIQ0SngFFtLXrLTsEG6XT+emhdeZSsvo+sKMan2ltYYPhN/JtJpD
	qFt0imX7MiJAaN5c8zKqH93xrs24JqTo8YJ3HcYaxjNSxL9I+e7GqjHBe7WzQ
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr150178965e9.32.1761051604276;
        Tue, 21 Oct 2025 06:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZFp/NfFGh9nzvdan/GtiYx6zHPVXBd5PXGxqlBj7uT7XLqj1hdDZYgamMo86fNe5GicJaNA==
X-Received: by 2002:a05:600c:3b8d:b0:46d:27b7:e7e5 with SMTP id 5b1f17b1804b1-47117917572mr150178725e9.32.1761051603807;
        Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47114423862sm283718595e9.1.2025.10.21.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
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
Subject: [PATCH v1 14/23] mm/balloon_compaction: move internal helpers to memory_compaction.c
Date: Tue, 21 Oct 2025 14:59:19 +0200
Message-ID: <20251021125929.377194-15-david@redhat.com>
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

Let's move the helpers that are not required by drivers anymore.

While at it, drop the doc of balloon_page_device() as it is trivial.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 44 ------------------------------
 mm/balloon_compaction.c            | 38 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index d1d4739398978..eec8994056a44 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -75,48 +75,4 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	balloon->migratepage = NULL;
 	balloon->adjust_managed_page_count = false;
 }
-
-#ifdef CONFIG_BALLOON_COMPACTION
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-#endif /* CONFIG_BALLOON_COMPACTION */
-
-/*
- * balloon_page_insert - insert a page into the balloon's page list and make
- *			 the page->private assignment accordingly.
- * @balloon : pointer to balloon device
- * @page    : page to be assigned as a 'balloon page'
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		SetPageMovableOps(page);
-		set_page_private(page, (unsigned long)balloon);
-	}
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_finalize - prepare a balloon page that was removed from the
- *			   balloon list for release to the page allocator
- * @page: page to be released to the page allocator
- *
- * Caller must ensure the balloon_pages_lock is held.
- */
-static inline void balloon_page_finalize(struct page *page)
-{
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
-		set_page_private(page, 0);
-	/* PageOffline is sticky until the page is freed to the buddy. */
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 709c57c00b481..717bc43732d09 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -17,6 +17,44 @@
  */
 static DEFINE_SPINLOCK(balloon_pages_lock);
 
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+
+/*
+ * balloon_page_insert - insert a page into the balloon's page list and make
+ *			 the page->private assignment accordingly.
+ * @balloon : pointer to balloon device
+ * @page    : page to be assigned as a 'balloon page'
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_insert(struct balloon_dev_info *balloon,
+				       struct page *page)
+{
+	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
+	list_add(&page->lru, &balloon->pages);
+}
+
+/*
+ * balloon_page_finalize - prepare a balloon page that was removed from the
+ *			   balloon list for release to the page allocator
+ * @page: page to be released to the page allocator
+ *
+ * Caller must ensure the balloon_pages_lock is held.
+ */
+static inline void balloon_page_finalize(struct page *page)
+{
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		set_page_private(page, 0);
+	/* PageOffline is sticky until the page is freed to the buddy. */
+}
+
 static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 				     struct page *page)
 {
-- 
2.51.0

