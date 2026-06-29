Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672343FBB5A
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732050; cv=none; b=HQZ1P65KzOOas5oQADRZKGLvqngLvr/DPFMJKaeveJ9rjDqjOAr67YS8he0+L3jh4tucjijnH2aGIoN6hGOTHPww+r9y8k5JSQFVhDxKzfTh535yCHaCMUjMO9+LU8az2k2TX6ObRCWJ9FfzrmuX8Azhoes/T+XK5DAAn/ZozeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732050; c=relaxed/simple;
	bh=MoZEZS7dbotkkuxxg4+GMlCMLeVYHkb4qQQQ+wJQPIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J1h9J5JAQ5Vrk/IxqoEWpfh1dQ//uC5ASbdI9xvkoMCiDlp3zm4sUx9/X9fKjosfzqAeSWASO1YjFEW2oPhYubkTz/4/1tGZ5vzOL9L3OBQ5Xj3hcHNspIjVEBsWdUIyPnX8aBXmkIiRHB40tmmLkl7QLXBTcLnhPvyTpNOBF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ekzz06lq; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ekzz06lq"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c9f10fa7a3so9970095ad.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782732048; x=1783336848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2wcplDrEZi5L3i6fVdKYZ7PB0BhNDAnbo6eoR1bcDwQ=;
        b=Ekzz06lqFhW7YyylJqZckSv/QLGjhmgbjvU2RgpY8WCZyQ6CSCJnVKOfPzYtlgD2AP
         Z2FkBpKBiEt7gKSiBwEP8ahdw9e0GxC5CPeSbHvymQnHhDyhG2IjyvDMql/bZNVDVslS
         luxFtcDWVxsTn+X5lTuKi0yKrjo58nm4WcxMk40woX6487Le8ApQExapVcGMfzjhroms
         EseemFy9Qupiu7f0enzefTPMOBD/+PP7Z6VJ2vTmXmfvPd85U8MYHaUDr/HPwflAlhYK
         eyqmlwOuGXRYbPG6IoSE1btVpldAdaV5AxuswDVsRDgKU5jBLeBuqzL2FT9LBv6PoOD4
         jBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732048; x=1783336848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wcplDrEZi5L3i6fVdKYZ7PB0BhNDAnbo6eoR1bcDwQ=;
        b=aKlqMYjbuyNy5xFRs9QNrSGXkmp3uNKYKANYO/Uzslx8J9zdW2aqGdJnHxqEDTiUxZ
         CsadlOHyY0mRuPfAS4Hs9T5ZaEyr7B0rVJWWOAlpZzFRIXm83F9tA/KaeX7JajltL8U+
         JKH/BodW9H0mfDHZDT4Gv/HfuOob4eZ4mTNykSIjDmISA6JNQ2NYLU/cIEPLNmD09TKw
         zluXaq5AQJGBijdjs0CKheicaZrboqC5NVVP9462zr+wiWnGWcNPzLhBKlwaKK1yb3VD
         ElW+qa0V+HIgm2jXXpbBkKVThUzlpsXk+Rl3/PEBlBEAbpCUcsa3obgTeN2hBpyTB8c1
         9GqA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9caNfEIbHNZZw9HrXq356RBcQo5XJd8zoTeHVtLPLQhFSc0KafaOWAz4pZ2VoIUbYV4W/DNxH6Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrNUYiXKePgD87ndtQs/wbeuEjyF+H8wIxKv+cmd6qA/8ubR2o
	aS3+WhvM2eoEEeHWoxPkFmscR51Da3EhSDCzamd6L7C4vasCpwVip1SL
X-Gm-Gg: AfdE7cmqtdotfMk5QTuKU9WlOCsbmwXUaTN8M0xOBP/ZRFmwZVuFHoJTLOJn2g91rPo
	TkGHcFTmYK1tU1LrP6OYjGiz03WWot7KMErll1FUGRHB9B6J8noPvbXOlPxh+sThZ3kCrojcD8/
	GN9EHbKyPcu5UEwtJlGJSF0ayRdrtebRWxyMm/VDD8Zn7XKlYhl8WbVWelcqVH2DYdtmWGy1dNJ
	53BtlLgWY4bc47ihSHBiw1QjdBSfjv3edaOzmFpel7O4l8v0A+l45FrdB7X+Cfm8to8vI2wVeON
	XQDbaCyyWwny06GT+TSZiv08YmdEu2kYoq/U2KReEkEs3aT6Bsmbo1PCqNKdxL1ylVSF/P7L+mH
	be0tTFfvS98XPf0j5m8R4/G0qNn5Rsv8FyuwnHejAsBlZJfQJpbOSKFtuWI9oHoB8dKa9f8M7q8
	M0rU0idS3VhKECA3V5IV9navYDf15onWd973SWbhCp
