Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500BD37B41F;
	Tue, 11 Aug 2026 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472630; cv=none; b=hrGuf58ybl+KVsDQFaVR5SOSqL30+PUPJhft9lDh42zraxjNsvegmC1/Ert+9o+fUe0kkhixXOZkRLl9lQGGLYYqeNrKj+x/svbBFqigkBWnJn/1wj+bR3GrgwwO8XM9vsTaxIxNgoQtvfRfepZqXdK/i0u/a1KCFfnrn/62KhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472630; c=relaxed/simple;
	bh=co0dpZBgX5+qHKtswp+53wV273oAyuJ2sbb1lQTgw7c=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=olBeAlFCUl2lK+zOXT0bsYiC81BJb5mHxyBoEpSPDz5UzyWrcpQNGZLfnLG9Z1Jp1HUAs2C/ZZHMu3CzFMBVz9vN2tr/tHgi5y0jkvsfLc+ah75ptlFh4XXv7BL/yhk0aPY8YVoFijW+mOaIZBbj/kfTLBrVtKmMQOoMvde3zy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iMMsJQ/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iMMsJQ/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408C81F000E9;
	Tue, 11 Aug 2026 18:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1786472628;
	bh=3TBsqf62Gp/AR2GFXLRO9hdGWAqrm6Ge9JO0CHdaHQg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=iMMsJQ/sSMP+Es94jqC3ZdHBnJ4v79SkduumOhjoUWhjn4Ej/NxcJLK93f7wccaYL
	 IArkxdEmZWKI+LKvUBEpdPcdnVcqChtXWJzG0BKLFtgyw1zK0YPhTxrBgzbXpwg3vw
	 bpAUFDXsqOFYMVLiCbzPF+g8nTZFJbuo7Gag8HgE=
Date: Tue, 11 Aug 2026 11:23:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry
 Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 0/7] mm/khugepaged: several cleanups
Message-Id: <20260811112347.aeb004e62daaeeaae98b6502@linux-foundation.org>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Aug 2026 06:48:32 -0600 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:

> The following changes stem from a number of reviews during my khugepaged
> mTHP support series [1]. Some of these are minor code cleanups, issues or
> reviews that we decided to deferred to a followup series, or in the case
> of the more major patch of the series, changes [2] Lance Yang attempted
> while my series was in-flight and we decided to wait till later to try.

Thanks, I've updated mm.git's mm-unstable branch to this version.

> Changes in v4:
>  - Add Acks/RB tags
>  - [patch2] rename pte_is_referenced() to folio_pte_referenced()
>  - [patch2] keep cc->is_khugepaged out of the helper gate
>  - [patch2] simplify/clarify the helper comment

Here's how v4 altered mm.git:


 mm/khugepaged.c |   27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

--- a/mm/khugepaged.c~b
+++ a/mm/khugepaged.c
@@ -693,20 +693,19 @@ static void release_pte_pages(pte_t *pte
 }
 
 /*
- * pte_is_referenced() - Check for enough referenced PTEs to justify collapsing
+ * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
  *
- * If collapse was initiated by khugepaged, check that the page has been
- * recently accessed (young pte) to justify collapsing the page.
- *
- * Return: true if the page has been recently accessed.
+ * Return: true if recent access was observed through either the folio state
+ * or the current PTE mapping.
  */
-static inline bool pte_is_referenced(struct collapse_control *cc, pte_t pteval,
-	struct folio *folio, struct vm_area_struct *vma, unsigned long addr)
+static inline bool folio_pte_referenced(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
 {
-	return cc->is_khugepaged &&
-	       (pte_young(pteval) || folio_test_young(folio) ||
-		folio_test_referenced(folio) ||
-		mmu_notifier_test_young(vma->vm_mm, addr));
+	/* The folio was referenced previously ... */
+	if (folio_test_young(folio) || folio_test_referenced(folio))
+		return true;
+	/* ... or the PTE mapping was recently used */
+	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
 }
 
 static void count_collapse_event(unsigned int order, enum vm_event_item vm_event,
@@ -910,7 +909,8 @@ static enum scan_result __collapse_huge_
 		if (folio_test_large(folio))
 			list_add_tail(&folio->lru, compound_pagelist);
 next:
-		if (pte_is_referenced(cc, pteval, folio, vma, addr))
+		if (cc->is_khugepaged &&
+		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 
@@ -1790,7 +1790,8 @@ static enum scan_result collapse_scan_pm
 			goto out_unmap;
 		}
 
-		if (pte_is_referenced(cc, pteval, folio, vma, addr))
+		if (cc->is_khugepaged &&
+		    folio_pte_referenced(folio, vma, addr, pteval))
 			referenced++;
 	}
 	if (cc->is_khugepaged &&
_

