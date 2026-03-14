Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E4B1DE8AE
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501925; cv=none; b=ALxRt1DYF7ZIu4Zr18udK/t7prcFwMSrJuvOMF6ladWqUQXoEDANXjK02fLYVeXKDfHOqqKzMwNTDs5Ai+6hyamyIAcs7qHK9E9mbZBDt8oVPrlWuP4hxV9a82Y4v7ETkT1+gDkToIIYMOgF1AAb4ywgw1aibMulGZoUboZkS7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501925; c=relaxed/simple;
	bh=/ir46Pt3wpUTQuiCV2OpzzlkwAiIz2lp8xS21cYxWkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n9EiK+WW04HSk2rDL5lAyjjPlB341/bUhUIlmMNhZQm2U+VGtME6p9EKUL6WRXrJKjEXR1rArSnLHoqq87j7fqw+hq7JjIH3WNzP+DgfALec3cwG6eA1mMIM7xo/Bzd6dRvh/0TqKmCdmt8vL71rIjeHUwD3pPMBUIGCCrwPZYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRB6SLIo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRB6SLIo"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439af7d77f0so2522401f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501922; x=1774106722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NVTfVmb6N0l2OFZbjNDjAuiMDfwEZpK5jgMzMH9pzI=;
        b=mRB6SLIoogsEF88toE5M/BTOayfMRqhnZURRrMeJqCgFqHr3ljyOg58mPm7O+oKQVn
         wrrajsxWVivyLpZJ6se7gO7BIH1UoBVrIEo1hc8A+4SjDSRSCRFjqB4eKBrAsvSkOx/+
         q1Gv7e54Xl8wrChbo3iwApBomXKIoN/+lxPWcpqkU7b7EZUBoPI3qz5TJxclRpnAe1Az
         Ot0Yor+cjwBFBKmpdt85XTDWL6QVLK7t6lpnjJOjz0e9hsiwDCDbBRF29EEGN+vHUVe/
         TmPK8rckrXcGuKPUyJ3pLEy0YDR3zq0hKf2wxyZOkf/x/G/avfbkwpYsjVN070TEQKqt
         kBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501922; x=1774106722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NVTfVmb6N0l2OFZbjNDjAuiMDfwEZpK5jgMzMH9pzI=;
        b=VzdJ0OQq7ZXcWHwILWZTka7I6ee4NAAIdcCA7YSqJR9VOhJ7krsHcLTaR95pB3uY0n
         mvnEGbsqKfIPM8KkPHNPdN3rbWV0ghzgaRXjyqoR8dg5nI+o85ORqYb0qiAc1QSfGOCt
         guRV0WHXDwU9vByUM77nUFgECr18n6ORse0DRVxmH5jmsj8LI2klAFJp+8NPAH7ZEjBq
         vacnYCZ3uZMkUn7eYDOuu91M1D/wTrnHNpjn4Buasub7qxor3lauEA9FqyeWqJrsB1t1
         HITBxS+SAfY+GUQMkrT+ehSKU1d24LGh0FwVSIyGHi6CxJDoCE5aDAVcnfTqY/kpMIKR
         HDww==
X-Forwarded-Encrypted: i=1; AJvYcCUVtM55WuJvXT5lF6QOOkMs8/w+TUZq8JEuevELP9soFFO40OMoZun2qVTdxhWA7qXi2aR+jEz88j0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv3ufJ0b2crxzBYQcKO3TyghygM6MSc1fRudPkiHbjDqyUtYJj
	4PmAs4WC2rpHfo7kunkqrQMg+Px8iamysTtG9wBUse+w5F7/VBhL+qii
X-Gm-Gg: ATEYQzwrMp/+D1X1YTbDBkexkWCZrICbkO3HWzAZx5FxBEnqagjU7YUfQVhVnaIXH7B
	enZ6z8Egw/MQbcj0yuu7lJieLiaCBAeFVce6Xtp7SnWEd/Qe+g6WuXFCNT4O4JIs6LhOmpcXN+i
	+TE5Ws0gKfb4B3F7QG71HsRw3gKzGzZAgvBi+/LW/PYvPC7d6OePc8SXkH+yc9woGe6symupxbt
	tQpzGD4MmAwDrJjX67fehZ3J4kR67jNbE1RKMyXhwRGBadxuSPbzo71bJ6zpTjN/4RHiaby3K2T
	Q7urYisW63MzPe+PxsWuB64ERS5RE37kNHccAAubKyKfg+rdmJLzDB2DryZBlSb8JKQDtJslrdC
	Vj7a6NkgpF8XsDtLN+H9o2ufjYiFAsAQhvmceq8GPrbOkoz8X4x6OCfdk+ldhxyI+YQhqNJDZoY
	kVLx8DUtOJ/Uc5tjJGQObXpOCL5/NrrRIeLXGbZEFk32k3El1d6NoB/wa7XzrOmy5OqzZHKpXAD
	ZyPD4yO/RC19dSDC+thX6CJIIpSALDwt2alncIe
