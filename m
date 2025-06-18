Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9022730613E
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268509; cv=none; b=WdOpqFE/KtUe5NhD62/DNMzk2h6d6kXSdwRXdAF7g3QCxulm7pjojNDuuKUhWoC5q5E0V5blbHv9SuI00erCzWcej30zEDFlLgd7Rov8k8iw6JqbChuUZZF9kBlSUXvB23LrIjrWg5fffKUMdpFnjEM1L5DU1r0RiDlkExJshYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268509; c=relaxed/simple;
	bh=VLtr/75+OgLg5UKJqAhr4SPpTHq3QNsAl+8ocPk3Nhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3hmcDDQuVLJzUPkxak95aV40pilKYZs6d4WAnj6zLq7qgmW/JE/j8AX/D2OMxUXZgcuCnvxb7BBACyMA/IcGV6dBKG2Gq32ZybrjR/X0BSoNYH0QAzfcjsksTtknxLX9Psuev2ceezBUT3wE95FOVd88v7D55Sg/cnfc51+uFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRsd9/LJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRsd9/LJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=YRsd9/LJd9Pf183PaWCTtCAlTWqX5t/S2jRSvxxNyI2zxNFgxZ6nPOIORNHuRFjmEn1sm3
	D5CFRTaaKBtI3y+xHiVGIcVN9OIrBZvVBQ8/Gptxvegv8pklhHTQgrubNdnk/neAD745+b
	oQIxisLc92760szQlNoyQZUp/l59Ky4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-LqaCOqy7NaSb6-14nlwbbA-1; Wed, 18 Jun 2025 13:41:39 -0400
X-MC-Unique: LqaCOqy7NaSb6-14nlwbbA-1
X-Mimecast-MFC-AGG-ID: LqaCOqy7NaSb6-14nlwbbA_1750268496
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d22so46555985e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268496; x=1750873296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=gqueUKtJ8LdYr7DzuCHYKctRTS/nggjkfawAmyGSF6hSJjEPX6COJnqkugzg6OhrW/
         0nK5suPMlwv2OJxJN5YiGIezddbZltJ6M57danxrhYoxOwV1ps1jfEuhaTg6lfCc50SB
         O++h1t65HYCch7hTMgtVWsGfm8SGGX8lsGv1qVc1wXW6npznh6q4PA6ITGt491/1kd/P
         Z3lAuu2g+Ke8QFpOQRuAk7GAxcAMwRpU38eMhBRxrqdgN/Fi+CHQNhUDkViuVT+pjrHc
         zD3Wuf1mbFA+m5J7yHc+p/9uRPob22J4OiPVor9lomgha6bcg/OQnEjENYAzeiYRgfBU
         /+lg==
X-Forwarded-Encrypted: i=1; AJvYcCXR9zn65V9L50Wb4KiRxjRQTAO9Z/58dsNTztxv9/g+0M4HH6MNIL5KUODB+vQu0vm7joNZ1kxOSEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTx5VrH4YtgRBOez7wkk3RN6MS64TLqyQv2vV4pfqAUqOFEjX
	Gy3aJz8l6x5wlhchM+baARpEySJ5O+hzfbEW35u8xzb2nvEc++v4kwWsAl3mOBkCSdCGKrn2PBW
	ywmBJVmYoDuLdcyIdLgS96Ey4IvcOWI3Dff+niKjuE9s1fhmq34eElzuZBmKfug==
X-Gm-Gg: ASbGnctabH2ArCSJ5rCGWkcf+k8nwQ2h76C9rN8Zt+xXmfSCil11hLren6Wt2d83RhP
	H3APe5X4AvPK0lYXiJsblHp7lNsyYlDHPiTSLDTk6JZYzQaej3RWqmfTIKXS/C6BLCr0P9iY66J
	BSUclgxzYNlM3Qjqueaedujlr88gdirOgwWOkvsI/S9bOvzVqBgbKmsdYFqWLDZKhVLqezIi+Gx
	73alCBLYzpjiHa5Tmuyyh4oDIfR+DCxrn6is98JuFQaMBRkYbm4g9YPUEVTJRkyLmdIfB+i0s8u
	zfDBz4yncQWdnJAl7LZtZ539YyGaydVjG7R+WicD4wjlKYHllpJKdFhRLV/I465ncuGXuxobCan
	0VIDMNg==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154424075e9.11.1750268496110;
        Wed, 18 Jun 2025 10:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJSoFqz4Qx4eaIpu3abT7lqqTMcn+cWB1r/wxQDnmsMcckQg5l2MzM3eBNzoSDxLAyECFAg==
X-Received: by 2002:a05:600c:5253:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-4534219a64fmr154423805e9.11.1750268495716;
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535eac8edbsm3459385e9.24.2025.06.18.10.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:35 -0700 (PDT)
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
Subject: [PATCH RFC 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Wed, 18 Jun 2025 19:40:12 +0200
Message-ID: <20250618174014.1168640-30-david@redhat.com>
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

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION
like we did for balloon_page_finalize().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 42 +++++++++++-------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 2fecfead91d26..7cfe48769239e 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -77,6 +77,15 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 
 #ifdef CONFIG_BALLOON_COMPACTION
 extern const struct movable_operations balloon_mops;
+/*
+ * balloon_page_device - get the b_dev_info descriptor for the balloon device
+ *			 that enqueues the given page.
+ */
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+#endif /* CONFIG_BALLOON_COMPACTION */
 
 /*
  * balloon_page_insert - insert a page into the balloon's page list and make
@@ -91,41 +100,20 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	SetPageMovableOps(page);
-	set_page_private(page, (unsigned long)balloon);
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	return GFP_HIGHUSER_MOVABLE;
-}
-
-#else /* !CONFIG_BALLOON_COMPACTION */
-
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
 	list_add(&page->lru, &balloon->pages);
 }
 
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		return GFP_HIGHUSER_MOVABLE;
 	return GFP_HIGHUSER;
 }
 
-#endif /* CONFIG_BALLOON_COMPACTION */
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
-- 
2.49.0

