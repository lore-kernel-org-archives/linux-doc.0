Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF963E8338
	for <linux-doc@vger.kernel.org>; Thu, 25 Jun 2026 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782409547; cv=none; b=L9wRQgPORt2RqWZDq7+aoFFvo6ddQaVc3kyysb6NIHWT6t+H6iUBOjhvU4wqsFov6P+3ByQCesvoWMjRL/GF8NjTZgt2AVGN2JmYAK5ljXGySDH0PMpbvWlHiJbgQYBT3oRQ6x3C9WWZXpnPU4p/uuaHj9rJtgy019pbts2x4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782409547; c=relaxed/simple;
	bh=pMiEZs/fHc2vjp+jVCAUSr66LcIyz/5uKo5FecVshb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5pcK9rMwUNBLEESjdjI0CKUga6QQNYubrzjOmaR35sMPyhlSCcX0ps44HmQD4uqfWpsCuFchQJN/iknqlzXOZ6ZaixSucAb2w0LsteLmLHU8es2UHCVNYiOvoxiQ/5ieeH+a7GCC6+7bKiLZUQfHz5HMp0dElpGWNPBhQqNIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pLYYOBoI; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pLYYOBoI"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782409534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MPa4NfxGFlsR/0ze8KtpPD8L+IgNM7huYMx2u1xMPgU=;
	b=pLYYOBoIfpAzpj66uxyzMUCl4zexcFVuEE8EPPEsRUbC48gpPtU5iZmzrkbZu0uKIGFWc5
	qiskz2Avy0pJ+Jek7fLQxhZlUyV0AciVXkbjCAj+ahVWn8Wlj9WQrDHgm5ctbPxFCYyGJE
	UG35hAFKXIXFQfLepY6g34sFFtBgtRQ=
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
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] docs: pagemap: fix flags location, member name and sample code
Date: Fri, 26 Jun 2026 01:44:47 +0800
Message-ID: <20260625174447.24292-1-zenghui.yu@linux.dev>
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
(Scripted) Disintegrate include/linux"). Upadte the doc to reflect the
current location of these flags.

The member @walk_end of struct pm_scan_arg {} was wrongly written as
"end_walk".

The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
The second one missed PAGE_IS_FILE in the required mask.

Fix them all together.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 Documentation/admin-guide/mm/pagemap.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/pagemap.rst b/Documentation/admin-guide/mm/pagemap.rst
index c57e61b5d8aa..12ac97d9d277 100644
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
+   .category_mask = PAGE_IS_WRITTEN | PAGE_IS_FILE | PAGE_IS_SWAPPED,
    .category_inverted = PAGE_IS_SWAPPED,
    .category_anyof_mask = PAGE_IS_PRESENT | PAGE_IS_HUGE,
    .return_mask = PAGE_IS_WRITTEN | PAGE_IS_SWAPPED |
-- 
2.53.0

