Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D34653
	for <linux-doc@vger.kernel.org>; Mon, 29 Jul 2024 22:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722292076; cv=none; b=dDj+CxD3t/CJJa9p0aftDHjlzQvz/SFYmATLPjhJ9aEu7M+9wCkQ4baRgZoVr6Vh0IXFtf92tGGdLKhR5eLqB7SGh4K+dog/iZER/NReC21wiqK7IDSTFMkj82pMY1lL1AyhQhHM0+2PH0TZry9twDjubEeSQRO0A2xgisd/ABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722292076; c=relaxed/simple;
	bh=Yky6F6abRRMH6s0qc/9JMpO904nZIC2LqFFy/OTjHVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tVwohY4CL6ZZbbMDqtdVoE1YuFZv/b6dM6bM/HdaaN9hcg62Dht1BZrySsYyq6acVHeFRTvGVmgQQB8MIkZp7hqymMmJKv1eTZ9lx3OsTYJGvBhIecJ8Ek7M5eG5QlAdABpHqLy9Hp8KBtXMNvLENXoL26Dtw9WTrj8VDyUK9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewa3I5cU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewa3I5cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722292073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4Q5RykvPxYoFpCQpWDRHF5h7ZQ9BlxcuCpJcIY9nYUE=;
	b=ewa3I5cUqnHiPDIa1drF8RV+hlLhn/eF7zOrKZMF//c2obPrx4dIyL6lcdRB3KeeXYpaki
	TOBeCKVWmDNzJred2kvvXvkSiaaJLBfxJLwJkj2FiwBx5pwOjJVkAaA/wMbIGx11vvk569
	deCRcMoBxRj6WvkAAwiZGc1fdYyx2xA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-uTyRrDj5N6GtKax1PpQkQw-1; Mon,
 29 Jul 2024 18:27:50 -0400
X-MC-Unique: uTyRrDj5N6GtKax1PpQkQw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 234F81956095;
	Mon, 29 Jul 2024 22:27:48 +0000 (UTC)
Received: from h1.redhat.com (unknown [10.22.10.55])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D6DEE1955F40;
	Mon, 29 Jul 2024 22:27:43 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lance Yang <ioworker0@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Rafael Aquini <aquini@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [RFC 0/2] mm: introduce THP deferred setting
Date: Mon, 29 Jul 2024 16:27:25 -0600
Message-ID: <20240729222727.64319-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

We've seen cases were customers switching from RHEL7 to RHEL8 see a
significant increase in the memory footprint for the same workloads.

Through our investigations we found that a large contributing factor to
the increase in RSS was an increase in THP usage.

For workloads like MySQL, or when using allocators like jemalloc, it is
often recommended to set /transparent_hugepages/enabled=never. This is
in part due to performance degradations and increased memory waste.

This series introduces enabled=defer, this setting acts as a middle
ground between always and madvise. If the mapping is MADV_HUGEPAGE, the
page fault handler will act normally, making a hugepage if possible. If
the allocation is not MADV_HUGEPAGE, then the page fault handler will
default to the base size allocation. The caveat is that khugepaged can
still operate on pages thats not MADV_HUGEPAGE.

This allows for two things... one, applications specifically designed to
use hugepages will get them, and two, applications that don't use
hugepages can still benefit from them without aggressively inserting
THPs at every possible chance. This curbs the memory waste, and defers
the use of hugepages to khugepaged. Khugepaged can then scan the memory
for eligible collapsing.

Admins may want to lower max_ptes_none, if not, khugepaged may 
aggressively collapse single allocations into hugepages.

RFC note
==========
Im not sure if im missing anything related to the mTHP
changes. I think now that we have hugepage_pmd_enabled in
commit 00f58104202c ("mm: fix khugepaged activation policy") everything
should work as expected.

Nico Pache (2):
  mm: defer THP insertion to khugepaged
  mm: document transparent_hugepage=defer usage

 Documentation/admin-guide/mm/transhuge.rst | 18 ++++++++++---
 include/linux/huge_mm.h                    | 15 +++++++++--
 mm/huge_memory.c                           | 31 +++++++++++++++++++---
 3 files changed, 55 insertions(+), 9 deletions(-)

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <baohua@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lance Yang <ioworker0@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Rafael Aquini <aquini@redhat.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
-- 
2.45.2

