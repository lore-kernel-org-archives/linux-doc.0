Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D292192F9
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537864; cv=none; b=Q1s4tEfdLaJ3CnIGx29g9qaCKvQe7zd8PH5J436wqiJm5OlYJCOe+AcehcuRtkbkmpI+n6dDyHtpdeNvLUXAYVucSz5VkMHq8bg116GxUMGYcW/4cayIoQl6C9xRrZzvN9bc1n8AtWfBtgeCSzSTPCR3NaYwAIZnttWrbPYOWMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537864; c=relaxed/simple;
	bh=QKc1hKn0Jaib+kOHavXhIsp+9pbidvHuEURYso6g3oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQFonVy5oXDdDX2Qq7tCEHGEGLZwekR/fgWu64AIfQ6lR0n0U/H/+Oy5iWoqtR3QQeQxiJNiVnh9ut6rLLqchIagF0R8rHqm8s2w2Vc8AMDp5QhQMRFtSvZW2f4b+K/rKg7BTamMYxp1VWADsheQ/7dxLe/zGT6DLwu6j7bIP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT4s4hz5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT4s4hz5"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2907ba47f71so20819655ad.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537860; x=1761142660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX/EZDn+5jjqePiAgsr/tPwX5d1al1/qKcHV0+MDT+Q=;
        b=cT4s4hz5Mz8nChI0oliTiC7JLpZVx0SD0s+HL4yii56V2QtOkaWGxdG3EtjZLFB5Ug
         Hx8iH7DEzQF44rANGD1QynFtO7JXTLaG04YY+buJsObV4mw322oF+x3f1Ft20WdVqb1l
         Nxny3y4+zTKa64DZogdm5xY2x4vcORmZX/xV/Ah516Lxe35RZ33E2lFtLhZvZVdLL+UG
         GtCOk3XwvpDG2+lSqe7BnpSeCkldRPsrXGtoxelveFdmERuQ2iDkxl26ji4fO6i0968C
         hdpG+trZo8Ts2klnPvKIV0sueQdwmhXPHwyP7SZP7NYzLk+PinkQO6+HOg5xID6sLI4k
         r6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537860; x=1761142660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX/EZDn+5jjqePiAgsr/tPwX5d1al1/qKcHV0+MDT+Q=;
        b=wbkJKVb++fcMVZ4u4BnAyRDn1ArK44o3NfoIUSHaEc2EEzs5qH2J7Md+T7gNvZrlKj
         OWUPS/Elqev3QT8eEdWJTdaDymZA7nfe54anP0m0ksCb3LffgXvaLyAuarmOd7okKED+
         6DbG4s+FSOwQPRfFkp+aiS8rWAPAl+f0RD4AUXQUOFCVE28vtT2alqNXjzG5S5vqMdlF
         zVQbS+1sZEYHD+u3k2Ugo5zDokSvLktlRk719KXkgFgyDEMQemrrIN3WCt4SBHHNt7T8
         OAf1MBDlnhFvcDA7/iCim0vuTChTGlosT0o5Y8AHU1uimRZDVcyzf5ElUVHGA8S1DPDx
         lLEA==
X-Forwarded-Encrypted: i=1; AJvYcCWWl34+NtJgebFZaOlL5Od4F9NsVIDK3HqFVkwHOuZ6eSh9Ebgxy2WErPEVVXfgM43ZbX6/SFSGlFw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OW9i/rjkuLAdkO9doscqR0xDbaU6PBQ5iT7MYFooe35AcXeC
	r04BNqFeiRILqRaUcYmwlgLDt5nsAAKKs95xyC7n0nPp7Se5gLFzuKLx
