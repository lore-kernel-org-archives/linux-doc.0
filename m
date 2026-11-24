Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795494506;
	b=eRkxiXY73QqZtgTsFSe1L5y7ajGPY5FWyqmakEHtGlfhL7tNJ5cQfsIi1ZmwLiDH2yzH
	 +QYVC+tgmJnam4XBzRhUHg9BSJO/9w+L/OowXSgjq5b9ih3sZnzKahU+2doC6sb2Mg6Mq
	 x18xf0I9dKNLMvhEPov4RglJUSnuV2GMTfOJR5NCr5fjW1118/Co9w0+CRgSpmACSsQDR
	 skjuk12P8CFWmOBQDoT+7dSOUCMso50PHi8halXf6X4PoCs1L+hmeV0rWf0VTfa1rHS/P
	 DOPR37/NEKWyD+jQoSqGuftDDRXZZiQ1RIz9Y9v17330C8rktDS8ehlSXLqz4Utykcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795494506;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=1nlWN+vTq2iPEJXsRcLiM8XVKReFm26rnukXyiCPwy0=;
	b=DPMqVVBYURJkqmriwwFd+oIcj2WV5IkkMIqsUrjjJC6OyV3gUO72Jgq59OuDFKoCXz2v
	 yYlK4BW98YGNMgIatWGDjP3lcrVbn/Kf2y2E5YgOWIv9jMHnu+xxc4JPGonBTDTQ+Kd8f
	 2ggX/W3RQU3odvEh6DXFAdt3lKL5I3bvz1hB/OzqIhuD8hlJoa5JCXJ31dF1zyhEzMtJV
	 Gv9pxZQijYh4dP9BH61juqipuUsPQce/s9VhLDBCK365kUJ8g0hrPDaNvyd7y3ggGBkc4
	 NUiREUPTDXNzTm1wV3aWOGfQOgYizyqDqFK1/k1rPMZN8OaMx3DKxsZyfHNdsP5xxcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wiv1bb51;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5570606A332
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 04:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5570606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wiv1bb51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795494504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1nlWN+vTq2iPEJXsRcLiM8XVKReFm26rnukXyiCPwy0=;
	b=Wiv1bb51qVyyNroTd1T2imJrG7Ofk/qvyiAOC41fZzy11SZDaR0r5QjJxO/jszrLBGQ3U8
	AE5SPHqFGDwRt2aK+S9euchx1+osvD0oCrq37Sh5W8fTn6FH9ABX0PWBVukqh85WMTcGg1
	y/ZMa/LH7KSLHD3ynJ2woUuItSQWdD4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-HvDynBISOzSrikThhjh5JQ-1; Tue,
 24 Nov 2026 04:28:18 +0000
X-MC-Unique: HvDynBISOzSrikThhjh5JQ-1
X-Mimecast-MFC-AGG-ID: HvDynBISOzSrikThhjh5JQ_1795494495
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7645C1800268;
	Tue, 24 Nov 2026 04:28:14 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9A8751800551;
	Tue, 24 Nov 2026 04:28:09 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ridong Chen <ridong.chen@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v3 0/3] Skip boot CPU or don't allow it from being used in isolcpus and isolated partitions
Date: Mon, 23 Nov 2026 23:27:59 -0500
Message-ID: <20261124042802.532633-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

 v3:
  - Add tags.
  - Patch 1: add a "cpumask_empty()" test in tick_nohz_init() to handle the
    "nohz_full=0" special case. Other than that, there is no change in
    its main logic.
  - Patch 3: Move down the PERR_ISOLCPU0 check in
    prstate_housekeeping_conflict(0 and add one more test case to
    test_cpuset_prs.sh.

 v2:
  - Update the patches to address issues reported by sashiko.

It is reported that having CPU 0 being domain isolated can cause
problems in the some kernel subystems which don't take into account
that the boot CPU (CPU 0) may not be a HK_TYPE_DOMAIN housekeeping CPU.
As a result, it makes sense to just disallow CPU 0 from being used
in the isolcpus=domain boot parameter as well as in cpuset isolated
partitions instead of trying to fix the problems when they show up.

The first patch fixes the inconsistency problems between
tick_nohz_full_mask and HK_TYPE_KERNEL_NOISE cpumask.

The second patch removes the boot CPU from the isolcpus=domain parameter
if set.

The third patch disallows isolated partitions from being created if CPU 0
is specified in its effective exclusive cpumask.

Waiman Long (3):
  tick/sched: Make tick_nohz_full_mask and HK_TYPE_KERNEL_NOISE cpumask
    consistent
  sched/isolation: Forbid the boot CPU from being domain isolated
  cgroup/cpuset: Disallow CPU 0 from being used in isolated partition

 Documentation/admin-guide/cgroup-v2.rst       |  1 +
 .../admin-guide/kernel-parameters.txt         |  7 +-
 include/linux/sched/isolation.h               |  2 +
 kernel/cgroup/cpuset-internal.h               |  1 +
 kernel/cgroup/cpuset.c                        | 90 ++++++++++---------
 kernel/sched/isolation.c                      | 33 ++++++-
 kernel/time/tick-sched.c                      |  6 ++
 .../selftests/cgroup/test_cpuset_prs.sh       | 44 +++++----
 8 files changed, 122 insertions(+), 62 deletions(-)

-- 
2.56.1

