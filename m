Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D083AD534
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406565; cv=none; b=sDUxvytoSPUC5mOslHV9KKQVsxjnfWRP07IxWwUnW2qpzSmV3VXgIoGw/3NQUqlCK6dTbluLwsUiZeZc9rPHF6lKVi6lIgVlSdIIID2iJz4i07ISypOPL1FglRIoRWZ3AMuoloxVQE7rU6MqmYIB+vGI29oDWVzVa47jIpNtOy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406565; c=relaxed/simple;
	bh=6v+ghItK7ul3adjRGUNabgeElM/A5NB7kggjLSChwns=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qIiRstbWd54Q8gbpS0r8wPgG/eiHTk2/vAgQf3cGUufFuP6B11Z7urt7q5tsfxVjJzPxHJrV5MgBweYvfrNXiEhUDbpwjVaUKd3QD0LCm7Tq3s65VPu0KS/3MgpJM9DcCu0C+JzDiXdojHOzzttBrKQGe7cl2xY8ElIOS3xs/dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=irpNA6X/; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--souravpanda.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="irpNA6X/"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c88da04b719so3194753a12.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783406563; x=1784011363; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mr0Imss8jl6Lql5T0sFpczm9SFtWuez0AZQ8VASrGcw=;
        b=irpNA6X/X4aGuuJ/u7v1TAi+bwUBZhCZvWcO2Qbgz8zIfJZ9LL8VWngxSep8ulXSqW
         9wntec3nwebXao46b7uX1t1ALqvqyY4YZDt8K4mzvVH0GZH02FJi3xmP9lD65vvfyHWq
         1d6qCoOAbsIaUE4pCG8/AMJKmceJumB9pcYP5/aEL8DIqh3ccXyBiJ8Y1A8F7RCtVWQ+
         gGhm+/mOSeojmZS/zRqam2UtlkmpOhqnH/nF1v/itY/3PoMb6I5h3rob2oqxRhAy9bjk
         7byezXpHZh2zpusuEgxYqUxEYdJeBW1SU9EOEiPZZP/k4xb0TgTHpqJ2rMPzpTrfAtmb
         +w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406563; x=1784011363;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mr0Imss8jl6Lql5T0sFpczm9SFtWuez0AZQ8VASrGcw=;
        b=ISH6PYnx/YmyDXnc++S/2uI09ivPpqRPTIxhfC34kL9842WiElkMgR5OzKWSbuS8qh
         t6o0FTD8fSNXXj3eP2BwlTqwCgXt927u6+AbWFAE7xQOfqz6joGXwL+rKMz16PiF5KfH
         hv5+9OH24Q5c68vVFNOr7835z/y/7BqiZtpgslBAwAzNPdQe4ZQJ7+A6IJq/rqkdYI75
         sntKVnI6HECztSUlweXjq9xNlBcY/Alc14Xe7WGunvQPT0B3198BlFzUincbO2WgeiXR
         AZAEAjC9e3lCgP1s8sJNBJErMOE8bbjFaIltQaNJa3Q07gLNvoL1f21+oAkItONDe4V9
         mCeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv6M7ew9Sg8RAi27rheD7UmpW1IQIJ3Zuw2MRl5KLfhAWhDljgBLe1zZjzk0IdTmMfIhA1IFDwuMc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/HozO3DpxKBgWGH7gCf1JVOOpcZAR8j5e3tXHj8raA1X6jYK
	gmnv3MpAVPwuiyxcyIEl+en60B3aVMqVGErZ+KjBsUgQ39lpot0ZFDAqcdTBOmAirvqOMvFs+4g
	+PYQeXTx2eNQVmOqYRDVUPC8gEQ==
