Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43E4534BB;
	Mon, 29 Jun 2026 16:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750643; cv=none; b=XbkXutDUkTp8mtclr5eXzSW+/kDo82mCMNoc4jTxJr56a1FaUsy8Oy5u8XfCRwFDkxOENEl/C/5OrzZXfiNlv19ByvmHtzPoVySaRMvd/pChbIBUJVCK3jv5p49nJBBn9Ij/g9l1gu1GObt6YzUEVerD4MwL+Dqpyeu2IK5h2dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750643; c=relaxed/simple;
	bh=y1DEQxrlV1SWeli+zA3icxlXqvyOVPMHr1EpbgC6R8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W0VAGD4RKBn9dJA2LjYEBvqLzW5Huw5oY1uOpoVnHKgqpQrxIvN8ZVDGvxe7+8fVfVwRFMeLF2r5oyr9maRn9UmHKNXCK56HQDQ3aAueOoyZgcz8p8fPEbFdSi/S3+Xxdmtqe68jKuTQzT/wu6V1J1b4TZd4duGbywdb4538kxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OtWOq4ik; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Kgkjw0VN; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OtWOq4ik";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Kgkjw0VN"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gpsG746ZCz8twN;
	Mon, 29 Jun 2026 18:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782750639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Izq61Gfdmn3fOpPis7spxvMBkAhgZwLG7r4XL2awBrw=;
	b=OtWOq4ikRWnlQNisfymhIs5JPXrTakP8Mg8CD77vjkcHqNglAfXYhg0diHKDAaO0A5PQ/w
	75HPUyUPp2nbY+mNXGGyyQzn5BH9eulmyLEHbaCtSoVazMI1S1g+ZQrxyZJeL1fzFQPcLg
	X5N+nVIyeDIaF7t2o2YKY4wXEP9xiSCIW8YIdoO/OIYSWEZj3Dad6BHWyrF+dXxmnvJZ45
	r+AjAvJScrNP05b+BLn/ja+y8RJsyHJxE5zg5K1jyfrinb3Mn9aTXQYKbuqsCjJL2zeDfs
	w8GBenccIg0/rukbTDWOqIpySxGkteFqSwLkkHYqt00crGtxGYge7O0NGXYtUA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Kgkjw0VN;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782750637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Izq61Gfdmn3fOpPis7spxvMBkAhgZwLG7r4XL2awBrw=;
	b=Kgkjw0VNjm4POD+1QDP30Qb9vp+eCLS0MYEjOlIORof049ernSl1uaP+F0lI1sVWC0GHDj
	yc2TK9Zn4rjsnyRkuzD6eVw8XDc/HWwqmc3vRf7cIygcsFQOX/uoYRPrYlR4SD1ztiaJuT
	NHvqinbzIBACoOIwuBc7edvKzbuyYklpJ4RtX+JphgspzsrqgtC8/Q5bVri9oTEOP6D+JT
	cajlxNa7stxeqZ5xMcdVerq39qGkN8z2gMzct0XL7qwiHQuhF077Q0UcV+Boq2bD0KOb1/
	EHCyHhjmDq/B9B7dc+CIcMLfBQk/zlJzDasYuYVfaTuEK+ytuXBMiNQRHKDifQ==
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs/mm: Fix braces
Date: Mon, 29 Jun 2026 18:11:56 +0200
Message-ID: <20260629161156.90213-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ccad1faff904b96f4ab
X-MBO-RS-META: woghhkiocwkn4d56kdjf4ot9xkz6uyfr
X-Rspamd-Queue-Id: 4gpsG746ZCz8twN

Correct typos in mm documentation by balancing parentheses.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
---
[v2]
 fix commit message
 add tags
---
 Documentation/mm/hmm.rst           | 4 ++--
 Documentation/mm/process_addrs.rst | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 7d61b7a8b65b..54c461e7a143 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -191,7 +191,7 @@ like a CPU page fault. The usage pattern is::
       mmap_read_unlock(mm);
 
       take_lock(driver->update);
-      if (mmu_interval_read_retry(&ni, range.notifier_seq) {
+      if (mmu_interval_read_retry(&ni, range.notifier_seq)) {
           release_lock(driver->update);
           goto again;
       }
@@ -316,7 +316,7 @@ between device driver specific code and shared common code:
    system memory and device private memory.
 
    One of the first steps migrate_vma_setup() does is to invalidate other
-   device's MMUs with the ``mmu_notifier_invalidate_range_start(()`` and
+   device's MMUs with the ``mmu_notifier_invalidate_range_start()`` and
    ``mmu_notifier_invalidate_range_end()`` calls around the page table
    walks to fill in the ``args->src`` array with PFNs to be migrated.
    The ``invalidate_range_start()`` callback is passed a
diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 851680ead45f..b391502fbfd6 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -724,7 +724,7 @@ the zap and the invocation of :c:func:`!free_pgtables`.
 
 Since it is assumed that all such steps have been taken, page table entries are
 cleared without page table locks (in the :c:func:`!pgd_clear`, :c:func:`!p4d_clear`,
-:c:func:`!pud_clear`, and :c:func:`!pmd_clear` functions.
+:c:func:`!pud_clear`, and :c:func:`!pmd_clear` functions).
 
 .. note:: It is possible for leaf page tables to be torn down independent of
           the page tables above it as is done by
-- 
2.54.0

