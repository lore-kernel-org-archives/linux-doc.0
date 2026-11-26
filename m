Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672352;
	b=mBwI0tANZgVd0nZLFENhlWM03cMkoaIGD/dhNAGe+UgyVOYodsQ/46trIGyLcPih/s1/
	 HYNEDwf6daM0oNrA23y7leDvGspXEUsp2qFGXnSOznjWEdd4bLsJt1DlEhVPLE4Esfy7C
	 aWwC9tMT3A/RLypVIXao8JrDZSgxyP4j8pDrl4tWp5xSmnVykZI86kpInnGRi/HfXxRi0
	 DPrr8zTJuzzVmXht8XsdVdgD1ojnLg3Y+87uGKf+htDaDEy887MxmUPUw6yxA7nXRve+W
	 F133fUlwHLfzvTtEbhIOfUEeezhgn5JBffMjiPXoT4WPmFeT9oUPzzTZlD97ArNLteg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672352;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zVuXwTyscVbFZi1wkQQAp7eD1hXL+dltypOcVIhVGZk=;
	b=S144wONAm765lRC5HyLdiXA9Yc02v8Ky1DGvGjkrNZqNF74nqTKHvuBwclDbY58XAIya
	 VU9QLR71ins8T4djd5NRUEsJm628+mwZEBbUJUKEMFTDs8PGUJVdkouMzl0S85Sp4V5EV
	 GMnNp14QpPjomYqPAqN315Lqq8Q/HrvCxrkZtiVllK56uistXzlN9mYWnVkZvTHg5TVv2
	 AeJi+Ue4hTbPxYwfKUtrVMUlegYDAVhTgF5Jpv36RmgJ9totjdRwhcLR1CHgSBkR53wZz
	 GJVc344jDstgpYYKu4FBJklHUA4kbghqRbKPz9t1x0mRqHkZzqx66ys54ZSS4xNNuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ONqKK8bn;
	arc=none smtp.remote-ip=95.215.58.21
Received: from mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33881606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33881606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ONqKK8bn
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=baszU1mgchieKqc/JGnZXd/YJ5gRMUsdHJjPpVJvFZQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672350; v=1; x=1796277150;
 b=ONqKK8bnNeEeOmHKGj56U3mdVSBU+8GghiKcwoXAxpubEhdYvizLQmfoNer1jkFMlSWRzT78
 gDCBhHwRkpWuxwLZHYoWpnT7j9nv9rrqVRr/gfiEPUohm/WS9F1GFJk90IAmXTuxIxrtlDzjClL
 JI2DYGnPFlpxSgB+HoZVYTYc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b5932c74b5b5b20e;
	Thu, 26 Nov 2026 05:52:30 +0000
X-Mizu-Trace-ID: b5932c74b5b5b20e
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	corbet@lwn.net
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 1/2] docs: cgroup-v1: Fix the isolcpus description
Date: Thu, 26 Nov 2026 13:52:05 +0800
Message-ID: <20261126055206.251724-2-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126055206.251724-1-guopeng.zhang@linux.dev>
References: <20261126055206.251724-1-guopeng.zhang@linux.dev>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The sched_load_balance section incorrectly includes CPUs isolated
with the domain flag of isolcpus= in the default scheduling domain.
It also refers to a nonexistent cpuset.isolcpus file.

Correct both passages and clarify that domain is the default flag
of isolcpus=. The nohz and managed_irq flags do not by themselves
disable scheduler load balancing.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 Documentation/admin-guide/cgroup-v1/cpusets.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v1/cpusets.rst b/Documentation/admin-guide/cgroup-v1/cpusets.rst
index fb3fb6fa88cb..d47f96979988 100644
--- a/Documentation/admin-guide/cgroup-v1/cpusets.rst
+++ b/Documentation/admin-guide/cgroup-v1/cpusets.rst
@@ -398,10 +398,11 @@ Put simply, it costs less to balance between two smaller sched domains
 than one big one, but doing so means that overloads in one of the
 two domains won't be load balanced to the other one.
 
-By default, there is one sched domain covering all CPUs, including those
-marked isolated using the kernel boot time "isolcpus=" argument. However,
-the isolated CPUs will not participate in load balancing, and will not
-have tasks running on them unless explicitly assigned.
+By default, scheduler load balancing includes all online CPUs except
+those isolated with the "domain" flag of the "isolcpus=" boot option.
+This flag is implied if no flags are specified. The "nohz" and
+"managed_irq" flags do not by themselves disable scheduler load
+balancing.
 
 This default load balancing across all CPUs is not well suited for
 the following two situations:
@@ -474,9 +475,9 @@ such partially load balanced cpusets, as they may be artificially
 constrained to some subset of the CPUs allowed to them, for lack of
 load balancing to the other CPUs.
 
-CPUs in "cpuset.isolcpus" were excluded from load balancing by the
-isolcpus= kernel boot option, and will never be load balanced regardless
-of the value of "cpuset.sched_load_balance" in any cpuset.
+CPUs isolated with the "domain" flag of the "isolcpus=" boot option
+remain excluded from scheduler load balancing regardless of the value
+of "cpuset.sched_load_balance" in any cpuset.
 
 1.7.1 sched_load_balance implementation details.
 ------------------------------------------------
-- 
2.43.0

