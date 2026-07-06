Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2D2701DC
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352715; cv=none; b=IRioOdDo4w2Sp/PJNfzkKsX+V2kReCdcPBsxN1pokMXL3ANdcLEDBO3dRvDUwkpyYm6BDZ+QOuswBG8EfdUYNaFq0CKHC4Pjsm4zQdY/JGMJQ2TqK8LHsmB5EAG5pMXCkChoPTtzwdYtbRrnoD2T9J02BN/ACSL7XhQPDg/TzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352715; c=relaxed/simple;
	bh=Wvw4KQ4xDEf8xjkcXI3OHWUJDI9OwTK73Tc4+PLrvHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUCAGxAQUMp+h9sESVChQp6q+CWhVajzLgEPe465yInB49Zh1oRR6zrjJ1yFe2fykR9z6ttXLOmqGnpfJHhx21zQcqW21AttTTy003uSNgHLU0p+d99sMbHus5teF+qzd3w7BIGePlhPKWvZrR7cMbfJAjWU+wIM35HJDBdnPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E+qdg4gD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E+qdg4gD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BezWf31aY4w6w/a+lqeQnI/w17h6Fee4KI8S5RVgbig=;
	b=E+qdg4gDeCYla3SUkegw/uQa7HsT8MZZMdRXeKyjQTlc4WQsap8sfDfdeVxYrv1MXQCGz8
	KSp4vDbtnZiNp06zXBvsta6BV3arhhpTzwpxC2bmTeNDpodLgRwSxvJjYuNsojt9QGg0Fr
	V9fiya5YgLhDHPYziCqJnAU8+OnAr7c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-6sLrIIyvOgODbJ2HxQVQoA-1; Mon,
 06 Jul 2026 11:45:08 -0400
X-MC-Unique: 6sLrIIyvOgODbJ2HxQVQoA-1
X-Mimecast-MFC-AGG-ID: 6sLrIIyvOgODbJ2HxQVQoA_1783352705
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AFBF11955DC3;
	Mon,  6 Jul 2026 15:45:05 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 67988195604B;
	Mon,  6 Jul 2026 15:44:57 +0000 (UTC)
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
Subject: [PATCH 6/8] mm/khugepaged: unmap pte before releasing vma write lock
Date: Mon,  6 Jul 2026 09:44:53 -0600
Message-ID: <20260706154500.39178-7-npache@redhat.com>
In-Reply-To: <20260706154500.39178-1-npache@redhat.com>
References: <20260706154500.39178-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

We are currently dropping the anon_vma write lock before unmapping the
PTE. Although this is safe, due to us still holding the mmap_write_lock,
its safer and less confusing to switch the order of these two operations.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index c4ea2dc1591b..3c6f1254deca 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1548,10 +1548,10 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 
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

