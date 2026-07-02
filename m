Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0E5381E99
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 17:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013567; cv=none; b=DaegDPhCOPmeYhtq6o7BO+B+iWg1ufkLTZ6RRuWQx2tVD4LIPrWk8AygGivFUMCjbyyzsXBFkhD6KZY086e6tsB/XyV8ZkQ6LrYxGJrdFAL5E7YYb1WzZ+Mqwg93prOgQm20FbSfKuxxZmciYAVDhBqsqmEoYpH3557tfQnISPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013567; c=relaxed/simple;
	bh=tKh4C1ptOXTlwyvEtqUf8PD9yQqcoUoYbA/gtsd3HOI=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVXIvrvQvI9xjgKGmQaNGbKvFbTl+1Oi6EDxd8c7tTmgfYrjDpXdJg2OTfB0By29wf/5cvUrRWDrNEE8tLUnB8ePAOhysBoVsBFzMN9M4b4YxqrrmY6RAULwtzzIXjyzONRVTbwsGrZkkRpmf558Mu4o1rA2o8ieBoOeKIF23oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0WW1pUV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0WW1pUV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8423f236418so1363768b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 10:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013564; x=1783618364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A3/ULYVgYqkVHGifQ6W/LaJ1GCCnz0joJzGF3nrJAIs=;
        b=f0WW1pUV5Yd5m69nBIDkJfvRFF4+3JkM6eCPWsaMLgBzjOihpxeB6xxgt6vm9nYmmA
         /11VdInQKieDqRLCLb3rse1raGCCbmbl+4IY3bzZaGy41eXN3RfQbI1Zu1R/v6ONLivc
         lWMaCl+g1XCXwc4OBBkKiPzgfRpC+mXadiz6aaNsv7fFLXwHfjQkaSxtkqN3g00lH1Zd
         L2BvDYneiPLqo7Cr6gmLwzf/ZjpB+b1PIT6bZAuqIRvCLLzD1LR+tDGpeAJS3BQqn3H9
         laIXcrt5w347Sjqo9ImkReKmDtJ5qVIabcAN5oFJzlMKjlfQqsOfTJdARsB24dQrhNDs
         eLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013564; x=1783618364;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3/ULYVgYqkVHGifQ6W/LaJ1GCCnz0joJzGF3nrJAIs=;
        b=kdbvQ6rM9bLj6B2YcAt4ipbRYDf4vshVhMbYF0XPGA4/2Y4NdmVGo9xVS9LS0RTtRu
         W0DmeJDVAgTL6+VlGHaDlEO18vHAWDHsSv3HWNexh7GiHVl78qSV0NVfevJdIephT9a7
         2usxskzi+Wh2CeQpbN7SZZY8P3yd+d1scFgD3NJZSkT9ZDLjohwRsvbE74YtXpPz3Fmr
         AGMayknXsAR5I1p8C9anIurVMEPoA54IGb3+g7KOJ8oiJE4aihjPvjXWP58M7Ddz9XIN
         PBmiKqzYJthVgUxzxYXHhRGRPT+6hmAAp9P39oQLJghuJ7rNEZmi6EVgArzMefEiXj/H
         X29Q==
X-Gm-Message-State: AOJu0YxSKa8XNL3kVihu+LqvhCv5RADs54tssQ6yVO/trBioM4GsaMES
	CcZ9NWgQoHfpXf/IZSnujlLN5GK0wkPXYJJ+lJFAzuKxbC7Mg65//UN6xietjw==
X-Gm-Gg: AfdE7cnRZpD7CmssBmNIg7qn5u53ArF60j+BL8uXigjBZl7QTmanlfVKfguG4KT6yWW
	E5qsUDtmIh+f1KMTq9uyeXyq0mjkyrpQdCuPBteDp/woK9Kxi21zeIuR1BMcRXAz6simPhkYULr
	7gavQZmTYV6xqPN+QIjUxnDBTxSFL6RZpE3vGIamSaHmFsuVnCdgN2OqVSk5jcpiNOtxX8331oX
	wWSXg1XljC1f3my2/uO4ZFC0Zhx/0yprxid1Ax+hVxRQO7xtILs7i8kyrcQsdpSvDlG55BclitU
	cRxZ/2S1Kpnj7/SvWaJwfNxsDHzYSbuYTtgTqdY0VgpplfCn5Qq6D+oRlUgn4iqawWGyHJjnfJW
	mN051hvQRpvAlgEGVqwfUuvf7IZYzlu+5Jw2iI6iJ6V0xwXKEL1cmZh1KgaPXqBRuyALl6ZUtmc
	cuuXgrBdQzjZqE/SFWcJ6QkvTppBdwr9ycreANZy+f1EJrjlMKdraCz+f3wi0=
