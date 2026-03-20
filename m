Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1C3254B2
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774033502; cv=none; b=UqU5a9NRQfJJbL4j2tG+vBV93PEYMKHaCkrS8aNc4Nl4PXPXjvg247yOZkjoWxpdcpD+b+IBuWRe4gju/lvk+qq/Y8CYG0imQb0CfXzxFQ9qVdNzoxaCsB3meeSfM0iXoNCGiRMyXY+6GEs+uTUtiDb9yB9mKV0M6wiw9mFQX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774033502; c=relaxed/simple;
	bh=38WZSCo5lv+k+5ZznusrVk4MfUht3WxQ2DgEfRCxPzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfutUjTsygXUn8GA2ABIYRop41kzVPrPOp1F01TeA6N99YiZd8ev7qDCpHFEFE4iPW05od4rtRwPO3QAtgsmU89bFsPnQZKgDddx7vs0iAx+jZDz4+jijp5zw5kY/WHjDh88Fbkrm92EtyBiYLWD53cJim3Nvz1UGod8DHebCq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKmfLGxq; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKmfLGxq"
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-64ad8435f46so1098511d50.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774033499; x=1774638299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrbpczjmQlWdU+8xGkQY54294j65e0aZRYcB8uO4mU0=;
        b=lKmfLGxqGbqGS4cUvrD8wZtX7HAtlA/xRgPcsujtfaaP4RocH4HklhMV9CLabMdID4
         W+Gl3Dk/EjLETEvo9EqcCuvYNB11Bp6n3wMe+1sS+rID96n/iP/PIhKyAZzjhQ5qutzy
         GNtPwb6ixJxvQGu6MVmLRPRQd1gJ4OmgYTXKsfDnD13judtzUP2BB5qz8yX1AqkSszGh
         CbJlSQI2N9dUBQMWPeGy7Y5GZlGcCjB1gGmgLQ8C9bNrPsnKBX7UC77jCz0r6YE0PiiT
         eJUqckgJmoh/DwkgUlz582nb0Q7thnO24SWX1xWopFY21a6XFCURKRAMUgYgUf6C0XwE
         cFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774033499; x=1774638299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrbpczjmQlWdU+8xGkQY54294j65e0aZRYcB8uO4mU0=;
        b=jTC8Rqjf3jD8EIIKi/oBFt2lTU/DbT0YCnrUC/dubb7W+q9Yeb99btu8DpeLYoL/Tm
         X+abF7yuLDkF5JrqT02kzUf5CSqYI62t88aueKJfnMO8cDYD3omT520xROgO2Zf9HE9Z
         S3u4e63SgEIPFp30x4b3Tfabx3dXRYOXwC4skUg6uImtk07AwT1JdiwBF3q+PQJ5k9nK
         Eur92EBRzzB4ov3+4PJPfHDIuWbmQHFCTQrqcuyVd/Aj3OanPBTkWufk/JulKTX65EyU
         gewz85dzBH0EW3wXRVKOeFHUlNFUy8hpYye0eHy/9MKMBwKvpA4MCK16gHHHMOEDjkcF
         ofKg==
X-Forwarded-Encrypted: i=1; AJvYcCVuX/Qv/Z01xDFAvBmb3svEbPyck9XUmeqQdXBCEYixArGvIucFGTfSuGxI0W8XW1feaGvujkLi4ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YySKbOIY2P13mc5n9QuOv9/m6/r/uj/wQm1VpCPsWdf5GByXKOq
	7RBlr1uqomGPFWtpN39jcjMumjcaV8ByK0Z+QvYkzhOFVy8hDjuteZE=
X-Gm-Gg: ATEYQzxQdHpL8q4rMPXJSGmcrUUxkhHp8kB/8sLfxNCIzn20Y2lGuNFPdSjQr1L/H9g
	5cClP3sVUB1lF699hCzqmkmB7NREpyi5qVmZbUOedPKhRacNq037vBEkteHvNd/8uGsQMtV8dKT
	npP0ELKiVmVq0w6CitlLleQDgt9PlcWZF92MDZ+uiDLwRct5i3PhbaM+mzF09oDESIQ++MKIf7C
	Z7umiNjFizQljXXPmKXShCa8g+nXteHJ959OpCTOW+lJo4LHWRr0mA9yOKYo9rlShkRnPPRlUYA
	AagUhOcnukHakrnifZmt6qNlRN+a8/8yaKzg6WeNcgtHP9Dl0AfJedfNJY66+lmvHgRKotAT7AU
	xOrykaPRTZ7P+V826fY2F66iG6iYICJBGPpcyHJeqBic3ZHBwc8bpfp+fQDQxG+LXkKpwZ9j9Rt
	k3aUXkeKkikVx755E8K/UxPyhwdjyvjZ4Z51J5t80S4Jf4c+bEbKif60dgBmp4W7r1j9KcB9PZ8
	A==
