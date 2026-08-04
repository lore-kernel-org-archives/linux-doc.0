Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C8E486654
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 19:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871534; cv=none; b=Yv1UrTmF9WeYkcwIYy42sRKKQLkotRjkZsFGT11zmlctvNBT0IybkbYuOp17oo5WQBm9+IjSmOYJFpX1YmHs/50YayM0Qt2xBuXthnxiQf/nOi88/xBTCo2u2HvKME3B0FmrGTONxfVKqi2x1wHOj+9e7EbXSyt6YU6btqpZzlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871534; c=relaxed/simple;
	bh=//foxHH/2PjR6L5nJj8cK35FU0GLrVPpN7iBqJ+oFjo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oPJ8YnKHL4sbl3pPEvdNbFQBEI3PTXQ4VWlNSzyZ08nRrSpCmfOx7OT7FbIzpQleHHPlUxnoMz7okNY1FVXfotlkILg8iTEmycO86mczl228w7Kn8zsdg0V7qoXxX7i3kg8wcIiQH7LyqCUd3FSb76w5xL5kDADhh34cDHKZgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=n/+W1jeS; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="n/+W1jeS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785871520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XNHgMmLcA6KLROW2cwwRYhGascVVpa2hXvMzLiBjt7Q=;
	b=n/+W1jeSVVxgrZJHSKLo8tW9t36GT/aD1idhxc1YJwHgw/DWhjcFdoTsZo5KOTRTDB0HKN
	72vzNeTtpE9cHGj1hAwmTdIQlS/ij4TlC/GYsmf4IcL4lMltnJjmQVdDUE+9b28GJD/6EP
	JNoPduMCBLMIwKjxTVdPCrvQYJHKPuE=
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Subject: [PATCH v3 0/7] mm/khugepaged: several cleanups
Date: Tue, 04 Aug 2026 13:24:58 -0600
Message-Id: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWwqDMBSE4a3IeW4gNdZetiIiSZzG04KGJIog7
 t3YPn4M828UERiRXsVGAQtHnsYMdSnIDnp0ENxnUynLWj5kJb7D7OC1Q9/5hC7grW2agrjB3Gt
 cK/NUmvLb54XXX7lp/46z+cCmM0f7fgD/TRuoewAAAA==
X-Change-ID: 20260804-khugepaged_pte_refactor-5eb76e14b93a
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Migadu-Flow: FLOW_OUT

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

The remaining 2 patches were review points during my mTHP series that we
agreed can be deferred to a later series.

Thank you to those whos reviews and work I leveraged to achieve these
cleanups.

V3 Changes:
 - Add Acks/RB tags
 - rename collapse_is_referenced() to pte_is_referenced()
 - fix count_collapse_event() call-site indentation to match kernel style
 - fold in the follow-up fix so collapse_scan_pmd() always assigns the
   local folio from collapse_check_pte()
 - normalize khugepaged comment references to use parentheses

V2 Changes:
 - Add Acks/RB tags
 - rename collapse_is_young() to collapse_is_referenced()
 - delete unncessary comment for collapse_control_init_scan()
 - merge fixup from V1 (fixes stale folio reference) into patch 5
 - keep original ordering for checks in patch 5
 - merge patch 7 into patch 4
 - conflict resolution from uffd_rwp changes

V2: https://lore.kernel.org/all/20260715025941.1571316-1-npache@redhat.com/
V1: https://lore.kernel.org/all/20260706154500.39178-1-npache@redhat.com/

[1] - https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/
[2] - https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux.dev/

Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
Nico Pache (Red Hat) (7):
      mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
      mm/khugepaged: extract young page check into pte_is_referenced() helper
      mm/khugepaged: introduce a count_collapse_event() helper
      mm/khugepaged: fix outdated comments
      mm/khugepaged: Refactor the PTE state checks into a helper
      mm/khugepaged: unmap pte before releasing vma write lock
      mm: Documentation: clarify where the mTHP stats live

 Documentation/admin-guide/mm/transhuge.rst |   6 +-
 mm/khugepaged.c                            | 417 +++++++++++++++--------------
 2 files changed, 223 insertions(+), 200 deletions(-)
---
base-commit: 486855239e38a91d3eae26618ccb7845c1764625
change-id: 20260804-khugepaged_pte_refactor-5eb76e14b93a

Best regards,
--  
Nico Pache (Red Hat) <nico.pache@linux.dev>

