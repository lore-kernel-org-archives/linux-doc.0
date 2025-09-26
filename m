Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C2729B8D8
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758879253; cv=none; b=gqvDNctfdaPEXaG7X2zVgZtRestxl4VXBdJR/7U/LP21C4W0yfZ3moCfMO8xkiVw6d3nBJSSUMnbvGFBDNn/lsox8X20BQkw3XzFprpGl/ZOXI2A0Ab9j5WUhPRr7G7Fdi3SgtvT22Yc5vewqWqGQmPWFj+nkA+B2Kx1kQOrE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758879253; c=relaxed/simple;
	bh=WFo9LyAeEaA81byOzYYPzk59eC4wRmtclcHVMsp5+Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GmqX+MSWMLbWCqDb2KY3Jp5956+nDbDKIszKvdcn1K2J2cIXQx7ivvda5JQYshKChGb0IlG4GM7kjJA9AEkgnwDJmeTV9uQQr32PIUE2sg+8CH/7zu6u8WH7bB7MhjLCv+/5E9TiEEyAypA4tX9M3QCb8OjGcYwu8OW4rrT+N8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gRoARfqg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gRoARfqg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27ee41e074dso12944025ad.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758879251; x=1759484051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZMgKn0wKQ/oqMfqx0uxt+uUc993BOebahb39/puGXY=;
        b=gRoARfqgFRk9vKKDfTDHsOLPvYzTwN6afyYUYiCLeT1GbcywDbz/MPpntwXtHcENN/
         VYxy/1MuXNLOj9hCpHaF7ThKXVZ4nNMMBphsAIM7VqxXChxprufykq4jWiWuZD6jt5o2
         B7DABBqZ/ollBxGZuZcLBLxUgajWBFAjqM9UgiO/TpaIKFVj0xHIJ/Fre9Kkh8vJMEHq
         PpjupUm4OavdoR7/jqB59cQhLQG6OVn7tpEOz9C/4+EgJvCXorAuBDtL3eXpdArbRfh8
         hWyH8zKnfd/ySA16aZTWci+D3OtWSeMhVRnkBhUItH5xouE1pLKwJHdZnAVMgAl0xqEB
         wD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758879251; x=1759484051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZMgKn0wKQ/oqMfqx0uxt+uUc993BOebahb39/puGXY=;
        b=fkkEqYhywlaX4G5P37SzQR2VeoUuOxN5wVOAiGwulePN6Y0otj6miJCuQfLhWD4YyV
         tEybfaANapws1y/QH8nNBtsYCSn6F80oOalanZjGlIbhmiGLcmwzV+9cVNNl/Icj6qiZ
         OLWoj9Irej359la2jjMcR3HVZh7hL6Syi2WQXAVAbxp7KEvG1z1gZGyCOeeLUlsdR5hw
         qG9LplIdbM0XWJM7McYiH8UsIAyFwzBExnaH/zpkqZcmA9njEHqRGVm9+nqdY7W4sZau
         DQZcydSWXaJZQwG7uIFfoNQEEfBnLz+KRPgpoMCL93STeS6+mR5I2rC2fDvMTYWxhZrV
         9JIA==
X-Forwarded-Encrypted: i=1; AJvYcCVZGa9VrOknOirdjiov9cmDnhiSKjChpjFRcoHPZ+WfbNLVEDSjTsaENtWYbXyRreOviX5KMAzt99I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0V97dSy3oveXa+H60MEZaHJyTBEM1OWOEK3pXY0UN0KCsIQ09
	8YbKc8axFXTTDxWaq1TYleLCJmKtg3H5PvZ4wB/D6QPEyU1+4Vw16cM2
X-Gm-Gg: ASbGncsizVyMmcR8T4tGjMyHF9cvyzdW0LiwjEsvSPtUEEwPft3fQVIdb1MTKQkboQ6
	Xy6aIBTBPg3Fm5107TKGulwufWlPRQZJqWmWFZEUnaF6iel3mZlhBpU5jtvnGlMCCQZjVxobE83
	upNtU3A3teM3MZ6/8tY5yzKS/4Jn3cA6KfK64igVHC+r5EpvGYbJitN0sfggeA9qfe0XGLE4jHM
	vrifsrMtcKVTbOqCabzl6dQ6OksWaoB9Fa55iZPbAyJKGN+avMDPoK21+KZhI07lpdyN/jlGZfE
	4S8/fRaO2cOqTHI4qAH6MTLabSKtmilHd30psPWz7NkxzoFFezNrsmQHTn4CPm4+iPSgWA/2qgs
	OdN+O878vrPoe79/tPNs4QqSG5T9HbilvlXw+8Lq16x856BsQLp4Uy43+mO7Eaua6reiQK91gRB
	w8dqzmt6lWXmLN
