Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334931DE4EB
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151900; cv=none; b=o7ZTcPD9jCNeA2uoRnFWr8LHb+CfdkHWi7LN1fCOnG3x7gQUPybIQLCp6/+nSGi6zeOPSrZJzmUduPk1dBsU4qhOXjfUbUp2dl21hZffbsTFxoafzApCAienX2fE3AxMR/fAArypTReHvobdDNjzIDK+Gq/rvYNYU2t4PLe4IVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151900; c=relaxed/simple;
	bh=sOFTxxiTEpmnz84//zewC99r4PEneol5TOg9SJgosTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0z8/UXT7MRyQ0qLJk3SnUyCoZg0g0BPGW4+soUqDw6erZrF3UuwqN2rFzPucc811qG+mpMX1sU6YMMooOWOvla4jAyEFOH2LYDu+DDa+agdrLc7tKpDWhzGm2pXyMMrxrA2CSgWn7uWCEHAROO8+xeqwSSl7QpnC1j+dZHAA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g5wWcChF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g5wWcChF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
	b=g5wWcChFzVjhYwUyUY42dz1gmoP03zan1wc7zJ+S8ea92QAOUhhPHoSJseZSnzzBsksfz3
	ghksBdMbeCESoaJmT2kt1VuEX2SfOQx+fPMAyaOXCgHplnq02qOe7+IldWJhzLqjivxxb8
	Tw+5Nw3Z2QvBs2C4h65mxHTQLmfSuCQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-CSqIGE9NOMykZhL8UbLsrA-1; Wed, 29 Jan 2025 06:58:17 -0500
X-MC-Unique: CSqIGE9NOMykZhL8UbLsrA-1
X-Mimecast-MFC-AGG-ID: CSqIGE9NOMykZhL8UbLsrA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38a35a65575so4683892f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151896; x=1738756696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2/u4hMaC1Y/nn2Uh1F1xHtHTh10RqLxBEMK6rVGx5s=;
        b=fQtirb4Difm8RyIzI9N+19uzcY0L+1BTPYl2D686EntkV1W1bOuiUKkywLOeSzssat
         Ivv6Ajp1y+k7qdokrrNIpa4LrAlH8qXl/hVNwv1rJqIaPCvzUox10h4gmdyWs7HPDqlM
         bSE7qGTl5hArIbvnC+ZcPAsjDmojBw5l6al80hEKKdvnEJRCxJSH+T3O9QWkUDTSxvXj
         oR2XsZ+1667JlJd0sMickPppwprGppV9phnPYNrdmzrl4tUPAdwQ2MyqhZURt727f41J
         6V26+2gU9enLWsuf0pOXMypw0nMlwkbAcsR8ZuDiMcJXbk//RyzPbCJu/czCMRXzvrVO
         AFLQ==
X-Gm-Message-State: AOJu0YwM1f0p+tXxlcXHJ3giIUrMoARCiC4Yg8csFG1nHbS9MsMsFvNI
	VZ/cyo7FJvu/Fcgbi4d4/2V+6+9aA8KBcMrql2jkstgLzWflqc5CiNXEb1ur5w/7LCX112+7vyI
	FzjX12KM3FGIFOh0aP6+uLy3WZ+US9qeMqh4EDU1IXLnd9arW32VI3HfUfQ==
X-Gm-Gg: ASbGncvN6MDHYXnilvVprjiESif0A4xtbeC5BtWFQBNyejPWXb7cqcrC/BYWCKtewgi
	FqdUlSVcF9jLLK0qBQr96mNCmM7eGJnE28i/QQg9fuvy5CRbeb4xrBMkC8V4/8dNyQWQcEfekRa
	jaiOU7HKgiFkCdZW/XJE9Ikwr3QniTGDmSomIqXVUHRFuEcH1W/ktvUts47/pwYztkRjEXtpXth
	FmrGplND0Poaq5jeSxW12UVzVVUtkm9m43RTJy0cHGLuaTnNPhloQkYB4sgn1NspVRq7F8J58GG
	9L9SR7K6S8Yy+A4SUe8YoAQ7F2EeBaH6gnm2JpT+wp8CD0yBtWNX+jJjqkya4snj6A==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id ffacd0b85a97d-38c52096289mr2025158f8f.54.1738151895829;
        Wed, 29 Jan 2025 03:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEON5WkoaxoRH3qtkNX0vn2oqksdlJtc4nZs+NotAXeIJk4vQvUCQu3rl+CihtRV9gH+gpH8w==
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id ffacd0b85a97d-38c52096289mr2025126f8f.54.1738151895421;
        Wed, 29 Jan 2025 03:58:15 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1764e9sm17070487f8f.17.2025.01.29.03.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:58:14 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 3/4] mm/memory: pass folio and pte to restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:01 +0100
Message-ID: <20250129115803.2084769-4-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's pass the folio and the pte to restore_exclusive_pte(), so we
can avoid repeated page_folio() and ptep_get(). To do that,
pass the pte to try_restore_exclusive_pte() and use a folio in there
already.

While at it, just avoid the "swp_entry_t entry" variable in
try_restore_exclusive_pte() and add a folio-locked check to
restore_exclusive_pte().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index cd689cd8a7c8..46956994aaff 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -719,14 +719,13 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 #endif
 
 static void restore_exclusive_pte(struct vm_area_struct *vma,
-				  struct page *page, unsigned long address,
-				  pte_t *ptep)
+		struct folio *folio, struct page *page, unsigned long address,
+		pte_t *ptep, pte_t orig_pte)
 {
-	struct folio *folio = page_folio(page);
-	pte_t orig_pte;
 	pte_t pte;
 
-	orig_pte = ptep_get(ptep);
+	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
@@ -756,16 +755,15 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
  * Tries to restore an exclusive pte if the page lock can be acquired without
  * sleeping.
  */
-static int
-try_restore_exclusive_pte(pte_t *src_pte, struct vm_area_struct *vma,
-			unsigned long addr)
+static int try_restore_exclusive_pte(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, pte_t orig_pte)
 {
-	swp_entry_t entry = pte_to_swp_entry(ptep_get(src_pte));
-	struct page *page = pfn_swap_entry_to_page(entry);
+	struct page *page = pfn_swap_entry_to_page(pte_to_swp_entry(orig_pte));
+	struct folio *folio = page_folio(page);
 
-	if (trylock_page(page)) {
-		restore_exclusive_pte(vma, page, addr, src_pte);
-		unlock_page(page);
+	if (folio_trylock(folio)) {
+		restore_exclusive_pte(vma, folio, page, addr, ptep, orig_pte);
+		folio_unlock(folio);
 		return 0;
 	}
 
@@ -871,7 +869,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		 * (ie. COW) mappings.
 		 */
 		VM_BUG_ON(!is_cow_mapping(src_vma->vm_flags));
-		if (try_restore_exclusive_pte(src_pte, src_vma, addr))
+		if (try_restore_exclusive_pte(src_vma, addr, src_pte, orig_pte))
 			return -EBUSY;
 		return -ENOENT;
 	} else if (is_pte_marker_entry(entry)) {
@@ -3979,7 +3977,8 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 				&vmf->ptl);
 	if (likely(vmf->pte && pte_same(ptep_get(vmf->pte), vmf->orig_pte)))
-		restore_exclusive_pte(vma, vmf->page, vmf->address, vmf->pte);
+		restore_exclusive_pte(vma, folio, vmf->page, vmf->address,
+				      vmf->pte, vmf->orig_pte);
 
 	if (vmf->pte)
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
-- 
2.48.1