X-Received: by 2002:a05:690e:16e4:b0:649:e501:21a6 with SMTP id 956f58d0204a3-64eaa6b8bdbmr3383035d50.16.1774033499004;
        Fri, 20 Mar 2026 12:04:59 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabecf140sm1983409d50.17.2026.03.20.12.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:04:58 -0700 (PDT)
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
Subject: [RFC PATCH v4 0/1] mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal metrics
Date: Fri, 20 Mar 2026 12:04:52 -0700
Message-ID: <20260320190453.1430-1-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces two new DAMON quota goal metrics for controlling
memory distribution in heterogeneous memory systems (e.g., DRAM and CXL
memory tiering) using physical address (PA) mode monitoring.

v3: https://lore.kernel.org/linux-mm/20260223123232.12851-1-ravis.opensrc@gmail.com/

Changes since v3:
=================

- The first two patches from v3 (goal_tuner initialization fix and
  esz=0 quota bypass fix) are now in damon/next. This submission
  contains only the core metrics patch, rebased on top of those fixes.

- Simplified implementation: removed per-node eligible_bytes array, now
  iterates scheme-eligible regions directly for each goal evaluation.

- Handle regions crossing node boundaries: uses damon_get_folio() to
  determine actual NUMA node placement of each folio rather than
  assuming uniform node placement within a region.

- Pass scheme pointer directly to metric calculation functions, avoiding
  container_of() derivation from quota pointer.

- Fixed 80-column wrapping issues.

Background and Motivation
=========================

In heterogeneous memory systems, controlling memory distribution across
NUMA nodes is essential for performance optimization. This patch enables
system-wide page distribution with target-state goals like "maintain 30%
of scheme-eligible memory on CXL" using PA-mode DAMON schemes.

What These Metrics Measure
==========================

node_eligible_mem_bp:
    scheme_eligible_bytes_on_node / total_scheme_eligible_bytes * 10000

node_ineligible_mem_bp:
    (total - scheme_eligible_bytes_on_node) / total * 10000

The metrics are complementary: eligible_bp + ineligible_bp = 10000 bp.

Two-Scheme Setup for Hot Page Distribution
==========================================

For maintaining 30% of hot memory on CXL (node 1):

    PUSH scheme: migrate_hot from node 0 -> node 1
      goal: node_ineligible_mem_bp, nid=0, target=3000
      "Push hot pages out until 30% of hot memory is NOT on DRAM"

    PULL scheme: migrate_hot from node 1 -> node 0
      goal: node_eligible_mem_bp, nid=0, target=7000
      "Pull hot pages back until 70% of hot memory IS on DRAM"

The complementary goals create a feedback loop that converges to the
target distribution.

Dependencies
============

This patch is based on SJ's damon/next branch which includes the
TEMPORAL goal tuner required for these metrics.

Testing Results
===============

Functionally tested on a two-node heterogeneous memory system with DRAM
(node 0) and CXL memory (node 1). Used PUSH+PULL scheme configuration
with migrate_hot action to maintain a target hot memory ratio between
the two tiers.

With the TEMPORAL goal tuner, the system converges quickly to the target
distribution. The tuner drives esz to maximum when under goal and to
zero once the goal is met, forming a simple on/off feedback loop that
stabilizes at the desired ratio.

With the CONSIST tuner, the scheme still converges but more slowly, as
it migrates and then throttles itself based on quota feedback. The time
to reach the goal varies depending on workload intensity.

Ravi Jonnalagadda (1):
  mm/damon: add node_eligible_mem_bp and node_ineligible_mem_bp goal
    metrics

 include/linux/damon.h    |   6 ++
 mm/damon/core.c          | 158 ++++++++++++++++++++++++++++++++++++---
 mm/damon/sysfs-schemes.c |  12 +++
 3 files changed, 164 insertions(+), 12 deletions(-)

-- 
2.43.0