X-Gm-Gg: ASbGncuJPVgqbI4dbjFofTJEoEZItYf+ICGmG0PLp6u8uisXiNCKmTWfjf4IVva84oR
	yml09aU64zQBbe9qw6N3JoQaFMtYEER7h+G2pBmNFoQDgt5UVSJ7bgtBb7UE5oRoTeR8a6Wgayd
	BlW9yNIVa7MA203CXB4un84/P5YjcH0udu+rJYWXHV1qEikTHWBO8qrX1kuLbPClUr6xmm4WZz8
	4bGnmlE12TuZd7DFY7VU92CXZHGC7LKEEvnGbuVC4F0OuLMdF25kLYVtUU2tR+E/QTo+7N3uJen
	NV1Nk25hdiHuA+wW+oR10q+G1f6iiiUvunz06D0qnHqMtfhmQjOiKlic8S0oeLM8dhYgSatbImP
	G3HbyPbHVzGOJa6WHBDR3JeuCC6jVUII6rRYxUy4fo963GRCy++7sil68+MjVrSCI7IqjovKJxa
	rlL64ahe2KrDBJIyus
X-Google-Smtp-Source: AGHT+IFp2HkeSJPTm8Jz89gAC0GGdTodgo+Rdq6QKzLu2VX0OPkPInkpCJBEYxlCq7SYTb+D8YpIug==
X-Received: by 2002:a17:902:ecc6:b0:25c:e2c:6653 with SMTP id d9443c01a7336-290272e1b44mr365455255ad.48.1760537860292;
        Wed, 15 Oct 2025 07:17:40 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.17.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:17:39 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	Yang Shi <shy828301@gmail.com>
Subject: [RFC PATCH v10 mm-new 1/9] mm: thp: remove vm_flags parameter from khugepaged_enter_vma()
Date: Wed, 15 Oct 2025 22:17:08 +0800
Message-Id: <20251015141716.887-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251015141716.887-1-laoar.shao@gmail.com>
References: <20251015141716.887-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The khugepaged_enter_vma() function requires handling in two specific
scenarios:
1. New VMA creation
  When a new VMA is created (for anon vma, it is deferred to pagefault), if
  vma->vm_mm is not present in khugepaged_mm_slot, it must be added. In
  this case, khugepaged_enter_vma() is called after vma->vm_flags have been
  set, allowing direct use of the VMA's flags.
2. VMA flag modification
  When vma->vm_flags are modified (particularly when VM_HUGEPAGE is set),
  the system must recheck whether to add vma->vm_mm to khugepaged_mm_slot.
  Currently, khugepaged_enter_vma() is called before the flag update, so
  the call must be relocated to occur after vma->vm_flags have been set.

In the VMA merging path, khugepaged_enter_vma() is also called. For this
case, since VMA merging only occurs when the vm_flags of both VMAs are
identical (excluding special flags like VM_SOFTDIRTY), we can safely use
target->vm_flags instead. (It is worth noting that khugepaged_enter_vma()
can be removed from the VMA merging path because the VMA has already been
added in the two aforementioned cases. We will address this cleanup in a
separate patch.)

After this change, we can further remove vm_flags parameter from
thp_vma_allowable_order(). That will be handled in a followup patch.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Yang Shi <shy828301@gmail.com>
Cc: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/khugepaged.h | 10 ++++++----
 mm/huge_memory.c           |  2 +-
 mm/khugepaged.c            | 27 ++++++++++++++-------------
 mm/madvise.c               |  7 +++++++
 mm/vma.c                   |  6 +++---
 5 files changed, 31 insertions(+), 21 deletions(-)

diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
index eb1946a70cff..b30814d3d665 100644
--- a/include/linux/khugepaged.h
+++ b/include/linux/khugepaged.h
@@ -13,8 +13,8 @@ extern void khugepaged_destroy(void);
 extern int start_stop_khugepaged(void);
 extern void __khugepaged_enter(struct mm_struct *mm);
 extern void __khugepaged_exit(struct mm_struct *mm);
-extern void khugepaged_enter_vma(struct vm_area_struct *vma,
-				 vm_flags_t vm_flags);
+extern void khugepaged_enter_vma(struct vm_area_struct *vma);
+extern void khugepaged_enter_mm(struct mm_struct *mm);
 extern void khugepaged_min_free_kbytes_update(void);
 extern bool current_is_khugepaged(void);
 extern int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
