Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5219343E
	for <linux-doc@vger.kernel.org>; Sat,  4 Apr 2026 01:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775265744; cv=none; b=uoi6iDLWic11CnBZLsjt5M68m4GuCObiWV8rv+NJXWNktGGvExkDXTcUVrbzj55AzIcs7BpcvtkGrw1zM6d9jDfEf8qb85w7Rjb874qkKrYdnDkeAzTZta3RWFtRsZUc1wB2kfsTVI2pflskKc8w421dB67wz9jRdxZstSljvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775265744; c=relaxed/simple;
	bh=EL1Cvs/C4hlC49ffFecfKC9loTfQoPdIpNRLNU/vPFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXoBGrvk3Oz5IE/0CQo5TbZBLn0VpWtCDpKzf2psQK3P8pk/7KLvHdE9E0z2sKHnB5DgtnWMxmDs87H+s8guaS4lfEQIsFHhhzbQ/wx3GjLRncW4pIg+Vk3VQR5PC3EViThS8CaTXQXM5BF/djQxQcrZqUu8AqY+xPpKO1nr+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHDHvqqc; arc=none smtp.client-ip=209.85.160.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHDHvqqc"
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-4042fe53946so943029fac.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 18:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775265741; x=1775870541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pcK6sHgPs6gP5Y6uAT692eRrV9NjZEVTLIRYHBLXl5s=;
        b=OHDHvqqcmjMAeWb0CRQ2n9CAXj+RbQPUZGoUiCOMbFi8dJQk5KFigl2EcGasgOXG2D
         jA0/v3XO5BWfRX38iLHlVdSNXMIKjv6tZecmmTHkNIX3avGjIPpDcOUmgvGnUuv8fAlo
         IHTms6kBsIfblUA6Zcyn24F0BecO8tQ+IMjlusiLornO5d6Jeh6HTXF7XoDtU8iT7tPc
         zQT0tZrgQIo5/vglDwUZ3UQXGXnJsiQEziKbn7oDXfY9Eex6HMP+T6qVWvWeoHnFB2Ku
         BJt2elP2WV4zAEr2QNoQHJ7AIGmQhsMFDXJoCQz3Qm/PziFdmGYikJVnDTyh34U0u5JF
         47Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775265741; x=1775870541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcK6sHgPs6gP5Y6uAT692eRrV9NjZEVTLIRYHBLXl5s=;
        b=cx5lgQ40Lp6HBgZjEisATqPYaL2Ze4VCymNhCFYlhdyA8UCxh3njX6pG/7uXT63ljz
         VPOePjdMMrvgunCplpsegynI9+nHfh4lGRypdNGh/rqxMJUhIjPmcDqewwBwhmGc/LnS
         oPNRi7UoDKtaHSr948xBnnvv/nJ5+P5n6gddKGdcDKoJrC4p98Q/85A5FNkDgPwG98fL
         VIo0i4ie0suNvI3LH7S/SR54Q6QHtAaYgW75wmi/5zbn8pro3t8Ay0kF4SRuFaCKx6qR
         Up/EB5ZvUnoNrwSY41MTt/s6xQHIbUSjKtLrTU9+wzAfGu98CrscUTQgYVTAoG1qtv2/
         Twew==
X-Forwarded-Encrypted: i=1; AJvYcCXEXFmIeYR5dt/7yiWgvfiAEw92bGrkq3L+LkLufGQnZtayC/9oc+ZjJP2wxELmThu6oN7/s3CLGZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGxjtsG0cSboAQV1n81OyKL6hO5HHrzP4/eqWKrNzclcbIw6j
	2eDKmyPjWsRZz6jQdyOvVo39hjTn3g+Z68/PIS4eJXPvF9+Abp/LS6bTXSzngAjktw==
X-Gm-Gg: AeBDies67Oz9YH6RhJQ4QVIX0SFOmAi2S/PoigVsjusY+FP63iL/a999hCoQKm+E6ar
	UZ7/3mUJ+z9zNpq7Anhlnyao20GCMTUi25rFrYNZA/Rl5sXvshcyEbtsJPMi92j1fRBIDdvzqqK
	n2wLmmLaSyTxpbOLmoxEOpULW/nbtMBDFu/r78gmZJuw0S0oXcHAzkviGBeh70lMwmyAbyt8G2o
	0BSrSxM/11XFa8IzNah47XnFJ75tjAE3Kw4rbn+IA8lReUSXBI4+kNLIBqnxZeVluI3hs8xB/SI
	KT9y+qmHNpcMUndDZqCupw8Q+wM3I21XrMI1y3HF1sK/F9JWsFwWPKi+fBxozt1Tl7ND3lUBsGM
	2pQiveTR67AcEC3aIRzA+mSUIpTXfI/GtmIijUOG6CYYic0nXEF42nhiG/wDyvEdq8JpYXqhzX/
	La3ItEhEXZNTbvHdEPNznurg==