X-Received: from pjui23.prod.google.com ([2002:a17:90a:cf97:b0:382:3fe5:7a9b])
 (user=souravpanda job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:570d:b0:37f:eaf9:4682 with SMTP id 98e67ed59e1d1-3875586394cmr3986337a91.14.1783406563403;
 Mon, 06 Jul 2026 23:42:43 -0700 (PDT)
Date: Tue,  7 Jul 2026 06:42:34 +0000
In-Reply-To: <20260707064235.1386552-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707064235.1386552-1-souravpanda@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260707064235.1386552-6-souravpanda@google.com>
Subject: [PATCH 5/6] Documentation/admin-guide/mm/hugetlbpage.rst: document
 cache interfaces
From: Sourav Panda <souravpanda@google.com>
To: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org
Cc: david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, mst@redhat.com, 
	mhklinux@outlook.com, souravpanda@google.com, fvdl@google.com, 
	gthelen@google.com, mike.kravetz@oracle.com, pasha.tatashin@soleen.com, 
	rientjes@google.com, riel@surriel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the newly introduced sysfs interfaces for the HugeTLB
dynamic cache. This includes max_cached_huge_pages,
nr_cached_hugepages and their NUMA/mempolicy variants.

Signed-off-by: Sourav Panda <souravpanda@google.com>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 34 ++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index 67a941903fd2..6b96779e2584 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -264,6 +264,10 @@ pages may exist::
 	free_hugepages
 	resv_hugepages
 	surplus_hugepages
+	max_cached_huge_pages
+	max_cached_huge_pages_mempolicy
+	nr_cached_hugepages
+	nr_cached_hugepages_mempolicy
 
 The demote interfaces provide the ability to split a huge page into
 smaller huge pages.  For example, the x86 architecture supports both
@@ -286,8 +290,28 @@ demote
         actually demoted, compare the value of nr_hugepages before and after
         writing to the demote interface.  demote is a write only interface.
 
-The interfaces which are the same as in ``/proc`` (all except demote and
-demote_size) function as described above for the default huge page-sized case.
+max_cached_huge_pages
+        is the maximum number of cached hugepages for this size (global).
+        Surplus hugepages freed by applications are recycled into this cache
+        instead of being released back to the buddy allocator immediately.
+        Subsequent allocations for surplus pages will prefer this cache.
+        A user with root privileges can write to this file to set the limit.
+        This interface accepts absolute values as well as relative adjustments
+        using +1 or -1.
+
+max_cached_huge_pages_mempolicy
+        is the same as max_cached_huge_pages, but the nodes from which pages
+        are cached are controlled by the memory policy of the task.
+
+nr_cached_hugepages
+        reports the current number of cached hugepages. Writing to this file
+        allows manual expansion or contraction of the cache.
+        A user with root privileges can write to this file.
+        This interface accepts absolute values as well as relative adjustments
+        using +1 or -1.
+
+nr_cached_hugepages_mempolicy
+        is the same as nr_cached_hugepages, but obeys the memory policy.
+
+The interfaces which are the same as in ``/proc`` (all except demote,
+demote_size, and the cache interfaces) function as described above
+for the default huge page-sized case.
 
 .. _mem_policy_and_hp_alloc:
 
@@ -372,6 +396,8 @@ contains the following attribute files::
 	nr_hugepages
 	free_hugepages
 	surplus_hugepages
+	nr_cached_hugepages
+	max_cached_huge_pages
 
 The free\_' and surplus\_' attribute files are read-only.  They return the number
 of free and surplus [overcommitted] huge pages, respectively, on the parent
@@ -382,6 +408,10 @@ specified node.  When this attribute is written, the number of persistent huge
 pages on the parent node will be adjusted to the specified value, if sufficient
 resources exist, regardless of the task's mempolicy or cpuset constraints.
 
+The ``nr_cached_hugepages`` and ``max_cached_huge_pages`` attributes return the
+number of cached huge pages and the max limit on the specified node, respectively.
+Writing to these attributes adjusts the cache on the parent node.
+
 Note that the number of overcommit and reserve pages remain global quantities,
 as we don't know until fault time, when the faulting task's mempolicy is
 applied, from which node the huge page allocation will be attempted.
-- 
2.55.0.rc0.799.gd6f94ed593-goog

