Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC22AE66
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 06:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751436076; cv=none; b=hN3GK74c3GazS0FeRAsCZqQqdHfuqkj8+XUGZmbdhlU+5MYXmyKBzv6byF74nmEmK8ngvtVZqpT6PWEtVfxgrXOURoMa4bcU2V9VB4uDksyEuytTvVX3f9km8T+CbfILMmNKQCADD3Ca6eXJQi3r8TkDxUc43X6XaLmdaDFSYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751436076; c=relaxed/simple;
	bh=4V3VZKJ7tNnTF9gQxOHiRZHMosS+JqRZ4B6S7aZ2Xgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bfi79LDbOF/e4vdj7h3CW2ju8AHa0RaiU6/IG4OoW7PKE5c9HtfB5rV6GtV/JhuBD0NDiUOglQ7RDDJDryQZQ9xdfO3+tuWa2JeNXCMeGgZyiq2ZkMh2kCC5JmSlbJ4EGTfDZke7F260WFPyE2RTrG063A9nf0qsSzES6+YhjME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VoDgDEIM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VoDgDEIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751436073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=raAG5xPTJbhWGRq+uqBJOcAkRPs8VPHBCr9uCuWQi40=;
	b=VoDgDEIMPRR9nD9LuZRpYmzfJ/SCL6dfaWYGxMyAPVahRYDxyuDRd74b6PMx4OoyUDcqWs
	9hTB8/TlaPoKdP/l7ZcEexBTxTxjQkE+jYbtr3LVZfLQG40q6wETv5uTGnKeG/CoeD3kkh
	ITGGU2iuAaT5YvxMjD1Jh9HnlPYjXtw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-kIqpZ7gwN_eHr4aMxsfPug-1; Wed,
 02 Jul 2025 02:01:07 -0400
X-MC-Unique: kIqpZ7gwN_eHr4aMxsfPug-1
X-Mimecast-MFC-AGG-ID: kIqpZ7gwN_eHr4aMxsfPug_1751436063
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A5862195FCCB;
	Wed,  2 Jul 2025 06:01:03 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E842318003FC;
	Wed,  2 Jul 2025 06:00:48 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	willy@infradead.org,
	peterx@redhat.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	tiwai@suse.de,
	will@kernel.org,
	dave.hansen@linux.intel.com,
	jack@suse.cz,
	cl@gentwo.org,
	jglisse@google.com,
	surenb@google.com,
	zokeefe@google.com,
	hannes@cmpxchg.org,
	rientjes@google.com,
	mhocko@suse.com,
	rdunlap@infradead.org
Subject: [PATCH v8 10/15] khugepaged: allow khugepaged to check all anonymous mTHP orders
Date: Tue,  1 Jul 2025 23:57:37 -0600
Message-ID: <20250702055742.102808-11-npache@redhat.com>
In-Reply-To: <20250702055742.102808-1-npache@redhat.com>
References: <20250702055742.102808-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Baolin Wang <baolin.wang@linux.alibaba.com>

We have now allowed mTHP collapse, but thp_vma_allowable_order() still only
checks if the PMD-sized mTHP is allowed to collapse. This prevents scanning
and collapsing of 64K mTHP when only 64K mTHP is enabled. Thus, we should
modify the checks to allow all large orders of anonymous mTHP.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 50e1d7ef7e6d..b96a7327b9c0 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -491,8 +491,11 @@ void khugepaged_enter_vma(struct vm_area_struct *vma,
 {
 	if (!test_bit(MMF_VM_HUGEPAGE, &vma->vm_mm->flags) &&
 	    hugepage_pmd_enabled()) {
-		if (thp_vma_allowable_order(vma, vm_flags, TVA_ENFORCE_SYSFS,
-					    PMD_ORDER))
+		unsigned long orders = vma_is_anonymous(vma) ?
+					THP_ORDERS_ALL_ANON : BIT(PMD_ORDER);
+
+		if (thp_vma_allowable_orders(vma, vm_flags, TVA_ENFORCE_SYSFS,
+					    orders))
 			__khugepaged_enter(vma->vm_mm);
 	}
 }
@@ -2612,6 +2615,8 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 
 	vma_iter_init(&vmi, mm, khugepaged_scan.address);
 	for_each_vma(vmi, vma) {
+		unsigned long orders = vma_is_anonymous(vma) ?
+					THP_ORDERS_ALL_ANON : BIT(PMD_ORDER);
 		unsigned long hstart, hend;
 
 		cond_resched();
@@ -2619,8 +2624,8 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 			progress++;
 			break;
 		}
-		if (!thp_vma_allowable_order(vma, vma->vm_flags,
-					TVA_ENFORCE_SYSFS, PMD_ORDER)) {
+		if (!thp_vma_allowable_orders(vma, vma->vm_flags,
+			TVA_ENFORCE_SYSFS, orders)) {
 skip:
 			progress++;
 			continue;
-- 
2.49.0

