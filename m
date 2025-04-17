Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB071CAA4
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848480; cv=none; b=G4MvdBlYryzP3aiIRmhP++Bnl0fjlrhsd2NCvz4VzTRHonnaxcRvZyd95mG6wWprogqzaFqn4fn1EtqQMIO7MouRZffjHLy+/SkWwZ8CpE+aYFJ03F5HUbmU/UHHwiKwyKlYqyAVZnjbRKFnZzxQh4AHJ8nihCjwA/zd6AiesdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848480; c=relaxed/simple;
	bh=J7cpEhGN+eEa1w3M0W/clk1j5yrNbvcE3ifGcRRwmJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blfNnMUOHPSCin+ijM9fxGqRN4mz6g/zD14QkX7Gr1SGmvXp5xNnhDPx2AP3q8ZBGD+Wf+n5h8joIJPIa76ILFNToqmRRa6uatbskAl9xVcuEi0031pN4KNnsRU8CuQlLHnCRRKeEXM6My+Sek55ksi0MSx2RrifcvmpDoIcqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mhrm5Bf8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mhrm5Bf8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744848478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwgfUM8JwJbA0iQF0LdD8dJp+2ea27Yg2QmSTdEXXUw=;
	b=Mhrm5Bf8pMRnqGt3FHsjbxm18EBMWKAGK+9Eo0L4yIn/YzUNj40nolE2AztG2ysazeKILy
	6b9y4ziNl90q0SMG5lZSWsv/rz27r5dfmkMM5D//BMOhm/bY46PVBhm/7QbB8rOkJYHsVF
	ob3BfA62JLkhtKMwURnlmld8dGHhH48=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-9yDmiuLHPCmnKNQ90mv0mg-1; Wed,
 16 Apr 2025 20:07:53 -0400
X-MC-Unique: 9yDmiuLHPCmnKNQ90mv0mg-1
X-Mimecast-MFC-AGG-ID: 9yDmiuLHPCmnKNQ90mv0mg_1744848469
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 947F61956048;
	Thu, 17 Apr 2025 00:07:49 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.88.34])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B8FC1800352;
	Thu, 17 Apr 2025 00:07:39 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	david@redhat.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	willy@infradead.org,
	peterx@redhat.com,
	ziy@nvidia.com,
	wangkefeng.wang@huawei.com,
	usamaarif642@gmail.com,
	sunnanyong@huawei.com,
	vishal.moola@gmail.com,
	thomas.hellstrom@linux.intel.com,
	yang@os.amperecomputing.com,
	kirill.shutemov@linux.intel.com,
	aarcange@redhat.com,
	raquini@redhat.com,
	dev.jain@arm.com,
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
Subject: [PATCH v4 12/12] Documentation: mm: update the admin guide for mTHP collapse
Date: Wed, 16 Apr 2025 18:02:38 -0600
Message-ID: <20250417000238.74567-13-npache@redhat.com>
In-Reply-To: <20250417000238.74567-1-npache@redhat.com>
References: <20250417000238.74567-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Now that we can collapse to mTHPs lets update the admin guide to
reflect these changes and provide proper guidence on how to utilize it.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index dff8d5985f0f..06814e05e1d5 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -63,7 +63,7 @@ often.
 THP can be enabled system wide or restricted to certain tasks or even
 memory ranges inside task's address space. Unless THP is completely
 disabled, there is ``khugepaged`` daemon that scans memory and
-collapses sequences of basic pages into PMD-sized huge pages.
+collapses sequences of basic pages into huge pages.
 
 The THP behaviour is controlled via :ref:`sysfs <thp_sysfs>`
 interface and using madvise(2) and prctl(2) system calls.
@@ -144,6 +144,14 @@ hugepage sizes have enabled="never". If enabling multiple hugepage
 sizes, the kernel will select the most appropriate enabled size for a
 given allocation.
 
+khugepaged uses max_ptes_none scaled to the order of the enabled mTHP size to
+determine collapses. When using mTHPs it's recommended to set max_ptes_none
+low-- ideally less than HPAGE_PMD_NR / 2 (255 on 4k page size). This will
+prevent undesired "creep" behavior that leads to continuously collapsing to a
+larger mTHP size. max_ptes_shared and max_ptes_swap have no effect when
+collapsing to a mTHP, and mTHP collapse will fail on shared or swapped out
+pages.
+
 It's also possible to limit defrag efforts in the VM to generate
 anonymous hugepages in case they're not immediately free to madvise
 regions or to never try to defrag memory and simply fallback to regular
-- 
2.48.1

