Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28823F44EB
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491260; cv=none; b=dQSpvrQVFc0gFw7F4D1Dx0/7bsxoyxGHARQKvJzchZZAvOzuYgBfFpZJJoHWrxM5N/yJqvPJHUUZdeumDRBRUI7gg/XlUiz2ZDWdl5Y6lX2R3ARuNcbl9s4EnaKpZbAeuR/We84ZTZOv8v2ZdC7wHVyWzuWRTy1jXaUJ+VQ4HzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491260; c=relaxed/simple;
	bh=4Vxtj6FwYDKdgUHCzV6tcVCq1d2ndTFOK6DJ2kE9gNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HK94QAQBihpJTRvXj1IYBi31duYBOzSvBxtqVo5yeq3zub/PfnX4rm/V6otR1Zcqc1JFIqemBkpoNZtA1hSKS3swPcj+MzvZu1ARtvZA7nUnB7kzjdzhRNyLPcm+dxCPVF8koyiHbCpHmsN6PkXR7czdk1WEK7QRSqYA9VKLOEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dh0UU0ha; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dh0UU0ha"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782491246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HpoSa0kJHGxaMqXrlQmbJAllTdbx9FWh5USHBk9S4yk=;
	b=Dh0UU0hal5UjSh+WqmVdVTLVLJIVjLghW2MnwL9ELm8gBkUC6093mFC0ffwRliYbdEdmX9
	tyo1NNjk4AZ+NtpRhh8KEbbbHtpbbP5A5c9kkUeceOmLy6g27cMJz3XXfSn941kHpTUlEE
	Q/f5eH0Z1xLlr5d0lMZXeeT7cZqEJ5s=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	sj@kernel.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH v2] docs: pagemap: fix flags location, member name and sample code
Date: Sat, 27 Jun 2026 00:27:10 +0800
Message-ID: <20260626162710.25844-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The userland visible page flags (KPF_*) were initially moved to
include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
stable page flags"), and later moved to
include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
(Scripted) Disintegrate include/linux").  Update the doc to reflect the
current location of these flags.

The member @walk_end of struct pm_scan_arg {} was wrongly written as
"end_walk".

The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
The second one included the wrong category in the required mask -
PAGE_IS_FILE should be used instead of PAGE_IS_SWAPPED as per the
intention.

Fix them all together.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---

* From v1 [1]:
  - drop PAGE_IS_SWAPPED in .category_mask (David)
  - fix typo in commit message (David)
  - didn't collect SeongJae's R-b (as the content has changed anyway) but
    thank you for that!

[1] https://lore.kernel.org/20260625174447.24292-1-zenghui.yu@linux.dev

 Documentation/admin-guide/mm/pagemap.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index c57e61b5d8aa..20e3fe76f099 100644
--- a/Documentation/admin-guide/mm/pagemap.rst
+++ b/Documentation/admin-guide/mm/pagemap.rst
@@ -67,7 +67,7 @@ number of times a page is mapped.
  * ``/proc/kpageflags``.  This file contains a 64-bit set of flags for each
    page, indexed by PFN.
 
-   The flags are (from ``fs/proc/page.c``, above kpageflags_read):
+   The flags are (from ``include/uapi/linux/kernel-page-flags.h``):
 
     0. LOCKED
     1. ERROR
@@ -264,7 +264,7 @@ The ``struct pm_scan_arg`` is used as the argument of the IOCTL.
     provided or not.
  3. The range is specified through ``start`` and ``end``.
  4. The walk can abort before visiting the complete range such as the user buffer
-    can get full etc. The walk ending address is specified in``end_walk``.
+    can get full etc. The walk ending address is specified in ``walk_end``.
  5. The output buffer of ``struct page_region`` array and size is specified in
     ``vec`` and ``vec_len``.
  6. The optional maximum requested pages are specified in the ``max_pages``.
@@ -275,7 +275,7 @@ Find pages which have been written and WP them as well::
 
    struct pm_scan_arg arg = {
    .size = sizeof(arg),
-   .flags = PM_SCAN_CHECK_WPASYNC | PM_SCAN_CHECK_WPASYNC,
+   .flags = PM_SCAN_WP_MATCHING | PM_SCAN_CHECK_WPASYNC,
    ..
    .category_mask = PAGE_IS_WRITTEN,
    .return_mask = PAGE_IS_WRITTEN,
@@ -288,7 +288,7 @@ present or huge::
    .size = sizeof(arg),
    .flags = 0,
    ..
-   .category_mask = PAGE_IS_WRITTEN | PAGE_IS_SWAPPED,
+   .category_mask = PAGE_IS_WRITTEN | PAGE_IS_FILE,
    .category_inverted = PAGE_IS_SWAPPED,
    .category_anyof_mask = PAGE_IS_PRESENT | PAGE_IS_HUGE,
    .return_mask = PAGE_IS_WRITTEN | PAGE_IS_SWAPPED |
-- 
2.53.0

