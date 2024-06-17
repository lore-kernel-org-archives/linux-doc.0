Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E3E15B973
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 14:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635277; cv=none; b=oEQ56BDngGG9Qz3FosgLYate/vnLQOphTDnLhMx7/DL432uId4aPBuQ/l2N/E1Q0uwsxaG29TZxX0PYHAUwF/CMBakTjg/wSpw9a66hR8I1RZZDPY7nv5xWU4xP0j2+l+bp4M++9YNCt0UdQaznGLbUUhtOJcoNunf2N0EkgkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635277; c=relaxed/simple;
	bh=5jQTs2lxCHcFprbF6CKPg1CLdTOcay7Z0kuZBu+6vXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OcA+ig9WiHXz0o/Dsv1VCd9eT9W6w+rgFdi7IfERrGY81Z0eWV1NMCSL8OICzS/21zSnl7iCU1icIRLK23npw57aTRF6J4L6fZ1/v5Fyve4sS7M3xTqXvfBg4IVxuZUl2DwL1g+UVaSx0MQPTuq1KPXwenYTa9YKdcPMAVEMc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DzJoyJea; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DzJoyJea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718635275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PvUM+GN/gB29YaibI3luJ34zEaRHwAEivDnpxaH0NNc=;
	b=DzJoyJeaPGJvOtYb49DKBJ3pPFRGYPRu/LG594EuBwvi1ndylTnxxHyZtquaRfQf+Gv6cU
	tyChUKTSqzgrHI4Hj+pxhYH1zF4/2871F8Dq2LStqZECMgGQ5ovqU4YiC+HMgcYr1qx0Ns
	6Nl8bxGPt3zE3JoAIdkvTWN9Pvg9ySQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-t7EwKp93N7CRrMaxXoaWmQ-1; Mon,
 17 Jun 2024 10:41:12 -0400
X-MC-Unique: t7EwKp93N7CRrMaxXoaWmQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11F07195609D;
	Mon, 17 Jun 2024 14:41:07 +0000 (UTC)
Received: from llong.com (unknown [10.22.32.57])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1E591956048;
	Mon, 17 Jun 2024 14:41:03 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Xavier <ghostxavier@sina.com>,
	Peter Hunt <pehunt@redhat.com>,
	Petr Malat <oss@malat.biz>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-cgroup v2 0/5] cgroup/cpuset: Fix miscellaneous issues
Date: Mon, 17 Jun 2024 10:39:40 -0400
Message-Id: <20240617143945.454888-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

 v2:
  - Fix test_cpuset_prs.sh problems reported by test robot
  - Relax restriction imposed between cpuset.cpus.exclusive and
    cpuset.cpus of sibling cpusets.
  - Make cpuset.cpus.exclusive independent of cpuset.cpus. 
  - Update test_cpuset_prs.sh accordingly.
  
 [v1] https://lore.kernel.org/lkml/20240605171858.1323464-1-longman@redhat.com/

This patchset attempts to address the following cpuset issues.
 1) While reviewing the generate_sched_domains() function, I found a bug
    in generating sched domains for remote non-isolating partitions.
 2) Test robot had reported a test_cpuset_prs.sh test failure.
 3) The current exclusivity test between cpuset.cpus.exclusive and
    cpuset.cpus and the restriction that the set effective exclusive
    CPUs has to be a subset of cpuset.cpus make it harder to preconfigure
    the cgroup hierarchy to enable remote partition.

The test_cpuset_prs.sh script is updated to match changes made in this
patchset and was run to verify that the new code did not cause any
regression.

Waiman Long (5):
  cgroup/cpuset: Fix remote root partition creation problem
  selftest/cgroup: Fix test_cpuset_prs.sh problems reported by test
    robot
  cgroup/cpuset: Delay setting of CS_CPU_EXCLUSIVE until valid partition
  cgroup/cpuset: Make cpuset.cpus.exclusive independent of cpuset.cpus
  selftest/cgroup: Update test_cpuset_prs.sh to match changes

 Documentation/admin-guide/cgroup-v2.rst       |  12 +-
 kernel/cgroup/cpuset.c                        | 158 +++++++++++++-----
 .../selftests/cgroup/test_cpuset_prs.sh       |  75 ++++++---
 3 files changed, 180 insertions(+), 65 deletions(-)

-- 
2.39.3

