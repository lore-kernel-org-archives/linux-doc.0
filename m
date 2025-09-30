Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F6D222560
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759211938; cv=none; b=YUngaEsj28O5avyXUOm15Mu0n4d80YZ2Y02Wjds7oYayHZbf1ZTs6NRyptH+Tm1y7VczijyW4dKayuSojI8iQCebmZ/dE0T6WxYknwSj3bAGqAhs1XHnL0pZ3rYHnA2talAVYHarDUydqujVveNArqowbrGVm0yBnnWt+7LpO3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759211938; c=relaxed/simple;
	bh=QKc1hKn0Jaib+kOHavXhIsp+9pbidvHuEURYso6g3oE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AcstY0TWytc7RHrEDoc+AAN3e8QtWplKf/ReG39qKbf6hKyDk5dVzReG+tHjkxMKEM8MC3jhg/T2mobvAsz4yZp8HS4JdcA4OK7XxutnLjDflzVi7IiWY0xqDFZS+CNGV9/Nnv+Q9in0euWNOYVM/nSznwkzyw1E/0upzp5UEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2ryFYvm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2ryFYvm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-273a0aeed57so74652325ad.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759211935; x=1759816735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX/EZDn+5jjqePiAgsr/tPwX5d1al1/qKcHV0+MDT+Q=;
        b=g2ryFYvmW2ZqzMdfP0Z3NYw5nnkjztUME7R44drvxEbNioeJw3pQhDx4grVBvdyWMI
         1NP4tH22HpJOQUE4rQR5UbY8lhphLLacu6D96hxz5u3CanqDCwN15kZUS9uLPC5KMVxY
         hL4X5zSIzg5JaCum2XfID1kz3Gxr5TKqqkPpz1ZPJiEq65m67rL5BDze3dLLhIku9UfS
         JOBlrCiU3MzHjOI4swbjKgVkZVWBb5Z6GJijQScSIFX7cylBNgwnFwVQyxj8mOaCKocq
         pwSXajnE4uzozx/HvnkkyapEY2Mfc2hCikl1SVtJiVvRzYYwZ4euysqfzIjNgh1GWyfk
         TU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211935; x=1759816735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX/EZDn+5jjqePiAgsr/tPwX5d1al1/qKcHV0+MDT+Q=;
        b=rcHLWDEYe4xbYHmj48lkm+aDSU7wZK1uq9dpK7f0gPKH1xy+84HtgqWE7gDJrQ9Kuh
         g0n2BVsJdVdy8CbYD/K5KOJR0BlNc6S8tWMDM1e1McmVXL0MxSNO0FgiejbAu14K/kE7
         1gmrjZ010H0MOLByzNfriB4TGmgrlR+bcMfkqgGN3yZPHCgf8X0T5rgHQUtbbd8X+KXN
         cnkpUA9RsE6MKS0ReP8kvJdNMw3yaegtIwQNzN2RCMpXKowohAG5syru7x8UfUV0Ik7b
         egXjloMAj/J2yY2OFIviHda6iBrV6qExeax4y+OcTMzGZI2h+l4qbZhHevJNPdzHotRN
         UGdg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiQ3jf8BtyxuP63SbO+PKneynOxW2OdKpGoLLka+DewnkPcxq8zycIs8rMWO+LSujDlUR+TXvRRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4Ilbo6R1FrVXR6IHpJHy1b/u+1NiwBX1LpuSoRpeDEhSXOWU
	2zvngq1zkqgP/X4wvOEOQel8ylmZTdtgjom+lMmT+VUyuQbqv056jbEh
X-Gm-Gg: ASbGncsJOtKG9NhGCrVsn5/t+Q6UbaxWEZPiPFRtI7KjOf1WKmB3AGNlePdvVd8w2T5
	zEbh5BAPt+yY+JEH0CJNSu9Ajz4LusqOUl5jRdKNvXEqexild6nSj9a3n+gQGDaghQu0n2WG3hM
	dxwY28slLU/EJZhsKT7HSx2a2EQlIKg+iRvYuIY1A0AihTYw8pKDk0pAqIGQRmemkCXw4Z/By+s
	uTynrCIQCZ44JlBlyQ0gb9vpWV9td/oaBAUpsaYKQFhy0HNme+Zc0TcqRy7oeFLdxHLdGdgzwty
	zoA4LgF+eAZo91L0aHHBfMoR8zcTPJEaE28TSE7hKvUwFnsy99AKEBDTGI3NAAaU6D1DH/D1MbI
	1hhG/no6rYLrIe1n1XBFP8a3a9KYxEM53zV0jPfK0s/UsUBvsdncD3PB02sYrh4nv96QC4lMUMN
	MxCIUP9luccsvY7/UKuli5cfmXDgjJBHuvwfLfYw==
X-Google-Smtp-Source: AGHT+IEe87sBeRrqaS6fI58+8CLk5OyPR4wtDVThXkEE6FbVm+QMGWoKZoG0IbKrCxt+Qu4CXqUQVQ==
X-Received: by 2002:a17:903:1904:b0:282:2c52:508e with SMTP id d9443c01a7336-28d171199c0mr34377675ad.8.1759211935110;
        Mon, 29 Sep 2025 22:58:55 -0700 (PDT)
Received: from localhost.localdomain ([61.171.228.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm148834065ad.9.2025.09.29.22.58.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 22:58:54 -0700 (PDT)
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
Subject: [PATCH v9 mm-new 01/11] mm: thp: remove vm_flags parameter from khugepaged_enter_vma()
Date: Tue, 30 Sep 2025 13:58:16 +0800
Message-Id: <20250930055826.9810-2-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250930055826.9810-1-laoar.shao@gmail.com>
References: <20250930055826.9810-1-laoar.shao@gmail.com>
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