X-Received: by 2002:a05:6a00:a93:b0:847:8921:9bd1 with SMTP id d2e1a72fcca58-847c51ac62cmr5958872b3a.53.1783013564356;
        Thu, 02 Jul 2026 10:32:44 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921d28d9sm1493533a12.24.2026.07.02.10.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:32:43 -0700 (PDT)
Subject: [PATCH v5 1/3] mm/hmm: move page fault handling out of walk callbacks
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Thu, 02 Jul 2026 10:32:42 -0700
Message-ID: <178301356294.373695.7368238076921004035.stgit@skinsburskii>
In-Reply-To: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
References: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

hmm_range_fault() currently triggers page faults from inside the page-table
walk callbacks: hmm_vma_walk_pmd(), hmm_vma_walk_pud(),
hmm_vma_walk_hugetlb_entry() and the pte-level helper all call
hmm_vma_fault(), which in turn calls handle_mm_fault() while the walker
still holds nested locks.  The pte spinlock is dropped explicitly by each
caller, and the hugetlb path manually drops and retakes
hugetlb_vma_lock_read around the fault to dodge a deadlock against the walk
framework's unconditional unlock.

This layering does not extend cleanly to fault handlers that may release
mmap_lock (VM_FAULT_RETRY, VM_FAULT_COMPLETED). If the lock is dropped
while walk_page_range() is mid-traversal, the VMA can be freed before the
walk framework's matching hugetlb_vma_unlock_read(), turning that unlock
into a use-after-free.

Split the responsibilities the way get_user_pages() does. Walk callbacks
become inspect-only: when they detect a range that needs to be faulted in,
they record it in struct hmm_vma_walk and return a private sentinel
(HMM_FAULT_PENDING). The outer loop in hmm_range_fault() then drops out of
walk_page_range(), invokes a new helper hmm_do_fault() that calls
handle_mm_fault() with only mmap_lock held, and restarts the walk so the
now-present entries are collected into hmm_pfns.

No functional change for existing callers. As a side effect the hugetlb
callback no longer needs the hugetlb_vma_{un}lock_read dance, and every
fault-path exit from the callbacks now releases the pte spinlock on a
single, common path. This refactor is also a precursor for adding an
unlockable variant of hmm_range_fault() in a follow-up patch.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 mm/hmm.c |  118 +++++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 75 insertions(+), 43 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 4f3f627d2b47..2129b1ee4c35 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -33,8 +33,17 @@
 struct hmm_vma_walk {
 	struct hmm_range	*range;
 	unsigned long		last;
+	unsigned long		end;
+	unsigned int		required_fault;
 };
 
+/*
+ * Internal sentinel returned by walk callbacks when they need a page fault.
+ * The callback stores end/required_fault in hmm_vma_walk; the outer loop
+ * consumes the sentinel and never propagates it to the caller.
+ */
+#define HMM_FAULT_PENDING	-EAGAIN
+
 enum {
 	HMM_NEED_FAULT = 1 << 0,
 	HMM_NEED_WRITE_FAULT = 1 << 1,
@@ -60,37 +69,25 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 }
 
 /*
- * hmm_vma_fault() - fault in a range lacking valid pmd or pte(s)
- * @addr: range virtual start address (inclusive)
- * @end: range virtual end address (exclusive)
- * @required_fault: HMM_NEED_* flags
- * @walk: mm_walk structure
- * Return: -EBUSY after page fault, or page fault error
+ * hmm_record_fault() - record a range that needs to be faulted in
  *
- * This function will be called whenever pmd_none() or pte_none() returns true,
- * or whenever there is no page directory covering the virtual address range.
+ * Called by the walk callbacks when they discover that part of the range
+ * needs a page fault.  The callback records what to fault and returns
+ * HMM_FAULT_PENDING; the outer loop in hmm_range_fault() drops back out of
+ * walk_page_range() and invokes handle_mm_fault() from a context where no
+ * page-table or hugetlb_vma_lock is held.
  */
-static int hmm_vma_fault(unsigned long addr, unsigned long end,
-			 unsigned int required_fault, struct mm_walk *walk)
+static int hmm_record_fault(unsigned long addr, unsigned long end,
+			    unsigned int required_fault,
+			    struct mm_walk *walk)
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
-	struct vm_area_struct *vma = walk->vma;
-	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
-
-	if (required_fault & HMM_NEED_WRITE_FAULT) {
-		if (!(vma->vm_flags & VM_WRITE))
-			return -EPERM;
-		fault_flags |= FAULT_FLAG_WRITE;
-	}
-
-	for (; addr < end; addr += PAGE_SIZE)
-		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
-		    VM_FAULT_ERROR)
-			return -EFAULT;
-	return -EBUSY;
+	hmm_vma_walk->end = end;
+	hmm_vma_walk->required_fault = required_fault;
+	return HMM_FAULT_PENDING;
 }
 
 static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
@@ -174,7 +171,7 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 		return hmm_pfns_fill(addr, end, range, HMM_PFN_ERROR);
 	}
 	if (required_fault)
