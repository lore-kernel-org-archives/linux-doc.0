Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC22308F26;
	Fri,  8 May 2026 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271724; cv=none; b=tnhRrTGT/Ybd2ou6DK7bY/QLOHEgqqiPie3rHNxESS2o7qx8naRz7Z+QpttdYjeJ5tutDCZJNrQ2qt6Q3eiaGGCLntHN/W/lhR4J7CKuNsNmAjuIRbjYvAY9pZDxBAKhOmgP6TLubwL7TcJdOKte6KSDPH2SJirkP0l3nXqmgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271724; c=relaxed/simple;
	bh=sO/poesBe+fZPMzonrnn4jkb8v/LkuUSjZXKGKF0WYM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aAfWcmjuTdZCF58AVx3oWJkdFY5hj713vcKhpC2H4qa3SzzZK1pjTz7dJqbo5tAyxlFWf3bxBUhvdkY0Z7hscflUmgrMNILbn77pTMyPNdr+Iux46NSdzSDAmw535A1QF1P8lhTv778rDkVnIrz8wZleb+kopjVtIT9zxm9Xl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mIrC3hOZ; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mIrC3hOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778271714; bh=PjGDfOb5t/z0HQUZGodd3GW8KBtkUHKvNElfu8QNbQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mIrC3hOZd363qdufDOJTXyYn0/lVwHj1WYH7Zouw45HKv9aQWiLwXTtYfar44GO4E
	 szkEk0IM1BMaLffoyD9XK+f8jIe85BkPhrPqpjsqKmxRRlK7Qm3KysXgPpzGR9Wg7l
	 Ic48BPrFUDzASl4n7C+/e6ktbYNu34uTcWP4Muj4=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 52124024; Sat, 09 May 2026 04:20:33 +0800
X-QQ-mid: xmsmtpt1778271638tjr8dbo19
Message-ID: <tencent_69E7E93D1E47766E922D48B9EA9FD1140D09@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMH8Drs51QFZOeh0A9puObyTusyC9D93b6utLw564wsyCMzyOtNf
	 kjO75MLkPkbvgBxqdy13laTpj2lboU00WC/pXpBrLBoE4JzEYTyuiUzWNgx3SZvil/V4/mrvUGRT
	 jqnc/9yJH+aB0V0NiPmFLqN0BwnkgjEdLofGZxyJ9zVJ5UDHU1VFrK/4fmqfH9W3dKCwCZutl5bg
	 3LYZPZUYDwAFyn3Ab+Hzp6Dv02pJr0dgkC7JDBjU+iZIaisXq+30kl1xTaGy2PfRHDLa2RDMGWQZ
	 Ul4QxDgnCJPVanhycI0tCuS5hExgjOl3H31OquQT2w2xrxDlj/4FGBUhO6sq1G9c3EBEakUtk6j+
	 Zi9tANtjkEJqYhCza0OzwfE0/SqQbKzRaqrY1EFci5HGCsLJK2vAU9ysanCl/BbYStMhT6MuQWYD
	 L3pEeU5BaU7/PqrBec5I0+dwRM9xpRee5vzhajJhmX2AGhndD4EiB9ru46QjOPBG5/81s/tQJnBx
	 uLVwwMT+byuyZttJkv3V2VRbjMn/dQV88530KjCcsuH0O9Dtwvcad3iJJdeZQ+CWc8cxUFVagVX6
	 0DMo/3O8Nr48i81Pn+bhT6avFi7S3plGed1o3+Wglxa+E9o1EBdTfN/dJrRZD0BG1XldQroSFGDd
	 fCn3M0cOyaL7m1g2ahtq1xVdhUE3ULlVamVxp8n0but+Ryq8uaiQr6aOev2IBYUaP1eHUkgAxN3D
	 Y7bSiK/2jMRmJTpQ0eA56g1JiXj0E97HkZfFiNoMsZ6RsDtDbkeKxA5F1sLlZRcVxfU/lnAwGCL7
	 J654qEecFSdrI532G0RoHU+q8M2sy8Yd4k6jggfT/bSC9uhQko/BblARXd+OWd7+WiaHz50tw0qD
	 j8YEGz5SM3iiDr8xrkdcgKKo3XKbH/56jMg7wc+GJmPPStZVFkEeNf4YB+d2zlX7URzIARh4nfIB
	 jZSODjYY3BicXVdtWJ7+Iw+PKp0RtKSWNlnL+6eStdHy+6BqVB6kg8CHfUsQS7STUBuDmUPWDms/
	 1A8WsshFyYrXxvSmKxk7JTSxqgu3yy5wcCJ/9z3g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: fujunjie <fujunjie1@qq.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	David Hildenbrand <david@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Baoquan He <bhe@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: [RFC PATCH 3/5] mm: zswap: load fully stored large folios
Date: Fri,  8 May 2026 20:20:31 +0000
X-OQ-MSGID: <20260508202033.1834876-3-fujunjie1@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

zswap_store() already stores every base page of a large folio as a
separate zswap entry and tears the whole folio back down on store
failure. The load side still rejects any large folio, which forces the
swapin path to avoid mTHP swapin once zswap has ever been enabled.

Use zswap_entry_batch() to distinguish three cases: the whole range is
absent from zswap and should fall through to the disk backend, the whole
range is present and can be decompressed one base page at a time, or the
range is mixed and must be treated as an invalid large-folio backend
selection.

