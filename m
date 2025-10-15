Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFDA261591
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537887; cv=none; b=GCfs5b5XZzdQq/XR+9aAzbhVmb+1GzfTVAtTjlw9zT5Zui2x6eAFIKAAM1NRAcUmiFM3h3taKGXUV6K91QLQ/O/QY4djNCRvfSHxRg9bSatSiIVgbMc2ROPRAJXeABeijDtvy5nR5Fy2cqOXe6f1c9+jLl0f39OdBEIzBDuCMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537887; c=relaxed/simple;
	bh=KluHk1QWZzn5NMc+VsC+MNBgvBYeQNDP8rGgjwP2v0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6itfj64PR2A0sTpOSmdYPncfl0vJk2j+OuwQw6UiQrTSQmfzyLUOSjuztLOaWgHh6y7Y7mH+L6/KSg33xpzkIg4Bve53pdLoODyjr9oYRC6Fhp8MIGMoyR2V1V1j325HuXlDUK55gpWGXh+j0khm+oPR3HiMbA5ZPThD+D5x3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jX+JnIV5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jX+JnIV5"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27c369f898fso95850645ad.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537885; x=1761142685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnem9WQoa9CrDKPFqRiLEj1JeBs2tMhwu9umKx+yfco=;
        b=jX+JnIV5GL0SE3y5tfD5skoaSosu6/cBMWqlGllqhw/tgO8dvEBy7xyclqP6r9TE4R
         /tQ7vJVtyOkCmn4vZj0Cu/DrJtY1sRH2zFJeOGlDDhX2LxZ5oJJe04neWEvuUnt3rr+P
         /3FuBGifhT0kPtk7H+GHrokCfnS6VAOiO1QVKI6BbkCz12kbQ0liP9n2n/mKW77tDoEy
         0koGJLi5tLHl2qekZTCCIQnnhFocuo0/cI/JUJuG9Fvws5C/5z7BtHUQqekn5cp20snx
         oYpLBgAtrpLe7NRj+PzqHdKE2ioGazp+541HGq/3PcY+3aR4F55wbYf3cjjCfk9DUs8K
         Hgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537885; x=1761142685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnem9WQoa9CrDKPFqRiLEj1JeBs2tMhwu9umKx+yfco=;
        b=uiednVGY/pQY7XenDFJBCXp3w//DQINbwHNzjcCKtSCG1gk0Amwg7USHRrvfUEPw9R
         6IH1Am+3+01e4RL+RRU3Ar8/TK862fvN0bhueQj10uW+i/cjgdK0NubDjIlzYP3E4uzM
         BQ+RiqxBCxnH/tIzHTxZ7zL7ZuVZnyfsHK19L/kCITi6idt6SR/V2zvracZhdXMOCHpG
         S4VWIjR3lD560yUa6kn3K+vGWkrsF4lPw4y+szWU5ozwtDRj9phjBhdIjMADiVDUHimB
         bgtv+MiqvMdK9JKWAb+zsKh6vFWbGE6R783mmsD7Pohj0IF5Ro/2UjW+2sBMcu/wnMSb
         EDEg==
X-Forwarded-Encrypted: i=1; AJvYcCX4MxIEK/VG+LpvUjbOs8iDKvC+UChrWu18m2A1xJgg0frLfimF+0o0V4RDhPIH3Be3nKKwT9DfTA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVDXOR0X2QtiygIKtRvF1RITJRoH0XMEw2XG8dYxt1HqVo9M2K
	oC68Ql4nY/O6rLzLoUEBdgXc977VQ5wJ24TzNPHRZztfpwdxrtNe/i1C
