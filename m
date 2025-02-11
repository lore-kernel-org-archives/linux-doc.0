Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1311F2364
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 00:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739234509; cv=none; b=p62ZWXpLiA1Qro+1vj62LFfXhZHZ/ZJkPfDSd05Wf3/ZtobCAO/1yjxqCKvrU00b9YWVIeF4ecj3S8SfGQ5zOmNr20IM+xFD03nzf/2wDvqy4rKWyZkLXJB/yO7mNtEqQLJV1f0WuJEZrEguRNtDl4ufxq9MW4YuY29dBuAVNjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739234509; c=relaxed/simple;
	bh=hewNwPYJ5IwQHNTzWNv8CrtJtwvzBiKdXBLv6qX1L6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJtM9juk29W54VgdsZeMb+pwNCpqhr5I6clPvjNQqfIyIuf3qUM8Ht4ijVK5GmsWAl5s2+K6I7+G4Q0C/cRJjnH5iHcZPdj+DGboNYPu+9/wevz2pLNGGJ4LNS9fJDyIDG2Ma8E7fYseH55fUv60GbuBWZa8YrbihQA0UnuD89Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAi5EmNS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAi5EmNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739234507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lueIMS7GNplHH2FDTf2Wie6UZEYR6RkSMcK6ekbEp2Q=;
	b=NAi5EmNSVYN+T4+c3zo7fzVchc/TEISvbomcsN6lgJAQkx800H79amDoKMQ6hZouYrhGW9
	d9KHX/AyfKAiofS0ME17x6VxgMpVKfxE3KVVFOfIpCLcOiVB/gZrf/VoX/PEwlRPv6qON5
	nAgLZhUKlrgrK+qqsoZeB9AZSy2j8Ks=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-321-Q5HLC00ENK-uAZBuWss8Hg-1; Mon,
 10 Feb 2025 19:41:44 -0500
X-MC-Unique: Q5HLC00ENK-uAZBuWss8Hg-1
X-Mimecast-MFC-AGG-ID: Q5HLC00ENK-uAZBuWss8Hg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 229591800877;
	Tue, 11 Feb 2025 00:41:40 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.129])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 108571800873;
	Tue, 11 Feb 2025 00:41:29 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	catalin.marinas@arm.com,
	cl@gentwo.org,
	vbabka@suse.cz,
	mhocko@suse.com,
	apopple@nvidia.com,
	dave.hansen@linux.intel.com,
	will@kernel.org,
	baohua@kernel.org,
	jack@suse.cz,
	srivatsa@csail.mit.edu,
	haowenchao22@gmail.com,
	hughd@google.com,
	aneesh.kumar@kernel.org,
	yang@os.amperecomputing.com,
	peterx@redhat.com,
	ioworker0@gmail.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	jglisse@google.com,
	surenb@google.com,
	vishal.moola@gmail.com,
	zokeefe@google.com,
	zhengqi.arch@bytedance.com,
	jhubbard@nvidia.com,
	21cnbao@gmail.com,
	willy@infradead.org,
	kirill.shutemov@linux.intel.com,
	david@redhat.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
	sunnanyong@huawei.com,
	usamaarif642@gmail.com,
	audra@redhat.com,
	akpm@linux-foundation.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	tiwai@suse.de,
	baolin.wang@linux.alibaba.com,
	corbet@lwn.net,
	shuah@kernel.org
Subject: [RFC v2 1/5] mm: defer THP insertion to khugepaged
Date: Mon, 10 Feb 2025 17:40:50 -0700
Message-ID: <20250211004054.222931-2-npache@redhat.com>
In-Reply-To: <20250211004054.222931-1-npache@redhat.com>
References: <20250211004054.222931-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

setting /transparent_hugepages/enabled=always allows applications
to benefit from THPs without having to madvise. However, the pf handler
takes very few considerations to decide weather or not to actually use a
THP. This can lead to a lot of wasted memory. khugepaged only operates
on memory that was either allocated with enabled=always or MADV_HUGEPAGE.

