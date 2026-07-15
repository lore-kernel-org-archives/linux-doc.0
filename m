Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1E2DCF4C
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084411; cv=none; b=I437ywvhmfNw2MoWhiysNGvEY+FKqRMlQkSy2yG0orM8rJIJNG/BrKOcMrM8j0zpBx3zKGD44IP5IvUS59FkTcceOs9s6Q7BPfIBlisDcbOTULgriBJBgeijMCeXqqgJ2fs4sPImidMKgcQej7EnXbor3vwmYCNojtTkHVmntjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084411; c=relaxed/simple;
	bh=Hzk/ZU1vWUyy5aOXuHKbZgHWOg1dNw6qdk7PKy3gP30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qPnMvUcPj0T90mb29j2SvBgGL44j4sllKNeKU7kPj6pD0xyNCuar2u9p0Ky2fWMgPvah0Qko9QSCyNTeVInm5WTV96B9u3cmaF8hnYNgGv3zoNLPK2/bzFYS/vrvgj0rYP8ugLCVTB+yBo20WiabZlbWx8Y9FHbs4FwnH+QJkdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BeGXwmmc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BeGXwmmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xm5WBsv9zplLnVKOn6KyW6wbP0F9XLs9d5K3XcjD3NQ=;
	b=BeGXwmmcGhBQvzgMRfn0zgwJyUyPwWqrMWJ48ts4lvgKSP/QRW50uAv4PH2fBjAzBIRlqW
	dVJ7hZfPeG7TF0UFTH1eewkD/W82EzNExDm+1pHsnmqfoTiA+XY/kOa3XR6DGW22gessWK
	v+Rp44yTo8mzvAUvNdvFilPmUN3IaxY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-eE6C1Xc-M6iPLWuGZ7uBig-1; Tue,
 14 Jul 2026 23:00:04 -0400
X-MC-Unique: eE6C1Xc-M6iPLWuGZ7uBig-1
X-Mimecast-MFC-AGG-ID: eE6C1Xc-M6iPLWuGZ7uBig_1784084401
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 16F561800D9A;
	Wed, 15 Jul 2026 03:00:00 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A15B0180028B;
	Wed, 15 Jul 2026 02:59:46 +0000 (UTC)
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
Subject: [PATCH v2 0/7] mm/khugepaged: several cleanups
Date: Tue, 14 Jul 2026 20:59:29 -0600
Message-ID: <20260715025941.1571316-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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

V2 Changes:
 - Add Acks/RB tags
 - rename collapse_is_young() to collapse_is_referenced()
 - delete unncessary comment for collapse_control_init_scan()
 - merge fixup from V1 (fixes stale folio reference) into patch 5
 - keep original ordering for checks in patch 5
 - merge patch 7 into patch 4
 - conflict resolution from uffd_rwp changes 

V1: https://lore.kernel.org/all/20260706154500.39178-1-npache@redhat.com/

[1] - https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/
[2] - https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux.dev/

Nico Pache (7):
  mm/khugepaged: refactor per-scan state clearing into
    collapse_control_init_scan()
  mm/khugepaged: extract young page check into collapse_is_referenced()
    helper
  mm/khugepaged: introduce a count_collapse_event() helper
  mm/khugepaged: fix outdated comments
  mm/khugepaged: Refactor the PTE state checks into a helper
  mm/khugepaged: unmap pte before releasing vma write lock
  mm: Documentation: clarify where the mTHP stats live

 Documentation/admin-guide/mm/transhuge.rst |   6 +-
 mm/khugepaged.c                            | 399 +++++++++++----------
 2 files changed, 214 insertions(+), 191 deletions(-)


base-commit: bdc38bfc1262e3d1432afadd2aa2ffd83d139dbb
-- 
2.54.0

