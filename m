Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B25C33AD9C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013559; cv=none; b=tWI1n4dZ+KJL8SOMt8/8Q1Iudja0U5TIT5FPzRF9XWOk3cgQptzuOe96qhOVU8QxXpOc4g3Y/My8P4WrpsYcsdJZ+XLiPThQnrR1tL1IkzXUc8f9I5sOFenaj9tPfcFW6kpeutminiwOy4T+MM3gnX7BjQ4aTgJXS3nRgaCkRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013559; c=relaxed/simple;
	bh=voO/cxY9W/13P7yzUb4tfvEmHKZq7t3Nk22Ue6QqcK8=;
	h=Subject:From:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=TX1rsI2tTn7yJ7+mQOcUpyJYlEq6c+v2WthOZ4jEDc4Z8Loh3IGA7/HenuDyMZbq5hXjJba5/+4d+4er4/Ar21SPmhadLGkVMsDl1EaXT+gkNHcx79l77H2V7NfbAdeHkMzQS5teRWUBeMnVj5AcQghBsi+Apui3ebH57dfs+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGyF0Q8r; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGyF0Q8r"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84780c95e2eso1455484b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013558; x=1783618358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:from:to:cc:subject:date:message-id:reply-to;
        bh=26WDDaYqRuzzMsOBQUpbaxL8aqOoRshWZ4hxrJuUv/M=;
        b=kGyF0Q8r25j1OyoTurw+h16I7vRVTEfyJmJVB2a+IdN/Jlp9Z7nuTtgEnfpHSDajAR
         NreB2OpTEK5VbTKkUH01V2yJ9sDvRGqDWwI2sGV9x2wa1L5yfypy3F7/W5Acho/ZHGfq
         uXQpTqkrXtGZJt0muQKGvazEp1BNGXgITyoO0FWYZT8o03PGwFKTTref3h8UHtjDYFlN
         8hChpg3l1KrXISyoPLxBSYCzS1u7cIt19ppkmastvSze5KPtN7wz1At2kH9Q/het2ym+
         ilDDvYdTaf7TDq0d2iwpG+fpfulD93EazFRYejNyRWs8Z2YvINFRmv5TMEpuZJpnsp9l
         CJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013558; x=1783618358;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :cc:to:from:subject:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=26WDDaYqRuzzMsOBQUpbaxL8aqOoRshWZ4hxrJuUv/M=;
        b=nFQwMQmz09yxPnSEyMqAeDCGA9X1IEKoOfZj8/zmTyg7cBa4nk0AXJkQ6CGUuYYBbr
         KQZjVkRcq1kZjaM3Lw+t3YRykIIv5Mn7a1PEP33RNApIm6sHztSj9rsKV9twQ33h3q7j
         MhKMRAvEsYKrQu6Ja9TYW4mR7LQiQ9nQjNhFn3dpasw7DS8Ou47FB4U2qLRcg22+52m6
         1KrSJhXJzvK+m8oomi/gVwM61kSiLA9Hl2ntVJbZNBjytqU97SwHKFvHdq97ZX9ap9AQ
         yj0zqNK+reKwOXPzLKyG/OrpzNpwmLtdF2rqNKaW0xqVbR5vvP7nTq7aDBtVmLWS8X9l
         w8XQ==
X-Gm-Message-State: AOJu0Yw+TzxvIS8M8kPpMpNywbq+Hk4l0lC2ubMmQCSMDRcA2/1/aR7u
	XixSH/o54hVU08p9mjiqdIfI6VcTA+IHpKR9RYU6PuEEWvQ3Bb/4u4bM
X-Gm-Gg: AfdE7ckURH0C2IkfXGO/jx2puNxMRq7IYc+uC0L1OBX+0UvSKrtkZ62T9sYi/13V1A6
	Rrn87EgU+CCnv43Td9+P+TTa8QXFNCg6uwIQ1glKbWqb9t6a6Wo6cxqN2LeVveeFGJu4b0X9Eli
	Xq0grQblfm4vdO6lcSS3AoICHlYTW55y1D1Y1CFsa4ZKPS7MCqO1L6mLeuAyD0d33oWh4ERYzbI
	VzBkyIL+cSIjGVysiOxgQHnZqssETEU18cPjxsyhz6aMVcACyj8fy8zumxdSWhEEkSvcdvpHu1t
	2LTDu9mWDP2dqClntu72ohtEg2pQLMd1zPfF7Lw18c+heXIl5W8UTy2E19qJYkCY/pJbWCHefoI
	laQEZ3jRQ/qI5qattl9TbS8EdWkEz7uboqqyDygvW5FkkbdfjQR/IxZBR8l9rhdbirKsGraRkM0
	4OZDUKv4BojVUfGJxyRrJpK2ioKLePOGj09jWDtlH4xWa1zn/QBJ0RfBOSaXI=
