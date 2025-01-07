Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EC82594BF
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208239; cv=none; b=oSPT7/9pRY6+ipLKGjirRURkJazQYO9249DfrFiMQaQMEf0Oip9oUqpLxNt/REKujBh1S6L90Wd0sNz6bwl94LLgzT0GhYmDJ5LuhDXpgoxy+xrI7hLDAyN+TSYEcOLocMMLsRAsfCvhRqg8WjOoPiOunAAFaRgwGBRy1/lzyfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208239; c=relaxed/simple;
	bh=6SwvmVZA7Id4aBZsN/1mtVYBtSUfvS87jONqYajuKJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KSd/OsX7nZZ9fG7xLcM6rQy+O0c+SLmNob4mG79/8s3apbU9w2v9mguHYiqMQlw75OUqCFSz0AMm7YPzXcKdv6g1YETgpk1PmSeAtXpaoLyT9YVQ0GMm9ZO1fCbLgyRGMhmCvULMVMYsVyAzgbAMpB1yf6d/9b1b9aYCMt97EYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ihxnR8d+; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ihxnR8d+"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6c3629816so769967585a.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208237; x=1736813037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhQxXMUURDFkAZ5scirPLfGBPx39x7Cq7gDAj234rcY=;
        b=ihxnR8d+JUrbj07GxZjrdIPCXA/nye86Mf+jt4bnbGSE7qZefRYMzz9bOMrOVUQiKk
         b42Ps0WNf3DEeZVPgldpCKG79vZD2Dvj1mZpefvQKgfJqLatRIIF/1ZmDCNQJK3TLThi
         EO1ILpkQVQmh1Eiz5VaznGlTaJnYzWZ1VsI7QLEDoDUh9jF7IvAKIsvg7Nkrop2wD3Pg
         y5Fbl/T1ogq4ze6EWASGErVUiCqAJIQSC7oSLICTblJAF63EN4dKJx1Pqojy1alS2aUv
         W/vyc2gyzJFLBKK83Lq67RmO+5ZHMSPM6aw+m9ktIBlXvuys/2EaQH1ZvHR6X6O97vZA
         DwoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208237; x=1736813037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhQxXMUURDFkAZ5scirPLfGBPx39x7Cq7gDAj234rcY=;
        b=DM8UOF2xE+JBnE2AbWmEghcQwRHWEra36/TT2ZZiHkbfEp+2XSl9sK7fJlWIih2oUV
         dbRIGkQX79XETzew22ybRXc38ufgWkWvls9hGhaerOdBwATn5Z/oRrjcI3gFu/NZijMn
         yMJq9Ahh0Il4gWd8K3P6wE/qwQEtpDnY8pndQiwibIr6IHjvBtVC54OYQLsDvLWDQbab
         y6Df9puUCM5DFUOPoPKgAXAb0YxvAOcsFKfedu8KUBlR3Nc3TuwK6t9ORdwpVPQ9bagW
         747DwJPETz+l0W1YM8Hv0t8H+PEUWuMad29/MIOgFInpVm2JicfYvtQa6xvBnA8nvi7U
         GvaQ==
X-Gm-Message-State: AOJu0YzisqQtFTdSyZ7ILXVt+O+uTBEtaoxZDsLrXJR+MHTyEsEBTgDp
	hCguc2/8OsuR9pN+X/0ME3xhvE4Icwk94OddGP4SZ/52qb2d+SmQNXwx9d1QQ7I=
X-Gm-Gg: ASbGncu1b+A3xEeo/ZXtQnH2XHkOZnFUrtlnFFlZ1h0D728npEVwxdy5hE47y3OsdtW
	xUcoNTSgIluWtuE0zrIw2jzQii8dsjJe82+Xsky+zDI2nNnLJWQBED/inWbJ9mOO0N0zvyuFX6l
	LLoDV2WUF/p+lM7nUtzMBEpbZBAirJdpHv4ing1PE70uRs9SWa2kmYZfq87cHfjZePO1rVpLKAq
	JYJMpYthnQekk5v9XR4N6yTyPQArGGvplcMdXT25ZvHhJNcXBbwMEZ0CYXLsheWMFlkz4T3m9Qm
	CLeGi8EoToIhY0hSMyqMFuNO2IGV87/eH3KlpbKsyvI8
X-Google-Smtp-Source: AGHT+IGxVrqjx+Di9dmI2xKMOrXvW3nylvanO8oTfhpUycZZo5Se/q08YTn9jxqPITzbOyS3wtn8GQ==
X-Received: by 2002:ad4:4eac:0:b0:6da:dc79:a3c9 with SMTP id 6a1803df08f44-6dd23306794mr895686556d6.9.1736208237050;
        Mon, 06 Jan 2025 16:03:57 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:03:56 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 3/6] memory: allow non-fault migration in numa_migrate_check path
