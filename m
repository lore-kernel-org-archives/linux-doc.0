Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EFC1E3762
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930232; cv=none; b=nGrHHMB/VcSmR03FMT+iwIy5+Hpg/4/Enf7CbqLJIibTaP1rExX82vZ3sNpnCvlpU6GKZywOgO/7UTj02bwVgZwDF+w7djPcZqkofGMuOlIvzsKw4AHwLAL3H+9R+pSR9PDpy6rHG96sQHkSxtLo4x3l9iDJujLoSnyb4unElUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930232; c=relaxed/simple;
	bh=Qv1HG9au83J7guckWop8/cgavdJDTQcWIQGKLivyPZg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DRh8d02uNLouuIZbj6peZ76JY3QmDmBN2Tprcn9C7VSL7X7LiUrVXYfACShiq4ROYy+Lr9S1+X/9zbvfHycs5l89waym2OYqruU03dnUSkg11noYl1mlZfLOYKTlFmNlqPS90FnJlP3xpNHNnKUdmQZGB7pQerb7bYbAJ02N9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOc1vDfJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOc1vDfJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-290b48e09a7so44857175ad.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930230; x=1761535030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGks2sOnnpNLPiQkQk5TdavZHCtfoEFSojg02a8VBgI=;
        b=BOc1vDfJwcdTWnQSl8wErjdt58QEu9d4A4uuWo+Yj9/iecarzaTVNQxe/TSfIk4JX+
         Mk90NQ9WHNRtHT+JYsKxeF6YaKhH0YVOW+o/DIRRAMqwYocl8fBdbaUtSMm0tKmUVS7K
         PV9/XDO+Ac0F8UrdEzAaw5l9ZAnfgs8hkwBlsj/ifiXEAMUe/F8gS/RZdj99qbQD60S2
         bLXFFn6vKRMA59T/b5BQb9s/hTzMzxTZKNY0c1irKjiyXQ4JeN6/9bouexEh4M2+no0j
         Lp96QaVg6dgGHwHRMyF7gB0g96WVcsKyk+gZaptHfOL4TceHZ4Hg40CuqgmxcenhI7Tc
         sSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930230; x=1761535030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGks2sOnnpNLPiQkQk5TdavZHCtfoEFSojg02a8VBgI=;
        b=LQe0j5S4ZS6CdNi3oWL1XWsLryN2m6qn5SET3q2XbXTe7qbpEoiUi7HhLbvjZQGm4J
         EAEovOHUmSu+iWM/eZ+s+7dm2U0EfF0ERigZpWbw6okQpQIS/smQ08+3TTCFe89HJBJG
         uUPbOQA9YH7XC8Vl7ICMxdrncOwd0SI1UGQPVWw+FkdLBd6fFg8C1BnY152VXqPbsXsY
         mGvPrWDsjUNRYhNziouZxfu+uBnZog5mKTi0msEBwttKoezamkMdSS0Rr7owZ6+kccXA
         Hlv4prwm2icxQ0pmdWQ0C7Cnr2V75a0NE3ZGYZ2aWklNwawfaQeeTjytzpVYxJxK8h9l
         VuKw==
X-Forwarded-Encrypted: i=1; AJvYcCUwa+/CZ0/UjTpVudiCoXUKLVizBwK1qyJMoq+dJ1y+vaLUvynmtQUAqlubOQ5G7jvGvDytMTdZl4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YypDm0duNh2SvtZzrQZygRttG2heZ3Tr/mrMcRBIL/0iLm0VbBy
	BlAI+8F0k2gKanTqB48SJe+Ds4Du5Fwh+ksCxma1dhz7T0Tm93bCY23S
X-Gm-Gg: ASbGncsPNMSKAoLgV5VsModrEj9S3APirch2qSw5PE6UT4bkwT3lSrfXlmfazQlGWfq
	pXeiv+rbjHCmUptzF/BJbgrIiV+LYcFv1FhI/Co3OaODzDRfNTA5BUYg8rzHeRaRykQm0or+EUE
	p93/XIk8Sd0yRZZVcJOhdnEljRzXQ5fjzyvZVENCnlx3rmUDNLzvdZPMj4iz6bg3E+xzg0PxT01
	D9Vu+6eSa2W8hUMj22JoejzPoEWH2Zh5i/bh9PwNvG2O4Y95kaaIvWaav2u7CUchtSjXwURK48z
	DZz1OmTDRTkGFFQvilZP2KY3/HViGQB9IoxUR0rlANdjUONoHFMwnOqScqkx8e9wtSeuCxnXIuq
	B4TaHOCm+G/7fYX3dKL/sazXUuid9NPVPVtUTUNvnUOh5FzVijqSUTLOOiYe/OXow9bTLXc/OsL
	gl3cG7lDDpxgEdfr/67JWSk8k194QGhNAff6hjqvf5r/TGwQ==
X-Google-Smtp-Source: AGHT+IHgkWxUzoUUp0gWSk3OAPdv3h9UX6IroOzlUnb1eY2K5j3hSN09VNabSt60qr2F5Tmrcms9KQ==
X-Received: by 2002:a17:903:41c6:b0:25d:37fc:32df with SMTP id d9443c01a7336-290cb65c914mr164540365ad.47.1760930230150;
        Sun, 19 Oct 2025 20:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:3815:5989:6e28:9b6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fddfesm66373435ad.88.2025.10.19.20.17.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:17:09 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	david@redhat.com,
	ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
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
Subject: [PATCH v11 mm-new 05/10] mm: thp: enable THP allocation exclusively through khugepaged
Date: Mon, 20 Oct 2025 11:16:50 +0800
Message-Id: <20251020031655.1093-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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
index e105604868a5..45d13c798525 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1390,7 +1390,6 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 	ret = vmf_anon_prepare(vmf);
 	if (ret)
 		return ret;
-	khugepaged_enter_vma(vma);
 
 	if (!(vmf->flags & FAULT_FLAG_WRITE) &&
 			!mm_forbids_zeropage(vma->vm_mm) &&
diff --git a/mm/memory.c b/mm/memory.c
index 7a242cb07d56..5007f7526694 100644
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

