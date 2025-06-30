Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E6285C81
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288506; cv=none; b=CNRdcc1/NT4fCGkx8K3Apxc3MVfrBtxFVHsqwdjh+EtXuDAc/ANKE7dmpHAvufrB/g7iE8y0BDcIVo5bLukLofwB14k0UlZAWbc4qXUZO1c68uIv5Ug1U42okN7R3ji/Brj8fbADUpV1cgZxcGYEGnhJMuGcIiMxTAdotjlA13Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288506; c=relaxed/simple;
	bh=xmAX6FaG7PwzByxdVNWIboeTPGW5tjq2c62uEFet5m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUweRxQeutxsHR8lHGom+uWCdS51CvpPLQbxDD0KA+CCgDqpEOYAfIhLkoRRNlyR05z0jvfihQvUxsPCL/6pmHVW1HXO7x2C/elTXwXa/1EdOy/nmYLx5wNO/0tFzFaVb6u10Zv3dArreTkJRQVl+Z9dIRYD1lN7x/pTiPs96Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b2nKEvYh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b2nKEvYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=b2nKEvYh7r2slqyOMdu81HTLYKvE2pP2f2gJR1OIFh58ens5iojPAv3HRp2nf1iqG+rF7j
	ZuTsOrurbfIJamVsc4P5wqu9dd1yoFRRupsRAxfL5xybdjGWKYfeUEfpPuR5EWqHSCaHrp
	U3dhAXeL3HQIElcrCdWL83JpeRJZBN8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-QF9pKyckOUGFGXJkt9QRSQ-1; Mon, 30 Jun 2025 09:01:41 -0400
X-MC-Unique: QF9pKyckOUGFGXJkt9QRSQ-1
X-Mimecast-MFC-AGG-ID: QF9pKyckOUGFGXJkt9QRSQ_1751288500
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so1310269f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288499; x=1751893299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
        b=QzfL5VfG0Ts2Ol3R3UuQ5EyYZRl1FSZtspBESHv6VGxtq5ibPJVolE+2Y1zFJ/trjb
         6CepH9K9GIFdyDyFdgI3LdX7Z+VeBRU0ABuvWgZlZ0gcyq20FrdH54fUBGmQ5AJ7V2D9
         7NbnU2/rK2p214fang3QhbURn2mTGRVj7NRygIUCBS4bkOtLNGLisdFV+qARLNTq7CaZ
         lrGdl/kceO+wmxIpJlxk2N8gKEprYijPsOW3mGylMg3qNUGIvWdjcdLzPfIrIK9TvZDK
         56JCm9SAgmb4WUmgzZrATV4+1nEX5GQobsDcwqpS1qKHvneLYflRiB+ORG9Pb5MtF0bo
         DzPw==
X-Forwarded-Encrypted: i=1; AJvYcCU5+bPUq6hGRq9O1EDzhYtHOh8VHirmBC1H/THGcTHyevvoO93c5hcQjHVluARDAviEZvGrzVDTV0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvCnRd911cl/nTax2un+BnP1gDhqP2/XtwN9klkZmkaKUx+oH
	5zQp+COCzgIUaKea8nL7ghQUQlKBmQzIPNcd9waMTbg0K6tuHLdPg5ODeJbnKFfC+vNbqeKHhsj
	Q01Ion6qHS3xfazu/fGJfx9IZ66Ai94q2TmBQ3x9GjQ1XwpsUwb8wRTz0id73gg==
X-Gm-Gg: ASbGncs3SrjN2GxwqTmtp/0HYVltj45YqzGhRLFcK0DvMER8f8gsiM7AF1RhuWsOMXc
	TRHQ9hlqqm9EnmKm6eJ/1U+o33nmB4/ifUQaOU52sLCGO15FN9pFRLr3+v0+KbXXFa2e7qYip2g
	x6mVRgFV1S3q3204od5/2mx4plyfXVA44odOZErsYDmMYpmG+AgWYid8NqV8fAcUJveQIt5RrtW
	2RDieoRFmsGl9SxE+09eD8fUxP+HIFRJBXukzXGorT+tdcp6IY6IZsnSBHd3uI3OX8jRY3ycJmS
	sOzmLeaKEqmGDjMxIdiJCdTqxHHgauoyhWJnM9JNqrDP78fP7K1yeNFRnJCe5CdePtwbO07Vtpx
	KS6EATyk=
X-Received: by 2002:a5d:5849:0:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3a8feb70269mr11468361f8f.50.1751288499131;
        Mon, 30 Jun 2025 06:01:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU/EidvqQvGX4HPGBQwVJZ7hXZfY7F5Qe2rCBAm3bwMmXiBwrV5rV1e++rVLkevEN+RDkRKg==
X-Received: by 2002:a5d:5849:0:b0:3a5:8934:4940 with SMTP id ffacd0b85a97d-3a8feb70269mr11468280f8f.50.1751288498410;
        Mon, 30 Jun 2025 06:01:38 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f92esm10485904f8f.90.2025.06.30.06.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:37 -0700 (PDT)
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
Subject: [PATCH v1 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Mon, 30 Jun 2025 15:00:09 +0200
Message-ID: <20250630130011.330477-29-david@redhat.com>
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

Let's bring the docs up-to-date. Setting PG_movable_ops + page->private
very likely still requires to be performed under documented locks:
it's complicated.

We will rework this in the future, as we will try avoiding using the
page lock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b222b0737c466..2fecfead91d26 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -4,12 +4,13 @@
  *
  * Common interface definitions for making balloon pages movable by compaction.
  *
- * Balloon page migration makes use of the general non-lru movable page
+ * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
  *
  * page->private is used to reference the responsible balloon device.
- * page->mapping is used in context of non-lru page migration to reference
- * the address space operations for page isolation/migration/compaction.
+ * That these pages have movable_ops, and which movable_ops apply,
+ * is derived from the page type (PageOffline()) combined with the
+ * PG_movable_ops flag (PageMovableOps()).
  *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
@@ -17,12 +18,10 @@
  * and safely perform balloon's page compaction and migration we must, always,
  * ensure following these simple rules:
  *
- *   i. when updating a balloon's page ->mapping element, strictly do it under
- *      the following lock order, independently of the far superior
- *      locking scheme (lru_lock, balloon_lock):
+ *   i. Setting the PG_movable_ops flag and page->private with the following
+ *	lock order
  *	    +-page_lock(page);
  *	      +--spin_lock_irq(&b_dev_info->pages_lock);
- *	            ... page->mapping updates here ...
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
  *      device page list under b_dev_info->pages_lock.
-- 
2.49.0

