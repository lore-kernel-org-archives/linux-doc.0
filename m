Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E5C3370E7
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051588; cv=none; b=tLlIvadPA0PIJynsoOu5vb6lhV2BmeJevUWLsK39s2nD8POX3yJNDZT7t6KezqdJtouvc7TldgFLLuTw++DlvoIkcqQT++4ahYWeObbd5zwq7Tod0h+nElR9i682QdAXBC8q1zBVyZW4Vm19a97hoQMCa/cqNIoYQhy2+07N1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051588; c=relaxed/simple;
	bh=97cB6P/al8lN3e4yxP/MWCa5SAPX4AFlrOtpe6WV0P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eY/aoAZuWbuVhUQ4Ex+weMKFhWoWSJLvbmZwDxcc5D93wPk6vRE7Z+5Pm8ZQ4HLVMmDvddHINpEtOArG11yKEuGiYjXGHJHWvd2ofHtJFrweHpaFeidHZYb8r9Hb2qEWLfeUYk3sJc4lKIvlD9A37YFDFlNA5Sxw7q+YIAnQIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZAy+33h9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZAy+33h9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
	b=ZAy+33h9qrhYN1iAKws27dnpJNdL+vm/L8QX4yek9IJJpDwIbvh4IZenrECBaR5CcCv+jk
	8krWVS11VljBcUiCjlxKIRuxvWHn8q74P686znjjt2MsSIxu1ktWqg9xzPvwUNSNQk0Rgv
	tW/nqAfZzP8Qeq+QeMuRRhQ8t0HAxHQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-lDr_3efgOHqUML_zee05yA-1; Tue, 21 Oct 2025 08:59:44 -0400
X-MC-Unique: lDr_3efgOHqUML_zee05yA-1
X-Mimecast-MFC-AGG-ID: lDr_3efgOHqUML_zee05yA_1761051584
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ef9218daf5so6231123f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051583; x=1761656383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUyqikpnRIZJJ7+CBYLr21ot5Ik6tImIDaS0WggNCzg=;
        b=qbwcTULk41qLZULs3q+mu5ga42nWjA1yxVavKbJjCRr+QPBFCiW9rgFYn9gg9z0Hzk
         Rin4rI/ZsmyNucIH5FhUYa+10B4W/gQ0XM1f7cvo/IW2c+eBE8mrw83VAP5nIxrd/9GL
         bXMlWo/wNe5AGz6J7XRZ1av42uVyrLenMQxvDvbJbV+T6ad38x0Iqzwg1ZaDtLxApUb6
         +I6sut+DMQaKnQ8vjKrGDf41NW6BNbrkWx8MFfrC3Nrkk9MTOdTKUCva2EzroS66uVUG
         M3gwWNv9IPHP5oVLquRXnwftMaYA3Ry49vrwgShLvtYnzlyylVsWawoHLRJkKdjIePey
         Xn0g==
X-Forwarded-Encrypted: i=1; AJvYcCXfUCEDKx91B7gBSEIdFhzohpe8WhVo2eG656jtRLGk3/EGJZFICVyswneUsXzGqWHfP32O5ySqVvw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrb0IuNLTVzWkZgHcnfxNKrdf6lzheMvc6lnP10NJ2KL7pxcUC
	k98h6XElsvKbphQJ3kv/ZQDTydvJWYNEETIOEPoRpkstflMdgzzphdkErgYwEm78loozYU+0obX
	ZRN9Tjz43soZldoIOLocFDyBDogLiLaCRZuIDJSRrcT1vyEE1jA20dHAhBMNIoA==
X-Gm-Gg: ASbGncumWky7aULzZgM89gB538rlVdk2doUiRc2lGH2ldr0DJQtoo8JvzaYxW9r9qXj
	0QFo9e9kEAHQn6aN6mYF37E1zje+EyyEBuGoOx1Y2gsjG59JoW6nIz395ulWoAcvF7frJ1pnAqL
	szR2R3/vf74Ona2pv2SECruJwTcJm1xr6E+B89mhDt7cLfCOxEVzDK0Ija8t9HSpcreq0EBsV9k
	1Ym4Hr19peUvtukKLgv9hK1JnF0cDc54vZMe/fWcmOHfP7IAQG+7+RAPow4k4UkQBx12BrH89vw
	rHZ+qn1b7tBI/HtL80W+KfOiHsJ+htOee1oIEMqAaphiVqBsdfD37hyhOviPUacY5ViTGr1sn2r
	1lZw+x7BJfpBfsh2aUqNJgk5LdWs99hW+kaOGS8OaFz+O4ZeoWvCzQJVIxOu8
X-Received: by 2002:a05:6000:26d1:b0:3ec:db0a:464c with SMTP id ffacd0b85a97d-42704dc94a0mr12883690f8f.44.1761051583500;
        Tue, 21 Oct 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe5sfmvBNGfARqbQvLIETNCNFniX0I3Wgmf7ZO8nqCKClSavcBGyNI7STnbkUGhrMC20EJA==
X-Received: by 2002:a05:6000:26d1:b0:3ec:db0a:464c with SMTP id ffacd0b85a97d-42704dc94a0mr12883652f8f.44.1761051583045;
        Tue, 21 Oct 2025 05:59:43 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3acfsm20082945f8f.14.2025.10.21.05.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:42 -0700 (PDT)
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
Subject: [PATCH v1 05/23] mm/balloon_compaction: centralize adjust_managed_page_count() handling
Date: Tue, 21 Oct 2025 14:59:10 +0200
Message-ID: <20251021125929.377194-6-david@redhat.com>
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

Let's centralize it, by allowing for the driver to enable this handling
through a new flag (bool for now) in the balloon device info.

