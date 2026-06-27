Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9999255F28;
	Sat, 27 Jun 2026 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782552849; cv=none; b=D5ejMNSIPeiHDE6VGnZE6BCQ+ISaRGftSYf1+6mL5iUsUfoC4vYr/dcIkddvjU0U5etPTW2tazSS+wln5mpjd/Nw+VLyYn6JHuGCIh7pVEBQ6sZVroRSQe6KmCVc3HvXvhKqI8MRS8AcRUAQY57mmvPAxE9Xw7N7ufVuYTjGH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782552849; c=relaxed/simple;
	bh=o8G2XWf3wTqsL/ZkPnaxECa0u8BbID3YAFTKgqNE1v4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRtG2BlR8N5MfzZBaXNCPXVBB/wuDVCZrv2QFC7RTrGuzWz7ebKWBvDEcN5/akAk6bT69ldRyJ5Gtif8de7+64YKR0CqN4lOYh2RhMI9JhkPlD+sUpjxeeDRIhtXSUDo2W/3AqxM4kiPjgEeDVHNK1+eDXGB0r1lC5XJE6ImQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qvbKsJjQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v7B3S3EF; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qvbKsJjQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v7B3S3EF"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gnS6P5xX2z9tkC;
	Sat, 27 Jun 2026 11:34:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YlWKjk2m93Y20GRwWu83QevunbPgZPbwOz1dqg0rweU=;
	b=qvbKsJjQ/Q1b5F4v5ax1na89TuxGq9hkvDlGOOP55H9yQN1XBSSIICFzEVjRC0HuVQdl+I
	vvLztHxXcJd6l1NUUe5xatLUN+fTy3HQqo7F+kMWTeLRsmtkwcGFKj5PAhYO1csCr7zKsB
	pbN+yysQDmg8Zz5qLRptP7V+OeTK9PWehVSKY6/gxqw9TOeZuG//Lx6DGTM7plmybynXE+
	yh3G7L+umtlmR6Ch4D3Dm+VuJ1aQSm5Fle2mdev6fHQ1vV4MGyzD+X+E8+So1NSrPbrUpu
	hERCmKlHJSCUlUbpWqr/vjWcvOpm2cPpFjvXF8ryU2yRhi9rg5VnSjReu//x0Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=v7B3S3EF;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782552844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YlWKjk2m93Y20GRwWu83QevunbPgZPbwOz1dqg0rweU=;
	b=v7B3S3EFx9HgRlGsOBCEhXFOJoUxvfQHyiZC0x+yw+/SLqv+0AGZRoS5GR8lUda0BWkcQi
	of4zz/zY+WzzC/ybphi6qUfv6Yg6n0kc8edUKzbikU0SX2cV0lFQwnvcr//7bkTKo+ywDu
	q2V0gBlEqPOmOf1GUPSH7wf0yTNfFycuf+Xg+AymztVWAMkoigPPfTN3tQ6nJ+r/naZnux
	6SzN9oLUIaQwoXLaeSk/epwrzaKF+RlPuw8IoXma5/LxIYZtD71yo72/qs1OX6lYAiAlwM
	9ovXyOq6FlKZyfGwjhWqSK2QxGgOlabYsnr6DD1onvg/Zl9uUp3P7KzTK99N9w==
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org (open list:HMM - Heterogeneous Memory Management),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] docs/mm: Fix brackets
Date: Sat, 27 Jun 2026 11:32:59 +0200
Message-ID: <20260627093258.31265-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g9h6im1gwqhbb14o9nrdfej744p5ujkd
X-MBO-RS-ID: 2c037404ca6d556e29a
X-Rspamd-Queue-Id: 4gnS6P5xX2z9tkC

Remove unnecessary ')' and missing '('.
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
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

