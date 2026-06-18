Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94D817D6
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 04:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781758160; cv=none; b=JvO3e1nG4N/aUmU27gNZ5aT8qcmisyZ7Puz9Hgd+nqVUZO9Uhf+SjaByOdmXgE1d67t82zhCODAnFaanvFxJLzsFc3MQyJlbtA34xCKuMUd7lM7rEnPv0AQhHmNUKzgtezFR6MW5uLEgD1gra+9K0KPq0bsYO8PmZ4+1Ln2XAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781758160; c=relaxed/simple;
	bh=1TTuSnuvoVAZPhlcWBtx64LtQvS0sCXjqkC4XowMXkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XCiQRHP2vhJ+qU1slxPUue5OwRwmWNWHx2yPhOur2ijabOueyzxUkzIWHL5JmtLWu0Mia1HVH8/lM6iQB8JhxAegCZGnUVZ88RHKF9cK84pB8/Xdy/eii1A/f2ji3GB9W+u2OdyVNcFD3ehhgxH8LbP80YsjJy2xH461+OXOoYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHyR0Qhd; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHyR0Qhd"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-845397d1221so270905b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 21:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781758158; x=1782362958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/50j8h9PVe8SgOeD0lIk2bjb8dms38WVFY5YQFYhQcI=;
        b=aHyR0QhdO+zdVcoNviNj8TwZxgl889voJEqudvQryefloONgG9gru46+GooU0UcKuw
         SX6Ov1HcBWbU0lGWF13H2epbziVyoDFz2qT7cY+1BJSdpkZdqUHTBVjT0wLE59FNi0Ax
         hbywqUiNprnpK9nKVZhyGLii4arkTlSU0QRYqImDppC4GsMujf4hS3Y0qYBu75LkjpE/
         Zwxf0SwZPVAHMD8ysktpamt6gHDKobi4G4oeZiuTAw5ba9KN4nVwx7hWxyTzY3BuMooW
         7Iv6wFBHRgYhi7Sf83jOKlIIZeTycTVI4VJVtP6+IP04KM8yAb1EwmIarW7QWTLgmfSf
         7kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781758158; x=1782362958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/50j8h9PVe8SgOeD0lIk2bjb8dms38WVFY5YQFYhQcI=;
        b=rZncjJur/4NSrrBKW0W8Ufl+8uxa1ucdQBuvBsGP/UzJeeBY/XFrX1F7GFcuA+nJSZ
         vGbflLEi+UwqUm9DmPPYRMwqtNAUqBn+oI5fQEAx4xbdppH3nU3cedSMwvlN24V5WXl0
         lXqUJNew4UxFtrJvIcmo5frhzRWxdrMjP85BT52Zkr1SDPNYu9p60345QoHc/4/emWtc
         0bOdWGdy4atgDFlsx/DBf4NFwJivrvE35Xdrugu64wZTnOM9sbbgekN7vRH8wRpvw3MA
         s4npZkuR1NJUr5tVOkuYFlAttuv2Os3bOtUq/F+PkXU/3aaS4v0M2pg11apPzNP6IYRD
         aURQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f6/6nlHFpOQ//ucwKbf2ZVpsHgXC1ZyarMUcuOwpbR/W5E40doRmUb+ZiYAuHDDxQEkH1DGRYEao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6a6U+NajwQo9xQeZpEf9fuLLpX6Mn1CE7QefI9hu7BzFGqVhG
	QO6btmc9tRzPKQWakNmorZ7TuFm3/XVOpHGeBpUkMdENhiXRjDxcrkch