X-Google-Smtp-Source: AGHT+IE8m06qLCI0fDHhVvccWM4X7VzASHCAmPvCMmQy9qW9LwLNoLvpBo8EtHPcpGLM28ZdNvKrWw==
X-Received: by 2002:a17:903:b06:b0:276:d3e:6844 with SMTP id d9443c01a7336-27ed4a7e7d9mr64071655ad.33.1758879251420;
        Fri, 26 Sep 2025 02:34:11 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1c21:566:e1d1:c082:790c:7be6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cda43sm49247475ad.25.2025.09.26.02.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Sep 2025 02:34:10 -0700 (PDT)
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
	lance.yang@linux.dev
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>,
	Yang Shi <shy828301@gmail.com>
Subject: [PATCH v8 mm-new 02/12] mm: thp: remove vm_flags parameter from khugepaged_enter_vma()
Date: Fri, 26 Sep 2025 17:33:33 +0800
Message-Id: <20250926093343.1000-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20250926093343.1000-1-laoar.shao@gmail.com>
References: <20250926093343.1000-1-laoar.shao@gmail.com>
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
  When a new VMA is created, if vma->vm_mm is not present in
  khugepaged_mm_slot, it must be added. In this case,
  khugepaged_enter_vma() is called after vma->vm_flags have been set,
  allowing direct use of the VMA's flags.
2. VMA flag modification
  When vma->vm_flags are modified (particularly when VM_HUGEPAGE is set),
  the system must recheck whether to add vma->vm_mm to khugepaged_mm_slot.
  Currently, khugepaged_enter_vma() is called before the flag update, so
  the call must be relocated to occur after vma->vm_flags have been set.

Additionally, khugepaged_enter_vma() is invoked in other contexts, such as
during VMA merging. However, these calls are unnecessary because the
existing VMA already ensures that vma->vm_mm is registered in
khugepaged_mm_slot. While removing these redundant calls represents a
potential optimization, that change should be addressed separately.
Because VMA merging only occurs when the vm_flags of both VMAs are
identical (excluding special flags like VM_SOFTDIRTY), we can safely use
target->vm_flags instead.

After this change, we can further remove vm_flags parameter from
thp_vma_allowable_order(). That will be handled in a followup patch.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Cc: Yang Shi <shy828301@gmail.com>
---
 include/linux/khugepaged.h |  6 ++----
 mm/huge_memory.c           |  2 +-
 mm/khugepaged.c            | 11 ++---------
 mm/madvise.c               |  7 +++++++
 mm/vma.c                   |  6 +++---
 5 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
index f14680cd9854..b30814d3d665 100644
--- a/include/linux/khugepaged.h
+++ b/include/linux/khugepaged.h
@@ -13,8 +13,7 @@ extern void khugepaged_destroy(void);
 extern int start_stop_khugepaged(void);
 extern void __khugepaged_enter(struct mm_struct *mm);
 extern void __khugepaged_exit(struct mm_struct *mm);
-extern void khugepaged_enter_vma(struct vm_area_struct *vma,
-				 vm_flags_t vm_flags);
+extern void khugepaged_enter_vma(struct vm_area_struct *vma);
 extern void khugepaged_enter_mm(struct mm_struct *mm);
 extern void khugepaged_min_free_kbytes_update(void);
 extern bool current_is_khugepaged(void);
@@ -39,8 +38,7 @@ static inline void khugepaged_fork(struct mm_struct *mm, struct mm_struct *oldmm
 static inline void khugepaged_exit(struct mm_struct *mm)
 {
 }
-static inline void khugepaged_enter_vma(struct vm_area_struct *vma,
-					vm_flags_t vm_flags)
+static inline void khugepaged_enter_vma(struct vm_area_struct *vma)
 {
 }
 static inline void khugepaged_enter_mm(struct mm_struct *mm)
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
index f47ac8c19447..04121ae7d18d 100644
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
@@ -467,10 +461,9 @@ void khugepaged_enter_mm(struct mm_struct *mm)
 	__khugepaged_enter(mm);
 }
 
-void khugepaged_enter_vma(struct vm_area_struct *vma,
-			  vm_flags_t vm_flags)
+void khugepaged_enter_vma(struct vm_area_struct *vma)
 {
-	if (!thp_vma_allowable_order(vma, vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
+	if (!thp_vma_allowable_order(vma, vma->vm_flags, TVA_KHUGEPAGED, PMD_ORDER))
 		return;
 
 	khugepaged_enter_mm(vma->vm_mm);
diff --git a/mm/madvise.c b/mm/madvise.c
index 35ed4ab0d7c5..ab8b5d47badb 100644
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

