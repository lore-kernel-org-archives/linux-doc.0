Received: from mta0.migadu.com (out-66.mta0.migadu.com [91.218.175.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BBA36F41C
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727069; cv=none; b=L7LnvybdEV+I1HdEzQuKYJwl+E6mD9NgcOB+qmhmO8A8Z4tyOOnob1SSZwJgez1E7n/4TmQCYlVbiZaEQ/GhxhhW3Dk9sKiB7BnojFQwAQQ9Xkwvlw0Ywzp35LVJXurYMYhiRTNkHk8dh3u74tVM8IgxZ6DPIcfzvXEmzhZ+GQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727069; c=relaxed/simple;
	bh=8oDsVyqBLxEiDren+mvzSBEhfATjLL22N1BKky2enWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I3zN9Vvz6PdJXNdbEgOxaR9KAD+FVOwFSjris7PBlvi8G1oSV8Q+IsRoNCoEr8Zp5O8VQGVXgZfSf5KQ0pl6Smakq8jhDqgMghKugEB2C1ZYDhhg2sT5/a4WcqVvkB7a8Kc9kN90C3/9PChlzYF21i10tp+O6AvWLAMPBpHGJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LBZcRZGo; arc=none smtp.client-ip=91.218.175.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LBZcRZGo"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8oDsVyqBLxEiDren+mvzSBEhfATjLL22N1BKky2enWM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789727063; v=1; x=1790331863;
 b=LBZcRZGogK+s/sDHopOcmI1V79FawoL1b0hvSL7ipsgtIKmzmoQiAbiYlxVWOzu9tL2ubUzF
 Kt/y+Pu7e1+rgh9l7dgsaSWwdR/aejacbhin5Rzo1oQ1GB7O3eY+0BaMLLSyk7/HojA+hgnwj/t
 Qyx6S4LOhenuho3mjLPzjU+o=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49790fc8767d1b32;
	Fri, 18 Sep 2026 10:24:23 +0000
X-Mizu-Trace-ID: 49790fc8767d1b32
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Ridong Chen <ridong.chen@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 1/2] docs: cgroup-v2: Describe boot-isolated CPUs in cpuset.cpus.isolated
Date: Fri, 18 Sep 2026 18:23:58 +0800
Message-ID: <20260918102359.71826-2-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918102359.71826-1-guopeng.zhang@linux.dev>
References: <20260918102359.71826-1-guopeng.zhang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

cpuset.cpus.isolated is documented as empty when no isolated partition
exists. This is not true when CPUs are isolated at boot with
isolcpus=domain. cpuset_init() adds those CPUs to the isolated mask,
and isolcpus=<cpu-list> uses domain isolation by default. They remain
listed after a partition using them is released.

Document the boot-isolated CPUs as well.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 2ec582985b5b..272e9f2432bd 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2625,9 +2625,11 @@ Cpuset Interface Files
   cpuset.cpus.isolated
 	A read-only and root cgroup only multiple values file.
 
-	This file shows the set of all isolated CPUs used in existing
-	isolated partitions. It will be empty if no isolated partition
-	is created.
+	This file shows CPUs isolated from scheduler domains by
+	isolated cpuset partitions or at boot with "isolcpus=domain"
+	(including the default "isolcpus=<cpu-list>" form).  CPUs
+	isolated at boot remain listed after any partition using them
+	is released.
 
   cpuset.cpus.partition
 	A read-write single value file which exists on non-root
-- 
2.43.0

