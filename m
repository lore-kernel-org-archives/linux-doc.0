Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903439FD4
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849970; cv=none; b=e/L43lHzrUGUBqQ3XFSwX5KBPCENlf6zBRab7vre2xcn31xyoJbDWkowe1M86u435gV3VhXaodNt/yiaF/8cTCWHwhl4biqFrMX0lNLdO8/DBOsZUy6dYFdjN3IX7WhSYDX/ZRxrxi/Bm2KmiCRIHB8M4rDFTyLIjtFy+TO939U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849970; c=relaxed/simple;
	bh=/hjWTF7tNqiQ5Nwhak3xS55/6KhpCzuSKrhD8waOpgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0Vf/5Ja3Wzl8JRlP5iZVaHDws3gLbvcaS4QRZuw3EnpP1yxyUPNXqy7m1kw7aysRPlCVN/J0STgLxs3O08ZRWx444wO1T5ThUaVrhT14mJhnsgIWBvnmqMuPLdX1UTSTEIz09Ry87bT4iJVeIBr8xQHof++Eo9ZZcYMjgbp7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxoT3GQZ; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxoT3GQZ"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824a3ba5222so2231174b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 04:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771849968; x=1772454768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWeTUTocNncqBZlX9GEiXOVVLoIbjlo/yvE3a+/Ll3A=;
        b=MxoT3GQZBDCMSPzyJGZZ49AzP2j9RPE/690TW8eodyeQqs/FNGnuJaTfI18ICfpB3f
         zY1aHmMvZHJXMqJQEyxEYsv7h0JhaxDyLu3CVnNylCZ66XAf2q2FnHCuSmUmzX/LMeHY
         nehHPeMSCtLfnHbCZjKUDwMaBnHG+Aq6mDCuH4FgH1y2e6ZBxQp7LGA429LcRV7WfyXd
         v/4V0t23wivcghK0Eu3acaAtjf/j1AYCv21BTDckt1TcZ6gMGCq28wNSeGUG/CWawvFF
         F6+g1VKDKqW3NSUG82wqSAfeD6M4P/WXXNi2/QreMYhcn1RrnfyHJjNkc5k2OSCs31mW
         m79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771849968; x=1772454768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWeTUTocNncqBZlX9GEiXOVVLoIbjlo/yvE3a+/Ll3A=;
        b=ZrNL26PnsPCiXhKenZELQ+7u5L0Wf/fKJhPXcqFTTEuFXHkD7oQzGTnEM7NeAtGxED
         vh0W/UCQdT0aB5AjAOAkoldjoTKfTWWlzV2foIjn6IgPSmjF1oKWLIZ7Wddm7OCvELo4
         I7sc05bDyZT5zo5DuBfGaXL1A86kO5e+Qc4mT0Njs5BkdKu5yRccOUnfS5eUq4S5sbta
         8fSF2TQ95LCpdexmKOJC+lwMB2Fe8y/E1sTQaGf/24r6Zk+ycpvGO6/8Ve/1IDllMZRg
         rbvNFyGu3PMY+8MZfAzr53ZrBrMRVugpCdtGIizM1w7tmafXlLSy/uas33BaLb+2hv0R
         Y0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWcw8V1Bz14RvLvslfRMr/iVBAOci1PGKpHd1Iq29UwHZehGjYNvLmqBDbG2MQsKJ8it8s9UlDfQcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhkBJoyZU+wks8Pv1+FRrR9Z6jQAYHwj870abMIMd2mNjHiO4Y
	TORJ3ezOGe+yocv2f6MnITzYHqjoKO3FiJJi3XhDwL2pKgujLTLfRpU=
X-Gm-Gg: AZuq6aKIFWLLNWgacr5t1HpX73SrXxlEeQEqa01VfBPtydTqzDKzvPaUpiZDfy4qGZu
	qTpveIW8sLUFXgUGhfVNoTTBdQiSgUZ5oIT+JdngsbIjHPhMPUud2pkguzLEL5YFtZCStjSHp1Y
	SnnzPN09nEdIke4/4JS8chrPGgyKMzI3QcaYUGmVRzSa4/n6HRL0LGoKksNW9zE8z3G5n/V7KJB
	auvZ/wIQQAKvlz7Gvzfcv+CoZ67by1a/xT3iyJPbKuDnYLBdLqkCQsWmsul/yScl/v8xm1tO4KV
	m8GQj4VX8/0KvQ3qg+2Zskuk7kN/PyWRFktlA5Ig72KMM9no44rZX6zXgoQIsUxdaw2bDgxr9zO
	BJWlrUsLiODZwtU6IlEmAZHEIaqQnEJM63Q+U0+QMQf0iRbVTdqCVrsq1cnxUS5o2S6R/q8qe7X
	LdNupbpyNXMop6x7vTaL+/69Mb4tAOn+URFoH5X0qfXmgucn7SF70SroU=
X-Received: by 2002:a05:6a21:6b12:b0:334:96ed:7a75 with SMTP id adf61e73a8af0-39545ed4a53mr7607282637.24.1771849968248;
        Mon, 23 Feb 2026 04:32:48 -0800 (PST)