Date: Mon,  6 Jan 2025 19:03:43 -0500
Message-ID: <20250107000346.1338481-4-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_migrate_check and mpol_misplaced presume callers are in the
fault path with accessed to a VMA.  To enable migrations from page
cache, re-using the same logic to handle migration prep is preferable.

Mildly refactor numa_migrate_check and mpol_misplaced so that they may
be called with (vmf = NULL) from non-faulting paths.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory.c    | 24 ++++++++++++++----------
 mm/mempolicy.c | 25 +++++++++++++++++--------
 2 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8d254e97840d..24acac94399c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5540,7 +5540,20 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 		      unsigned long addr, int *flags,
 		      bool writable, int *last_cpupid)
 {
-	struct vm_area_struct *vma = vmf->vma;
+	if (vmf) {
+		struct vm_area_struct *vma = vmf->vma;
+		const vm_flags_t vmflags = vma->vm_flags;
+
+		/*
+		 * Flag if the folio is shared between multiple address spaces.
+		 * This used later when determining whether to group tasks.
+		 */
+		if (folio_likely_mapped_shared(folio))
+			*flags |= vmflags & VM_SHARED ? TNF_SHARED : 0;
+
+		/* Record the current PID acceesing VMA */
+		vma_set_access_pid_bit(vma);
+	}
 
 	/*
 	 * Avoid grouping on RO pages in general. RO pages shouldn't hurt as
@@ -5553,12 +5566,6 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	if (!writable)
 		*flags |= TNF_NO_GROUP;
 
-	/*
-	 * Flag if the folio is shared between multiple address spaces. This
-	 * is later used when determining whether to group tasks together
-	 */
-	if (folio_likely_mapped_shared(folio) && (vma->vm_flags & VM_SHARED))
-		*flags |= TNF_SHARED;
 	/*
 	 * For memory tiering mode, cpupid of slow memory page is used
 	 * to record page access time.  So use default value.
@@ -5568,9 +5575,6 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 	else
 		*last_cpupid = folio_last_cpupid(folio);
 
-	/* Record the current PID acceesing VMA */
-	vma_set_access_pid_bit(vma);
-
 #ifdef CONFIG_NUMA_BALANCING
 	count_vm_numa_event(NUMA_HINT_FAULTS);
 	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 305aa3012173..9a7804f65782 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -2747,12 +2747,16 @@ static void sp_free(struct sp_node *n)
  * mpol_misplaced - check whether current folio node is valid in policy
  *
  * @folio: folio to be checked
- * @vmf: structure describing the fault
+ * @vmf: structure describing the fault (NULL if called outside fault path)
  * @addr: virtual address in @vma for shared policy lookup and interleave policy
+ *	  Ignored if vmf is NULL.
  *
  * Lookup current policy node id for vma,addr and "compare to" folio's
- * node id.  Policy determination "mimics" alloc_page_vma().
- * Called from fault path where we know the vma and faulting address.
+ * node id - or task's policy node id if vmf is NULL.  Policy determination
+ * "mimics" alloc_page_vma().
+ *
+ * vmf must be non-NULL if called from fault path where we know the vma and
+ * faulting address. The PTL must be held by caller if vmf is not NULL.
  *
  * Return: NUMA_NO_NODE if the page is in a node that is valid for this
  * policy, or a suitable node ID to allocate a replacement folio from.
@@ -2764,7 +2768,6 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 	pgoff_t ilx;
 	struct zoneref *z;
 	int curnid = folio_nid(folio);
-	struct vm_area_struct *vma = vmf->vma;
 	int thiscpu = raw_smp_processor_id();
 	int thisnid = numa_node_id();
 	int polnid = NUMA_NO_NODE;
@@ -2774,18 +2777,24 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 	 * Make sure ptl is held so that we don't preempt and we
 	 * have a stable smp processor id
 	 */
-	lockdep_assert_held(vmf->ptl);
-	pol = get_vma_policy(vma, addr, folio_order(folio), &ilx);
+	if (vmf) {
+		lockdep_assert_held(vmf->ptl);
+		pol = get_vma_policy(vmf->vma, addr, folio_order(folio), &ilx);
+	} else {
+		pol = get_task_policy(current);
+	}
 	if (!(pol->flags & MPOL_F_MOF))
 		goto out;
 
 	switch (pol->mode) {
 	case MPOL_INTERLEAVE:
-		polnid = interleave_nid(pol, ilx);
+		polnid = vmf ? interleave_nid(pol, ilx) :
+			       interleave_nodes(pol);
 		break;
 
 	case MPOL_WEIGHTED_INTERLEAVE:
-		polnid = weighted_interleave_nid(pol, ilx);
+		polnid = vmf ? weighted_interleave_nid(pol, ilx) :
+			       weighted_interleave_nodes(pol);
 		break;
 
 	case MPOL_PREFERRED:
-- 
2.47.1

