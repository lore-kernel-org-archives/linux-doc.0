Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95131096F;
	Wed, 26 Aug 2026 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787702424; cv=none; b=ZhDlFfTOXuqu/zoV+1vk5KpPrajnESl17YHrjiAqupAZM+26sgLcZzSnXoPJnaXZiMzFnV/jEyvKrkNLZDFY3FNrUI1nS6Q92MGzmnGt6Qmn5nTdztn+uDC/2v41ZdcEJ/CJCNVI14Z4zWOs9RJIgrcllWxHx57s4pJ+mXcuEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787702424; c=relaxed/simple;
	bh=Z6aHtvQXyGKCnTQVv7nMlmByWVfeRnZRrw/SQND8FGM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D4IChaZhQ8M+lINQzOf3I/erOUe9ZoJL6Ermv9qiZp5WJ0x/FmJgp2dznEZr/KIyyvmoYYEb0iVeb+rHerlSXfeCXXYBqkKBDfeCgOXz5LZiERxyE8x7xDQSHNH/Yw2Pe6N6OjbgR0vDj7mFQSuwl3Uxefu1UgD2VJiMGU/aha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=jRLKtJQM; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="jRLKtJQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1787698183;
	bh=Z6aHtvQXyGKCnTQVv7nMlmByWVfeRnZRrw/SQND8FGM=;
	h=From:Subject:Date:To:Cc:From;
	b=jRLKtJQMbd99ynRnT9wFONXVeWE74gxq2ur0Yo+srnmjJSh7FlPDmAFGKk9V6iOC2
	 bq35RF1zdybaoWvWe/mhIbPdDrmI8xORDwC1kBmD0M9qhlCXjA4tWGCmoZsCa2G6+f
	 Fps2JEc+q1dp1TZAelVHVVWOmhRTXroOqegvJRx8=
Received: from sut02sys-r112.scc-lab.amperecomputing.com (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTPS id ED20240112;
	Tue, 25 Aug 2026 15:49:42 -0700 (PDT)
From: "Shubhang Kaushik (Ampere)" <sh@gentwo.org>
Subject: [RFC PATCH 0/2] sched: Document WF_SYNC wakeup placement semantics
Date: Tue, 25 Aug 2026 15:46:55 -0700
Message-Id: <20260825-sched-wf-sync-doc-v1-0-f899edb44ff5@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8bjmoC/x3MTQqAIBBA4avErBswicquEi1Kx5yNhgP9EN09a
 fkt3ntAKDMJjNUDmQ4WTrGgqSuwYYkbIbti0Ep3atAtig3k8PQod7TokkUyem09maH3PZRuz+T
 5+p/T/L4fR0pHGGMAAAA=
X-Change-ID: 20260824-sched-wf-sync-doc-e92b4fe987f7
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787698182; l=1390;
 i=sh@gentwo.org; s=20251010; h=from:subject:message-id;
 bh=Z6aHtvQXyGKCnTQVv7nMlmByWVfeRnZRrw/SQND8FGM=;
 b=VWKuuAAoEr8Pqq75XMvPG8NDSzjmL9pmZEwb46liGrwd/mv4yZ3WzJz96W9C0j3jDtmJx0m5v
 DdSCtkg/4aYARNDTKRZkWYH1tHvSm92P5z5ivHngG1uDa8kkq6S41YC
X-Developer-Key: i=sh@gentwo.org; a=ed25519;
 pk=jc8YIRvxPSyJaBRe5y+a4N0RXKBUEcAh8+OFhlROXPY=

WF_SYNC is passed by synchronous waitqueue wakeup helpers when the
caller expects the waker to schedule away soon. Its fair-class semantics
are not documented.

In particular, the waitqueue API comments state that a synchronous wakee
will not be migrated to another CPU. This is not guaranteed by the
current wakeup path. For a blocked fair-class wakee, wake_affine() can
select the waking CPU, but select_idle_sibling() can select another
eligible CPU.

Document the current fair-class CPU-selection and wakeup-preemption
behavior. Also correct the stale waitqueue API comments.

This series does not change scheduler behavior. It documents WF_SYNC as
a non-binding fair-class hint and does not define a stronger placement
policy.

Signed-off-by: Shubhang Kaushik (Ampere) <sh@gentwo.org>
---
Shubhang Kaushik (Ampere) (2):
      sched: Document WF_SYNC wakeup placement semantics
      sched/wait: Clarify WF_SYNC wakeup semantics

 Documentation/scheduler/index.rst               |   1 +
 Documentation/scheduler/sched-wake-affinity.rst | 133 ++++++++++++++++++++++++
 kernel/sched/wait.c                             |  30 +++---
 3 files changed, 150 insertions(+), 14 deletions(-)
---
base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
change-id: 20260824-sched-wf-sync-doc-e92b4fe987f7

Best regards,
-- 
Shubhang Kaushik (Ampere) <sh@gentwo.org>

