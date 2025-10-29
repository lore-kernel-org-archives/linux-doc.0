Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527826AA94
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 21:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761774987; cv=none; b=VOviwdN+4rYepcOcdw5LWCIIxtJ3gtiEkZviVONfuGOpg4Bedu+6m/86v/swzDNF3qLUosVb6cep937V2KgwCOPNPLbJY7wWZWiBxtX01/GGK5QNdvQ6TfNnHvO5eGEiTVeZBE0+JIF6Zpxw7RmuUJf0vX3ANgBgRaQRouLgQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761774987; c=relaxed/simple;
	bh=BKVvZPsCVoX8quYVXbgUICsMPp2FUeqHlRd1jo0TsI8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oUiQ5MvpPz31Niii8qkDHrkyMl+Hn9pFiLmNYBJlNNBsIIZrxfU3sWJH1Gq7WY8cMlg3prdxV8BTRfOtpeOFhayB4q1HWeRecbt5Ybn7HAVMOUXlibjKCPxANw7jMnrljzTHe1pV73zj6DFnoUwhAJlCwh2Cey9lRloUdA7FyBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NPdL7dFr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NPdL7dFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761774983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+3lIRk+iOkhZJiXRtYul+9aWejoo4FRuq7Xwu2UcebU=;
	b=NPdL7dFrjkfQ3hMGs7KnFJ2jdQNd8tekrewJynALgT0U0PIK37LrdsPgGDAYL/1904dxgZ
	iFndnlOKWQokFT/pJzhXX65EnYu+EMozIx8rdlk748/azxESGLsO8OU1kUlPFEg2nw81sE
	hopSXNrE/m8Xm7OEAtROI3Ee2lkhAHo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-3t0I7cP0PiGTeZqbQ4RTqw-1; Wed,
 29 Oct 2025 17:56:20 -0400
X-MC-Unique: 3t0I7cP0PiGTeZqbQ4RTqw-1
X-Mimecast-MFC-AGG-ID: 3t0I7cP0PiGTeZqbQ4RTqw_1761774978
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C596719540C1;
	Wed, 29 Oct 2025 21:56:16 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.22.64.105])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4330919560AD;
	Wed, 29 Oct 2025 21:56:12 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nico Pache <npache@redhat.com>,
	Phil Auld <pauld@redhat.com>,
	John Coleman <jocolema@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2 0/2] sched/core: Show user_cpus_ptr & allow its reset
Date: Wed, 29 Oct 2025 17:55:53 -0400
Message-ID: <20251029215555.1006595-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

 v2: Make minor change in patch 2 to show the new status fields will be
     empty if user_cpus_ptr not defined.

As the presence of user_cpus_ptr will affect how the CPU affinity of a
process will be defined, it makes sense to enable users to see if the
user_cpus_ptr of a process is set as well as enabling the clearing of
user_cpus_ptr if it is not needed.

Waiman Long (2):
  sched/core: Enable full cpumask to clear user cpumask in
    sched_setaffinity()
  fs/proc: Show the content of task->user_cpus_ptr in /proc/<pid>/status

 Documentation/filesystems/proc.rst |  3 +++
 fs/proc/array.c                    |  9 +++++++++
 kernel/sched/syscalls.c            | 20 ++++++++++++++------
 3 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.51.0

