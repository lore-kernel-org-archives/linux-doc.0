Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D3334688
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051593; cv=none; b=OI31+vov5d1WW5iLfJ7aXcnS+Ip0ooBCLGHXlxn36fgYehCaPUV6qMrP3Y01l4kVmEjYSjE0qnOpts+POc9hI8WuH9Z7c8ldAxkRRNta5FijdnbjzVG/vpEFcScX9dt+BllS7qQP+LVPGIDsWj7TOEnmPsEP7jWYdQ3G8CIq/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051593; c=relaxed/simple;
	bh=YLWsOT/fjbA9n4u49rmVT4FCqZV2WT6/mBViN35ADWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kTKi58JUGH0kTXjVSiplQkU/37ZwrqY1A4ngLBI5wvXomvSLs7WGv8MuiIFIs7vHgsl6MvMyBn12pxWap+hE/lxIGzjmLs0TCGDuC1Bhs6osCRXj7os5fJjjUcD3/65B2vxHC8bwpfOk6DL1P2qqq5OcT0RNbjk9RGahbEGVBgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gimRm8bM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gimRm8bM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
	b=gimRm8bMmG/uzJtjmrC3bJuObFEpgrNbSzxERApPAHLb1B/+SRmODkfPrQnfeknNuHmZgb
	jbG4M9QVTyRPwxzkpuqmHCV5DDyr9nO0a6MkfjZwM1MykBY1+Gd025X+FvngI1QWwjhf/z
	BNGSPLpBj+LKxoBsvNd++w9ce+xz5QU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Dm54NQAVMoCZh7j9UEbOCA-1; Tue, 21 Oct 2025 08:59:47 -0400
X-MC-Unique: Dm54NQAVMoCZh7j9UEbOCA-1
X-Mimecast-MFC-AGG-ID: Dm54NQAVMoCZh7j9UEbOCA_1761051586
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426ff59a320so7155809f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051586; x=1761656386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxQnhgSm0DzB03k3ShvGshMJPsSCnBiKfz0W3WaQRCE=;
        b=IeoASnV5iN5LjVwX90zR0FPpDq0BHf+BHaYwPeLvJhNdaRWCnS2UsFdevWy+jGXGp0
         v5YEZShXJMuh9i+zaOTerNs74Ot+fymPtwgYVWWVPrNQ0mEA8Z4oMmd3HPTix/fRXb7h
         wa+r2cEDHGjmDVv4GrX8mL4XVr4OA1K7DmXYC/SkIztVG13Ubie1Uc2wSlFQtgyCUVKB
         MMSQn+B88Jrjd1L6ps+hWMr+SJWml0p5JUwdEbfVyFRh8MHQqmFS40+Yc0LwC96YMgmF
         N9cY+C30Yxt/pzeuX9XWTNW73Xr4rW9f146QJtzUpHmf/OpRZq/kWkwfDE6PS0ytH2Df
         lgTA==
X-Forwarded-Encrypted: i=1; AJvYcCW0LEtv3P9kECU9z4JzBmw5dxW2AFROGjvr7LUtygIismO8oIwf3PrtKuJUMwnRJKS1n1pG1DMWkpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0kzH7e+C7Uh5/h00dH9C1PN5E3Wh4BezeeCgLLqe4qht224Sx
	enKXno8GA1lqwgY0Zm3MLtDgEnoMQWYKoaKVz4MCiTHFJXFhcrlKlZAsR7RAsnhTeqdvFD0tTht
	DSJe+PWjEi+xNCtcfArVHEY++Gl9rgy3JmoyMEP7G4Nl3xoTlCtvHAduUxdxBig==
X-Gm-Gg: ASbGncv2rej8PdywNzXeItQ/h1ZYAdswe6E+9S26OkRaP62fs5Qkb7joZTt06L8E5cP
	bCcEJliiiDA28heAxHiSAzjLLN/mvPChTggu/w30KSMcQwIThBA8fVW+Qtk9n4I42KaccUXAi16
	SoOr50WowUfResgbFzVObfv/kOgGigIHd3NzhNshUgG5htsLK59psQLoOzKtcQVddRD5yqtmaUC
	ul8CQ9s6nEBSFQuPSghPbSchIqGWZWCEb8ScccWg9ZeWYJ4t9hFSKqv8/psbVDS16btLsKL7pPJ
	4Knaj+z2O6En4YAvsfutKwr1n7lc2d9wCGkWSxcpkgb4p++eRB5TEZkTb/JLezlvfU6Jc74LOpa
	JCQ7sQVQ0Wly3p2dqfz44OEVEfk9GQU2Fnahjro532WTbJzHG7lCnxzdAc5Sx
