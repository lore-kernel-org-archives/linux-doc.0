Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A59C1D935C
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151897; cv=none; b=Mtwfp5v4G0sm6XyyYJXfUfa+qPN9ceaU9OeYWQYw/qkyuRh7NiuBzq1y77UoMsmOLnYCgxKWdAgbdR6ZIfkpFwpTZgKhJXXFMCYK8x1Dl0B7FrGPFroC8L09vG3s6u9uOoAZfS4xDONu4rlaV9MzeM11psLCV8mGrRUeRlCTKDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151897; c=relaxed/simple;
	bh=ctFwb9uMTBVm9UDo1nN2tyX9Jer31qwqNzGs00Hd6Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9S+7zOVYgIlVK3JNWP+Ib+n/s3s1cL8GWWjvjto835G2VEWyrz+eXYA6+JqdRJcZ/tH3XGna/kmXYfqfc1khIc2wkHtxWzea0f0Hq/LvJvVo6Qpx3RXm9z5KWf5jo/gpMFV1zUBUHlGrOmnJRKZ7z68PnolqWvzbbCTRD1FJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=insHvV7D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="insHvV7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7tz66Q1mh6b9biGlGMq1Dqed0aye0/ijzbhQ2yLKo0=;
	b=insHvV7DtDiDrZ42pwUfxeXg65hxU4pZitxguPUrDZkNNpAMl6Mmb+OqYSPBfjuBN0TZZI
	nR60auiSeJ9b6kuDeTjjxzbUmsZ+JpEyO+Qo3iFrbq6viJRkMvQu1UGuLijuUtu9Gfo+/T
	7YFX1+jsAtnEPW9t/V1nDPfawhibA2A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-fPkLs9zdNvCrNbz7QAk9fw-1; Wed, 29 Jan 2025 06:58:13 -0500
X-MC-Unique: fPkLs9zdNvCrNbz7QAk9fw-1
X-Mimecast-MFC-AGG-ID: fPkLs9zdNvCrNbz7QAk9fw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385d6ee042eso4940013f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151892; x=1738756692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7tz66Q1mh6b9biGlGMq1Dqed0aye0/ijzbhQ2yLKo0=;
        b=e8Y8NkiEf6jKOjGJlboHLg/AQcXP55gA6Xnm/jEXu217I2/i9slscxJrJ5fbM05+Nj
         jtHY5hL8I9q6ho7fbf+6fcZG26/a74/W1X/BLlDsVIjkGxwdyahZ90tnXJNOAR++Igi9
         r/yM8sJNk6/gwakTN3h4f37Mecskkn7DRkhIgUP0SZAS0yVrf4igJ8bf9ViaRSqWjr8T
         851YdEMYD4hV5JRYJZCM2WWbQ00RVOXN2+E1ttG9AxtVft2+ptaoB+e08xDb82tUQso+
         zzvmxAYw+NDsapv2leXrZOucvJrNG5y2P/2RXsGOL9yXJPj/+tIFB9pR3hDc64qeCQOV
         /1ZQ==
X-Gm-Message-State: AOJu0YwmVmiqMrGX3m3zP7SVQLHDaiqHiTprMk9TXhcL7+qhGbN98qPx
	BpeuwQSfWTKr63xy2LglbcUnoEn1QaAOzOqscCutgPEeQzNqtq3xW8jMSuncjlTUEyX2eiqYxPh
	kxFaa/8CvCk0G5esFeLvP1WOHRjD6hYQ7H1ygx1hysyom7t/7R9LbWNcNOQ==
X-Gm-Gg: ASbGncsY+nRSCgBW9i6tWByZ70kYIBwM1F+T2rSlXqyi13NrfKkJARWBXXxujL6vIaF
	nXUoNVv+LVcjw3NWvXQLBNxi24il/wtX8+ycUAKDmtuzWAsnjrqlotv+ZdH5R187asT6PVwRW4Z
	kgae7PqHSMslRaecDpKH3Sm9KdiyHHnFhn8pc6KBtW4HAYn1J93YDIlgHlPW4zbf3aESpkRvV6X
	OpXAPfJeIeoTDxOQ7akRgK66tAblGDOiNaCQ1fQCoIDsC/b7QjS0xq8Ad3K89TNLvLTUoTgAuxv
	VEEMDmMvz+Kb0+Lck7fwPsHhCD8tDa2R/R0AiTeMll7f1ykqLWTdpFYLM18fsgKfGQ==
