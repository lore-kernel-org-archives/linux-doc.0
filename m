Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0533806B6
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711778; cv=none; b=IWCCjXAQy92/1CAjCxnKP8o/t085IyWRgQX70ecR0HZTjMP3v+O2oOADdZz5/R3ehdvrrw/daPVn4QCgrTTrj9lYkCWDdNVB4zZNgQGyqf4PW67/WCz+VtrIoiDzEyk6ZwmttEvCngnpe8gaMyep8Dnc1+roYNyqW2tCGv8uU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711778; c=relaxed/simple;
	bh=Yo7Ky/LHGaqLpQiIGCLB/PsMXfu9aCIuIh28NNc4dd4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LDsREjfSXDGVzzGa+70JMy9rfw70qY3ex+P9/Ps38PffsKabcYMnK4Y92XxS8Cfk9xRAugiNnFQ/nWWnZ+JhTMFcZNqCS2RqtenXNg+yTu2oIsN7HSXsCnpupziPFvignqUb/EVY42SDQEqTDxV0CoH2v7x4stzKpsfXO+YYmXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1Nu6j/Q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1Nu6j/Q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-367d88b9940so6394594a91.1
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711776; x=1780316576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwuURQBEyX2Ow+eyi17IhR1pDynYjLjI1eOjjb4C8q8=;
        b=p1Nu6j/QC7nQggvFeVMBTSKaf2KLm9n6qHsWcXZDrhMA/FhAZI+cAUUvjUuk5S+v81
         odI0uwzZtZwfRR4OPajk9ISuAUmklAv7gUidppnO1fsjwxBXSaOiLJEjM3shHznfJ/Ox
         3pxj2ZKvvRkHu8JSgU+Y9FgbdfHrmu2m+ajfNlgy9NKugp1IuLKCAWNzTsvoMRGJAAu3
         mTIM7vzvSbCkWe6dbF1TzvID9dA/s04cU8Kn3RjUAmQ1+qAboDqlhtnXJ/7IhLOaWsBy
         jT4K7eyx9c66Um9FVkiICbjMzfp0aNLAYRHMPy1iF6DTNjAC3CU1KuI6pByPWXuUdCxT
         1avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711776; x=1780316576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwuURQBEyX2Ow+eyi17IhR1pDynYjLjI1eOjjb4C8q8=;
        b=gaYurml6jl2wHjb/YB7lSf6ZLONlWFoX5MvcTZkfHmZ2L30TzLs2DAsYWkInVVGNGh
         qY7EPUwjHhOl4C7NFhK/T9RhCLpC4TDJP2vSV6HJuBSWWvbfOo6PZyzU/1Q6gVSSIu26
         GBW3arg79SksBflwMM6ixkSnSLE6IWUw/3OALZSWYPHbe+4DMdJ7grshNKwBZsL+LwS4
         J8L0H3+r9lmhVpJ1IHtcwsJbIGxRku+Oa3H/1WyPfM+Fj5gyDUxWXCPNk8doBDa/kcoE
         MSsgPCsd02G6QlEn9LEz0krrL406B9jzH5TxqeLggUDwAg6IiR3iMjXx0AbILOeNr7lj
         h3ow==
X-Forwarded-Encrypted: i=1; AFNElJ8x8kbKODGvAKgZBq0ynBA4m/iuKacD2YGoCPg0jvA60rGQKA/E6WYVJeBZxpC0wgmqIe7ExExWhZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYSoKzsUspdyPybV5i0z9TbCkEKa/AzXmDEruNu2cVPa1Lnk6o
	eBpLcG8rabeZQF1ziT6xrNt2CEbz+euMxULyaSkEhbuYcLz/tB8sUHEM
X-Gm-Gg: Acq92OFQlRBL1WZFw4q3LfJAe0gQ/fchq/3PGpF5kNNZHyKeck5Uvc39PDZW+xvyr45
	/ImGFouqxp12U3dXRfPJkOQ6tm3b+U+xwoOaaKtAJyE2vboCXSx5YFQvEysm1rjoz8H8NaFw/tr
	3h3OTS7gI5tCSuOpbG44qdlGhuw0zA2ut8Q7rvkXNGYsPWNmfr3iodzC0sSKnr7FwARao7Cw0+t
	l+fRiSc51AP5PkN+978qmByPuzZW7CAJ+du6ntY1JaY4iZGHM3GpUS+jxx293PaPF2ly25fvKkF
	Rr0aTWLaqNcdED6bK49b6jrFU/H1vwVNYU2SrIkbgvkKVxAdMY9E1wLjiT+UDmoGWUUUgeLRSDT
	BjFcFpfi07gWQ0jforJxie6CZTTeRWmNYRRQgNpOLBjtXdqEI57CPpryssdCVoLQOwpMSZ6bc4R
	hpNtx/XmpWS/eq5kZI25VPZoGrBon1ZyoI/E17EoqNXf0xkIVpe5w=