X-Received: by 2002:a17:902:d4c7:b0:2c9:b8e5:5741 with SMTP id d9443c01a7336-2c9b8e557dcmr55818535ad.35.1782732047619;
        Mon, 29 Jun 2026 04:20:47 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63d09f0sm92759085ad.56.2026.06.29.04.20.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Jun 2026 04:20:46 -0700 (PDT)
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
Subject: [PATCH v5 0/6] mm/zswap: Implement per-cgroup proactive writeback
Date: Mon, 29 Jun 2026 19:20:26 +0800
Message-Id: <20260629112032.20423-1-jiahao.kernel@gmail.com>
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

This patch series introduces a "source=zswap" key to memory.reclaim
cgroup interface, allowing users to proactively write back cold compressed
data from zswap to the backing swap device. When specified, this key
bypasses standard memory reclaim and exclusively performs proactive zswap
writeback up to the requested budget. If omitted, the default reclaim
behavior remains unchanged.

Example usage:
  # Write back 10MB of compressed data from zswap to the backing swap
  echo "10M source=zswap" > memory.reclaim

Patch 1: Fix missing global shrinker when memory cgroup is disabled.
Patch 2: Extend shrink_memcg() to support batch writeback and update its
  return value semantics, thereby improving the writeback efficiency in
  the shrink_worker() path.
Patch 3: Extract a reusable writeback helper zswap_shrink_one_memcg() from
  shrink_worker().
Patch 4: Extend the memory.reclaim cgroup v2 interface with a new
  "source=zswap" key, allowing users to trigger proactive zswap
  writeback up to a requested budget.
Patch 5: Add the zswpwb_proactive_b stat to track the compressed bytes
  of proactive writeback for better monitoring and tuning.
Patch 6: Add tests for zswap proactive writeback.

v4->v5:
  - Add a new patch to fix missing global shrinker when memory cgroup is disabled.
  - Simplify batch writeback logic in shrink_memcg() and improve comments.
  - Refactor the writeback retry helper out of shrink_worker().
  - Replace the "zswap_writeback_only" memory.reclaim key with a more
    extensible "source=zswap" key, leaving room for selecting other
    reclaim sources in the future.

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

[v4] https://lore.kernel.org/all/20260618044857.69439-1-jiahao.kernel@gmail.com
[v3] https://lore.kernel.org/all/20260526114601.67041-1-jiahao.kernel@gmail.com
[v2] https://lore.kernel.org/all/20260525122242.36127-1-jiahao.kernel@gmail.com
[v1] https://lore.kernel.org/all/20260511105149.75584-1-jiahao.kernel@gmail.com

Hao Jia (6):
  mm/zswap: Fix global shrinker when memory cgroup is disabled
  mm/zswap: Support batch writeback in shrink_memcg()
  mm/zswap: Extract a reusable writeback helper from shrink_worker()
  mm/zswap: Implement proactive writeback
  mm/zswap: Add per-memcg stat for proactive writeback
  selftests/cgroup: Add tests for zswap proactive writeback

 Documentation/admin-guide/cgroup-v2.rst     |  22 +-
 Documentation/admin-guide/mm/zswap.rst      |  11 +-
 include/linux/memcontrol.h                  |   1 +
 include/linux/zswap.h                       |   7 +
 mm/memcontrol.c                             |   3 +
 mm/vmscan.c                                 |  24 +-
 mm/zswap.c                                  | 239 +++++++++++++++-----
 tools/testing/selftests/cgroup/test_zswap.c | 161 ++++++++++++-
 8 files changed, 410 insertions(+), 58 deletions(-)

-- 
2.34.1