X-Received: by 2002:a05:6000:26d1:b0:408:d453:e40c with SMTP id ffacd0b85a97d-42704d8efa0mr12411507f8f.25.1761051585847;
        Tue, 21 Oct 2025 05:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEOtDIfhDIzkXczwnOUGV3QbWhaE/6kTj9DtjKKHbsfSDizDdGlR5kALx8VAPeRCrHUv5bhA==
X-Received: by 2002:a05:6000:26d1:b0:408:d453:e40c with SMTP id ffacd0b85a97d-42704d8efa0mr12411489f8f.25.1761051585441;
        Tue, 21 Oct 2025 05:59:45 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ba070sm20517572f8f.42.2025.10.21.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:44 -0700 (PDT)
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
Subject: [PATCH v1 06/23] vmw_balloon: stop using the balloon_dev_info lock
Date: Tue, 21 Oct 2025 14:59:11 +0200
Message-ID: <20251021125929.377194-7-david@redhat.com>
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

Let's not piggy-back on the existing lock and use a separate lock for the
huge page list.

This is a preparation for changing the locking used to protect
balloon_dev_info.

While at it, talk about "page migration" instead of "page compaction".
We'll change that in core code soon as well.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/misc/vmw_balloon.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
index 52b8c0f1eead7..53e9335b6718c 100644
--- a/drivers/misc/vmw_balloon.c
+++ b/drivers/misc/vmw_balloon.c
@@ -354,10 +354,15 @@ struct vmballoon {
 	/**
 	 * @huge_pages - list of the inflated 2MB pages.
 	 *
-	 * Protected by @b_dev_info.pages_lock .
+	 * Protected by @huge_pages_lock.
 	 */
 	struct list_head huge_pages;
 
+	/**
+	 * @huge_pages_lock: lock for the list of inflated 2MB pages.
+	 */
+	spinlock_t huge_pages_lock;
+
 	/**
 	 * @vmci_doorbell.
 	 *
@@ -987,7 +992,6 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 					unsigned int *n_pages,
 					enum vmballoon_page_size_type page_size)
 {
-	unsigned long flags;
 	struct page *page;
 
 	if (page_size == VMW_BALLOON_4K_PAGE) {
@@ -995,9 +999,9 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 	} else {
 		/*
 		 * Keep the huge pages in a local list which is not available
-		 * for the balloon compaction mechanism.
+		 * for the balloon page migration.
 		 */
-		spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
+		spin_lock(&b->huge_pages_lock);
 
 		list_for_each_entry(page, pages, lru) {
 			vmballoon_mark_page_offline(page, VMW_BALLOON_2M_PAGE);
@@ -1006,7 +1010,7 @@ static void vmballoon_enqueue_page_list(struct vmballoon *b,
 		list_splice_init(pages, &b->huge_pages);
 		__count_vm_events(BALLOON_INFLATE, *n_pages *
 				  vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
-		spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
+		spin_unlock(&b->huge_pages_lock);
 	}
 
 	*n_pages = 0;
@@ -1033,7 +1037,6 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 {
 	struct page *page, *tmp;
 	unsigned int i = 0;
-	unsigned long flags;
 
 	/* In the case of 4k pages, use the compaction infrastructure */
 	if (page_size == VMW_BALLOON_4K_PAGE) {
@@ -1043,7 +1046,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 	}
 
 	/* 2MB pages */
-	spin_lock_irqsave(&b->b_dev_info.pages_lock, flags);
+	spin_lock(&b->huge_pages_lock);
 	list_for_each_entry_safe(page, tmp, &b->huge_pages, lru) {
 		vmballoon_mark_page_online(page, VMW_BALLOON_2M_PAGE);
 
@@ -1054,7 +1057,7 @@ static void vmballoon_dequeue_page_list(struct vmballoon *b,
 
 	__count_vm_events(BALLOON_DEFLATE,
 			  i * vmballoon_page_in_frames(VMW_BALLOON_2M_PAGE));
-	spin_unlock_irqrestore(&b->b_dev_info.pages_lock, flags);
+	spin_unlock(&b->huge_pages_lock);
 	*n_pages = i;
 }
 
@@ -1828,6 +1831,7 @@ static int __init vmballoon_init(void)
 		balloon.b_dev_info.migratepage = vmballoon_migratepage;
 
 	INIT_LIST_HEAD(&balloon.huge_pages);
+	spin_lock_init(&balloon.huge_pages_lock);
 	spin_lock_init(&balloon.comm_lock);
 	init_rwsem(&balloon.conf_sem);
 	balloon.vmci_doorbell = VMCI_INVALID_HANDLE;
-- 
2.51.0

