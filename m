Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C712C344DBD
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496725; cv=none; b=bXuvy6KntE02xTQKDNhrDK/kuKdSecNYGtpP9Z+7MNiIm4+xK7QLh8VI/8lFNY2HVNS8u1tOf0P/esFX1cdQH3pDwopX0Mcn4O6sWvk5drHobF0o+zqkbjrlijLz9BuW0R5CXivpY4p5Tyd2xQg95dcCy0+Ov4HrSxM17mAI7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496725; c=relaxed/simple;
	bh=XnB/2JOHyehUPoJKRScL1gkzyR01b6jxo9UdjDLCTJE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P2c6Eaxba2THfIOtfZrN/zZ+h7u/6N+SDnGsfLAfpZEXSYS28H9V5H93CulG3RvWnil8S4vYxSDuUOFaAiGEo+iuyULHlhq6QA6oaqdy3qrrohEYQmmKT91AXqYjecQHjEMGkF2/R3c2TtDrdbWSsP0oezZ9bLb6lhb7TxyJfiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFdoS2Ly; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFdoS2Ly"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so37792825ad.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496722; x=1779101522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg9BoGIRQX9a4/FMAbkw8BJqSowvqCXDuFdaccaN4l4=;
        b=YFdoS2Ly+orE5uvjoFsHg9X1qIWh7dNOZ+nRO9bhhJ/XSMLlf3PZY9/RbXvSxjEL71
         hdA+cjmL8fa2mmcDlmaPVeZfxeBYzfBFC8AdIaG1Lzmj7e3W28j91OBVAv3Ub5b+sitj
         6XcLAEqKoMuot10kqVYwBcXJm80EMDQyhXngb/1lXcoaGPITrzaglUibiQzeJYsoM8RJ
         UWCqI7rf9WG0VgL246pQEMX+71ge2Te5nThkky0O9i4baS1pRdGvldtjwD+zAAwnkIHI
         PKrwPrYCEl8Q8mqCeXuC4fYfA1Ij7SOuPaTG4CvwKbD0C+I2CeHzg6/DgfFlBFjSX8Uw
         2tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496722; x=1779101522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg9BoGIRQX9a4/FMAbkw8BJqSowvqCXDuFdaccaN4l4=;
        b=regzEjftY4blxa+RNecr8IusbIeTftXnYcX/r3vTMVmp4glyfpigej2mVFoiHFqlkC
         iIHvSlxDWEFIkJE4afc5S49mGhdLpUQHTDU7mJP27J1zYoZMnnXZgTXRUNwmTCmF+tzP
         3Z0ydhZOePv/10G/iGcfENLyv3YCyBw5gHE6B18WUTUUlFlcaeG6UjsO9cTCTEpo6w7p
         zQMvI6XNlV0Bliu/vXczwMaX3EDl1T6P8PY0AgT+iWpDGX3pwaN8xxQSL/IrU0QYdFIy
         atp9AV+Y7lHHlLNWsOum3US/XdlJe+0ejaXYiungDOWYorAMuAGMMTDU9B4rx2rVlnn2
         PDeg==
X-Forwarded-Encrypted: i=1; AFNElJ+vYZKfI3sLCLknCr6xW0xHBeLDOhReJTEovgs2s0LygO8K1R8DeplmlppQ9yhtkav6o1q9PpuB1AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3bIcM3SPZSlUxE23Rbca3T2y4/f/AdtxHlVu33fd/c1yvGmg
	dBIi5oICzGYONvv+dtG6+zRj0lJJMB474xml71CRFnWhMzbgVZWwH9Ig
X-Gm-Gg: Acq92OF+VUsO9gluagR8dOXystvP/ylAwm4WA3nSzdytWtiOmhprgQHywXHdfWsRwPJ
	tjJ1s0jd2fwHEPRRoTm5/ta6ctrUHUb/Fxa2qXJtP24c33OjKs4juslUoh4hPxGiVXmR8rAPFku
	UF/NPW9ZcSxWjiqZLTj9NEdnkBBwuc9ATTi9ibyTeneOHjqoeQ7EXZE/1BxXIpatqKbtuPYAajv
	80Vb/rWGgwbb/pvM0ft/ZbGRkMo/BGQdlr3TM/X6ii8WqfqZ1SoPCLYuV2SH4Urm2MJvP1k3283
	kuWqhd8tEifnYdeoKuA927eDVP2Ekz2plRPR0VYMfPGMcqiYWxtgGZSs4I9GsRTM1r34p3eFXdw
	TO1KGbyddfyESAtBylUP0vylDfKqfuBJrdm5WDS1dm6faUblHznosrxokuBkvouceAnyyUvqSTl
	IUYPdQvlD++InbSynrTxnVmajYP8eXf6+36CgpES0RNdHXXrF1hkGlSiR4W4o0Fw==
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr266735895ad.17.1778496722209;
        Mon, 11 May 2026 03:52:02 -0700 (PDT)
Received: from localhost.localdomain ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm98571745ad.32.2026.05.11.03.51.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 May 2026 03:52:01 -0700 (PDT)
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
Subject: [PATCH 0/3] mm/zswap: Implement per-cgroup proactive writeback
Date: Mon, 11 May 2026 18:51:46 +0800
Message-Id: <20260511105149.75584-1-jiahao.kernel@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hao Jia <jiahao1@lixiang.com>

Zswap currently writes back pages to backing swap devices reactively,
triggered either by memory pressure via the shrinker or by the pool
reaching its size limit. However, this reactive approach makes writeback
timing indeterminate and can disrupt latency-sensitive workloads when
eviction happens to coincide with a critical execution window.

Furthermore, in certain scenarios, it is desirable to trigger writeback
in advance to free up memory. For example, users may want to prepare for
an upcoming memory-intensive workload by flushing cold memory to the
backing storage when the system is relatively idle.

To address these issues, this patch series introduces a per-cgroup
interface that allows users to proactively write back cold compressed
pages from zswap to the backing swap device.

Users can trigger writeback by writing to this interface with the following
parameters:

- "max=<bytes>" : Optional. The maximum amount of data to write back.
    (default: unlimited).
- "<age>" : Required. The minimum age of the pages to write back
    (in seconds). Only pages that have been in the zswap pool for at
    least this amount of time will be written back.

Example usage:
  # Write back pages older than 1 hour (3600 seconds), max 10MB
  echo "max=10M 3600" > memory.zswap.proactive_writeback

Patch 1: Move the global zswap shrink cursor into struct mem_cgroup as a
  per-memcg zswap_wb_iter, so patch 2 can scope writeback to a given memcg
  and make forward progress across its subtree on repeated invocations.

Patch 2: Add the memory.zswap.proactive_writeback cgroupv2 interface,
  allowing users to trigger writeback with optional size limit and
  age threshold.

Patch 3: Add a zswpwb_proactive counter to memory.stat and /proc/vmstat
  to track the number of writebacks triggered by proactive writeback.

Hao Jia (3):
  mm/zswap: Make shrink_worker writeback cursor per-memcg
  mm/zswap: Implement proactive writeback
  mm/zswap: Add per-memcg stat for proactive writeback

 Documentation/admin-guide/cgroup-v2.rst |  28 +++
 include/linux/memcontrol.h              |   6 +
 include/linux/vm_event_item.h           |   1 +
 include/linux/zswap.h                   |  17 ++
 mm/memcontrol.c                         |  80 +++++++
 mm/vmstat.c                             |   1 +
 mm/zswap.c                              | 303 ++++++++++++++++++++----
 7 files changed, 390 insertions(+), 46 deletions(-)

--
2.34.1