X-Gm-Gg: ASbGncuvKmichZoY9SMx3F3Q+iclsrEFLJWuapaty+WtA+RtNsD4v25Xzq8mX3xORcC
	2RG+6wtZJWINUv91o36RtTbHu/h8frxeYFI8slqgM5ub6tCkA6vnmpMks9bzaBiduPYp9/73QcN
	OFSQYwKWVaIWcFw1d4CEZJUJ8DcOHBvtq3Y6AJLe1ZtPvg9sGJcaSJQnEjsslCn+ZiSXWapZ0G7
	Dm5ORTRmUxVyAj06C0SpbofY591F8oByp4HftnByUbmIVi4hda8SDyd7vBurMZmb/7o7OgTcRPj
	kNJybIoIevrsJLMmdGr+cP8eJHu/rgLkiqrEimL8ec6AM3r1SBx1xMaFUDG4TKGRBsUql0Mtlzn
	adZqb1pIm6KY79DhlVxMQO3cGxdecXC9j9s1s8+qt1mWj4E/wCHoXrKUbDrBE/N2kcH4MCr+Nsl
	9H5e1gJw==
X-Google-Smtp-Source: AGHT+IH94/LKl7eMp9XLhTF4MNSw5y/puAoaithR0MMgu0BDg3idBsTz0DwsyFW6zRb6V4pYAII+Og==
X-Received: by 2002:a17:902:e54f:b0:28d:18d3:46bc with SMTP id d9443c01a7336-2902723d619mr412289645ad.19.1760537884479;
        Wed, 15 Oct 2025 07:18:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.17.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:18:03 -0700 (PDT)
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
	Yafang Shao <laoar.shao@gmail.com>
Subject: [RFC PATCH v10 mm-new 4/9] mm: thp: decouple THP allocation between swap and page fault paths
Date: Wed, 15 Oct 2025 22:17:11 +0800
Message-Id: <20251015141716.887-5-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251015141716.887-1-laoar.shao@gmail.com>
References: <20251015141716.887-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new BPF capability enables finer-grained THP policy decisions by
introducing separate handling for swap faults versus normal page faults.

As highlighted by Barry:

  We’ve observed that swapping in large folios can lead to more
  swap thrashing for some workloads- e.g. kernel build. Consequently,
  some workloads might prefer swapping in smaller folios than those
  allocated by alloc_anon_folio().

While prtcl() could potentially be extended to leverage this new policy,
doing so would require modifications to the uAPI.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Usama Arif <usamaarif642@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>
---
 include/linux/huge_mm.h | 3 ++-
 mm/huge_memory.c        | 2 +-
 mm/memory.c             | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 5ecc95f35453..9e4088ae0a32 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -96,9 +96,10 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 
 enum tva_type {
 	TVA_SMAPS,		/* Exposing "THPeligible:" in smaps. */
-	TVA_PAGEFAULT,		/* Serving a page fault. */
+	TVA_PAGEFAULT,		/* Serving a non-swap page fault. */
 	TVA_KHUGEPAGED,		/* Khugepaged collapse. */
 	TVA_FORCED_COLLAPSE,	/* Forced collapse (e.g. MADV_COLLAPSE). */
+	TVA_SWAP_PAGEFAULT,	/* serving a swap page fault. */
 };
 
 #define thp_vma_allowable_order(vma, type, order) \
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1ac476fe6dc5..08372dfcb41a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -102,7 +102,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 					 unsigned long orders)
 {
 	const bool smaps = type == TVA_SMAPS;
-	const bool in_pf = type == TVA_PAGEFAULT;
+	const bool in_pf = (type == TVA_PAGEFAULT || type == TVA_SWAP_PAGEFAULT);
 	const bool forced_collapse = type == TVA_FORCED_COLLAPSE;
 	unsigned long supported_orders;
 	vm_flags_t vm_flags = vma->vm_flags;
diff --git a/mm/memory.c b/mm/memory.c
index cd04e4894725..58ea0f93f79e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4558,7 +4558,7 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 	 * Get a list of all the (large) orders below PMD_ORDER that are enabled
 	 * and suitable for swapping THP.
 	 */
-	orders = thp_vma_allowable_orders(vma, TVA_PAGEFAULT,
+	orders = thp_vma_allowable_orders(vma, TVA_SWAP_PAGEFAULT,
 					  BIT(PMD_ORDER) - 1);
 	orders = thp_vma_suitable_orders(vma, vmf->address, orders);
 	orders = thp_swap_suitable_orders(swp_offset(entry),
-- 
2.47.3