X-Received: by 2002:a5d:5986:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38c520b0b02mr2139380f8f.50.1738151892507;
        Wed, 29 Jan 2025 03:58:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkkUWuvL/Qi4Q+ZXMjYaW+MERJXy55kjeOBJGiA5aHVhI3t0Ux4qagc7L275aZnwYNWB5ItA==
X-Received: by 2002:a5d:5986:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38c520b0b02mr2139337f8f.50.1738151892123;
        Wed, 29 Jan 2025 03:58:12 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1bb057sm17068560f8f.62.2025.01.29.03.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:58:11 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 2/4] mm/mmu_notifier: drop owner from MMU_NOTIFY_EXCLUSIVE
Date: Wed, 29 Jan 2025 12:58:00 +0100
Message-ID: <20250129115803.2084769-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We no longer get a MMU_NOTIFY_EXCLUSIVE on conversion with the owner set
that one has to filter out: if there already *is* a device-exclusive
entry (e.g., other device, we don't have that information), GUP will
convert it back to an ordinary PTE and notify via
remove_device_exclusive_entry().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 6 +-----
 include/linux/mmu_notifier.h          | 4 +---
 include/linux/rmap.h                  | 2 +-
 lib/test_hmm.c                        | 2 +-
 mm/rmap.c                             | 3 +--
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 39e3740980bb..4758fee182b4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -510,10 +510,6 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
 	struct svm_notifier *sn =
 		container_of(mni, struct svm_notifier, notifier);
 
-	if (range->event == MMU_NOTIFY_EXCLUSIVE &&
-	    range->owner == sn->svmm->vmm->cli->drm->dev)
-		return true;
-
 	/*
 	 * serializes the update to mni->invalidate_seq done by caller and
 	 * prevents invalidation of the PTE from progressing while HW is being
@@ -609,7 +605,7 @@ static int nouveau_atomic_range_fault(struct nouveau_svmm *svmm,
 
 		notifier_seq = mmu_interval_read_begin(&notifier->notifier);
 		mmap_read_lock(mm);
-		page = make_device_exclusive(mm, start, drm->dev, &folio);
+		page = make_device_exclusive(mm, start, &folio);
 		mmap_read_unlock(mm);
 		if (IS_ERR(page)) {
 			ret = -EINVAL;
diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index d4e714661826..bac2385099dd 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -44,9 +44,7 @@ struct mmu_interval_notifier;
  * owner field matches the driver's device private pgmap owner.
  *
  * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will no
- * longer have exclusive access to the page. When sent during creation of an
- * exclusive range the owner will be initialised to the value provided by the
- * caller of make_device_exclusive(), otherwise the owner will be NULL.
+ * longer have exclusive access to the page.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 86425d42c1a9..3b216b91d2e5 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -664,7 +664,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags);
 void try_to_unmap(struct folio *, enum ttu_flags flags);
 
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
-		void *owner, struct folio **foliop);
+		struct folio **foliop);
 
 /* Avoid racy checks */
 #define PVMW_SYNC		(1 << 0)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 1c0a58279db9..8520c1d1b21b 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -786,7 +786,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 		struct folio *folio;
 		struct page *page;
 
-		page = make_device_exclusive(mm, addr, &folio, NULL);
+		page = make_device_exclusive(mm, addr, &folio);
 		if (IS_ERR(page)) {
 			ret = PTR_ERR(page);
 			break;
diff --git a/mm/rmap.c b/mm/rmap.c
index 4acc9f6d743a..d99dbf59adc6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2397,7 +2397,6 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
  * make_device_exclusive() - Mark an address for exclusive use by a device
  * @mm: mm_struct of associated target process
  * @addr: the virtual address to mark for exclusive device access
- * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
  * @foliop: folio pointer will be stored here on success.
  *
  * This function looks up the page mapped at the given address, grabs a
@@ -2421,7 +2420,7 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
  * Returns: pointer to mapped page on success, otherwise a negative error.
  */
 struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
-		void *owner, struct folio **foliop)
+		struct folio **foliop)
 {
 	struct folio *folio, *fw_folio;
 	struct vm_area_struct *vma;
-- 
2.48.1

