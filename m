Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB42264A7;
	Wed, 26 Aug 2026 01:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787706625; cv=none; b=rOGdXCdMjbUmqroaZfu9Ezpfs9K0KbuNFiG5XZZCI1S01NKBLSNpMTPPZdUeU5V0sZ+e92z59/Yu1dumBXh0y654qHaVlTNQ7CY4qb+IjlrzYaod5tVcYNR0OYSCGkPNZ0+NKKJDF4Sg/8IRfcwuuSLiwFbSd4CXDq4gYAOeoqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787706625; c=relaxed/simple;
	bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWBWYUs0X00p9ISG1N/6YNcR8reACrq1KuFETM67K+UKPhVnbb+YP8I8KQwrre1PF5hgf3ky3tb0dSb7CzPqt4Vo2UrumSwSgPbyu3+D7PHlu7A/GJPeh63TOumOxWu1olIvufVpnboBhDI089KQMarw5Gry2io+ScHVvQfY38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=pBf3A4JG; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="pBf3A4JG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1787698184;
	bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pBf3A4JGOkgQAWZZvQVRNnkhuAsxYPrCrO0c7pORUlBGdGb6PCttRca78GiYT576M
	 Y4/yyPHvQVJthNN1/m47cgbN3zjiZ7hV6h1GTyyD0JLIb9rIjOXrCM1sJNEDGmFFxT
	 pnjikTpafq0VLX4Dj0fZfDXcKRCsO0eqMhhv3yHE=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id 003A340BCE;
	Tue, 25 Aug 2026 15:49:43 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Date: Tue, 25 Aug 2026 15:46:57 -0700
Subject: [RFC PATCH 2/2] sched/wait: Clarify WF_SYNC wakeup semantics
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-sched-wf-sync-doc-v1-2-f899edb44ff5@gentwo.org>
References: <20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org>
In-Reply-To: <20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Shubhang Kaushik <shubhang@os.amperecomputing.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
 Christopher Lameter <clameter@amperecomputing.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787698182; l=3313;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=wNrHsjDKVfWS8zXNLUqwBHM5EXAhWqtMXDjFXL6wzKI=;
 b=CHsLAT8NtNZVx9oZK2SXENLmbvhiX+PAdyMBo+4Jond10RzM3UYxw9ddOBtD2jPYxUhPm+tMi
 9mwYMV1GpiOAKkMdEFs8oOJ8CgoXk83jLH2Qxje9dSQF00NCA3RM4sh
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

The synchronous waitqueue wakeup comments state that the wakee will not
be migrated to another CPU. This is not guaranteed by the current
scheduler wakeup path.

The synchronous helpers pass WF_SYNC to waitqueue wake functions. The
default wake function forwards it to the scheduler, where fair-class
tasks can use it as a wakeup-placement and preemption hint.

Correct the API comments to describe this behavior and remove the
incorrect no-migration guarantee.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
 kernel/sched/wait.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index d033f600f48c6fc3a0a088ea5d9f6ed95ec4c86e..ac1d260a6a37fc35b934079706819b79e20df4ba 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -174,15 +174,16 @@ EXPORT_SYMBOL_GPL(__wake_up_locked_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
+ * The caller expects the waker to schedule away soon. This helper passes
+ * WF_SYNC to waitqueue wake functions. The default wake function forwards
+ * it to the scheduler.
  *
- * On UP it can prevent extra preemption.
+ * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
+ * hint. It does not guarantee that the wakee will run on the waker CPU
+ * or avoid migration. On UP, this may avoid an unnecessary preemption.
  *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * If this function wakes up a task, it executes a full memory barrier
+ * before accessing the task state.
  */
 void __wake_up_sync_key(struct wait_queue_head *wq_head, unsigned int mode,
 			void *key)
@@ -200,15 +201,16 @@ EXPORT_SYMBOL_GPL(__wake_up_sync_key);
  * @mode: which threads
  * @key: opaque value to be passed to wakeup targets
  *
- * The sync wakeup differs in that the waker knows that it will schedule
- * away soon, so while the target thread will be woken up, it will not
- * be migrated to another CPU - ie. the two threads are 'synchronized'
- * with each other. This can prevent needless bouncing between CPUs.
+ * The caller expects the waker to schedule away soon. This helper passes
+ * WF_SYNC to waitqueue wake functions. The default wake function forwards
+ * it to the scheduler
  *
- * On UP it can prevent extra preemption.
+ * For fair-class tasks, WF_SYNC is a wakeup-placement and preemption
+ * hint. It does not guarantee that the wakee will run on the waker CPU
+ * or avoid migration. On UP, this may avoid an unnecessary preemption.
  *
- * If this function wakes up a task, it executes a full memory barrier before
- * accessing the task state.
+ * If this function wakes up a task, it executes a full memory barrier
+ * before accessing the task state.
  */
 void __wake_up_locked_sync_key(struct wait_queue_head *wq_head,
 			       unsigned int mode, void *key)

-- 
2.52.0

