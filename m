Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F732F5462
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268470; cv=none; b=VaRv0OUz+sMbbV4f2SI9ecMhtqKgbQaK0vRObgZbex6VZi4LyE+nph80NoRcXEhJ6tEL5tUwUnTFKLzeAiJC/ITtdM2P4OhjyhCzN3Ju878tj/6K1obQqJ1jN7doXmY0xoiA0/22/VT/sC4Nb9aY11YrpXiPIe1ToO5ucuRX+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268470; c=relaxed/simple;
	bh=0evh8/P+NmJQ1hFz8tzRv5gkRTQcHLHrxi5Nv+XvqCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vg2K/RvjU8nj6z6yItmnPFVXpo6EZCGeHzys7J7bqQIbYw05aGUwJ3RGU5Pjc0tT/G3qH6Bo2ajf2thFccLHugdgUI40SqKAtAirWt22dZ7C8u4meXY4ZkwjlrTdZSseINGyenyWfuPHeZID7mFzACQBWvppfhqhPc5PEwVNIdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lf/v1WoG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lf/v1WoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
	b=Lf/v1WoGNfdJWpjvHWaEdIqCe1OX99Rlgk9Ij/xdBDOWkSlGuvURUSWKPROkcC9tpL4Rhq
	KNjaPHF5jKiMgWprJJjjLLYM3UAgMQOsj8lICZSv7ioUNlpu03DOzNYo415GkQrwlW/cZU
	Xb8u3zIZg7mCVN8jlTnSeX9a3cdZ+W8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-OXpvcF2DNviug7PDd9ygVA-1; Wed, 18 Jun 2025 13:41:04 -0400
X-MC-Unique: OXpvcF2DNviug7PDd9ygVA-1
X-Mimecast-MFC-AGG-ID: OXpvcF2DNviug7PDd9ygVA_1750268463
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a503f28b09so555087f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268463; x=1750873263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
        b=kQCygCt5bx6Et/djH28q5PuinjX74m9u2qf2YCU6x514BQpwB30iWtesN/B7ow16gA
         3i/baVb+xZ5lIvWF4PeR4Pyz+OXub4vrwH127uNQNlu6R5ZBrk87XJyQ7tUhI4+9Cyb2
         cY0YGYsTV6qytZb7Mg+Dz8mqgOGvTOJpFp3+esQTuP/yKae0fjQRgneKSOULINxCdsl1
         PLDzPQzD02eUj0w+lRNCahw4l6Bo5PRw7eMKueV1UnS1T/H9J0U4l/0MHumT/8JLFmLk
         hgMNoO3cKBpeW1ypSImrnS7GXawBJSkhtXrkWq6aaQP9q4RNDK5m/JMjjGhoLpagXwtR
         u0cA==
X-Forwarded-Encrypted: i=1; AJvYcCUbQzuhDQvdsbrOyh2fxD6tKZ45uFfiM9maGNJ1oF4WmUci2VucURxCjtu9RthkBtnUlD/r7yHZx7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYwlZPqYzj4maO6V2ZNUCMQqRNv6cLjFDlbbDhBTOW3r7HKm4
	K61mHDVC0CrZ2+uCDoA9JsYyXCTZztdVrcNwl7GxVrOUujVuJTe1/CzNIArikVThNYmF0cFG4oC
	WFBb30IHMuRmzo8f3Laj/irbqXB0ID69A/S89ASIHBf+5eh6Z77Ds/nR+ENee8w==
X-Gm-Gg: ASbGncuZk+OcGHVmfcjVIfm25FGr7YKI0omC9jB4HiqxvDuNOPc92xgdsho4reE762I
	dVXYoApCJglCqPapzcytIqkV1SoebEoaz7S9uRXotLFyZmePFZNOrlzgCMgOgcx4mPturECOUx+
	wpcU3J9OQF3aZIoMghTJ47ncsMkndh5FPWci2AWFHu+gJ1Mfggm0pXVS991X/ggcoMyFrQV1GfA
	M8/rDT3iKzMwo622lAgYRSYVmkTuprSllMWu4R77rwmelyLBokwfZTECqwv/qDEA46zwkIagw76
	D4m0a2XddSLba5dwg7maw9UOucAgULCqklMuqtrRrauxgoTiEDtNK0gigAtbObtMHxt6WjRv58j
	kZYPV5Q==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252831f8f.17.1750268462988;
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIfeWEl0T3CJLW2Q374pwGp0+w6+6OG/MMLaU0GvL+YMoweLR1hXiYpIsPjINzwYBpzh5jeg==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252776f8f.17.1750268462550;
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453596df276sm20306265e9.0.2025.06.18.10.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
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
Subject: [PATCH RFC 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Wed, 18 Jun 2025 19:40:00 +0200
Message-ID: <20250618174014.1168640-18-david@redhat.com>
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

Currently, we only support migration of individual non-folio pages, so
we can not run into that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0

