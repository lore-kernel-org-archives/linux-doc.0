Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4E2931D3
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084480; cv=none; b=pTnOSDOCw6SErDPvn5sVLMcE6h/JLPiHoVRe8YwixLEerP4fCP/n/6QiWMrZnJ5YMVXZruRocVaxFSBsq5g5wc1wO6+ffBQy2RT1v5FgVzBB/lXAtMj3maDLPnA5y3u5sz+HqM41LKr+Z/V5Ox+6+fSWBh38jeOpgoqk8w/rg0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084480; c=relaxed/simple;
	bh=4luQiXsCuwsclFGFRc3xlBCF+QI7Qfyz35QdJyJm34U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZi5cZkkEZP5ZXXcG/TEe5Ny64uSr0hBSRfRgdohANoTND/Qka2DO2hSjaqJW215lm2POOsQyxtAmbgak3DISLtb80cMdGXOyvMjCvjtvovV/nMGJ2j2rlo7Z9Pm3JpgColQ/RP8CpCXDawmuxrM+JU6a6vDw0+5nh0Nb1Nx2dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKSnK/cz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKSnK/cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkmNJj3p+KyDaYOMlbC6g4u6+fH9bsqVff+cIbv9v0Q=;
	b=YKSnK/czKq3mCscgUt7qrNNF/xNf5prhMlhR+6OjMbCTEM1ZGT6zdICYHj+JK/gcegerbR
	h1UjZX8+cN2eURLddXanBciEpXEf+uCdCK3V9qybyN+TQVTdWU1CytGDyKrzEI5si8Jo5X
	BS6DULXE8GdX7OqFk2MwydqkKVfseJM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-Bshq_oCoPjeSmfnmViBaSw-1; Tue,
 14 Jul 2026 23:01:12 -0400
X-MC-Unique: Bshq_oCoPjeSmfnmViBaSw-1
X-Mimecast-MFC-AGG-ID: Bshq_oCoPjeSmfnmViBaSw_1784084469
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B6BC195606B;
	Wed, 15 Jul 2026 03:01:09 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96D481800677;
	Wed, 15 Jul 2026 03:01:01 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 6/7] mm/khugepaged: unmap pte before releasing vma write lock
Date: Tue, 14 Jul 2026 20:59:35 -0600
Message-ID: <20260715025941.1571316-7-npache@redhat.com>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

We are currently dropping the anon_vma write lock before unmapping the
PTE. Although this is safe, due to us still holding the mmap_write_lock,
its safer and less confusing to switch the order of these two operations.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 655dbc90535a..40125dcb4de9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1546,10 +1546,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 
 	result = SCAN_SUCCEED;
 out_up_write:
-	if (anon_vma_locked)
-		anon_vma_unlock_write(vma->anon_vma);
 	if (pte)
 		pte_unmap(pte);
+	if (anon_vma_locked)
+		anon_vma_unlock_write(vma->anon_vma);
 	mmap_write_unlock(mm);
 out_nolock:
 	if (folio)
-- 
2.54.0

