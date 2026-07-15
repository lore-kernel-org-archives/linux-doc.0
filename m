Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11B3242D4
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084490; cv=none; b=Bsl05lwVvFrsQsNv/XIyfrbmAUs4E0ODHfqyIHrKMGW1Hfkqt81JXaMDn1DeXWGSqwV+zglxwusuzchIR3eknom2iXt0wj98NulZzbbQ4G9SYWbNE0+/oaQ/906fUXmqTumtQOFImT/OexsCJIHwi2NJR3+Xbz4la5UL2Yd4l7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084490; c=relaxed/simple;
	bh=H1iJBFK0h4/BZcz0yT2Xb5OFnVYv8bJkTQekiV8mjmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyNBP6pL6TV2aARYrHmLChRtNhwLAvw7O5UeVloF/DOuju4XWlQBGDeYMk+lgVS9l+eDBC+fK8KKErOy5jkYNHQ8iSrxFzUcUax9La2e8M3Vt8n/XbDkV3I/Xyah0fOpkTlRKi2dBfO+pA4B08/saiagCTdJxPSYN1vYZzLKEYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8FBt4tL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8FBt4tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2S1pF402fEwqnXDZiEv0A+qeJQZJmSklciMUBTEkZ4=;
	b=E8FBt4tLMD/FZw6REvDfWnloJxhLpX64i+iPECJGcB2ZQ41IWb0p1/1KSn9vHFNM9F1KLM
	9DcTLLG2LFQ7483V+UX/030shg7nTySQ2rzRIKTUyXqgawHUiIHYYxJfhQxGhf8BfhupGL
	zv5fmULRqbW8Hen2xerp1qxfy7ePvwo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-DaWvWqfgNIqxwO1J7L8avA-1; Tue,
 14 Jul 2026 23:00:17 -0400
X-MC-Unique: DaWvWqfgNIqxwO1J7L8avA-1
X-Mimecast-MFC-AGG-ID: DaWvWqfgNIqxwO1J7L8avA_1784084414
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D8BC1956052;
	Wed, 15 Jul 2026 03:00:12 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ED26818005B7;
	Wed, 15 Jul 2026 03:00:00 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 1/7] mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
Date: Tue, 14 Jul 2026 20:59:30 -0600
Message-ID: <20260715025941.1571316-2-npache@redhat.com>
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

Extract the repeated clearing of node_load, alloc_nmask, and
mthp_present_ptes into a helper to reduce duplication in
collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
current use the bitmap, they will in the future, and clearing it now is
harmless.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 55157567dc4c..6ec0812210b6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -629,6 +629,13 @@ void __khugepaged_exit(struct mm_struct *mm)
 	}
 }
 
+static void collapse_control_init_scan(struct collapse_control *cc)
+{
+	memset(cc->node_load, 0, sizeof(cc->node_load));
+	nodes_clear(cc->alloc_nmask);
+	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
+}
+
 static void release_pte_folio(struct folio *folio)
 {
 	node_stat_mod_folio(folio,
@@ -1617,9 +1624,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		goto out;
 	}
 
-	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
-	memset(cc->node_load, 0, sizeof(cc->node_load));
-	nodes_clear(cc->alloc_nmask);
+	collapse_control_init_scan(cc);
 
 	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
 
@@ -2691,8 +2696,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 
 	present = 0;
 	swap = 0;
-	memset(cc->node_load, 0, sizeof(cc->node_load));
-	nodes_clear(cc->alloc_nmask);
+	collapse_control_init_scan(cc);
 	rcu_read_lock();
 	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
 		if (xas_retry(&xas, folio))
-- 
2.54.0

