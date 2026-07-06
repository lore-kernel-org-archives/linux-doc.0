Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D715F3264EF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352663; cv=none; b=QPHUrryUYPnngFbHIJ0v8wjdYxt8lpEb3jhb750ySS7Pqs1yJsgdwkHak6Yo2VMa4QVnUMkQ5r95A5gCQlKHogBkjxlRpIwhooWbDwAsKTvhOrdphL9/TgAJZJZSYQ15JnVoQtEsSmtgPoOB7MKEBz9+F2F5y/fmpBeuCRbmg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352663; c=relaxed/simple;
	bh=HO9NA1pG3XqTXsc3NlfpO6Vfjq4AZnoUXTf8RHqgZ2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bFcGZzCJ7T8jeF7gNvoPVMCBHm/kz5vgX3R0kzOuUit+Ep/qm6/bcPkG0lLiHPRLDYoIdIJw0IVUyGeqpOwJXT08kl2EiQEWBWurymtOYXALpuZd7OX+fu3wcd6axWJ63EgTRdyo6siHsEnTFg4tSBm39zq7abUr3ExJVrAiHCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hu7PZaVD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hu7PZaVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3gTJIa0gE7A3vgzzgGCw1m6fPp1oaPfkLUEvDWQZVdM=;
	b=hu7PZaVDsw9VvuBvKtXpLPr4/Dr+669gtduvt26MHiLeV9zuuIhkEXbPoHbu9xrQMRhEsd
	0Q6LKqEzYWSOyvLwEurWkCSH1FmipzoEFAmQc4kMMSUolUUsLYLqBuBHDT4j++W0sqqPrK
	XwavqAGv4oeyWda2wX4xLvnt1MBZQcA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-ruGJw-zKP4GvEj00QaJ1EQ-1; Mon,
 06 Jul 2026 11:44:16 -0400
X-MC-Unique: ruGJw-zKP4GvEj00QaJ1EQ-1
X-Mimecast-MFC-AGG-ID: ruGJw-zKP4GvEj00QaJ1EQ_1783352648
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E8411800868;
	Mon,  6 Jul 2026 15:44:07 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2EDFF195604C;
	Mon,  6 Jul 2026 15:43:56 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
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
Subject: [PATCH 0/8] mm/khugepaged: several cleanups
Date: Mon,  6 Jul 2026 09:44:47 -0600
Message-ID: <20260706154500.39178-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The following changes stem from a number of reviews during my khugepaged
mTHP support series [1]. Some of these are minor code cleanups, issues or
reviews that we decided to deferred to a followup series, or in the case
of the more major patch of the series, changes [2] Lance Yang attempted
while my series was in-flight and we decided to wait till later to try.

The first 3 patches introduce helper functions to increase code reuse and
readability. This includes a per-scan state clearing function, extracting
the young page check into a helper, and a count_collapse_event() function
to reduce a repetative pattern used across mTHP collapse.

The 4th patch was the byproduct of me throwing Claude at all the
comments in khugepaged verifying and looking for any outdated info.

The 5th patch is based on Lance Yang's commit series [2] trying to extract
the PTE state checking into a helper function. This required a bit of
rewriting due to differences after mTHP collapse was introduced. I also
took into account the changes requested during his patches review cycle.

The remaining 3 patches were review points during my mTHP series that we
agreed can be deferred to a later series.

Thank you to those whos reviews and work I leveraged to achieve these
cleanups.

[1] - https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/
[2] - https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux.dev/

Nico Pache (8):
  mm/khugepaged: refactor per-scan state clearing into
    collapse_control_init_scan()
  mm/khugepaged: extract young page check into collapse_is_young()
    helper
  mm/khugepaged: introduce a count_collapse_event() helper
  mm/khugepaged: fix outdated comments
  mm/khugepaged: Refactor the PTE state checks into a helper
  mm/khugepaged: unmap pte before releasing vma write lock
  mm/khugepaged: clarify a comment regarding max_ptes_none check
  mm: Documentation: clarify where the mTHP stats live

 Documentation/admin-guide/mm/transhuge.rst |   6 +-
 mm/khugepaged.c                            | 400 +++++++++++----------
 2 files changed, 216 insertions(+), 190 deletions(-)


base-commit: d148260a31fddf6d59cc0ea4980bd78ebe301a91
-- 
2.54.0

