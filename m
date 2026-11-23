Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407153;
	b=2jih+dVBED84EOhwdw+g4lQLWaGkWOshcTIU9A2e/zWi6Go3HfO6eVeHqCOACrkcvkNw
	 m45mUOQfA1kq1pc//b1uxTE3abejpMLYLJvGpjQpR+aoUyFviTNUfsaWO/B8RcUsb0c0R
	 dReM+sG/aZm3XecEiwDIjtBO+04vFdR/QWEevMry/nEyGFe6PXh21ASimk3N5oPUqnfPT
	 Rg16AsmJPAQ5o6xTKH0nJpw1EvmDG80HJfK4Zv6DkIV3RZcIX2Y4DTY3y27AWxHW8uFR8
	 81CrYNrmtZa0m3wWpbEZwdnN0YZ9xXqG+7v76UT3m+gsLPFEm+HMIAKJCuqdr6UpVUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407153;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=5TmNVpfj4hDwFh6gyMhke7jXfX4xLa6sU8BErkMxfqc=;
	b=kSsOUN+oHn7VB9vHASt6By4MVwSqQfAio7oFo9mB2iRP2hweTsFqz2llhQiEhLLcZoqZ
	 dXyB20GjJlJB7HAcE0jxJgVKZJOjpwsqe78GXpWsgzYKqAXgvrvda/dm7nSZEhFzTXJgT
	 UHq5r3Df5ZqxQcGo0nKFmXbmtpF0ClJkSbtuMTQ1L6yHJCc0rTZ0pCbhqB/KeufwyjS5s
	 gQmZuXZeGF3PVeKAgHqJ7ut0di1Am8uCTCL9hjLg8Vs3RzTDpe1eeAzfI6Ng0nddtzbXW
	 RdxnpEFaBAFR1Oogt2aOMMzQG/YqgpL/12JNckgGBJHgaVOsYgoM+TvyfrD4opgUOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Frgk8XGp;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF6A606A320
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FF6A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Frgk8XGp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795407151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5TmNVpfj4hDwFh6gyMhke7jXfX4xLa6sU8BErkMxfqc=;
	b=Frgk8XGpbTp0JjHGKEljXjwszs968sDuDkfW8wtK6NKzq8yaPy72+MAr4dCcaW+KLT22FY
	GnNPHrI2YU4gzGeiDXyUM9uSdDNwxI5R/OP2+b1SQSvYDo9g8LScr8aM4yttuPDHunDNfx
	b4Yw78Wj5F1Ded/eOL3ppX2L7zJUpCQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-tWRd4N6nPG2Ybc8jMblIAw-1; Mon,
 23 Nov 2026 04:12:27 +0000
X-MC-Unique: tWRd4N6nPG2Ybc8jMblIAw-1
X-Mimecast-MFC-AGG-ID: tWRd4N6nPG2Ybc8jMblIAw_1795407144
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33EBD1954B2F;
	Mon, 23 Nov 2026 04:12:23 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B24918011D8;
	Mon, 23 Nov 2026 04:12:17 +0000 (UTC)
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
Subject: [PATCH-next v2 0/3] Skip boot CPU or don't allow it from being used in isolcpus and isolated partitions
Date: Sun, 22 Nov 2026 23:12:06 -0500
Message-ID: <20261123041209.382726-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

 [v2]
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
 kernel/time/tick-sched.c                      |  2 +
 .../selftests/cgroup/test_cpuset_prs.sh       | 43 +++++----
 8 files changed, 117 insertions(+), 62 deletions(-)

-- 
2.56.1