X-Received: by 2002:a17:90b:384a:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-36a677fd1f8mr13345191a91.18.1779711776032;
        Mon, 25 May 2026 05:22:56 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a72c913a1sm8999131a91.15.2026.05.25.05.22.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 25 May 2026 05:22:55 -0700 (PDT)
From: Hao Jia <jiahao.kernel@gmail.com>
To: akpm@linux-foundation.org,
	tj@kernel.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	mhocko@kernel.org,
	yosry@kernel.org,
	mkoutny@suse.com,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev,
	muchun.song@linux.dev,
	roman.gushchin@linux.dev
Cc: cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v2 0/4] mm/zswap: Implement per-cgroup proactive writeback
Date: Mon, 25 May 2026 20:22:38 +0800
Message-Id: <20260525122242.36127-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Zswap currently writes back pages to backing swap reactively, triggered
either by the shrinker or by the pool reaching its size limit. Although
proactive memory reclaim can automatically write back a portion of zswap
pages via the shrinker, it cannot explicitly control the amount of
writeback for a specific memory cgroup. Moreover, proactive memory reclaim
may not always be triggered during a steady state.

In certain scenarios, it is desirable to trigger writeback in advance to
free up memory. For example, users may want to prepare for an upcoming
memory-intensive workload by flushing cold memory to the backing storage
when the system is relatively idle.

This patch series introduces a "zswap_writeback_only" key to memory.reclaim
cgroup interface, allowing users to proactively write back cold compressed
pages from zswap to the backing swap device. When specified, this key
bypasses standard memory reclaim and exclusively performs proactive zswap
writeback up to the requested budget. If omitted, the default reclaim
behavior remains unchanged.

Example usage:
  # Write back 100MB of pages from zswap to the backing swap
  echo "100M zswap_writeback_only" > memory.reclaim

Patch 1: Move the global zswap shrink cursor into struct mem_cgroup as a
  per-memcg zswap_wb_iter, so patch 2 can scope writeback to a given memcg
  and make forward progress across its subtree on repeated invocations.

Patch 2: Extend the memory.reclaim cgroup v2 interface with a new
  "zswap_writeback_only" key, allowing users to trigger proactive zswap
  writeback up to a requested budget.

Patch 3: Add a zswpwb_proactive counter to memory.stat and /proc/vmstat
  to track the number of writebacks triggered by proactive writeback.

Patch 4: Add tests for zswap proactive writeback.

v1->v2:
    - As suggested by Yosry and Nhat, extend the memory.reclaim cgroup v2
      interface with a "zswap_writeback_only" key instead of adding a new
      dedicated cgroup interface.
    - Update the zswap documentation and add selftests for proactive writeback.

[v1] https://lore.kernel.org/all/20260511105149.75584-1-jiahao.kernel@gmail.com

Hao Jia (4):
  mm/zswap: Make shrink_worker writeback cursor per-memcg
  mm/zswap: Implement proactive writeback
  mm/zswap: Add per-memcg stat for proactive writeback
  selftests/cgroup: Add tests for zswap proactive writeback

 Documentation/admin-guide/cgroup-v2.rst     |  22 +-
 Documentation/admin-guide/mm/zswap.rst      |  11 +-
 include/linux/memcontrol.h                  |   3 +
 include/linux/vm_event_item.h               |   1 +
 include/linux/zswap.h                       |  16 ++
 mm/memcontrol.c                             |   4 +
 mm/vmscan.c                                 |  14 +
 mm/vmstat.c                                 |   1 +
 mm/zswap.c                                  | 292 +++++++++++++++++---
 tools/testing/selftests/cgroup/test_zswap.c | 161 ++++++++++-
 10 files changed, 470 insertions(+), 55 deletions(-)

-- 
2.34.1