After all entries decompress successfully, mark the folio uptodate and
dirty, account the mTHP swpin stat once for the folio, account one ZSWPIN
event per base page, and invalidate each zswap entry because the
swapcache folio becomes authoritative.

Signed-off-by: fujunjie <fujunjie1@qq.com>
---
 Documentation/admin-guide/mm/transhuge.rst |  4 +-
 mm/zswap.c                                 | 65 ++++++++++++++--------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 5fbc3d89bb07..05456906aff6 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -644,8 +644,8 @@ zswpout
 	piece without splitting.
 
 swpin
-	is incremented every time a huge page is swapped in from a non-zswap
-	swap device in one piece.
+	is incremented every time a huge page is swapped in from swap I/O or
+	zswap in one piece.
 
 swpin_fallback
 	is incremented if swapin fails to allocate or charge a huge page
diff --git a/mm/zswap.c b/mm/zswap.c
index 27c14b8edd15..863ca1e896ed 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -28,6 +28,7 @@
 #include <crypto/acompress.h>
 #include <crypto/scatterwalk.h>
 #include <linux/zswap.h>
+#include <linux/huge_mm.h>
 #include <linux/mm_types.h>
 #include <linux/page-flags.h>
 #include <linux/swapops.h>
@@ -1614,20 +1615,23 @@ bool zswap_store(struct folio *folio)
  *  NOT marked up-to-date, so that an IO error is emitted (e.g. do_swap_page()
  *  will SIGBUS).
  *
- *  -EINVAL: if the swapped out content was in zswap, but the page belongs
- *  to a large folio, which is not supported by zswap. The folio is unlocked,
- *  but NOT marked up-to-date, so that an IO error is emitted (e.g.
- *  do_swap_page() will SIGBUS).
+ *  -EINVAL: if the folio spans a mix of zswap and non-zswap entries. The
+ *  folio is unlocked, but NOT marked up-to-date, so that an IO error is
+ *  emitted (e.g. do_swap_page() will SIGBUS). Large folio swapin should
+ *  reject such ranges before calling zswap_load().
  *
- *  -ENOENT: if the swapped out content was not in zswap. The folio remains
+ *  -ENOENT: if the swapped out content was not in zswap. For a large folio,
+ *  this means the whole folio range was not in zswap. The folio remains
  *  locked on return.
  */
 int zswap_load(struct folio *folio)
 {
 	swp_entry_t swp = folio->swap;
 	pgoff_t offset = swp_offset(swp);
-	struct xarray *tree = swap_zswap_tree(swp);
 	struct zswap_entry *entry;
+	int nr_pages = folio_nr_pages(folio);
+	bool is_zswap;
+	int index;
 
 	VM_WARN_ON_ONCE(!folio_test_locked(folio));
 	VM_WARN_ON_ONCE(!folio_test_swapcache(folio));
@@ -1635,30 +1639,36 @@ int zswap_load(struct folio *folio)
 	if (zswap_never_enabled())
 		return -ENOENT;
 
-	/*
-	 * Large folios should not be swapped in while zswap is being used, as
-	 * they are not properly handled. Zswap does not properly load large
-	 * folios, and a large folio may only be partially in zswap.
-	 */
-	if (WARN_ON_ONCE(folio_test_large(folio))) {
+	if (zswap_entry_batch(swp, nr_pages, &is_zswap) != nr_pages) {
+		WARN_ON_ONCE(folio_test_large(folio));
 		folio_unlock(folio);
 		return -EINVAL;
 	}
 
-	entry = xa_load(tree, offset);
-	if (!entry)
+	if (!is_zswap)
 		return -ENOENT;
 
-	if (!zswap_decompress(entry, folio, 0)) {
-		folio_unlock(folio);
-		return -EIO;
+	for (index = 0; index < nr_pages; index++) {
+		swp_entry_t entry_swp = swp_entry(swp_type(swp),
+						  offset + index);
+		struct xarray *tree = swap_zswap_tree(entry_swp);
+
+		entry = xa_load(tree, offset + index);
+		if (WARN_ON_ONCE(!entry)) {
+			folio_unlock(folio);
+			return -EINVAL;
+		}
+
+		if (!zswap_decompress(entry, folio, index)) {
+			folio_unlock(folio);
+			return -EIO;
+		}
 	}
 
 	folio_mark_uptodate(folio);
 
-	count_vm_event(ZSWPIN);
-	if (entry->objcg)
-		count_objcg_events(entry->objcg, ZSWPIN, 1);
+	count_mthp_stat(folio_order(folio), MTHP_STAT_SWPIN);
+	count_vm_events(ZSWPIN, nr_pages);
 
 	/*
 	 * We are reading into the swapcache, invalidate zswap entry.
@@ -1668,8 +1678,19 @@ int zswap_load(struct folio *folio)
 	 * compression work.
 	 */
 	folio_mark_dirty(folio);
-	xa_erase(tree, offset);
-	zswap_entry_free(entry);
+
+	for (index = 0; index < nr_pages; index++) {
+		swp_entry_t entry_swp = swp_entry(swp_type(swp),
+						  offset + index);
+		struct xarray *tree = swap_zswap_tree(entry_swp);
+
+		entry = xa_erase(tree, offset + index);
+		if (WARN_ON_ONCE(!entry))
+			continue;
+		if (entry->objcg)
+			count_objcg_events(entry->objcg, ZSWPIN, 1);
+		zswap_entry_free(entry);
+	}
 
 	folio_unlock(folio);
 	return 0;
-- 
2.34.1