X-Received: by 2002:a05:6870:1718:b0:41c:b780:93c with SMTP id 586e51a60fabf-4230fbedf40mr2606467fac.8.1775265741311;
        Fri, 03 Apr 2026 18:22:21 -0700 (PDT)
Received: from localhost ([108.147.99.33])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-422eb3c8282sm6117376fac.13.2026.04.03.18.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:22:20 -0700 (PDT)
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
	ravis.opensrc@gmail.com
Subject: [PATCH v5 0/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Fri,  3 Apr 2026 18:22:14 -0700
Message-ID: <20260404012215.1539-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces two new DAMOS quota goal metrics for controlling
memory distribution in heterogeneous memory systems (e.g., DRAM and CXL
memory tiering) using physical address (PA) mode monitoring.

Changes since v4:
=================
https://lore.kernel.org/linux-mm/20260320190453.1430-1-ravis.opensrc@gmail.com/

- Fixed commit message description for DAMOS_QUOTA_NODE_INELIGIBLE_MEM_BP
  per review feedback
- Added clarifying comment for ops-common.h include (for damon_get_folio())
- Fixed build error when CONFIG_DAMON_PADDR is disabled by adding
  #ifdef CONFIG_DAMON_PADDR guards around functions using damon_get_folio()
- Dropped RFC tag per maintainer feedback

This patch is based on top of damon/next.

Background and Motivation
=========================

In heterogeneous memory systems, controlling memory distribution across
NUMA nodes is essential for performance optimization. This patch enables
system-wide page distribution with target-state goals such as "maintain
30% of scheme-eligible memory on CXL" using PA-mode DAMON schemes.

What These Metrics Measure
==========================

node_eligible_mem_bp:
    scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000

node_ineligible_mem_bp:
    (total - scheme_eligible_bytes_on_node) / total * 10000

These metrics are complementary: eligible_bp + ineligible_bp = 10000 bp.

Two-Scheme Setup for Hot Page Distribution
==========================================

For maintaining hot memory on DRAM (node 0) and CXL (node 1) in a 7:3
ratio:

    PUSH scheme: migrate_hot from node 0 -> node 1
      goal: node_ineligible_mem_bp, nid=0, target=3000
      "Move hot pages from DRAM to CXL if more than 70% of hot data is
       in DRAM"

    PULL scheme: migrate_hot from node 1 -> node 0
      goal: node_eligible_mem_bp, nid=0, target=7000
      "Move hot pages from CXL to DRAM if less than 70% of hot data is
       in DRAM"

The complementary goals create a feedback loop that converges to the
target distribution.

Testing Results
===============

Functionally tested on a two-node heterogeneous memory system with DRAM
(node 0) and CXL memory (node 1). A PUSH+PULL scheme configuration using
migrate_hot actions was used to reach a target hot memory ratio between
the two tiers. Testing used the TEMPORAL goal tuner available in
damon/next and mm-unstable.

With the TEMPORAL tuner, the system converges quickly to the target
distribution. The tuner drives esz to maximum when under goal and to
zero once the goal is met, forming a simple on/off feedback loop that
stabilizes at the desired ratio.

With the CONSIST tuner, the scheme still converges but more slowly, as
it migrates and then throttles itself based on quota feedback. The time
to reach the goal varies depending on workload intensity.

Note: These metrics work with both TEMPORAL and CONSIST goal tuners.

Ravi Jonnalagadda (1):
  mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal
    metrics

 include/linux/damon.h    |   6 ++
 mm/damon/core.c          | 186 ++++++++++++++++++++++++++++++++++++---
 mm/damon/sysfs-schemes.c |  12 +++
 3 files changed, 190 insertions(+), 14 deletions(-)


base-commit: 97eefd14af390e1921f1fc5507140025095634e0
-- 
2.43.0

