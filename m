Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9A3939CE
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352726; cv=none; b=EmksEGERRKedrzxEeTO7E3CNK1aSoG+im/msvrZKGnkCEmMKADQPjeTeBHIHZIT7zSsXGGgjo5VCbXtGl3BwgoyWgks10LQE2dapxp5r2da5yNZ/SbS5UydHYGbSNNgyz39djlkM2nQcvhIJsiZ33Oo+MMbxhcWvNvhFAE29/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352726; c=relaxed/simple;
	bh=NQElXtVisEMuw0z8xItQitjo+xHXqsUNjq2Ae/SiiI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdWzPLWHV4syC7AfUl92sCqXMvdKEDLwrgiw/rx265BTiNEOt2LIIY0WVg8XoDKZW+TlVslwHbHLP40pwDFv8xMMACBvLYK9l3LXvB8YTD/6vBmwt5FCyqIeyNllhKr2r4oCLTlAGx0ZJPM64YiQzcB3kv8D1szgLwTFC6hrCpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C18IGEyD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C18IGEyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=84lc5B0NBz+7Y8WKAyou2vvafhNe1K13yiHHAsSIXuM=;
	b=C18IGEyDgl/6h9OZmtN6MneEmk+9HbOLVGaJXj5ShDftt9yLO/3s6ebur7C34ljh0yJVO3
	DI+pO+Mf7KHPV+bU5md1B91dkY1hLLj5dYxVm/1o/BdLODIBmM+cK1yboVGML8duxRaO3O
	fsXlTxpVKqjiJTOfCUbYHEMVyJQodVQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-530-zMc_VIbXM2uh8MIKARxtqQ-1; Mon,
 06 Jul 2026 11:45:16 -0400
X-MC-Unique: zMc_VIbXM2uh8MIKARxtqQ-1
X-Mimecast-MFC-AGG-ID: zMc_VIbXM2uh8MIKARxtqQ_1783352714
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E978718052D3;
	Mon,  6 Jul 2026 15:45:13 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 31B6D195604B;
	Mon,  6 Jul 2026 15:45:06 +0000 (UTC)
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
Subject: [PATCH 7/8] mm/khugepaged: clarify a comment regarding max_ptes_none check
Date: Mon,  6 Jul 2026 09:44:54 -0600
Message-ID: <20260706154500.39178-8-npache@redhat.com>
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

While reading collapse_scan_pmd, one may be confused on where the deferred
max_ptes_none check is done. Expand on this current comment by explaining
which function the max_ptes_none check is now done.

Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 3c6f1254deca..388045a524a3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1728,7 +1728,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 
 	/*
 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
-	 * scan all pages to populate the bitmap for mTHP collapse.
+	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
+	 * is then checked again in mthp_collapse() for each attempted order.
 	 */
 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
 		ctx.max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
-- 
2.54.0

