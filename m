Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FD1262D0B
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537897; cv=none; b=C9Ny2Wn/H0pF0biA0WwHmlXDd9d63Ua1jneJ70375VDZ9ysCAlEKn778WSSxifKEzVWUaZ0zn0+/VRuNeR7LUh0EBSanFB6RMVrBUEETZyfYeGwx3y7QbYkUQCuPVaJyoaIlUDXIHux5C55aA2D2H533M9YyKQGrgnmmLQYHxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537897; c=relaxed/simple;
	bh=PdHzrFnTfY/BX2nYC+VH4KXSooOxeg+vmzUyNWX3Omw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQMK/TiXXYy7wiq+NkcGFTeZLLtMYeBfzutezvlTE2N4PydOC6oGkPeRwVoXUodY7x0bqqgMXz5pZcHf4MZ/Xr74RCOm7ebr02ggoIMh3tXsa0vldA5ltvtrG5WQpHCqkvrXc/PqNPcVOhZxFtH+d4//WmHW7kY4M8DJGisYtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jODZ0Lda; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jODZ0Lda"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b58445361e8so876423a12.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537894; x=1761142694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tfnp2VgNI7X5NDB06OaZAZrurrAWQnxjDDxodnKF9g=;
        b=jODZ0LdaRXSqRmVsN3wl29fRoNLR5YwDPATJ1b/tmu4g7l8urBKSWHxYKpJiJFS9b3
         PlszC92aOlK+wlqG1SFa/Fcpm37CXqaUkTZrkB8fpzxaKqowDXslaJ0HssoP8Yfk/YNy
         lsYcQXJtOC2LXk6BMQt+u0uVSBJypBbfX+gaBoGXgfYdN34GW1fTu0uNgqVSWE2oci42
         wcZau7CMC9bFPzuCncX87W0P182DFOvkZaG/8Yjz2xFaRKnIsNBdyJKWDYgLw5SQda/Y
         IRIlujW9vBJtafcH5vrDm7UAGmrnPVIYm2xSNUFUkZRHwRiY2KOh3iteJmATm0SCQOuF
         yfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537894; x=1761142694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tfnp2VgNI7X5NDB06OaZAZrurrAWQnxjDDxodnKF9g=;
        b=l1B8NRCFSsz4ln0yMXuWUlpI3OQj/QiEVbrIm227HYeAChjOGC59mnBiCtdPsX95JJ
         h49zLMDdxMiK+iwTmiOl3El95Ay5DZCjyIAdXmlu9khZQLeAMPeVrkStLRY56yb9zZ4I
         SjfezElALOQwZnj/GYUSGJBfdoYjXKl46dyJtENZymBTbH9PasfnEmpq9SuL9Ytdbwg4
         wkFzazVevWdv48ASIFuIjhjh54nT+N/9zR7y7QRlwd0Uc8UC3abNfx8b8PXKvCbijXJ5
         Ol3gYehlPfgA3VyVkvA1B9IGZkzVPqw2VPkAkG1saPpC7knlITXEf95ZBTLqX1QnZg32
         jE8g==
X-Forwarded-Encrypted: i=1; AJvYcCUw7oUYBri/Z5GkUnqtKa25R4SUCNJnW8D4DZpAQVEdnRDMRSrms1z+cxAwopGS2XKluqch7e/hCnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUImrp5HfWjqCzSSG1DslWZZkr0IoaW9kvX7YGQZOoVtdZzVUa
	ZdR7MjQV7odU3EFZSGWWhkssCP0bEneFsyboFks9MbNVqjo+Mu28M0m/