X-Received: by 2002:a05:6000:2406:b0:439:b522:37ee with SMTP id ffacd0b85a97d-43a04db4c63mr12781586f8f.27.1773501921112;
        Sat, 14 Mar 2026 08:25:21 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a0b2e2c71sm11187254f8f.22.2026.03.14.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:20 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document the OOM killer
Date: Sat, 14 Mar 2026 16:25:18 +0100
Message-ID: <20260314152518.100194-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the oom.rst stub that was created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of the structured
memory management documentation following Mel Gorman's book outline.

Cover the scoring heuristic, allocation constraints, OOM reaper,
process_mrelease syscall, and sysctl knobs.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/oom.rst | 67 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/mm/oom.rst b/Documentation/mm/oom.rst
index 18e9e40c1ec1..2259f871a4a7 100644
--- a/Documentation/mm/oom.rst
+++ b/Documentation/mm/oom.rst
@@ -3,3 +3,70 @@
 ======================
 Out Of Memory Handling
 ======================
+
+When the kernel cannot satisfy a memory allocation after exhausting reclaim,
+compaction, and memory reserves, it invokes the OOM killer to terminate a
+process and free memory.  The implementation is in ``mm/oom_kill.c``.
+
+Victim Selection
+================
+
+The OOM killer scores every eligible process and kills the one with the
+highest score.  The score is the sum of the process's resident pages, swap
+entries, and page table pages.  This sum is then adjusted by the per-process
+``oom_score_adj`` tunable (range -1000 to 1000, default 0), which biases
+the score by ``oom_score_adj * totalpages / 1000``.  Setting
+``oom_score_adj`` to -1000 disables OOM killing for that process entirely.
+
+The ``totalpages`` baseline depends on the allocation constraint:
+
+- **Unconstrained**: all RAM plus swap.
+- **Cpuset**: memory on nodes in the current cpuset.
+- **Memory policy**: memory on nodes in the current mempolicy.
+- **Memory cgroup**: the cgroup's memory limit.
+
+Only processes that can use memory within the constraint are considered.
+Kernel threads and init are never eligible.
+
+OOM Reaper
+==========
+
+Sending SIGKILL does not immediately free memory — the victim must be
+scheduled, unwind its stack, and tear down its address space.  To speed
+this up, the OOM reaper kernel thread (available on MMU systems) proactively
+unmaps the victim's anonymous and private pages without waiting for the
+victim to exit.
+
+The reaper gives the victim a short window to exit naturally before
+intervening.  It walks the victim's VMAs in reverse and calls
+``unmap_page_range()`` to release physical pages.  Once reaping completes
+(or is no longer possible), the mm is marked ``MMF_OOM_SKIP`` so the OOM
+killer skips it in future invocations.
+
+Before reaping, the mm is marked ``MMF_UNSTABLE`` to signal page fault
+handlers that private mappings may have been zeroed and are no longer
+reliable.
+
+process_mrelease
+================
+
+The ``process_mrelease(pidfd, flags)`` system call lets userspace OOM
+managers (such as systemd-oomd or Android's lmkd) trigger the same reaping
+mechanism on a dying process without waiting for the kernel OOM killer.
+It operates on a process that is already exiting and performs the same
+address space teardown that the OOM reaper would.
+
+Sysctl Knobs
+============
+
+``vm.panic_on_oom``
+  0 (default): kill a process.  1: panic on unconstrained OOM only.
+  2: always panic.
+
+``vm.oom_kill_allocating_task``
+  When non-zero, kill the task that triggered the OOM rather than scanning
+  for the largest process.
+
+``vm.oom_dump_tasks``
+  When non-zero (default), dump a table of all eligible tasks and their
+  memory usage to the kernel log before killing.
-- 
2.53.0