-		return hmm_vma_fault(addr, end, required_fault, walk);
+		return hmm_record_fault(addr, end, required_fault, walk);
 	return hmm_pfns_fill(addr, end, range, 0);
 }
 
@@ -209,7 +206,7 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	required_fault =
 		hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, cpu_flags);
 	if (required_fault)
-		return hmm_vma_fault(addr, end, required_fault, walk);
+		return hmm_record_fault(addr, end, required_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
@@ -328,7 +325,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 fault:
 	pte_unmap(ptep);
 	/* Fault any virtual address we were asked to fault */
-	return hmm_vma_fault(addr, end, required_fault, walk);
+	return hmm_record_fault(addr, end, required_fault, walk);
 }
 
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_SOFTLEAF
@@ -371,7 +368,7 @@ static int hmm_vma_handle_absent_pmd(struct mm_walk *walk, unsigned long start,
 					      npages, 0);
 	if (required_fault) {
 		if (softleaf_is_device_private(entry))
-			return hmm_vma_fault(addr, end, required_fault, walk);
+			return hmm_record_fault(addr, end, required_fault, walk);
 		else
 			return -EFAULT;
 	}
@@ -517,7 +514,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 						      npages, cpu_flags);
 		if (required_fault) {
 			spin_unlock(ptl);
-			return hmm_vma_fault(addr, end, required_fault, walk);
+			return hmm_record_fault(addr, end, required_fault, walk);
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
@@ -564,21 +561,8 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	required_fault =
 		hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, cpu_flags);
 	if (required_fault) {
-		int ret;
-
 		spin_unlock(ptl);
-		hugetlb_vma_unlock_read(vma);
-		/*
-		 * Avoid deadlock: drop the vma lock before calling
-		 * hmm_vma_fault(), which will itself potentially take and
-		 * drop the vma lock. This is also correct from a
-		 * protection point of view, because there is no further
-		 * use here of either pte or ptl after dropping the vma
-		 * lock.
-		 */
-		ret = hmm_vma_fault(addr, end, required_fault, walk);
-		hugetlb_vma_lock_read(vma);
-		return ret;
+		return hmm_record_fault(addr, end, required_fault, walk);
 	}
 
 	pfn = pte_pfn(entry) + ((start & ~hmask) >> PAGE_SHIFT);
@@ -637,6 +621,44 @@ static const struct mm_walk_ops hmm_walk_ops = {
 	.walk_lock	= PGWALK_RDLOCK,
 };
 
+/*
+ * hmm_do_fault - fault in a range recorded by a walk callback
+ *
+ * Called from the outer loop in hmm_range_fault() after a callback
+ * returned HMM_FAULT_PENDING.  At this point we hold only mmap_lock;
+ * the page-table spinlock and any hugetlb_vma_lock acquired by the walk
+ * framework have already been released by the unwind.
+ *
+ * Returns -EBUSY on success (all pages faulted, caller should re-walk).
+ * Returns a negative errno on failure.
+ */
+static int hmm_do_fault(struct mm_struct *mm,
+			struct hmm_vma_walk *hmm_vma_walk)
+{
+	unsigned long addr = hmm_vma_walk->last;
+	unsigned long end = hmm_vma_walk->end;
+	unsigned int required_fault = hmm_vma_walk->required_fault;
+	unsigned int fault_flags = FAULT_FLAG_REMOTE;
+	struct vm_area_struct *vma;
+
+	vma = vma_lookup(mm, addr);
+	if (!vma)
+		return -EFAULT;
+
+	if (required_fault & HMM_NEED_WRITE_FAULT) {
+		if (!(vma->vm_flags & VM_WRITE))
+			return -EPERM;
+		fault_flags |= FAULT_FLAG_WRITE;
+	}
+
+	for (; addr < end; addr += PAGE_SIZE)
+		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
+		    VM_FAULT_ERROR)
+			return -EFAULT;
+
+	return -EBUSY;
+}
+
 /**
  * hmm_range_fault - try to fault some address in a virtual address range
  * @range:	argument structure
@@ -674,6 +696,16 @@ int hmm_range_fault(struct hmm_range *range)
 			return -EBUSY;
 		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
 				      &hmm_walk_ops, &hmm_vma_walk);
+		/*
+		 * When HMM_FAULT_PENDING is returned a walk callback
+		 * recorded a range that needs handle_mm_fault();
+		 * hmm_do_fault() runs the fault outside walk_page_range()
+		 * (so no page-table or hugetlb_vma_lock is held) and
+		 * returns -EBUSY so the loop re-walks and picks up the
+		 * now-present entries.
+		 */
+		if (ret == HMM_FAULT_PENDING)
+			ret = hmm_do_fault(mm, &hmm_vma_walk);
 		/*
 		 * When -EBUSY is returned the loop restarts with
 		 * hmm_vma_walk.last set to an address that has not been stored


