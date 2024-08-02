Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD121C19A
	for <linux-doc@vger.kernel.org>; Fri,  2 Aug 2024 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722614189; cv=none; b=jebpzvHy9G6skEvZsWgtMLBtCNnH2BPRlgUB5/5MTqQBiZPwuo2zKNC9PxBSnepX3hAdQZA23oPomszA47LvOMvaJVm5YYD3NQyNeaPkvDMP2Zyex46F1P+bzJzCXma4IM56RIEfkky5mbEVGC3ZS7GfyOXz0VjYXCCpbzqv860=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722614189; c=relaxed/simple;
	bh=28p9D+KQFhZK/nXSJOf5//9mKCyB6fypztEnAu+mAsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOO1mm78pSn51lV0DnfkB7OExIUlR9x99Eam3RA6AoaRN94+/A9ruya7wbDcOyOzKPB29jXDJGw6/Cw2qZ6yVQLEX0lX+1dEAk4biDflK3HezIT5IQ3qL3jIRKyaYbgrUqj2+IjowMhRW6lDPCGlmMSARcq1o+ipjbd0IaZcxII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKzezPf5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKzezPf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722614186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mv/si6kOfwIvneZw24kO6Mkvevsw9QN/WnWMpKXtofY=;
	b=bKzezPf5tVQlG6g4lXy8BBQ9uADbKslLGBXLTTSSOfZ1bItKiEX6YrGusrlOxQUHvWPwjy
	zaHvVmpTua9wSrDdh4N/mVtQ6XpViWEm/apE7/WG43EBayQv48rBgARsLBdL7pJXTJe0fX
	hDL8bnOVz2P+4gAsf0VDa4zvv6+J8Wo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-HVr8hLF5NxywldDisXzbUw-1; Fri,
 02 Aug 2024 11:56:21 -0400
X-MC-Unique: HVr8hLF5NxywldDisXzbUw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7675919B9A9B;
	Fri,  2 Aug 2024 15:56:19 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.39.192.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7F6E1300019D;
	Fri,  2 Aug 2024 15:56:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: [PATCH v1 07/11] mm/huge_memory: convert split_huge_pages_pid() from follow_page() to folio_walk
Date: Fri,  2 Aug 2024 17:55:20 +0200
Message-ID: <20240802155524.517137-8-david@redhat.com>
In-Reply-To: <20240802155524.517137-1-david@redhat.com>
References: <20240802155524.517137-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Let's remove yet another follow_page() user. Note that we have to do the
split without holding the PTL, after folio_walk_end(). We don't care
about losing the secretmem check in follow_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0167dc27e365..697fcf89f975 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -40,6 +40,7 @@
 #include <linux/memory-tiers.h>
 #include <linux/compat.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/pagewalk.h>
 
 #include <asm/tlb.h>
 #include <asm/pgalloc.h>
@@ -3507,7 +3508,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 	 */
 	for (addr = vaddr_start; addr < vaddr_end; addr += PAGE_SIZE) {
 		struct vm_area_struct *vma = vma_lookup(mm, addr);
-		struct page *page;
+		struct folio_walk fw;
 		struct folio *folio;
 
 		if (!vma)
@@ -3519,13 +3520,10 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 			continue;
 		}
 
-		/* FOLL_DUMP to ignore special (like zero) pages */
-		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
-
-		if (IS_ERR_OR_NULL(page))
+		folio = folio_walk_start(&fw, vma, addr, 0);
+		if (!folio)
 			continue;
 
-		folio = page_folio(page);
 		if (!is_transparent_hugepage(folio))
 			goto next;
 
@@ -3544,13 +3542,19 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
 
 		if (!folio_trylock(folio))
 			goto next;
+		folio_get(folio);
+		folio_walk_end(&fw, vma);
 
 		if (!split_folio_to_order(folio, new_order))
 			split++;
 
 		folio_unlock(folio);
-next:
 		folio_put(folio);
+
+		cond_resched();
+		continue;
+next:
+		folio_walk_end(&fw, vma);
 		cond_resched();
 	}
 	mmap_read_unlock(mm);
-- 
2.45.2

