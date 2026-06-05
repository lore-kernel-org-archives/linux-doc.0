Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F73EDE64
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676128; cv=none; b=VD18CK/1xcCp/tBixdNG0hcGMxL09Og5e/yQCVWbknYHrM/D21P03lTdIaLni08xI+GgL6e7ID5J7Q8sonZqVMXIPq1wRB1/xQSPwpWvobZgeICw1eMw9s0Dd6AAIXplnZesCh0iHU16gCIOLvnbdYSepBRtVdDz2K8gpOXNEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676128; c=relaxed/simple;
	bh=+xneohTX9Lz11Een8uTd/GS0joO/VMqHCU4nitpbTY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIVmxhBlb3dcdHKr8Q5FuNVNCKiALTj520EewgD9i1dGdw4NfXlGD8OsH6bTJLBwAe3hQtjNGZ6Z75WfdinGXkLyiPR0vtBxI1jtwLKKJ/9BXOBAm2EErMiLDqdFQtsi6GQZPsMi91Y0EE4K9NveBo6c8TOkweTEmCQlK0XaZak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xw8YGkqC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xw8YGkqC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780676125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fzDHpbqIBXdBWPrEX6e4jd9D7S6Wp53dvbcajiiuilc=;
	b=Xw8YGkqCl70zFVUhAK/oH294iaU/2UfhyJ+34qoxQ8qX0D1cKQCEXTr3vPpV5gnpaM1d5G
	vs0oEXZre4kB1zylALla72KICK55UHEdZwTtUWaC21s2H4p7NLbVFeerrkJ5RcG5XFm/CF
	1YeTNBHErfb4BkSJA6dvm6CvpnacUig=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-UXKfE2kGPJqHwFwDQg_wwA-1; Fri,
 05 Jun 2026 12:15:20 -0400
X-MC-Unique: UXKfE2kGPJqHwFwDQg_wwA-1
X-Mimecast-MFC-AGG-ID: UXKfE2kGPJqHwFwDQg_wwA_1780676119
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5844195608E;
	Fri,  5 Jun 2026 16:15:19 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.44.22.9])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52CF6180049F;
	Fri,  5 Jun 2026 16:15:01 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org
Cc: aarcange@redhat.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	byungchul@sk.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jack@suse.cz,
	jackmanb@google.com,
	jannh@google.com,
	jglisse@google.com,
	joshua.hahnjy@gmail.com,
	kas@kernel.org,
	lance.yang@linux.dev,
	liam@infradead.org,
	ljs@kernel.org,
	mathieu.desnoyers@efficios.com,
	matthew.brost@intel.com,
	mhiramat@kernel.org,
	mhocko@suse.com,
	npache@redhat.com,
	peterx@redhat.com,
	pfalcato@suse.de,
	rakie.kim@sk.com,
	raquini@redhat.com,
	rdunlap@infradead.org,
	richard.weiyang@gmail.com,
	rientjes@google.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shivankg@amd.com,
	sunnanyong@huawei.com,
	surenb@google.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.de,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	vishal.moola@gmail.com,
	wangkefeng.wang@huawei.com,
	will@kernel.org,
	willy@infradead.org,
	yang@os.amperecomputing.com,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	zokeefe@google.com
Subject: [PATCH mm-unstable v19 05/14] mm/khugepaged: require collapse_huge_page to enter/exit with the lock dropped
Date: Fri,  5 Jun 2026 10:14:12 -0600
Message-ID: <20260605161422.213817-6-npache@redhat.com>
In-Reply-To: <20260605161422.213817-1-npache@redhat.com>
References: <20260605161422.213817-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Currently the collapse_huge_page function requires the mmap_read_lock to
enter with it held, and exit with it dropped. This function moves the
unlock into its parent caller, and changes this semantic to requiring it
to enter/exit with it always unlocked.

In future patches, we need this expectation, as for in mTHP collapse, we
may have already dropped the lock, and do not want to conditionally
check for this by passing through the lock_dropped variable.

No functional change is expected as one of the first things the
collapse_huge_page function does is drop this lock before allocating the
hugepage.

Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 474ee97c54ba..e4b2ca77ecf6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1222,6 +1222,12 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
 	return SCAN_SUCCEED;
 }
 
+/*
+ * collapse_huge_page expects the mmap_lock to be unlocked before entering and
+ * will always return with the lock unlocked, to avoid holding the mmap_lock
+ * while allocating a THP, as that could trigger direct reclaim/compaction.
+ * Note that the VMA must be rechecked after grabbing the mmap_lock again.
+ */
 static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long address,
 		int referenced, int unmapped, struct collapse_control *cc)
 {
@@ -1237,14 +1243,6 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
 
 	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
 
-	/*
-	 * Before allocating the hugepage, release the mmap_lock read lock.
-	 * The allocation can take potentially a long time if it involves
-	 * sync compaction, and we do not need to hold the mmap_lock during
-	 * that. We will recheck the vma after taking it again in write mode.
-	 */
-	mmap_read_unlock(mm);
-
 	result = alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
 	if (result != SCAN_SUCCEED)
 		goto out_nolock;
@@ -1549,6 +1547,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 out_unmap:
 	pte_unmap_unlock(pte, ptl);
 	if (result == SCAN_SUCCEED) {
+		/* collapse_huge_page expects the lock to be dropped before calling */
+		mmap_read_unlock(mm);
 		result = collapse_huge_page(mm, start_addr, referenced,
 					    unmapped, cc);
 		/* collapse_huge_page will return with the mmap_lock released */
-- 
2.54.0