Received: from LAPTOP-FDBL0TVI.localdomain ([49.37.157.71])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a73e1sm7454739a12.13.2026.02.23.04.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:32:47 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH v3 0/4] mm/damon: Introduce node_eligible_mem_bp and node_ineligible_mem_bp Quota Goal Metrics
Date: Mon, 23 Feb 2026 12:32:28 +0000
Message-ID: <20260223123232.12851-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series introduces two new DAMON quota goal metrics for controlling
memory migration in heterogeneous memory systems (e.g., DRAM and CXL
memory tiering) using physical address (PA) mode monitoring.

v2: https://lore.kernel.org/linux-mm/20260129215814.1618-1-ravis.opensrc@gmail.com/

Changes since v2:
=================

- Split single metric into two complementary metrics:
  * node_eligible_mem_bp: hot memory present ON the specified node
  * node_ineligible_mem_bp: hot memory NOT on the specified node.
  This enables both PUSH and PULL schemes to work together.

- Added PA-mode detection lag compensation cache (see dedicated section
  below for design details).

- Added fix for esz=0 quota bypass that allowed unlimited migration when
  goal was achieved.

- Added fix for goal_tuner sysfs setting being ignored due to
  damon_new_scheme() always defaulting to CONSIST.

- Rebased on SJ's damon/next branch which includes the TEMPORAL goal
  tuner required for these metrics.

Background and Motivation
=========================

In heterogeneous memory systems, controlling hot memory distribution
across NUMA nodes is essential for performance optimization. This series
enables system wide hot page distribution with target-state goals like
"maintain 30% of hot memory on CXL" using PA-mode DAMON schemes.

Two-Scheme Setup for Hot Page Distribution
==========================================

For maintaining 30% of hot memory on CXL (node 1):

    PUSH scheme (DRAM->CXL): migrate_hot from node 0 -> node 1
      goal: node_eligible_mem_bp, nid=1, target=3000
      Activates when node 1 has less than 30% hot memory

    PULL scheme (CXL->DRAM): migrate_hot from node 1 -> node 0
      goal: node_ineligible_mem_bp, nid=1, target=7000
      Activates when node 1 has more than 30% hot memory

Both schemes use the TEMPORAL goal tuner which sets esz to maximum when
under goal and zero when achieved. Together they converge to equilibrium
at the target distribution.

What These Metrics Do
=====================

node_eligible_mem_bp measures:
    effective_hot_bytes_on_node / total_hot_bytes * 10000

node_ineligible_mem_bp measures:
    (total_hot_bytes - effective_hot_bytes_on_node) / total_hot_bytes * 10000

The metrics are complementary: eligible_bp + ineligible_bp = 10000 bp.

PA-Mode Detection Lag and Cache Design
======================================

In PA-mode, when pages are migrated:
1. Source node detection drops immediately (pages are gone)
2. Target node detection increases slowly (new addresses need sampling)

This asymmetry causes temporary underestimation of hot memory on the
target node. Without compensation, the system keeps migrating even after
reaching the goal.

The cache addresses this by remembering how much was recently migrated.
When calculating effective hot memory:
- Source node: reduce detected amount by recent migrations out
- Target node: boost detected amount by recent migrations in

The cache uses a rolling window to track migrations over time, and
expires after a configurable timeout (default 10s) when no migration
activity occurs. It also detects when its baseline becomes stale due
to new hot memory appearing in the workload.

Dependencies
============

This series is based on SJ's damon/next branch which includes:

- mm/damon/core: introduce damos_quota_goal_tuner [1]
- mm/damon/core: set quota-score histogram with core filters [2]
- mm/damon: always respect min_nr_regions from the beginning [3]
- mm/damon/core: disallow non-power of two min_region_sz [4]

[1] https://lore.kernel.org/linux-mm/20260212062314.69961-1-sj@kernel.org/
[2] https://lore.kernel.org/linux-mm/20260131194145.66286-1-sj@kernel.org/
[3] https://lore.kernel.org/linux-mm/20260217000400.69056-1-sj@kernel.org/
[4] https://lore.kernel.org/linux-mm/20260214214124.87689-1-sj@kernel.org/

Patch Organization
==================

1. mm/damon/sysfs: set goal_tuner after scheme creation
    - Fixes goal_tuner initialization order in sysfs scheme creation

2. mm/damon: fix esz=0 quota bypass allowing unlimited migration
    - Ensures esz=0 stops migration rather than bypassing quota entirely

3. mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
    - Adds the two complementary metrics for hot memory distribution control

4. mm/damon: add PA-mode cache for eligible memory detection lag
    - Implements rolling window cache to compensate for PA-mode detection lag
    - Adds configurable cache timeout via sysfs

Testing Status
==============

Functionally tested on a two-node heterogeneous memory system (DRAM + CXL)
with PUSH+PULL scheme configuration.

This is an RFC and feedback on the design is appreciated.

Ravi Jonnalagadda (4):
  mm/damon/sysfs: set goal_tuner after scheme creation
  mm/damon: fix esz=0 quota bypass allowing unlimited migration
  mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal
    metrics
  mm/damon: add PA-mode cache for eligible memory detection lag

 include/linux/damon.h    |  51 ++++
 mm/damon/core.c          | 496 +++++++++++++++++++++++++++++++++++++--
 mm/damon/sysfs-schemes.c |  43 ++++
 3 files changed, 576 insertions(+), 14 deletions(-)

-- 
2.43.0

