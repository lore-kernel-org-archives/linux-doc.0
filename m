Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B807242D9B
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452569; cv=none; b=Jv2kOG8pYCta+hJ7EnrfBZ33nyyMYdZNdBFusZTmWeXIJV1qTuhE7tnZkJuI3DvgmbVE8TBdoMiYKWv+LklBUMiin+joTx4qpk/61iu/4+e5PjI2YN7rCS3umDqoo5e6A/Ne9xb1qDb4bIv+tasX85b1hv55UYX/CR4+/U5phJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452569; c=relaxed/simple;
	bh=96Jiz2nBa9IR/tusnpngVA1w1zyvP3Ch2YG3Y79Of2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O5hn5c0LrlQGIhllCoREyja8HrWDkPCPweoO6KacRX2+H+znsdOU4SeIAse19cN7afR+TDPqPqmPeeukXQHoErthVo6QTYpkhLbnjfppGHmXTKtVAsPLwbcPhPHpKs8zY+cYd9zOZYZI2Zq0NKll8sqnbW+mLHUkJmjnOvlj1jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tWdTgtaD; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tWdTgtaD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786452554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UamYZUrsSttAOWNhw1TD47ovNhb9o9UffL8S0RW1mgs=;
	b=tWdTgtaDWxjpQZYm3brbZjkngTiOXjN/EMtct4m7cpMStiBiLyQUUJ97YmkjX7DaXh05mB
	bL434r206B7yXZiR51fEamNKctmfasLcCeavWOZgDJT5rXWQK/cAb810iehj35xh/6hJ/r
	hkbdeKF27sJjejXwiLl1XrZIoa5Rp7Q=
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Subject: [PATCH v4 0/7] mm/khugepaged: several cleanups
Date: Tue, 11 Aug 2026 06:48:32 -0600
Message-Id: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNWw6CMBREt0LutzWV1vr4ch+GkD6ucNUAaWmDI
 ezdggvw82TmzMwQ0BMGuBYzeEwUqO8yyF0BttVdg4xcZih5qfiZS/ZqY4ODbtDVw4i1x4e2Y+/
 ZEc1J4UGai9CQ7SEnNG3L9+rHIZon2nGdWxsthSx+tusk1t7/lyQYZ1woabVTstT89qYuTnuHC
 aplWb5Z/QuT0AAAAA==
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

Changes in v4:
 - Add Acks/RB tags
 - [patch2] rename pte_is_referenced() to folio_pte_referenced()
 - [patch2] keep cc->is_khugepaged out of the helper gate
 - [patch2] simplify/clarify the helper comment

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

V3: https://lore.kernel.org/all/20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev
V2: https://lore.kernel.org/all/20260715025941.1571316-1-npache@redhat.com/
V1: https://lore.kernel.org/all/20260706154500.39178-1-npache@redhat.com/

[1] - https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/
[2] - https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux.dev/

Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
Nico Pache (Red Hat) (7):
      mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
      mm/khugepaged: extract reference check into folio_pte_referenced() helper
      mm/khugepaged: introduce a count_collapse_event() helper
      mm/khugepaged: fix outdated comments
      mm/khugepaged: Refactor the PTE state checks into a helper
      mm/khugepaged: unmap pte before releasing vma write lock
      mm: Documentation: clarify where the mTHP stats live

 Documentation/admin-guide/mm/transhuge.rst |   6 +-
 mm/khugepaged.c                            | 414 +++++++++++++++--------------
 2 files changed, 222 insertions(+), 198 deletions(-)
---
base-commit: 005d5c898c17ecadec427819a20640e37c357997
change-id: 20260804-khugepaged_pte_refactor-5eb76e14b93a

Best regards,
--  
Nico Pache (Red Hat) <nico.pache@linux.dev>

