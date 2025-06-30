Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E15F2749E1
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288452; cv=none; b=tGUWSvYn/YTaYLOR6pUNVe8WIht8rAcS9gWWKEcNt4Zgc3ivvxF31TZVpvI01Xjr4y9eGbhRoL085ipGMrfCCO6zXB08qgAIQafpyqeaZnqVYWCe6/0HX0vqnKJYkGSklSj02At2H9uSGU0f6ovgI8bmqnOZzWQHTExsfMPN41c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288452; c=relaxed/simple;
	bh=rcWuXS8i+J1+1NqCBG24FdrnWnU9/Zr9SBDXhHAAeFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNgMOWlSHbxa6OKy/83MUI8HzNr75T9hf0cbjZJEHP/uNd8fRoDrdCeiU08zrQBRVtSf+TJBKt5cSDHqBNG5KAFT2ukEoMIgsrGCTn0SoF04jT1UiblKBZT9gIvJRpM6vtnCDAaCx3292kP2irux8y4guh47PQcF+IVt6C91m5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X51H/YrE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X51H/YrE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
	b=X51H/YrEJYzcOn54jPKMwicegGEu2iaUtLaNtqPE29zuyyerbXasE3NEF82s8AsHCP/BmL
	3JB110wAHrleVwvryOqJk2pGCW1H/rOlKJg2NgQgwkxW8/7mzuO2GwcOSIrytNPaSj5RY+
	ZV78B0HD6VjZoiFW7HqCRIrwoZe2boE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-bxdA2uU8NMia6X8lenHRrA-1; Mon, 30 Jun 2025 09:00:44 -0400
X-MC-Unique: bxdA2uU8NMia6X8lenHRrA-1
X-Mimecast-MFC-AGG-ID: bxdA2uU8NMia6X8lenHRrA_1751288444
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1367847f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288443; x=1751893243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOWsWuhFUlcALOXMJY1BPVzymTvYGz+UAPJ/r3JMpJ4=;
        b=NHI6tMDHlrBbMNSv9cG0bnS1CT37h6Sz6yF4gMj+BA0GJjMomgFaXh0GWlF5CdQnSk
         +Sn/ILLGv2T81u4ytUCdYK3InFSMvNsdN9AFmuBqolUpuz7hjhEJ2/3X7cMyUOO5VkL4
         jpAbngKcoCCzF3ok21VTOMW6AZ83hPIZYLORwYC2OQJn9SMmCAoClxFHeliRfGUWeOJq
         o/d3S78EO0NSDZ9w6Dgy7tm57JmdbJPL5uu/IgBK5ybpHHAm5OethzqKTQSIWOYvOth0
         CywTuZ+rccLrfsrBCcjLWHQy9SQD+IocT58IB0njp52SMcSbj2BFM8j5lKNTSL7/+DlA
         HVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtx2PBQiqRy5oPvK5mPjsj2ZwFoptapjgh3DBffqdoyt3D1f0uXPm8R1rJZ9uXqD+Zalb+lQJdUzI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOOUi+TOjIKoeNylsfxtGDR6mijZdMWvz8kwNsFsfEODMbGHCi
	tugjTSmSJXeuZqFovlBkwU4mGDMaU0dLDCH5xRJQgoEQPOHXnJqFlNg4USmBuLB/qELdfwCASkn
	sctARXoK93zRhvNma+zz0eNF/xz7uAMI6qKp4F2Vij+z1oZIrO8EubzZk2UVNvw==
X-Gm-Gg: ASbGnctgbOCnR1j7ew5GuYqH9mNiDiJ5JE68/uBj5I1vtsJnUihhFIlERr2Y2aU8w/b
	/NzH3uFbRQwl5ILgK0BwxLefzzbS9vedr2fbtCSIXl6VE3ymtVbzuGBP0ohxH1UcqyP8mTFUu8m
	axiedQWE49cUPnvoYwY5LwEAo1NyApU+5flRlPqKbVk7Rzy1GuN7jS8dcFd2LWW3k4ZBUMZQzG4
	q1RD4hXGgdFxqXkUlzf9q/T/KIK/V4igCPmLVof+1k8JMDQJMG6lypmkqb0NBX+dK7ma+ZZ7cCj
	U9cuFtSfanOyO1wIW+t+OiIVoCyt0wcRE8soeGw+nXWq7QUf/8rMTPGd7MdvGN2Je3JsWvRkyRE
	Xas6vElI=
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766120f8f.52.1751288443201;
        Mon, 30 Jun 2025 06:00:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx8UWJltFtDizxyihu6cXjhn3Ci52lQuk8tR1EGhsL0o4Tf/9IaaIN7lF9qzEV9dDz+LNV9w==
X-Received: by 2002:a05:6000:2b03:b0:3a4:e6c6:b8bf with SMTP id ffacd0b85a97d-3a8ffeb382fmr7766023f8f.52.1751288442367;
        Mon, 30 Jun 2025 06:00:42 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4538a406489sm136745865e9.27.2025.06.30.06.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:41 -0700 (PDT)
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
Subject: [PATCH v1 10/29] mm/migrate: remove folio_test_movable() and folio_movable_ops()
Date: Mon, 30 Jun 2025 14:59:51 +0200
Message-ID: <20250630130011.330477-11-david@redhat.com>
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

Folios will have nothing to do with movable_ops page migration. These
functions are now unused, so let's remove them.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c0ec7422837bd..c99a00d4ca27d 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -118,20 +118,6 @@ static inline void __ClearPageMovable(struct page *page)
 }
 #endif
 
-static inline bool folio_test_movable(struct folio *folio)
-{
-	return PageMovable(&folio->page);
-}
-
-static inline
-const struct movable_operations *folio_movable_ops(struct folio *folio)
-{
-	VM_BUG_ON(!__folio_test_movable(folio));
-
-	return (const struct movable_operations *)
-		((unsigned long)folio->mapping - PAGE_MAPPING_MOVABLE);
-}
-
 static inline
 const struct movable_operations *page_movable_ops(struct page *page)
 {
-- 
2.49.0

