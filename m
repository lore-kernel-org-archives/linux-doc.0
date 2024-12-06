Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867C53D6B
	for <linux-doc@vger.kernel.org>; Fri,  6 Dec 2024 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733469925; cv=none; b=ES73AbbOKYNnvytrJkc0Q8olhYqrDZrHBth3RMBZhrZ94g4IAl93jCzUfTv4jxFj7S1FJUXBoy08yV6VGbL+DpVA8mE8Rp9lYe7bRpnpw0u1N/MPX5fNj2Q1aVpjof/m2vyB6UFkHPiphoeL5oVTPG/PHvGgapHKOSioJ1m7wTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733469925; c=relaxed/simple;
	bh=Nw9RLpfZXU/lN/Cn/DmZPVO7dJjtqdL3hbEg78PkUh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0gNBtHBX3N96Mdq5Ie7MOB36jA89vO2NCBrjjY1Ih00kyInWF8zu7xhiS2rwe+dsr4FxE5+d0/Z0uC8gxENuwAO/ycJOqHXxm4577/FhLA+QnrbqrzmiBd14PzxjL15+28dB8fEVYEDumus1wgOn+fHTzBqQLTMkqixyinRcYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Z69DEalD; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Z69DEalD"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1733469914; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=KeiQksj5p3kpfgOUaaoCQtUilY9sIU4svRw05SIy3cI=;
	b=Z69DEalDbl3qHbbJa3OkyoM+NdRBG7P99UBIavVeIMVGdmxH6+aIjwmX3Y9euAP46SYhQYxQSUCM/zaNb+4DEOSnu8nWsMoE9CxAQ/s33qRQEEESwE/WyLjO1qTag9nxEO4/W+3sNoIYs7vMF/JVd85EOCrHwNGbm9MOlqvdlck=
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0WKvfgsT_1733469907 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Dec 2024 15:25:13 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-nvme@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH separete v2] docs, nvme: introduce nvme-multipath document
Date: Fri,  6 Dec 2024 15:25:07 +0800
Message-ID: <20241206072507.37818-1-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a document about nvme-multipath and policies supported
by the Linux NVMe host driver, and also each policy's best scenario.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
Hi,
  We found that we should take care of the throughput of each path in
service-time policy, so separate the doc patch. And continue working
on service-time policy patch.

Changes from v1 to v2:
- Remove service-tome policy.

 Documentation/nvme/nvme-multipath.rst | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/nvme/nvme-multipath.rst

diff --git a/Documentation/nvme/nvme-multipath.rst b/Documentation/nvme/nvme-multipath.rst
new file mode 100644
index 000000000000..97ca1ccef459
--- /dev/null
+++ b/Documentation/nvme/nvme-multipath.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+Linux NVMe multipath
+====================
+
+This document describes NVMe multipath and its path selection policies supported
+by the Linux NVMe host driver.
+
+
+Introduction
+============
+
+The NVMe multipath feature in Linux integrates namespaces with the same
+identifier into a single block device. Using multipath enhances the reliability
+and stability of I/O access while improving bandwidth performance. When a user
+sends I/O to this merged block device, the multipath mechanism selects one of
+the underlying block devices (paths) according to the configured policy.
+Different policies result in different path selections.
+
+
+Policies
+========
+
+All policies follow the ANA (Asymmetric Namespace Access) mechanism, meaning
+that when an optimized path is available, it will be chosen over a non-optimized
+one. Current the NVMe multipath policies include numa(default), round-robin and
+queue-depth.
+
+To set the desired policy (e.g., round-robin), use one of the following methods:
+   1. echo -n "round-robin" > /sys/module/nvme_core/parameters/iopolicy
+   2. or add the "nvme_core.iopolicy=round-robin" to cmdline.
+
+
+NUMA
+----
+
+The NUMA policy selects the path closest to the NUMA node of the current CPU for
+I/O distribution. This policy maintains the nearest paths to each NUMA node
+based on network interface connections.
+
+When to use the NUMA policy:
+  1. Multi-core Systems: Optimizes memory access in multi-core and
+     multi-processor systems, especially under NUMA architecture.
+  2. High Affinity Workloads: Binds I/O processing to the CPU to reduce
+     communication and data transfer delays across nodes.
+
+
+Round-Robin
+-----------
+
+The round-robin policy distributes I/O requests evenly across all paths to
+enhance throughput and resource utilization. Each I/O operation is sent to the
+next path in sequence.
+
+When to use the round-robin policy:
+  1. Balanced Workloads: Effective for balanced and predictable workloads with
+     similar I/O size and type.
+  2. Homogeneous Path Performance: Utilizes all paths efficiently when
+     performance characteristics (e.g., latency, bandwidth) are similar.
+
+
+Queue-Depth
+-----------
+
+The queue-depth policy manages I/O requests based on the current queue depth
+of each path, selecting the path with the least number of in-flight I/Os.
+
+When to use the queue-depth policy:
+  1. High load with small I/Os: Effectively balances load across paths when
+     the load is high, and I/O operations consist of small, relatively
+     fixed-sized requests.
-- 
2.43.0

