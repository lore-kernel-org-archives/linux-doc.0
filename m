Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B36C328B47
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769723902; cv=none; b=exJqrJodGH6E6hDuImpKcsU/VKX4b0JYEV0WxQEP18y+VjrlqvnSppVtMdB2mqd09q8b/tv3xCwmOVnqY5qtKXdJQI0LyQibI+FsEM9WIQ/9lrH/yCIv1bROqe/+lSqesmp/v5ibpFQxOyzbpalOFa9isMqXREjedMI2ePi8kT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769723902; c=relaxed/simple;
	bh=fy8EK8PWQZsqSffsYil7YART3hXT+T+mHqmJlgR9iak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHtoJt5Fwq5UWJ1ZZPGqUkkCiLMvO4/ec7DaN+ld2khedat/j2VJNwJ5B8G7WPE8tf8OIJNakSdWjNZuUHatwIjGL1/yyOcbCPgGODkTeOK8sblmv7u9rblHTanfEcG4HilXK9YnCqf3K28YrFfw2sXcEuIcoYxlrrldM/Ydzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S92czNi+; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S92czNi+"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-124b117776fso1210448c88.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769723899; x=1770328699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C7ZtJvE3dpFWqwjZMa9omEQRwNhNuc19ZVJnJ8avCkY=;
        b=S92czNi+H451hgemOy+W5F1/y4kf5iqH5bpIibV/Ej1PVo4uXenK5tG0hcZp9Qtb57
         4fowGgde1H6EdC3GgaIFUvnmqRxMVNDFXTGmFYaRftUR9iOid7e2Sn56UHKiXnerPVqz
         8nQeEZTZP4Uso9D/8Gf+Ds5JQ3uW/PHH4ENdYKm/ReTujTAkg4Gkyt2Y/Pav4XucxhnX
         MxFxBL8AR8uRkdxFwOuUNqZdAxD09PmJe68Bk8XMXwIr7/o2I6gKNJpSpQh6y5+BZktY
         J4Moxf6m/WZqLVfPTgtTT9/ZN8vrtZ8le5I+4KGRC+XHn+eR9S7nuvuvF6cWFW0MFrVg
         Buww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769723899; x=1770328699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7ZtJvE3dpFWqwjZMa9omEQRwNhNuc19ZVJnJ8avCkY=;
        b=jeDkVMzqC3BxDU5C4YpZoAylUnCTIbQj2JfJVEiodtA6eJe+UQKKfciJimqf5wmyQk
         ejGIBi4ORlzgzQEHAZubD3RncCSOuGrUtsuR+evlQhLzP+6ZILNzNDnaM4HlNRxrNP/Q
         k162NF50kT3RZ0oFeJK24jWH9Nb3GeD/5HlUwE7bdWLfQgCs4ltUUo10QzLAoczApU02
         ymLtaMpUVK0NLXEXiJEsF4JI4e3TdIldomdAmIwsBYnRrxuqX9r4WwYOirUHsIsCnjhd
         u4feBSxTttJfz3sEPsiZ2Kr7gnguoo0QbXfuKxrrJrr3yCGi4uLaf1eLIzpaZBBY8k4B
         nbqA==
X-Forwarded-Encrypted: i=1; AJvYcCVODKZCaka95RnubQ58veZPGs7qNJ9KEiSm0+oYN5naDXrpqPo2xl8jzDVQLLWswyIu96sf/boGJeI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSiZ0HVAhrYQOqqvmRMoOA72uMuVmdaH4sF8ufLTPtvnxUwF24
	ewOmyxOwB1TAAHN4wCkeWDKCtLN9uHpRo7aHSgB/UNruMEIBMmw9OcQ=
X-Gm-Gg: AZuq6aLqrQN9woagAIfK/Fqz072V4vBXttI9jHS74uI/QnE8uBv7L4Q5gmnNVrWbrnI
	Jni2uIPBJWof6PIUv5rDGVFwedNwYIqpo8r1JrjhoxaKraoDzrQr0FKzyoxzhTq+a3GBRCcDmWj
	m7neLrW2OoOthKqIT6k07Np1mnDTPzoeWFfQaKW5mHS+ZrajINFCJCWaWizcnZLQCfGD8oGtjdb
	okt/w8qFfDKcpR5sgVx84UuoXhsKcBxGibjZZaCeNauSEn5hN2Fusf3ycYG2qP5iNx9Wd1NBpmU
	moM7labfBs7qFMMFOlhOHtWYvkKNFFTbW91AwBQG1nyKRUu5gV22KYMCr54Xi97euncB1i7Fi4u
	A6GESgC0D7F9hncmIwQ7vE3WOqx5B4xUV+10GqC5rD3+ffdVnqvh0SKglLcBK+My80Qfl0RiRDg
	12jhjjrCZXAw==
X-Received: by 2002:a05:7022:68aa:b0:124:a610:62f6 with SMTP id a92af1059eb24-125c1006e73mr427951c88.44.1769723899034;
        Thu, 29 Jan 2026 13:58:19 -0800 (PST)
