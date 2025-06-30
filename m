Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FBF2BD5B9
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288508; cv=none; b=JZ1ZdJbHlWUvyxBxUN0k+2Tchtte8KutYbUcMD/yqnj8D8gJjvgQAjQ9o/J0TdNFToH05xM+inHN5gLzgJc2IKF8YBeDK32dmUMIR+LyLo3ORNfe64NdInhq9jlacNphyk6Flr+s27CIQgZzOyge3dg+iPwtWkNq8OBkzfVFCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288508; c=relaxed/simple;
	bh=VLtr/75+OgLg5UKJqAhr4SPpTHq3QNsAl+8ocPk3Nhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebF5OxhP2VD8vZQICYstfEMsFkmBz2yYgsGcQBT92wHTj8hu1KWEoLphJilcpdG9PCIoq19AskWiMewEwdR77znhP34nMoJjQEl5d+PgEePkgZO3bYhJarnjciQnObzhPCHNJyJ5OLIvvdcJBKTC+ZF5Z7nzYiPbUIoTkElDg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eO5Ns51a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eO5Ns51a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=eO5Ns51aDvdeyZqjjDiN/dQAyzOiQnjXJWZPC5YqXZt1TkIiSwWWjQULOz1zKJbRf2L/sN
	zqpqxmx7j7Zjsp+WbTHh1FW8PkupdWmAv6MHN+N6P7L0KFBe9dWO7LvsiyqwC+l08hQnYg
	IcsuVokwET5BDQTToM2Ty+OxUWmaerY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-QgcjWzsiMvOPPK0mzBp6wg-1; Mon, 30 Jun 2025 09:01:44 -0400
X-MC-Unique: QgcjWzsiMvOPPK0mzBp6wg-1
X-Mimecast-MFC-AGG-ID: QgcjWzsiMvOPPK0mzBp6wg_1751288502
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so1975982f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288502; x=1751893302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=ipxIzvbdzPJ858tlt5wpT7gW+bsrSAU6MNQ2v0uQA99ceQWK2RA/YQRwi5PjAeP+tU
         f2vEk6ob/xonLMi1HPv73tB2BYBViDXCmpCz0D6I3Et/UJnyxYRkoTk49kzT4J8Pr+up
         JUb0o3AApgRxFAly8F+LhevRBPH1kfmTichB//iVQHSmcVw8290glBR5eih+OsfBKPPY
         6tALkAZeXsi3sqC/e826nce3TNa1ViXZi/wjnpPOaxPtpcewIvWh/DNZoU56+Z1TFCFR
         43NT898CJgfwCBMd6A2T3ddqOP6UiGtp9QXU+2Bx2G3N2rLVngYG1f0RH9nk1Y72/8Up
         Oi+w==
X-Forwarded-Encrypted: i=1; AJvYcCVfaWdhk2BtTzOZaUvGjJbF2JoAV5eRlarljlLM/njEM6wPPx61WXKfm07vIgtgUnNeqVnhWvM9X1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhWOxzGZxzc73jHdCWAQeBqYvft4SbQjAsInwCvRYklMt+zZT
	3cdp7v99QczwoztG125+syj6mRNQGbYljGdRo7EfEEUUGVySck00kppLxCga5FnvRLmgEE5rnfJ
	TSdRf1EUzZEazbdGwiLAjOptZdKity6vo25fr1bPksXs2dKoJXxxWztwKP87wlw==
X-Gm-Gg: ASbGncuOqit/jjkSDZvbIcByU64nXpaUSv7LvbJ28Noy3i8ke3NEBv+9BtlaE8ehKmC
	yOMJC71U5445R5ZO4DAWSfU50qmVpm8Aq43fVsswPcrd/xdCEeRbqY+UITessAwEk0KKuH+T5JX
	GGUIY4wR6oYzcV2llyP7grwAnFxKI/VQmsGwtmFm0qEqQ04e6dczd9gwPmJ/QzJaEq94MxHDsBy
	UWJ/d99msoIKYJAIFdjNIGt/VtuKhrsTaY27p87nvFiy2O6Nsu9GbxtzH2iE+88XZhFp7Xl56ol
	xHiyt8WRAgV1mMuSQFXiBqQYKdCufd7Np/byktC6Gia7USFUoGwmQk0o3IVOgCM7+/MDPBzNd/n
	fXvBzKmg=
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545874f8f.31.1751288501847;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmBHmttdmK2eq+WBU1B9I2DDaPMLfI/76nbXYnXDHgExr/7iQPmKv6fPJxJBiz140zN+RyvQ==
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545827f8f.31.1751288501169;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f943sm10337130f8f.101.2025.06.30.06.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:40 -0700 (PDT)
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
Subject: [PATCH v1 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Mon, 30 Jun 2025 15:00:10 +0200
Message-ID: <20250630130011.330477-30-david@redhat.com>
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

