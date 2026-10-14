Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D04E323D
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971111; cv=none; b=aMy/EpJiupTb6P1vm7CCo6euzScwl5amD2WeNa6ZSI8WJ2D1/blUs6rgb+WPQOa2oTUS6FiEPhb2T08ecsLVJ+Wr0OF9BQdCyjt0z+WnFBpuBi5iE8Y8Ccumu68QQbLlTeb1UMP9Qbmbvu7qA6C3HN/RqgBoiRI/1DptX/lLKiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971111; c=relaxed/simple;
	bh=Vx0eP6EIIAZfFDfVzZOz4AKjBkg9TGFz4vhMs/BZCoM=;
	h=Mime-Version:Subject:From:In-Reply-To:Content-Type:To:Cc:Date:
	 Message-Id:References; b=Sjx2374vvj+02gc4E2D88X95YqIB4OydsrjDe7gfQ12qJyN+qbpza3fkJpyc8vysaf7qnVNjPjzYVCwgk5I5T1xwRvDwvieIAP0kEQ9NI2X7ZMwT56VkA5GvTAz0WqlSFvG+7vCwV9Q62P/CL4BAEXxs2HETnYZXpfdjJind1jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NZK+II6k; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NZK+II6k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971097; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YgtaUAMzxFpM6Hd/lNCKgresHIYixggmJPuHuVJA3OQ=;
 b=NZK+II6kDDzdH4npJZaHpnJ7DHn0xxEhP6k9OCN/sLqq9i9Mx9zyg6YECvSTIzPIJgiYZY
 s8ug0d9GiykabhQw/a2EI1mml4X/OuwURVRAre55y0sG0wnIZBY+pNZmAd4AYFMBOO/fWX
 Md60JxSifmpN1n8dRfLq3uN4wTRAnHfkjtWak+KCu/6CwIBzSrGaqFXazxGvvuYyEeymif
 7vLlrzKEv7vCvDOHdXMJJfNMW1EcwrGEEhRMDPKaKmfbAdPwA7gk8s1tLkAaDERKah2hA1
 krmloMsqiSUiHo+gMsolQzmHOFvN54uhMGBpd3vCzZldE5FO3nsWhjAq+T/WOw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.45.2
Subject: [PATCH 1/6] sched/numa: clear fault locality state on execve
From: "Li Zhe" <lizhe.67@bytedance.com>
In-Reply-To: <20261014094347.99157-1-lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 14 Oct 2026 17:43:42 +0800
Message-Id: <20261014094347.99157-2-lizhe.67@bytedance.com>
References: <20261014094347.99157-1-lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26acf4f17+0537e9+vger.kernel.org+lizhe.67@bytedance.com>

task_numa_free(p, false) is used by execve() to reset NUMA balancing
state without freeing p->numa_faults, because concurrent readers may
still observe the task.

The non-final path clears p->total_numa_faults and the averaged half of
the retained p->numa_faults array, but leaves the current-window buffer
half and p->numa_faults_locality unchanged. Those are also NUMA fault
feedback consumed by task_numa_placement() and update_task_scan_period(),
so a newly executed image can inherit stale fault feedback from the old
image.

Clear the whole retained p->numa_faults array and p->numa_faults_locality
together in the non-final reset path.

Fixes: 04bb2f947505 ("sched/numa: Adjust scan rate in task_numa_placement")
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 kernel/sched/fair.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..1053437933ee 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4177,8 +4177,9 @@ void task_numa_free(struct task_struct *p, bool final)
 		kfree(numa_faults);
 	} else {
 		p->total_numa_faults = 0;
-		for (i = 0; i < NR_NUMA_HINT_FAULT_STATS * nr_node_ids; i++)
-			numa_faults[i] = 0;
+		memset(p->numa_faults_locality, 0, sizeof(p->numa_faults_locality));
+		memset(numa_faults, 0, sizeof(*numa_faults) *
+		       NR_NUMA_HINT_FAULT_BUCKETS * nr_node_ids);
 	}
 }
 
-- 
2.20.1
