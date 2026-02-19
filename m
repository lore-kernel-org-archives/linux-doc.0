Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698133893A
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508323; cv=none; b=cPM8+3DXZ/MTVwcScQauefyuitCRDQqc356lBpQgiL9Gsn0pbNU93QuMmQlf9nCZtv2xz6vd70Xsdag5HD9Q3+PDOCRuYDqM2jYi6y3IDOK66GStoXHn6kR9E281I2AX6SytChR7zshjRf4MexOksa6IEr1RQRGnasHUY8TRliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508323; c=relaxed/simple;
	bh=8mBEaAqx/FO7nbGRWsaxewXG0hWsTxNHEeGETDh1ovQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKpj4toxFZV3LFiL24Wpc/585rmhzZ9j5H9XyAceYzyHTg3/WgOX+oyhD+pl33apP4WQMpWMSwdItTiN7CmFK9+Li9CqkyHBDEbXWItQ7GIeeRMR/3KkQb//VMKhGyRAgFWQKYDknn/fzvr0/kVaHl9CPywnkcLZp5MLN3hzsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWZbM3tJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWZbM3tJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771508320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAKZ+AzEoXo8beHK/ies5ksRzpHQSF9QsdvGWay5oi8=;
	b=JWZbM3tJs1/oiHjVoYAglKsXOEYzQcrHu8BvTtYSjOK51WVbU9HMQIqnc5NaZ+tx1ppWiU
	qWEVKO1ZSF6W7MgHEb7e489E3KJxHwTF+nejJKhIrxCoubbfYbO97stPcwHGPYGZXShbrb
	swqOPbKZL4zVyd4nmSKe17ghXvx3jXU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-UCzeWMxVMTmiB2FiTKQ7BQ-1; Thu,
 19 Feb 2026 08:38:36 -0500
X-MC-Unique: UCzeWMxVMTmiB2FiTKQ7BQ-1
X-Mimecast-MFC-AGG-ID: UCzeWMxVMTmiB2FiTKQ7BQ_1771508314
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD47E1800465;
	Thu, 19 Feb 2026 13:38:33 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1909D19560A7;
	Thu, 19 Feb 2026 13:38:27 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Thu, 19 Feb 2026 14:37:35 +0100
Subject: [PATCH RFC 2/4] sched/doc: Document SCHED_DEADLINE demotion
 feature
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-upstream-deadline-demotion-v1-2-528b96e53d12@redhat.com>
References: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
In-Reply-To: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Qais Yousef <qyousef@google.com>, Clark Williams <williams@redhat.com>, 
 Gabriele Monaco <gmonaco@redhat.com>, 
 Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>, 
 Luca Abeni <luca.abeni@santannapisa.it>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771508294; l=4139;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=8mBEaAqx/FO7nbGRWsaxewXG0hWsTxNHEeGETDh1ovQ=;
 b=kOKO8rC4LL0X8cIW7/4fwWZCRYHQyS6DnFKESNjtqgm6enCmb/eQr8tFeQnAmVM7nB3nvK0o5
 T/y0uSHohhoBN1EEAUnCIiJWCpekFA/0XUWNZby/MyZDnaIgt5zZ3zL
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add user-facing documentation for the SCHED_FLAG_DL_DEMOTION flag in
the SCHED_DEADLINE scheduler documentation.

The new section explains how tasks with this flag demote to SCHED_NORMAL
when runtime is exhausted and automatically promote back to SCHED_DEADLINE
at the next period. Cover the bandwidth accounting behavior, migration
restrictions while demoted, handling of explicit parameter changes, and
provide a usage example.

This enables users to leverage the demotion feature for soft real-time
workloads that can gracefully degrade to best-effort execution when
occasionally overrunning their reservation.

Assisted-by: Claude Code:Sonnet 4.5
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
 Documentation/scheduler/sched-deadline.rst | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/scheduler/sched-deadline.rst b/Documentation/scheduler/sched-deadline.rst
index ec543a12f848e..d4f25150648b4 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -9,6 +9,8 @@ Deadline Task Scheduling
     2. Scheduling algorithm
       2.1 Main algorithm
       2.2 Bandwidth reclaiming
+      2.3 Energy-aware scheduling
+      2.4 Deadline task demotion
     3. Scheduling Real-Time Tasks
       3.1 Definitions
       3.2 Schedulability Analysis for Uniprocessor Systems
@@ -300,6 +302,58 @@ Deadline Task Scheduling
  setting a fixed CPU frequency results in a lower amount of deadline misses.
 
 
+2.4 Deadline task demotion
+---------------------------
+
+ The SCHED_FLAG_DL_DEMOTION flag enables an alternative behavior when a
+ SCHED_DEADLINE task exhausts its runtime budget. Instead of being throttled
+ until its next period (as described in Section 2.1), a task with this flag
+ set is temporarily "demoted" to run as SCHED_NORMAL, allowing it to continue
+ execution while competing with other normal tasks. When the replenishment
+ timer fires at the next period, the task is automatically "promoted" back to
+ SCHED_DEADLINE with its runtime budget replenished.
+
+ This mechanism is useful for soft real-time workloads that need timing
+ guarantees most of the time but can gracefully degrade to best-effort
+ execution when they occasionally overrun their reservation, rather than
+ being completely suspended until the next period.
+
+ State transitions and behavior:
+
+  - **Demotion**: When a task with SCHED_FLAG_DL_DEMOTION exhausts its runtime
+    (remaining runtime <= 0), it is immediately switched to SCHED_NORMAL policy
+    and continues executing as a normal task. Its bandwidth reservation remains
+    in place - the task still "owns" its reserved bandwidth even while running
+    as SCHED_NORMAL.
+
+  - **Promotion**: When the replenishment timer fires (at the next period), the
+    task is automatically switched back to SCHED_DEADLINE policy with its
+    runtime budget replenished. The task then resumes real-time execution.
+
+  - **Migration restriction**: While demoted, a task cannot migrate to other
+    CPUs through the normal load balancer. This simplifies bandwidth accounting
+    by ensuring the reservation stays on the original CPU. Migration is
+    re-enabled after promotion or if the task's scheduling parameters are
+    explicitly changed.
+
+ Example usage::
+
+    struct sched_attr attr;
+    attr.size = sizeof(attr);
+    attr.sched_policy = SCHED_DEADLINE;
+    attr.sched_runtime = 10 * 1000 * 1000;   /* 10ms */
+    attr.sched_deadline = 100 * 1000 * 1000; /* 100ms */
+    attr.sched_period = 100 * 1000 * 1000;   /* 100ms */
+    attr.sched_flags = SCHED_FLAG_DL_DEMOTION;
+    attr.sched_nice = 0;  /* Nice value when demoted */
+
+    sched_setattr(pid, &attr, 0);
+
+ When this task exhausts its 10ms budget within a period, it will be demoted
+ to SCHED_NORMAL (with nice value 0) rather than being throttled. It will be
+ promoted back to SCHED_DEADLINE at the start of the next period.
+
+
 3. Scheduling Real-Time Tasks
 =============================
 

-- 
2.53.0

