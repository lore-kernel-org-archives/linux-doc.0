Received: from out-181.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E637DE8A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452567; cv=none; b=PQNYHC2D10U1CHm2gZmNfN4lEmBCA7ZQaZ7lj0gF+CK+NOHoJPtI0XMXO7iGMKNli9rXnGIYcTH29LQddOSWzVCTsCDdJ7ytY08OzcaA+TjZYFhaPnJc0sEc44SZq4h2iOi/jXQHJ7qA5PrO6Sw4Jnx5J+IMspl+7cftOxJEo4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452567; c=relaxed/simple;
	bh=/9EAJ/dN/gn9sVcJy5v0+Lv2u0wT6xker5NBXuru9E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cp4CTDjK5lKx27ljznVoXVEMBfzDPQiSE7OgdbVsrV4Zgcyg7FBxJNZXULrQrOwB/BJItDN9Nc5oQjQU7yrTgw/XEuWwOBE0AV5wOLBAkst7H77YkvPts1SaxrxDBoWudbqhNE60RHHpEitEanvVKh9WqSliEhcVFn+hNx083Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Aloh00tp; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Aloh00tp"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786452563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gR1+r30Mkqw9blPKY78guCWs8LSsvYgWVex7UAgVmzQ=;
	b=Aloh00tpuWGgHKkcp/GH99nGD2LT50Jl+8Z34Tzod0/+brfcigGbAaRkWYGl8KvqutI1y4
	moHyBzTbCniDicENMLUTvfJzP/fN0RsnDWNcqWc5vRuXYB44BK8gZMRXORbjtiQlvUVGA7
	A3Lk5q9mStCjwFIaag9hhe4UOhG3P/w=
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Date: Tue, 11 Aug 2026 06:48:34 -0600
Subject: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Migadu-Flow: FLOW_OUT

This change deduplicates the "is this PTE/folio referenced enough to be
considered for a collapse" condition that was repeated in both
__collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
a single inline helper function.

Also move the comment and use it as the function header. While we are at
it, updated the comment to clarify that a young pte is a recently accessed
one.

Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
 mm/khugepaged.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1e26ea97381a..8babd4c97db6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -672,6 +672,22 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
+/*
+ * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
+ *
+ * Return: true if recent access was observed through either the folio state
+ * or the current PTE mapping.
+ */
+static inline bool folio_pte_referenced(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
+{
+	/* The folio was referenced previously ... */
+	if (folio_test_young(folio) || folio_test_referenced(folio))
+		return true;
+	/* ... or the PTE mapping was recently used */
+	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
+}
+
 static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
 		unsigned int order, struct list_head *compound_pagelist)
@@ -810,14 +826,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (folio_test_large(folio))
 			list_add_tail(&folio->lru, compound_pagelist);
 next:
-		/*
-		 * If collapse was initiated by khugepaged, check that there is
-		 * enough young pte to justify collapsing the page
-		 */
 		if (cc->is_khugepaged &&
-		    (pte_young(pteval) || folio_test_young(folio) ||
-		     folio_test_referenced(folio) ||
-		     mmu_notifier_test_young(vma->vm_mm, addr)))
+		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 
@@ -1766,14 +1776,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 			goto out_unmap;
 		}
 
-		/*
-		 * If collapse was initiated by khugepaged, check that there is
-		 * enough young pte to justify collapsing the page
-		 */
 		if (cc->is_khugepaged &&
-		    (pte_young(pteval) || folio_test_young(folio) ||
-		     folio_test_referenced(folio) ||
-		     mmu_notifier_test_young(vma->vm_mm, addr)))
+		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 	if (cc->is_khugepaged &&

-- 
2.55.0

