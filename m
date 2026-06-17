Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC527314A65
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781696787; cv=none; b=sev8L1XRttMVWSTdrEGjIgawVHZ0NSHz5gbLrgYzI26F2ZK+jLE31Us4SeRPpD+6sZO0HlmmFeDNy/CDXcySR8ilLjNrsni1DswDT7/YGe4JNHP/v4cJZuBIdju/Ar4kyvQsekOyXFodw8ofMT+a8vRz4mXVZhyjy61EcpEEVhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781696787; c=relaxed/simple;
	bh=/xb9A0pUGGEXVtQ2aZ8IHoRRLWJjPPaw9P+k9+K2rvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C/xqAIWfsgXEfHVMOhRXtEIIuIfI6sqW45VRzSFU8zUZrnRGnO6AeVRBJObHWRzHrKEnuH6TEVb2gbb2O3G9/9QnSmCzxDrQVkMblxe+hJ3ah9l6i5blCOXa7jOwBBfRvaRx95BMy7VaU0DdkTV1HQ34C5G9frNkbibHssZ8jI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ou7k4UR4; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ou7k4UR4"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781696777; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=thSN4qiuwD7kJRMtpqlhr/2Ldd7hTJyaIcnEUOs28zg=;
	b=Ou7k4UR4cz1hrBElnagJv91g1qG7PuC7YCjpC4j+NMBebpV2YdYO/tkG2XWeGuWtqju54LO8dIaFlcPY5AKsyfovPSKhiE+vMESwshO7hk6LnikPVkzwHrwq6KY2yhWu0ODP6MUzrqDt6Kd9PrAb6Ae9C9/ZTw6W+7USY8DIWVg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0X53e-V2_1781696772;
Received: from localhost(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0X53e-V2_1781696772 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Jun 2026 19:46:16 +0800
From: Guixin Liu <kanie@linux.alibaba.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	onathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-nvme@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: nvme-multipath: document service-time I/O policy
Date: Wed, 17 Jun 2026 19:45:59 +0800
Message-ID: <20260617114602.2224074-3-kanie@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260617114602.2224074-1-kanie@linux.alibaba.com>
References: <20260617114602.2224074-1-kanie@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the service-time path selection policy, including
its algorithm overview, sysfs attributes (in_flight_bytes and
relative_throughput), and guidance on when to use it over queue-depth.

Document that setting relative_throughput to 0 makes the path a standby
that is only used when no path with a positive value is available.

Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
---
 Documentation/admin-guide/nvme-multipath.rst | 31 ++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/nvme-multipath.rst b/Documentation/admin-guide/nvme-multipath.rst
index 97ca1ccef459..2acfceaf3d65 100644
--- a/Documentation/admin-guide/nvme-multipath.rst
+++ b/Documentation/admin-guide/nvme-multipath.rst
@@ -24,8 +24,8 @@ Policies
 
 All policies follow the ANA (Asymmetric Namespace Access) mechanism, meaning
 that when an optimized path is available, it will be chosen over a non-optimized
-one. Current the NVMe multipath policies include numa(default), round-robin and
-queue-depth.
+one. Current the NVMe multipath policies include numa(default), round-robin,
+queue-depth and service-time.
 
 To set the desired policy (e.g., round-robin), use one of the following methods:
    1. echo -n "round-robin" > /sys/module/nvme_core/parameters/iopolicy
@@ -70,3 +70,30 @@ When to use the queue-depth policy:
   1. High load with small I/Os: Effectively balances load across paths when
      the load is high, and I/O operations consist of small, relatively
      fixed-sized requests.
+
+
+Service-Time
+------------
+
+The service-time policy selects the path with the lowest estimated service time.
+It calculates service time as ``in_flight_bytes / relative_throughput`` for each
+path, preferring the path that would complete I/O fastest. Unlike queue-depth
+which counts requests regardless of size, service-time tracks actual bytes in
+flight, making it aware of I/O sizes.
+
+Each path exposes two sysfs attributes under
+``/sys/class/nvme/nvmeX/nvmeXcYnZ/``:
+
+  - ``in_flight_bytes`` (read-only): Current bytes in flight on this path.
+  - ``relative_throughput`` (read-write): Relative throughput weight for this
+    path, default 1. The valid range is 0-100. Set higher values for faster
+    paths. If set to 0, the path is not selected while other paths with
+    positive values are available.
+
+When to use the service-time policy:
+  1. Asymmetric Link Speeds: When paths have different bandwidths, set
+     ``relative_throughput`` proportionally (e.g., 2 for a link twice as fast)
+     to steer more traffic to faster paths.
+  2. Mixed I/O Sizes: When workloads mix small and large I/Os (e.g., 4K and
+     128K), service-time distributes load more accurately than queue-depth
+     because it accounts for actual bytes rather than request count.
-- 
2.43.7