Note that we now adjust the counter when adding/removing a page into the
balloon list: when removing a page to deflate it, it will now happen
before the driver communicated with hypervisor, not afterwards.

This shouldn't make a difference in practice.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 13 +------------
 drivers/virtio/virtio_balloon.c      | 19 ++-----------------
 include/linux/balloon_compaction.h   |  2 ++
 mm/balloon_compaction.c              | 17 +++++++++++++++++
 4 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 07b21d2bc8a78..9ed71683ae402 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -165,7 +165,6 @@ static long cmm_alloc_pages(long nr)
 
 		balloon_page_enqueue(&b_dev_info, page);
 		atomic_long_inc(&loaned_pages);
-		adjust_managed_page_count(page, -1);
 		nr--;
 	}
 
@@ -190,7 +189,6 @@ static long cmm_free_pages(long nr)
 		if (!page)
 			break;
 		plpar_page_set_active(page);
-		adjust_managed_page_count(page, 1);
 		__free_page(page);
 		atomic_long_dec(&loaned_pages);
 		nr--;
@@ -515,16 +513,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
 		return -EBUSY;
 	}
 
-	/*
-	 * When we migrate a page to a different zone, we have to fixup the
-	 * count of both involved zones as we adjusted the managed page count
-	 * when inflating.
-	 */
-	if (page_zone(page) != page_zone(newpage)) {
-		adjust_managed_page_count(page, 1);
-		adjust_managed_page_count(newpage, -1);
-	}
-
 	/*
 	 * activate/"deflate" the old page. We ignore any errors just like the
 	 * other callers.
@@ -551,6 +539,7 @@ static int cmm_init(void)
 		return -EOPNOTSUPP;
 
 	balloon_devinfo_init(&b_dev_info);
+	b_dev_info.adjust_managed_page_count = true;
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		b_dev_info.migratepage = cmm_migratepage;
 
diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 8969271581bca..f7d6a4a6e54f5 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -274,9 +274,6 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
 
 		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
 		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
-		if (!virtio_has_feature(vb->vdev,
-					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-			adjust_managed_page_count(page, -1);
 		vb->num_pfns += VIRTIO_BALLOON_PAGES_PER_PAGE;
 	}
 
@@ -295,9 +292,6 @@ static void release_pages_balloon(struct virtio_balloon *vb,
 	struct page *page, *next;
 
 	list_for_each_entry_safe(page, next, pages, lru) {
-		if (!virtio_has_feature(vb->vdev,
-					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
-			adjust_managed_page_count(page, 1);
 		list_del(&page->lru);
 		put_page(page); /* balloon reference */
 	}
@@ -839,17 +833,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
 	if (!mutex_trylock(&vb->balloon_lock))
 		return -EAGAIN;
 
-	/*
-	  * When we migrate a page to a different zone and adjusted the
-	  * managed page count when inflating, we have to fixup the count of
-	  * both involved zones.
-	  */
-	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM) &&
-	    page_zone(page) != page_zone(newpage)) {
-		adjust_managed_page_count(page, 1);
-		adjust_managed_page_count(newpage, -1);
-	}
-
 	/* balloon's page migration 1st step  -- inflate "newpage" */
 	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
 	set_page_pfns(vb, vb->pfns, newpage);
@@ -958,6 +941,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
 	if (err)
 		goto out_free_vb;
 
+	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
+		vb->vb_dev_info.adjust_managed_page_count = true;
 #ifdef CONFIG_BALLOON_COMPACTION
 	vb->vb_dev_info.migratepage = virtballoon_migratepage;
 #endif
diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 7cfe48769239e..3109d3c43d306 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -56,6 +56,7 @@ struct balloon_dev_info {
 	struct list_head pages;		/* Pages enqueued & handled to Host */
 	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
 			struct page *page, enum migrate_mode mode);
+	bool adjust_managed_page_count;
 };
 
 extern struct page *balloon_page_alloc(void);
@@ -73,6 +74,7 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 	spin_lock_init(&balloon->pages_lock);
 	INIT_LIST_HEAD(&balloon->pages);
 	balloon->migratepage = NULL;
+	balloon->adjust_managed_page_count = false;
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 5444c61bb9e76..fd9ec47cf4670 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -23,6 +23,8 @@ static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
 	BUG_ON(!trylock_page(page));
 	balloon_page_insert(b_dev_info, page);
 	unlock_page(page);
+	if (b_dev_info->adjust_managed_page_count)
+		adjust_managed_page_count(page, -1);
 	__count_vm_event(BALLOON_INFLATE);
 	inc_node_page_state(page, NR_BALLOON_PAGES);
 }
@@ -95,6 +97,8 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 			continue;
 
 		list_del(&page->lru);
+		if (b_dev_info->adjust_managed_page_count)
+			adjust_managed_page_count(page, 1);
 		balloon_page_finalize(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
@@ -256,12 +260,25 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 
 		balloon_page_insert(b_dev_info, newpage);
 		__count_vm_event(BALLOON_MIGRATE);
+
+		if (b_dev_info->adjust_managed_page_count &&
+		    page_zone(page) != page_zone(newpage)) {
+			/*
+			 * When we migrate a page to a different zone we
+			 * have to fixup the count of both involved zones.
+			 */
+			adjust_managed_page_count(page, 1);
+			adjust_managed_page_count(newpage, -1);
+		}
 		break;
 	case -ENOENT:
 		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 
 		/* Old page was deflated but new page not inflated. */
 		__count_vm_event(BALLOON_DEFLATE);
+
+		if (b_dev_info->adjust_managed_page_count)
+			adjust_managed_page_count(page, 1);
 		break;
 	default:
 		return rc;
-- 
2.51.0