X-Received: by 2002:a05:6a00:2d0e:b0:847:968d:b108 with SMTP id d2e1a72fcca58-847c5202bc1mr5573787b3a.57.1783013557733;
        Thu, 02 Jul 2026 10:32:37 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb73936dsm1809806b3a.14.2026.07.02.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:32:37 -0700 (PDT)
Subject: [PATCH v5 0/3] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Date: Thu, 02 Jul 2026 10:32:36 -0700
Message-ID: <178301344866.373695.16044452017467686329.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This series extends the HMM framework to support userfaultfd-backed memory
by allowing the mmap read lock to be dropped during hmm_range_fault().

Some page fault handlers — most notably userfaultfd — require the mmap lock
to be released so that userspace can resolve the fault. The current HMM
interface never sets FAULT_FLAG_ALLOW_RETRY, making it impossible to fault
in pages from userfaultfd-registered regions.

This series follows the established int *locked pattern from
get_user_pages_remote() in mm/gup.c. A new entry point,
hmm_range_fault_unlockable(), accepts an int *locked parameter. When the
mmap lock is dropped during fault resolution (VM_FAULT_RETRY or
VM_FAULT_COMPLETED), the function returns 0 with *locked = 0, signalling
the caller to restart its walk. The existing hmm_range_fault() is
refactored into a thin wrapper that passes NULL, preserving current
behavior for all existing callers.

Faulting hugetlb pages on the unlockable path is not supported because
walk_hugetlb_range() unconditionally holds and releases
hugetlb_vma_lock_read across the callback; if the mmap lock is dropped
inside the callback, the VMA may be freed before the walk framework's
unlock. Hugetlb pages already present in page tables are handled normally.
Possible approaches to lift this limitation are documented in
Documentation/mm/hmm.rst.

Changes in v5:
 - Rework hmm_range_fault_unlockable() retry handling to retry
   VM_FAULT_RETRY internally with FAULT_FLAG_TRIED set, matching the
   fixup_user_fault() pattern and avoiding repeated first-retry lock drops.
 - Distinguish VM_FAULT_RETRY from VM_FAULT_COMPLETED: retry faults now
   reacquire the mmap lock internally, while completed faults return to the
   caller with *locked = 0 so the caller can restart with a fresh notifier
   sequence.
 - Document the two *locked return states, including the -EINTR case when a
   fatal signal is pending after the mmap lock has already been dropped.
 - Update comments around HMM_FAULT_UNLOCKED and the HMM fault loop to match
   the current hmm_range_fault_unlockable() implementation.

Changes in v4:
 - Rebased on 7.2-rc1

Changes in v3:
 - Return -EFAULT from dmirror_fault_unlockable() when the mirrored mm can
   no longer be pinned.
 - Add an eventfd stop signal for the userfaultfd handler thread to avoid
   waiting for the poll timeout on successful test completion.


Changes in v2:

 - Split into a preparatory refactor (new patch 1) that moves
   handle_mm_fault() out of the walk callbacks, plus a smaller feature
   patch on top.  Suggested by David Hildenbrand.
 - Hugetlb regions are now supported on the unlockable path; the v1
   -EFAULT short-circuit and the hugetlb_vma_lock_read drop/retake
   dance are gone.
 - Distinct internal sentinels for "needs fault" (HMM_FAULT_PENDING)
   and "lock dropped" (HMM_FAULT_UNLOCKED).
 - Outer loop now re-walks after a successful internal fault so the
   faulted pfns end up in range->hmm_pfns.
 - Kernel-doc on hmm_range_fault_unlockable() and the
   Documentation/mm/hmm.rst example match the implementation.
 - Dropped the mshv driver conversion (v1 patch 2); will post
   separately.
 - Selftest converted to drive the path through test_hmm with a
   userfaultfd handler (new HMM_DMIRROR_READ_UNLOCKABLE ioctl).

---

Stanislav Kinsburskii (3):
      mm/hmm: move page fault handling out of walk callbacks
      mm/hmm: add hmm_range_fault_unlockable() for mmap lock-drop support
      selftests/mm: add userfaultfd test for HMM unlockable path


 Documentation/mm/hmm.rst               |   66 ++++++++++
 include/linux/hmm.h                    |    1 
 lib/test_hmm.c                         |  122 +++++++++++++++++++
 lib/test_hmm_uapi.h                    |    1 
 mm/hmm.c                               |  209 +++++++++++++++++++++++++-------
 tools/testing/selftests/mm/hmm-tests.c |  149 +++++++++++++++++++++++
 6 files changed, 504 insertions(+), 44 deletions(-)

