Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF0C3E9C21
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795982; cv=none; b=gaxnm6CyDRbC63C1sbRSZmeFeKJ0zz6WU1E+5XvUmRr4Ak4YW++iKDBuZCFo6dAT0kcbFmCeSr9UPJuJ8mGxVprlx8RME8KT0jG5sGb7B5cjcCuXVQcgRSnhS3Pa5GXd9kc8WdSE9uB2dhY+ZRjnqyPfrkIKH+dqLpV6DDxTHCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795982; c=relaxed/simple;
	bh=HR7T48L4Vy+sBHGM47N+45shXRfXheO6QwhLsSflKE0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l1vRpwT2jiWC/Kp8B93J4jrgCvQzavqPtQoyqWj78uCvg6V8zQ+ufaRz1d7CrAxzXRBStete1fVCGbZn8V9/PXPuypWu8jw+SDX08/Dbq5i3rJ7ynGwxdKbccWpQw6LtkN4FcW/fn1UNu4lJF/q7PBig72FO1YQ81dvm/A+nKk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkVWvkUn; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkVWvkUn"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c822652f82aso8661729a12.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779795973; x=1780400773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=983/W68Px22eGNnSr2lTrxriWPgIBrKprA/JK1mMbWU=;
        b=RkVWvkUnVvCZaxdNF6Ug4V08zeZ5G4svBoJNnUj+D4Str6VeL6jSEzpgaiGNra0EAT
         V7ZvdNNJ3jOtBjisbSrLAMXrqHs806zWBdRke5kJbSnVbVTsX3Z4qGa43G7JdqDxG2oK
         9yrBHabQsqIW/aMyXUKRe8wTvLH57ADdZf0Nt883DoaoldEVMye9v0Gn6LHhfeEzVGj1
         wb79opPQinXgD0a0hRCwZH6Rl6Ksa6R4RaMMwPZMZO7Luv/uAeNEAT5NQa8HFfxJwjGW
         626ohLYX2YUHWST8CuqKBmxs8cA8g1E+FFNJm2kYwURt6hM50jK65+V0pZ+sIaZy9qv+
         HwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795973; x=1780400773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=983/W68Px22eGNnSr2lTrxriWPgIBrKprA/JK1mMbWU=;
        b=do409sYOhL2kauLzJlWpRNT76ni+iBqzxLku8IZVi01MWwqHa5UVPsYT7QUEAv1yAx
         KdBjbiyvpuBsSelZtJ5Oz3lOKlGD4r4WTonc+CiBla08Wl/V7IsFKlpqNMcOdgDpDqN2
         2Rcibbx5XuI7luzKOWGFeVtxJpRTo/o67QXWbZRQ7rYRxaK2fp9t7KCAu3giy50WT9Zn
         CXuaKehtYklBXc2PPzo+TXJQG4mRz/Lsb/DYSXt2xbffxWHOScRfDMd5Vf137+IiyjlT
         jcxfIFk3X+IwFqbhZRldALbSNHkvJlEOl9kDORWrGZU+pWgzt0ylTwt/Xf0aatri87Ys
         JAYg==
X-Forwarded-Encrypted: i=1; AFNElJ8jTeLSt3klcXWASaIUlMBwnSXZ2JQMoabxeMBZF7suPn7TsMIFRyH/NgBKiOLV+nCriL0orUMDNP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/g0HC4FUfbop0bob/wSCXcE1KhnRz756Fcq8+Ah2EstJeq8T
	s2xKpBm8iuQojcOdkaegVARGaNyy4ba3a+18iFSLqgJKq0fCTVYRgbEi
X-Gm-Gg: Acq92OFGeGp1UXibbkEFKFW9KYVsJn/aioxqFDFV+mBor9ts1ViSsJwY25huWSu8tzy
	82yzjDaeIjdeNss7m00fEbBeKzhJMpfdyal4lv72lvis4ujo5uGqqSuclIg7T/bF6BH2AsWhJbB
	6GFJMH/xNsIpjoacNb/V9StqVgblenC73gG46WwtqrKrdiAm7cObXboxBgk/Lg4SOxGFBEa4x8/
	TOy0AqyMfi5bszQr9jVw0dXqJYOJIRAAMzojjsUtUiVszPU+sDELWguwLsDZhpkmJHAlfMEXhMc
	BGiITRNvQ0S6jyHciltWpE7lzHcEYN4M1uzNEQ4X89KlLdYTfCAC8h4qlYVMHhQPAlhji/sh3Nf
	hRHJUJ87M8c0UrPobAq+ltbjNNtK1uLN4lEJyZYzpW8KT3BFK60W7elwc6mhKAYFWTz9c7S/Aeh
	u/zrIql5PCCTn4+4A8I5RDivG18+6KboYFMk38/0Qwf4Q/2aPwd1Q=
X-Received: by 2002:a05:6a21:a45:b0:3aa:3fbf:d0a3 with SMTP id adf61e73a8af0-3b328fb7b6fmr20340231637.47.1779795973481;
        Tue, 26 May 2026 04:46:13 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fe99sm10304341a12.4.2026.05.26.04.46.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 26 May 2026 04:46:12 -0700 (PDT)
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
Subject: [PATCH v3 0/4] mm/zswap: Implement per-cgroup proactive writeback
Date: Tue, 26 May 2026 19:45:57 +0800
Message-Id: <20260526114601.67041-1-jiahao.kernel@gmail.com>
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

v2->v3:
    - Align the return value of zswap_proactive_writeback() with
      memory.reclaim and update the corresponding documentation accordingly.
    - Resolve conflicts in test_zswap.c on the mm-unstable branch.
    - Enhance the zswap proactive writeback selftests to guard against potential
      future regressions.

v1->v2:
    - As suggested by Yosry and Nhat, extend the memory.reclaim cgroup v2
      interface with a "zswap_writeback_only" key instead of adding a new
      dedicated cgroup interface.
    - Update the zswap documentation and add selftests for proactive writeback.

[v2] https://lore.kernel.org/all/20260525122242.36127-1-jiahao.kernel@gmail.com
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
 tools/testing/selftests/cgroup/test_zswap.c | 155 ++++++++++-
 10 files changed, 471 insertions(+), 48 deletions(-)

-- 
2.34.1