@@ -38,8 +38,10 @@ static inline void khugepaged_fork(struct mm_struct *mm, struct mm_struct *oldmm
 static inline void khugepaged_exit(struct mm_struct *mm)
 {
 }
-static inline void khugepaged_enter_vma(struct vm_area_struct *vma,
-					vm_flags_t vm_flags)
+static inline void khugepaged_enter_vma(struct vm_area_struct *vma)
+{
+}
+static inline void khugepaged_enter_mm(struct mm_struct *mm)
 {
 }
 static inline int collapse_pte_mapped_thp(struct mm_struct *mm,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1b81680b4225..ac6601f30e65 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1346,7 +1346,7 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	ret = vmf_anon_prepare(vmf);
 	if (ret)
 		return ret;
-	khugepaged_enter_vma(vma, vma->vm_flags);
+	khugepaged_enter_vma(vma);
 
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm) &&
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 7ab2d1a42df3..5088eedafc35 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -353,12 +353,6 @@ int hugepage_madvise(struct vm_area_struct *vma,
 #endif
 		*vm_flags &= ~VM_NOHUGEPAGE;
 		*vm_flags |= VM_HUGEPAGE;
-		/*
-		 * If the vma become good for khugepaged to scan,
-		 * register it here without waiting a page fault that
-		 * may not happen any time soon.
-		 */
-		khugepaged_enter_vma(vma, *vm_flags);
 		break;
 	case MADV_NOHUGEPAGE:
 		*vm_flags &= ~VM_HUGEPAGE;
@@ -460,14 +454,21 @@ void __khugepaged_enter(struct mm_struct *mm)
 		wake_up_interruptible(&khugepaged_wait);
 }
 
-void khugepaged_enter_vma(struct vm_area_struct *vma,
-			  vm_flags_t vm_flags)
+void khugepaged_enter_mm(struct mm_struct *mm)
 {
-	if (!mm_flags_test(MMF_VM_HUGEPAGE, vma->vm_mm) &&
-	    hugepage_pmd_enabled()) {
-		if (thp_vma_allowable_order(vma, vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
-			__khugepaged_enter(vma->vm_mm);
-	}
+	if (mm_flags_test(MMF_VM_HUGEPAGE, mm))
+		return;
+	if (!hugepage_pmd_enabled())
+		return;
+
+	__khugepaged_enter(mm);
+}
+
+void khugepaged_enter_vma(struct vm_area_struct *vma)
+{
+	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
+		return;
+	khugepaged_enter_mm(vma->vm_mm);
 }
 
 void __khugepaged_exit(struct mm_struct *mm)
diff --git a/mm/madvise.c b/mm/madvise.c
index fb1c86e630b6..8de7c39305dd 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1425,6 +1425,13 @@ static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
 
 	error = madvise_update_vma(new_flags, madv_behavior);
+	/*
+	 * If the vma become good for khugepaged to scan,
+	 * register it here without waiting a page fault that
+	 * may not happen any time soon.
+	 */
+	if (!error && new_flags & VM_HUGEPAGE)
+		khugepaged_enter_mm(vma->vm_mm);
 out:
 	/*
 	 * madvise() returns EAGAIN if kernel resources, such as
diff --git a/mm/vma.c b/mm/vma.c
index a1ec405bda25..6a548b0d64cd 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -973,7 +973,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err || commit_merge(vmg))
 		goto abort;
 
-	khugepaged_enter_vma(vmg->target, vmg->vm_flags);
+	khugepaged_enter_vma(vmg->target);
 	vmg->state = VMA_MERGE_SUCCESS;
 	return vmg->target;
 
@@ -1093,7 +1093,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	 * following VMA if we have VMAs on both sides.
 	 */
 	if (vmg->target && !vma_expand(vmg)) {
-		khugepaged_enter_vma(vmg->target, vmg->vm_flags);
+		khugepaged_enter_vma(vmg->target);
 		vmg->state = VMA_MERGE_SUCCESS;
 		return vmg->target;
 	}
@@ -2520,7 +2520,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 	 * call covers the non-merge case.
 	 */
 	if (!vma_is_anonymous(vma))
-		khugepaged_enter_vma(vma, map->vm_flags);
+		khugepaged_enter_vma(vma);
 	*vmap = vma;
 	return 0;
 
-- 
2.47.3