Received: from localhost ([137.201.204.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm8593035eec.34.2026.01.29.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:58:18 -0800 (PST)
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
Subject: [RFC PATCH v2 0/3] mm/damon: Introduce node_target_mem_bp Quota Goal Metric
Date: Thu, 29 Jan 2026 13:58:11 -0800
Message-ID: <20260129215814.1618-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a new DAMON quota goal metric, `node_target_mem_bp`,
designed for controlling memory migration in heterogeneous memory systems
(e.g., DRAM and CXL memory tiering).

v1: https://lore.kernel.org/linux-mm/20260123045733.6954-1-ravis.opensrc@gmail.com/T/#u

Changes since v1:
=================

- Renamed metric from `node_sys_bp` to `node_target_mem_bp` for consistency
  with existing node-related quota goal metrics (node_mem_used_bp,
  node_mem_free_bp) as suggested by SJ.

- Fixed the metric calculation:
  * Numerator: Now correctly counts only scheme-eligible bytes (regions
    matching the scheme's access pattern criteria).
  * Denominator: Now uses node capacity instead of total system memory.

- Removed the get_goal_metric() ops callback. The implementation now
  resides in core.c, following the existing pattern for other metrics
  that have ops-layer dependencies.

- Removed the early-exit optimization patch. As SJ noted, this would
  introduce a behavioral change for existing users and should be an
  opt-in feature with a properly designed interface. This can be
  addressed in a separate follow-up series.

- Removed capacity clamping logic (was tied to early-exit behavior).

Background and Motivation
=========================

A previous patch series [1] added weighted interleave support for DAMON
migrate_{hot,cold} actions for vaddr schemes. That approach requires VMA
offset information to determine target nodes, which for paddr schemes
would require costly rmap walks.

This series takes a different approach for PA-based migration control
using basis points (bp) target-state goals instead of weight-based
action rates, avoiding the need for rmap walks entirely.

What This Metric Does
=====================

The `node_target_mem_bp` metric measures:

    scheme_eligible_bytes_on_node / node_capacity

expressed in basis points (bp, 1/10000).

"Scheme-eligible bytes" are regions that match the scheme's access pattern
criteria (size, nr_accesses, age). This allows users to specify goals like:

    "Migrate hot pages until node N contains X% hot memory"

Unlike weight-based approaches that specify ACTION RATES, this metric
specifies a TARGET STATE, which naturally prevents oscillation issues
that would occur with weight-based PA migration without rmap.

Two-Context Setup for Hot Page Distribution
===========================================

For distributing hot pages between two NUMA nodes (e.g., DRAM node 0 and
CXL node 1), two DAMON contexts work together:

    Context 0: monitors node 0, migrate_hot -> node 1
      goal: node_target_mem_bp, nid=0, target=6000
      "Migrate hot pages out when node 0 exceeds 60% hot"

    Context 1: monitors node 1, migrate_hot -> node 0
      goal: node_target_mem_bp, nid=1, target=4000
      "Migrate hot pages out when node 1 exceeds 40% hot"

Each context migrates excess hot pages to the other node. The system
converges when both nodes reach their target hot memory ratios.

Complementary to Existing vaddr Migration
=========================================

This series complements rather than replaces the vaddr weighted interleave
migration:

  vaddr migration (weight-based):
    - Per-process control
    - Fine-grained interleave patterns via VMA offset
    - Deterministic placement based on weights

  paddr migration (bp-based, this series):
    - System-wide control
    - Target-state goals for node capacity management
    - No rmap overhead

Patch Organization
==================

1. mm/damon/core: add DAMOS_QUOTA_NODE_TARGET_MEM_BP metric
   - Adds new enum value and documentation

2. mm/damon/core: implement NODE_TARGET_MEM_BP metric calculation
   - Adds damos_get_node_target_mem_bp() function
   - Updates function signatures to pass ctx and scheme through call chain

3. mm/damon/sysfs-schemes: expose NODE_TARGET_MEM_BP metric
   - Exposes metric as 'node_target_mem_bp' in sysfs

Status
======

These patches have been compile-tested but have NOT been tested on actual
hardware. Feedback on the design and approach is appreciated.

References
==========

[1] mm/damon/vaddr: Allow interleaving in migrate_{hot,cold} actions
    https://lore.kernel.org/linux-mm/20250709005952.17776-1-bijan311@gmail.com/

Ravi Jonnalagadda (3):
  mm/damon/core: add DAMOS_QUOTA_NODE_TARGET_MEM_BP metric
  mm/damon/core: implement NODE_TARGET_MEM_BP metric calculation
  mm/damon/sysfs-schemes: expose NODE_TARGET_MEM_BP metric

 include/linux/damon.h    |  5 +++
 mm/damon/core.c          | 66 +++++++++++++++++++++++++++++++++++-----
 mm/damon/sysfs-schemes.c |  5 +++
 3 files changed, 69 insertions(+), 7 deletions(-)

-- 
2.43.0

