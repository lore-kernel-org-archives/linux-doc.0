Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B2D270575;
	Fri,  8 May 2026 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271647; cv=none; b=PUXpX0/4axzuLd9tNqDjF8P9Xea2Q1766U2+LNu+XZVBbWV0BxEUjKFyWVcqfCyjfC7uiiKVre6Ox3EJuVODQI2iOtj6Ei6i7QK0yjw2vV/D5wmjshwLU9FQ9vVP1qvPqtqiHaY5xW+tyw4xULPDmdN74nVgAsPCfBsjUhbc3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271647; c=relaxed/simple;
	bh=0SsTQrE8/CfukGLoFTODd/Ziz6CRTgjLjK9jGiQ4Z/s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=SR4V1rP45KRNsq3FJwg1rtwGIdvp2kdWAfvl4K9Mimy9mKODk2PlpMTcWSlzWpn6Sb3vIUmGPkcEO4GiIk9pEn+EQN44DWFaXRgDRqQtE3asgVRKV+wtW+bwjc4tmRXcicCQjPJBkVXwSnklKPUnWgCeK3EUTHpHzoiY2fHZ0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=C4Svgf+C; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="C4Svgf+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778271643; bh=7+VsAe268AqTCt3bJy0GHLNrVxZajJrbaFUpnRg04rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C4Svgf+Cua3obXizWlV2nGfPpWvCazlMA5FVVMQc5uN2z5eVznxDUyBmpdR1EctLv
	 3YDdso6F8BtdYh49Dc0G7UnLulbGTDM9vqJR8jZcXLQZwBGD+pZoRmD8Em2/W4o7oT
	 3E3GZTS4Nv4TbM0h41n07gGgDUOFm+AofYhi/nbI=
Received: from node68.. ([166.111.236.25])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 52124024; Sat, 09 May 2026 04:20:33 +0800
X-QQ-mid: xmsmtpt1778271640tmrmaao9o
Message-ID: <tencent_CD11FE9B4A0B362E95E776C5F679598FAA07@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uoZq1R1mcC6Jb7yeLTJbbmAfMYJ8QqsiQrPoRXtIk/dAtVzCvNu
	 YH4XmMQyzr/Zi6/QFcszsPO8FVD/417uIaBeVCyABHrm1lqRt6gp/EMGG6hL0GDY7QMzsHZEzrKr
	 5aiYFn1muYUnHC5nDw9zogMmMYNduVIsEqPjrxlKUiE95THEL4mQzyDOf16Bh/idM1ozDn2nnLIc
	 u4TP9X45EBo61+7csmKqkNnNrTvW3Ny+lk8A0KQNr9rJzZwBdt02xuplMF48tjZ9sMIG6pKLM2IA
	 5PlCvduFrUdVcuGkV/OcJjD1ltjZf+HbuuLRYgAUnanPM6XzPbrzsyN3h1Ngl1kN8PLZ+4bLfJeP
	 4TWv78/1bFqcgcXZIEKZwtwsV1EUOW1vRK8YyKGivI5wg/xy4K8tGn6Fu4LBFWHBVN82F4rjz+4Z
	 R9zAy/wrRlh4RiI6xwiIf2si1EETe/lQQ9k5GaDN/Kw+HLmXif6UwccKsGeHHwjJn3ORz6mXT6N7
	 jsQRE8SIdq00db+ZwSeqnYDPWqYlDdy1LMtrxmg5ODfEHEA3fIzC79HyWTs7ROuH978XDkSvDLTP
	 kHkLzgkcrer4CY0E5FaTDiT1bY6cNgz09Ds11PKfzwpyDjR0u5q1RVFgMabn+wP8eutkhT0N2SZV
	 mYRQHLqaN9JPlkLu3v+kUigyfZ0qoETkV0lizuwU9I2pZDMsJC79KGmcUtRbbknJY3G4lgeHA/Lm
	 DQYPpPnXOYPfwtl7iQR3+Wcfb7AL2BbKAavXSWnmX8nz0Fwk1uVUzi3U5QKKjmE9ceXLwNFxADey
	 8qBRIitATtl4os38v5ttIF31UUUn8+kOjCfu0lQ0qClI8FuwLoAbmM7eT76kZCsGNAWxV77aa5kK
	 jjkgpJQuGITnTHZ6HZ+ELQpTsgFasU0AiwmmY+cFo3193QgWY2YBdlzPVl31jNJvK63dsq3e45nC
	 UAA7HLsv/V3g9tovlugrvqzPMs8g/Z1+YBboemzQxzzDYB5VidpEl015kzEfhzdXpCYF+qZIHw6I
	 W8C299uLZzEcQYXcMs3gUmJMjklf6AxUOaydthB9P0ImOSG55SIgj3c5U2EUSRO3vZHTOmXIAnR5
	 kEelkJ
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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
Subject: [RFC PATCH 4/5] mm: swap: fall back to order-0 after large swapin races
Date: Fri,  8 May 2026 20:20:32 +0000
X-OQ-MSGID: <20260508202033.1834876-4-fujunjie1@qq.com>
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

swapin_folio() documents that a large folio insertion race returns NULL
so the caller can fall back to order-0 swapin. do_swap_page() currently
turns that NULL into VM_FAULT_OOM if the PTE is unchanged, which is
harsher than necessary and gets in the way of rejecting large folio
ranges for backend reasons.

Move the synchronous swapin sequence into a helper and retry with an
order-0 folio when a large folio cannot be inserted into the swap cache.
Count the event as an mTHP swapin fallback before dropping the failed
large allocation.

Signed-off-by: fujunjie <fujunjie1@qq.com>
---
 mm/memory.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ea6568571131..84e3b77b8293 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4757,6 +4757,44 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static struct folio *swapin_synchronous_folio(swp_entry_t entry,
+					      struct vm_fault *vmf)
+{
+	struct folio *swapcache, *folio;
+	bool large;
+	int order;
+
+	folio = alloc_swap_folio(vmf);
+	if (!folio)
+		return NULL;
+
+	large = folio_test_large(folio);
+	order = folio_order(folio);
+
+	/*
+	 * folio is charged, so swapin can only fail due to raced swapin and
+	 * return NULL.
+	 */
+	swapcache = swapin_folio(entry, folio);
+	if (swapcache == folio)
+		return folio;
+
+	if (!swapcache && large)
+		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK);
+	folio_put(folio);
+	if (swapcache || !large)
+		return swapcache;
+
+	folio = __alloc_swap_folio(vmf);
+	if (!folio)
+		return NULL;
+
+	swapcache = swapin_folio(entry, folio);
+	if (swapcache != folio)
+		folio_put(folio);
+	return swapcache;
+}
+
 /* Sanity check that a folio is fully exclusive */
 static void check_swap_exclusive(struct folio *folio, swp_entry_t entry,
 				 unsigned int nr_pages)
@@ -4860,17 +4898,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 		swap_update_readahead(folio, vma, vmf->address);
 	if (!folio) {
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
-			folio = alloc_swap_folio(vmf);
-			if (folio) {
-				/*
-				 * folio is charged, so swapin can only fail due
-				 * to raced swapin and return NULL.
-				 */
-				swapcache = swapin_folio(entry, folio);
-				if (swapcache != folio)
-					folio_put(folio);
-				folio = swapcache;
-			}
+			folio = swapin_synchronous_folio(entry, vmf);
 		} else {
 			folio = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE, vmf);
 		}
-- 
2.34.1

