Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409362F50AD
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624756; cv=none; b=l9f6B0FTGWpsHJ1bIqT4rLSV/ztrmZK7q/1/33na0pY0o1BiW5tGIua7uYieetb0tWw69jyWpVgFvK0n65oU2ZimUOWT5lwrCsOxts/pDDLM5V39HP/7ByuiHo+jQ5+2ilbLXpap5fZUMOJSncbmCfG7voHira9IGrqYEFCEpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624756; c=relaxed/simple;
	bh=cpXSWX6aTPOh+pmlPrRH6DoAXsk2bYocWaGA0TOO5Uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nr7DyO9kC3oXxZZPODhFAVSdiun3Cma87p4Mx1Kra7eOSoTSIG7inHSjQnT0T1vCZH1rBTZFIKH6klElmqr7xryF5h42rVrgB0nLirDeXKRVpm8zpsmPLW6CVXew3c1wBC7ukO9Bx5x/hzPO+myjGVasThiqpJUMPeYSZM0lY28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xt8up5Ay; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xt8up5Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
	b=Xt8up5AySavAvEx9qxpOwNV+rjLcRshFO/bPhWiittVu6T+GKAft0tNbaeQbj+nK2IJ2nW
	zsMOcs0fUd6lLaKiXBR6aQ7qmeDYHPSmg13HTsSCT+cmoukZNXrCT/sF1HODYn4QhAi4MO
	Z1vvwfj8EMAIQ5P90QxyuBF4E4BB9L0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-u2qKNeSCOMiFq_xabQ3L2A-1; Fri, 04 Jul 2025 06:25:53 -0400
X-MC-Unique: u2qKNeSCOMiFq_xabQ3L2A-1
X-Mimecast-MFC-AGG-ID: u2qKNeSCOMiFq_xabQ3L2A_1751624752
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso4614275e9.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624752; x=1752229552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVyour2UNFNS7aNaSR0hE5hzdL3B1bhwCvX/GUFQiSw=;
        b=IzypK02n1zRQe/0xMzRHYbFFY6O1m+PJvhN2fLyweCs0MPUATOTJRn9ZKqGyQW2mVd
         uWmR+h93zgn+l5L9U34zZnBjTkj4PtM0TciyWswafjUTCKnRSNaPm4bE8wTNpbNj7HPJ
         q2VGZz1CFn6Ju7H/GviDlJeoFPQLCSbWBl4iLrDVD17sAaIWU6/pjzgl6AETFBgQxyuE
         XCyvp4+cxG5NA1St/dIqLiUNYJKx8VonUwfTc7ooGKwI139chtRdOLALKcR5Rf6MeV8t
         QiEvK1QdtpLCs9v1W88BjgJYXcfIH5RpOXKXmMlhdw9rSvHyRQatmE3DJK0KHtq69aJv
         50xA==
X-Forwarded-Encrypted: i=1; AJvYcCVoP0uPcWVZuCtO/5UskRfdoU1q7mN9GgcJBMfUW7DDR7uA06u3vPYpaSnB3qqVFIfKclMpdHamQGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVjAbyA81Hm5hAiglDhzHhXbIElrjEgAET3z3G7sa0C81HucZE
	lWej1xkNJycrS/gWHcbkFc0YUq9hCkDMV7NqklraOQ6jy2n7IfJxnManYKh9bmjXLeD87rnTQ+6
	GylD5PSC0hC1vHrBuXWd8PGMFCKUQbdjncZ4TlcIk98HAJWB5udjqyDKdP+4exw==
X-Gm-Gg: ASbGncujWG8ayGE4WFiyuxZwIBkBGlnSYGwF6uk4rt5SRFgjXB29ZTDsaQ9zLbxYPPm
	QO/y179IaJdxD87cGE3lc4gZvXYScNvNtstMuciXrn0Nu9tiAKvYuQsx/2+jT7Ex4IFJF4fxErY
	k+k7neoMk765st2OzxgenCtPT8OnOd9e+Abkf99fHtu4fPA6TYCgYFDBavgJEQtV9TcloMMUsLV
	LIj3m1Lzda8DCn4EysfwXw25PPuu7teFmU8+MZMtCQlEgfAS9GjiRfYinUIiOm8ixoDnYSZ4OGz
	SsMLP0LBaUgyViw2poHEZlyVD8KKzddjxVsJ2nUd7kUgVze9MjclzDDzakhPgUzRYsrnLDCgt1h
	gU0vIsA==
X-Received: by 2002:a05:600c:4f07:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454b835631bmr1455915e9.14.1751624751484;
        Fri, 04 Jul 2025 03:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Rez8KVGPQFiDbU29hzAgNjBI7xFdtw4twkMv/+PHLeFt8+nZnPGBAy1buVfR9Z9nLRQVCg==
X-Received: by 2002:a05:600c:4f07:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-454b835631bmr1455215e9.14.1751624750855;
        Fri, 04 Jul 2025 03:25:50 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b1634b0fsm22804075e9.17.2025.07.04.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:49 -0700 (PDT)
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
Subject: [PATCH v2 08/29] mm/migrate: rename putback_movable_folio() to putback_movable_ops_page()
Date: Fri,  4 Jul 2025 12:25:02 +0200
Message-ID: <20250704102524.326966-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... and factor the complete handling of movable_ops pages out.
Convert it similar to isolate_movable_ops_page().

While at it, convert the VM_BUG_ON_FOLIO() into a VM_WARN_ON_PAGE().

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 2e648d75248e4..c3cd66b05fe2f 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -133,12 +133,30 @@ bool isolate_movable_ops_page(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static void putback_movable_folio(struct folio *folio)
+/**
+ * putback_movable_ops_page - putback an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Putback an isolated movable_ops page.
+ *
+ * After the page was putback, it might get freed instantly.
+ */
+static void putback_movable_ops_page(struct page *page)
 {
-	const struct movable_operations *mops = folio_movable_ops(folio);
-
-	mops->putback_page(&folio->page);
-	folio_clear_isolated(folio);
+	/*
+	 * TODO: these pages will not be folios in the future. All
+	 * folio dependencies will have to be removed.
+	 */
+	struct folio *folio = page_folio(page);
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
+	folio_lock(folio);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(page))
+		page_movable_ops(page)->putback_page(page);
+	ClearPageIsolated(page);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 /*
@@ -166,14 +184,7 @@ void putback_movable_pages(struct list_head *l)
 		 * have PAGE_MAPPING_MOVABLE.
 		 */
 		if (unlikely(__folio_test_movable(folio))) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(folio), folio);
-			folio_lock(folio);
-			if (folio_test_movable(folio))
-				putback_movable_folio(folio);
-			else
-				folio_clear_isolated(folio);
-			folio_unlock(folio);
-			folio_put(folio);
+			putback_movable_ops_page(&folio->page);
 		} else {
 			node_stat_mod_folio(folio, NR_ISOLATED_ANON +
 					folio_is_file_lru(folio), -folio_nr_pages(folio));
-- 
2.49.0