Introduce the ability to set enabled=defer, which will prevent THPs from
being allocated by the page fault handler unless madvise is set,
leaving it up to khugepaged to decide which allocations will collapse to a
THP. This should allow applications to benefits from THPs, while curbing
some of the memory waste.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 include/linux/huge_mm.h | 15 +++++++++++++--
 mm/huge_memory.c        | 31 +++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 93e509b6c00e..fb381ca720ea 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -44,6 +44,7 @@ enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
 	TRANSPARENT_HUGEPAGE_FLAG,
 	TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
+	TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG,
 	TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG,
@@ -177,6 +178,7 @@ static inline bool hugepage_global_enabled(void)
 {
 	return transparent_hugepage_flags &
 			((1<<TRANSPARENT_HUGEPAGE_FLAG) |
+			(1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG) |
 			(1<<TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG));
 }
 
@@ -186,6 +188,12 @@ static inline bool hugepage_global_always(void)
 			(1<<TRANSPARENT_HUGEPAGE_FLAG);
 }
 
+static inline bool hugepage_global_defer(void)
+{
+	return transparent_hugepage_flags &
+			(1<<TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG);
+}
+
 static inline int highest_order(unsigned long orders)
 {
 	return fls_long(orders) - 1;
@@ -282,13 +290,16 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
 				       unsigned long tva_flags,
 				       unsigned long orders)
 {
+	if ((tva_flags & TVA_IN_PF) && hugepage_global_defer() &&
+			!(vm_flags & VM_HUGEPAGE))
+		return 0;
+
 	/* Optimization to check if required orders are enabled early. */
 	if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
 		unsigned long mask = READ_ONCE(huge_anon_orders_always);
-
 		if (vm_flags & VM_HUGEPAGE)
 			mask |= READ_ONCE(huge_anon_orders_madvise);
-		if (hugepage_global_always() ||
+		if (hugepage_global_always() || hugepage_global_defer() ||
 		    ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
 			mask |= READ_ONCE(huge_anon_orders_inherit);
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3d3ebdc002d5..a5e66a12bae8 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -297,12 +297,15 @@ static ssize_t enabled_show(struct kobject *kobj,
 	const char *output;
 
 	if (test_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags))
-		output = "[always] madvise never";
+		output = "[always] madvise defer never";
 	else if (test_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags))
-		output = "always [madvise] never";
+		output = "always [madvise] defer never";
+	else if (test_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags))
+		output = "always madvise [defer] never";
 	else
-		output = "always madvise [never]";
+		output = "always madvise defer [never]";
 
 	return sysfs_emit(buf, "%s\n", output);
 }
@@ -315,13 +318,20 @@ static ssize_t enabled_store(struct kobject *kobj,
 
 	if (sysfs_streq(buf, "always")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+	} else if (sysfs_streq(buf, "defer")) {
+		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 	} else if (sysfs_streq(buf, "madvise")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
 	} else if (sysfs_streq(buf, "never")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG, &transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG, &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG, &transparent_hugepage_flags);
 	} else
 		ret = -EINVAL;
 
@@ -943,18 +953,31 @@ static int __init setup_transparent_hugepage(char *str)
 			&transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		ret = 1;
+	} else if (!strcmp(str, "defer")) {
+		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
+			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
+			  &transparent_hugepage_flags);
+		set_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 	} else if (!strcmp(str, "madvise")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		set_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
-			&transparent_hugepage_flags);
+			  &transparent_hugepage_flags);
 		ret = 1;
 	} else if (!strcmp(str, "never")) {
 		clear_bit(TRANSPARENT_HUGEPAGE_FLAG,
 			  &transparent_hugepage_flags);
 		clear_bit(TRANSPARENT_HUGEPAGE_REQ_MADV_FLAG,
 			  &transparent_hugepage_flags);
+		clear_bit(TRANSPARENT_HUGEPAGE_DEFER_PF_INST_FLAG,
+			  &transparent_hugepage_flags);
 		ret = 1;
 	}
 out:
-- 
2.48.1