X-Gm-Gg: Acq92OGyrEzMuIaWnrHXU/zCnNJe9o7Hn6z7EHO92xWbtEB6xR5hztS6jtb17xro6C/
	fy5T75cdh4oSmCi1rVG/KaRTRU0lQns/gHkzvre+CFKcR22Q9cZtU2YvPFS/uLJj8TFF0qd4aRN
	ItoVm35qANbmoIw60MLwt2SLDZZ4trSd+tMXLtar3SrPvDEld7FxPAa4IxFU9vHNaxPyNuGyAbZ
	Navt+w15FuDbuzS3C3fJ1wV+3j/Vfu1kRQYzVQuXxI/tfkBiGoFJ5VHdDcUZdu7cYwQWBEGtIS6
	KgXZ4mtWcz0Z/7qXHrbS2f3Sb72Db+C0gHysCNiicv7NzgInuq3FObaX+Jrfyh5SvA3rgEszwhG
	vh5OJl9UW6EL/Bi2hrFIeLo0cMnlnNq5SRAZjHKlDyYGSa7um3v1Y8aFo4Dv8+TD96I/w4BqI8W
	wVrTfsKB0LrRC5hzM13DMqDNRjnJzxtb+3hvaTFq4mbILvUmBSi78=
X-Received: by 2002:a05:6a00:4615:b0:822:6830:5900 with SMTP id d2e1a72fcca58-8452444604bmr7259302b3a.6.1781758158031;
        Wed, 17 Jun 2026 21:49:18 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17214781b3a.47.2026.06.17.21.49.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 21:49:17 -0700 (PDT)
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
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao1@lixiang.com>
Subject: [PATCH v4 0/5] mm/zswap: Implement per-cgroup proactive writeback
Date: Thu, 18 Jun 2026 12:48:52 +0800
Message-Id: <20260618044857.69439-1-jiahao.kernel@gmail.com>
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
data from zswap to the backing swap device. When specified, this key
bypasses standard memory reclaim and exclusively performs proactive zswap
writeback up to the requested budget. If omitted, the default reclaim
behavior remains unchanged.

Example usage:
  # Write back 10MB of compressed data from zswap to the backing swap
  echo "10M zswap_writeback_only" > memory.reclaim

Patch 1: Extend shrink_memcg() to support batch writeback based on a
  compressed-size budget and update its return value semantics, thereby
  improving the writeback efficiency in the shrink_worker() path.
Patch 2: Extract the memcg iteration and writeback loop into helper
  functions to prepare for proactive writeback.
Patch 3: Extend the memory.reclaim cgroup v2 interface with a new
  "zswap_writeback_only" key, allowing users to trigger proactive zswap
  writeback up to a requested budget.
Patch 4: Add the zswpwb_proactive_b stat to track the compressed bytes
  of proactive writeback for better monitoring and tuning.
Patch 5:
  Add tests for zswap proactive writeback.

v3->v4:
  - Drop the per-memcg cursor and keep the root cgroup cursor
    (zswap_next_shrink) logic intact.
  - Stick to using the zswap_writeback_only key, and change the proactive
    writeback size to use the compressed size.
  - Consolidate and reuse the logic between shrink_worker() and
    shrink_memcg(). Enable batch writeback in the shrink_worker() path,
    while maintaining a low writeback budget in the zswap_store() path.

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

[v3] https://lore.kernel.org/all/20260526114601.67041-1-jiahao.kernel@gmail.com
[v2] https://lore.kernel.org/all/20260525122242.36127-1-jiahao.kernel@gmail.com
[v1] https://lore.kernel.org/all/20260511105149.75584-1-jiahao.kernel@gmail.com

Hao Jia (5):
  mm/zswap: Extend shrink_memcg() writeback capability
  mm/zswap: Factor writeback loop out of shrink_worker()
  mm/zswap: Implement proactive writeback
  mm/zswap: Add per-memcg stat for proactive writeback
  selftests/cgroup: Add tests for zswap proactive writeback

 Documentation/admin-guide/cgroup-v2.rst     |  22 +-
 Documentation/admin-guide/mm/zswap.rst      |  11 +-
 include/linux/memcontrol.h                  |   1 +
 include/linux/zswap.h                       |   7 +
 mm/memcontrol.c                             |   3 +
 mm/vmscan.c                                 |  14 +
 mm/zswap.c                                  | 322 +++++++++++++++-----
 tools/testing/selftests/cgroup/test_zswap.c | 153 +++++++++-
 8 files changed, 456 insertions(+), 77 deletions(-)

-- 
2.34.1

