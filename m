Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AC339701
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051605; cv=none; b=tBh+JlcvSQCrlv3dbKtgStLZPqW9xPJeY1k7r1mwfcNtTH4XVUekjIyc34f8dkK92G0G04CKlIo/SkzkuGOAuO336UPg8KgJDPgsHzmiGVGTZjcXjVeecPWJTqtawZiBRK4i1bCojkibsQEZ2J8ZuCXEo/DLLVEZ2rMjzFXxFKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051605; c=relaxed/simple;
	bh=p9NQaEnTQkjOvytztuGwrp0tPWZa+D35cuLh/W8irHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T/V64HWoDbW6nYbOHN6bBt5yJP3QEUGMotPnG0BXm7EWn6Lt9IEIsRhANbAyvINpvy5sISZ//O86P9Hqu4dg2mwU6z7HpvolpVdbqzs2CwHxy09Xf006I0Js2lD3Esj4FfYGHuI/kmai76377+V8zRTs3en6n37mW5IwzZsYC4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VJZe6GGr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VJZe6GGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
	b=VJZe6GGrlBbN4TUWDsIKDX5xNdDwDrf0lwwh1wIJ1IVJDjNVRN5yhHUzN6pJhV8Xsrd5jV
	IdQ9R1x4lX7K2eSuwjvxtJFEYCrUxQA6PmOmRX8OlYiTooFjgBZbcypHahPG0fNCBXHjP2
	wh79ZbWCy8AxJmjsjIBtIPCvCziqnwM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-CheIh0WwPk-gSU3wZGQXjA-1; Tue, 21 Oct 2025 09:00:01 -0400
X-MC-Unique: CheIh0WwPk-gSU3wZGQXjA-1
X-Mimecast-MFC-AGG-ID: CheIh0WwPk-gSU3wZGQXjA_1761051600
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-426ce339084so4908452f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051600; x=1761656400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dmjAOzzOKe+PWzSzDnov13uhbtuxj7aSoteYm9r0kM=;
        b=iDKYuN3XDib3XAq6pDX8Q6GZmp4UAbyfDpnAm6bKv09S67taz1bvzT+7wAuoEsPwZR
         EOPIeiWr8a1FojYnP8DIkVHKAZIovyWXjP32nGGp9+I6LQjgz610ODcumJPQWu3QWvgH
         imCV9PqRuXsrCLBbPvdlsHlyFENk1UVtkfuJoD2XLGEfPmaWs9bM8qFFOQPmvunluRCI
         KclAwdE8zqsIZhu3QRwAmWyqo1xhW2aUlJtrPCZmmHoqZcsI/+eqPAXgtJ26mBJvcBo1
         WLf8I/BieBLoyoopYBQXF3JKfjczLs1wyf4TTifVB+3eZ6i7BH0wD45+gBw6Xf7u1zNT
         keUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV27MV0ll8+LE0r0p0aKCiK/OUatNI/5xOrtxKhRKSMY6AWgpkk24yRJ7ixr/adsCvpFPSPZTTwwAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxySTMd3Z/1dGkkXLEprpaNMRI3OEG2sjXjyM4XZEeEYqhRM4QK
	1Bh/HfwKEdEg9tMbTBcAgXXeoVLeEf6EIv1s1A+h2wBbFBP6bRs76+kh2T85mLyN0vlwTe58O5w
	JX0p8PbwsZpihbEYOWHPr179AKnK6grXbiBsL9uP7UJ9+hQvdP2+7nZ1fYRx5qg==
X-Gm-Gg: ASbGncvHmXO0BvkyhkUOrD2SUpREw3wYi4qH30uKlMbkVXoeGo5+hhyfY+3m4/Ye5Kj
	HhwRvp2YapTPyoQQlC4HjCtcf5BeBNmc948foDmsvAbPzFho4IZu9NNOuaN/oM2w6AB0h+HB25N
	0A5VvkWUm/EPZSeug+UsMtaFUlxRWU86GxI5yk1rj55egwSr3ATCS7QQqq+VGpT2xrOIlRWS+Rq
	p3n2RjcHaGrTddrOpz4xPTwem94CgsY35KlVJ/IlDe/7Lw5ujEmHZaxZeiB4j6vAXwCWnQYebdt
	IkfpOVCLRdd+kicDFRZjAtySZKDuzaqNQvSVoyNntp4Ob9HucHZAr1zWn0yysrQeuN27h16jFaC
	PjhfzrZuetipT6PHryQzg4GiWmuvP+3e727tSJJxHnTK6oqGpiepcNOKNo7pT
X-Received: by 2002:a05:6000:2503:b0:425:825d:2c64 with SMTP id ffacd0b85a97d-42704d6c822mr11791974f8f.17.1761051599788;
        Tue, 21 Oct 2025 05:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfxO1MIMIHuEAyS8Hvj/zoSDSKI4v296mvX+6V2esc8bVwH2VAjXdgu+NOffYas4k+6n6n6g==
X-Received: by 2002:a05:6000:2503:b0:425:825d:2c64 with SMTP id ffacd0b85a97d-42704d6c822mr11791940f8f.17.1761051599346;
        Tue, 21 Oct 2025 05:59:59 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00cdf6csm20134215f8f.43.2025.10.21.05.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:58 -0700 (PDT)
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
Subject: [PATCH v1 12/23] mm/balloon_compaction: remove balloon_page_push/pop()
Date: Tue, 21 Oct 2025 14:59:17 +0200
Message-ID: <20251021125929.377194-13-david@redhat.com>
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

Let's remove these helpers as they are unused now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 30 ------------------------------
 mm/balloon_compaction.c            |  5 ++---
 2 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 1452ea0635245..e5451cf1f6589 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -126,34 +126,4 @@ static inline void balloon_page_finalize(struct page *page)
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
-
-/*
- * balloon_page_push - insert a page into a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline void balloon_page_push(struct list_head *pages, struct page *page)
-{
-	list_add(&page->lru, pages);
-}
-
-/*
- * balloon_page_pop - remove a page from a page list.
- * @head : pointer to list
- * @page : page to be added
- *
- * Caller must ensure the page is private and protect the list.
- */
-static inline struct page *balloon_page_pop(struct list_head *pages)
-{
-	struct page *page = list_first_entry_or_null(pages, struct page, lru);
-
-	if (!page)
-		return NULL;
-
-	list_del(&page->lru);
-	return page;
-}
 #endif /* _LINUX_BALLOON_COMPACTION_H */
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index c44e0b62203cc..90b2d61a593b7 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -128,9 +128,8 @@ EXPORT_SYMBOL_GPL(balloon_page_alloc);
  * Drivers must call this function to properly enqueue a new allocated balloon
  * page before definitively removing the page from the guest system.
  *
- * Drivers must not call balloon_page_enqueue on pages that have been pushed to
- * a list with balloon_page_push before removing them with balloon_page_pop. To
- * enqueue a list of pages, use balloon_page_list_enqueue instead.
+ * Drivers must not enqueue pages while page->lru is still in
+ * use, and must not use page->lru until a page was unqueued again.
  */
 void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 			  struct page *page)
-- 
2.51.0