X-Gm-Gg: ASbGnctekOAvjM3oC8NlNZ5aSp1lXsst/vjaJH1533vqK/qyhhdbHLo6+2hWxSn2GYb
	xQPyrxGxUqkIUhr3cEsyDLuKh3hjNFxDVRV+wp7LsX7g77XxVK0F7PYXPEKvZcCJcfzu0xGeI9i
	gZ7JdK/u3memqigfHuFXkm2MMrvTm7/F6TtAAyFCHSOKVISLbQanGZ10j3UiJUpXeXNCLfzdvrv
	d+HMeZBuXK3zRx1Vdga859lumxjDR5xm9K+u85X5xKnUSbI21fXkovCbDAsCwLvNvb9jAh0Kz9G
	jS79kljjm6YjGN/K/xl+WBchmMJRV/NfMLEBzDOJB8WDXTyyirjqzaLkJ25faMOngPQzQKhlXU4
	xfIDf3h8kUIegU8ex5+pRFlwjWnon3v7Y/0pknqfwrFg7XT79HyBduiLKE/CjOj75M9jHiSVMIS
	13oElWYt/+bQlTzxpP
X-Google-Smtp-Source: AGHT+IGaH4Q7yuB3UefbX6fUnOF0Cq4qxYjfR/YqrSeLwExSFoNCC9hfKuz5SVL5H702WlYSyJC/fw==
X-Received: by 2002:a17:902:ecc2:b0:281:fd60:807d with SMTP id d9443c01a7336-290919d5389mr3536805ad.2.1760537894159;
        Wed, 15 Oct 2025 07:18:14 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.18.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:18:12 -0700 (PDT)
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
Subject: [RFC PATCH v10 mm-new 5/9] mm: thp: enable THP allocation exclusively through khugepaged
Date: Wed, 15 Oct 2025 22:17:12 +0800
Message-Id: <20251015141716.887-6-laoar.shao@gmail.com>
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

khugepaged_enter_vma() ultimately invokes any attached BPF function with
the TVA_KHUGEPAGED flag set when determining whether or not to enable
khugepaged THP for a freshly faulted in VMA.

Currently, on fault, we invoke this in do_huge_pmd_anonymous_page(), as
invoked by create_huge_pmd() and only when we have already checked to
see if an allowable TVA_PAGEFAULT order is specified.

Since we might want to disallow THP on fault-in but allow it via
khugepaged, we move things around so we always attempt to enter
khugepaged upon fault.

This change is safe because:
- khugepaged operates at the MM level rather than per-VMA. The THP
  allocation might fail during page faults due to transient conditions
  (e.g., memory pressure), it is safe to add this MM to khugepaged for
  subsequent defragmentation.
- If __thp_vma_allowable_orders(TVA_PAGEFAULT) returns 0, then
  __thp_vma_allowable_orders(TVA_KHUGEPAGED) will also return 0.

While we could also extend prctl() to utilize this new policy, such a
change would require a uAPI modification to PR_SET_THP_DISABLE.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
Acked-by: Lance Yang <lance.yang@linux.dev>
Cc: Usama Arif <usamaarif642@gmail.com>
---
 mm/huge_memory.c |  1 -
 mm/memory.c      | 13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 08372dfcb41a..2b155a734c78 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1346,7 +1346,6 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	ret = vmf_anon_prepare(vmf);
 	if (ret)
 		return ret;
-	khugepaged_enter_vma(vma);
 
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm) &&
diff --git a/mm/memory.c b/mm/memory.c
index 58ea0f93f79e..64f91191ffff 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6327,11 +6327,14 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 	if (pud_trans_unstable(vmf.pud))
 		goto retry_pud;
 
-	if (pmd_none(*vmf.pmd) &&
-	    thp_vma_allowable_order(vma, TVA_PAGEFAULT, PMD_ORDER)) {
-		ret = create_huge_pmd(&vmf);
-		if (!(ret & VM_FAULT_FALLBACK))
-			return ret;
+	if (pmd_none(*vmf.pmd)) {
+		if (vma_is_anonymous(vma))
+			khugepaged_enter_vma(vma);
+		if (thp_vma_allowable_order(vma, TVA_PAGEFAULT, PMD_ORDER)) {
+			ret = create_huge_pmd(&vmf);
+			if (!(ret & VM_FAULT_FALLBACK))
+				return ret;
+		}
 	} else {
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
-- 
2.47.3

