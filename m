Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0EF2EB87E
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 13:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771508309; cv=none; b=cUt9KgTcD+7l/2N5Y+pYgVpmdp7qQ83NJNbb6nd4ulDik5+P1lWO4O/Sq+R3P0kYM4HciohMa387i5Vj+9TJDzLA/UXVy/DCQ3iSeMnOy+t//yU2LtO0TzlC9fw+dbCrE7iyurFTcRIuG7F3Kaf9b2pvWSnd5O6Fja5YL45QE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771508309; c=relaxed/simple;
	bh=cSw1phAcmiq0kZN7Wwxl0rDlV1qs6y+K54cRfWcVd4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BG/+q/vOegH5Rl15HF1/yaoVMJTtD2Mz5lSfDipiVdh8SefA5TU0kOYvHSSv9CKaLN6D/GvHZUHjPmRriIfI6mAG77ytFqK3S71yQ3HiHHzCy89g/xkXi+nm2b9qnoWlRfdmQezV5FMaeEplwTYEfG+L6AkUsIVVFdGgiZ8v588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xo4IlU9U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xo4IlU9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771508307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aOeIg9jPXgnnqCaV4kmsvRxqIOtd7FL+w1fHgOoShuM=;
	b=Xo4IlU9UJQpG6c5JWYSrCkA4H93b7i4aTdOs6PnmWmYpr8HRq1taMfX9gSDVMabZCz3K7g
	s/40/MdmJ+XZmiCel8USG9eiU2vjU5T9FjIHJ8tSBdIfcjmB6qr3609E47VzlEkAo+0s4H
	/YrJYxX6Iu/9CYeNoWxCqAuzrCVa/gk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-8rgNG8P9O9iIH6NoaYwXmg-1; Thu,
 19 Feb 2026 08:38:24 -0500
X-MC-Unique: 8rgNG8P9O9iIH6NoaYwXmg-1
X-Mimecast-MFC-AGG-ID: 8rgNG8P9O9iIH6NoaYwXmg_1771508302
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95AF41956063;
	Thu, 19 Feb 2026 13:38:21 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1534519560A7;
	Thu, 19 Feb 2026 13:38:14 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH RFC 0/4] sched/deadline: Add soft/reclaim mode via
 SCHED_OTHER demotion
Date: Thu, 19 Feb 2026 14:37:33 +0100
Message-Id: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMywrCMBBFf6XM2kAmGF9bwQ9wKy5ic9URm5ZMK
 kLpvxt1d8+FcyZSZIHSrpko4yUqfarAi4bae0g3GImVyVm3so43Zhy0ZITORIT4lIQ6ur5UzfD
 WM2O9ZOs91cCQcZX3L36i42FP5/+p4+WBtnyzNM8fqCzVjYMAAAA=
X-Change-ID: 20260218-upstream-deadline-demotion-19511e741055
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771508294; l=4943;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=cSw1phAcmiq0kZN7Wwxl0rDlV1qs6y+K54cRfWcVd4E=;
 b=S6lpBNtHabq9IcseSchz6U9UM6Wo4x1CzJ7YX6vdb+QDkxq3MMNy6tjaZyCh7N5nVkt2h6q4N
 dl6RaxghlaYDLWzIAiIZDKCVv49EhueQO0wsAXpSubo2Wu8rp5gydcV
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi All,

This RFC introduces a bandwidth reclaiming mechanism for SCHED_DEADLINE
tasks through temporary demotion to SCHED_NORMAL when runtime is
exhausted. This resurrects and refines the demotion concept from the
original SCHED_DEADLINE development circa 2010, focusing exclusively on
SCHED_NORMAL demotion.

Discussions about the feature have been resurfacing over the years and I
wanted to check for feasibility and real interest. Found a little time
to play around with the idea and this is the result of that.

When a DEADLINE task with SCHED_FLAG_DL_DEMOTION exhausts its runtime
budget, the scheduler demotes it to SCHED_NORMAL rather than throttling
it until the next period. The task continues execution competing fairly
with other normal tasks, using the nice value specified in
sched_attr.sched_nice. At the next period boundary, the replenishment
timer automatically promotes the task back to SCHED_DEADLINE with a
fresh runtime budget.

This provides a "soft(er) real-time" mode where tasks get timing
guarantees when within budget but gracefully degrade to best-effort
execution during overruns rather than being suspended. The bandwidth
reservation remains in place during demotion, making the mechanism
transparent from an admission control perspective similar to throttling.

Key design aspects:

The implementation focuses solely on SCHED_NORMAL demotion, unlike
earlier proposals that suggested multiple demotion targets including RT
and DL postponement. Simpler and maybe enough?

The feature reuses the existing sched_attr.sched_nice field to specify
the nice value during demotion, avoiding new UAPI additions while
maintaining ABI compatibility. This is orthogonal to GRUB
(SCHED_FLAG_RECLAIM) - tasks can combine both mechanisms for
opportunistic reclaiming through accounting and continued execution
through demotion (at least in principle, didn't actually test it yet :).

Demoted tasks cannot migrate between CPUs. This simplification keeps
bandwidth accounting straightforward by ensuring the reservation stays
on the original CPU throughout demotion. Migration is re-enabled after
promotion or explicit parameter changes via sched_setattr().

The bandwidth accounting follows the throttling model rather than full
class switching. Dequeue operations omit DEQUEUE_SAVE to keep the
reservation in this_bw (admission control bandwidth). Running bandwidth
(enforcement) is handled at 0-lag time for tasks that sleep while
demoted, maintaining correct GRUB accounting.

Explicit sched_setattr() calls on demoted tasks cancel the demotion
state and perform full bandwidth cleanup including inactive timer
handling and cpuset tracking. The replenishment timer remains armed but
fires harmlessly when it detects the task is no longer DEADLINE.

This posting is very much experimental. I added AI generated tests
(included here just for reference) that helped checking a few cases
during implementation. However, I am quite sure I'm missing several
additional cases that can cause breakage. Test it at your own risk! :P

Based on original work by Dario Faggioli:
https://lore.kernel.org/lkml/1288334546.8661.161.camel@Palantir/

As always comments and questions are more than welcome.

Series also available at

git@github.com:jlelli/linux.git upstream/deadline-demotion

Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
Juri Lelli (4):
      sched/deadline: Implement reclaim/soft mode through SCHED_OTHER demotion
      sched/doc: Document SCHED_DEADLINE demotion feature
      DEBUG selftests/sched: Add tests for SCHED_DEADLINE demotion feature
      DEBUG selftests/sched: Add simple demonstration of SCHED_DEADLINE demotion

 Documentation/scheduler/sched-deadline.rst         |  54 +++
 include/linux/sched.h                              |  10 +
 include/uapi/linux/sched.h                         |   4 +-
 include/uapi/linux/sched/types.h                   |   8 +
 kernel/sched/deadline.c                            | 213 +++++++++-
 kernel/sched/fair.c                                |   8 +
 kernel/sched/sched.h                               |  15 +-
 kernel/sched/syscalls.c                            |   8 +
 tools/testing/selftests/sched/.gitignore           |   3 +
 tools/testing/selftests/sched/Makefile             |   4 +-
 tools/testing/selftests/sched/README_dl_demotion   |  83 ++++
 tools/testing/selftests/sched/dl_demotion_demo.c   | 239 +++++++++++
 tools/testing/selftests/sched/dl_demotion_stress.c | 208 ++++++++++
 tools/testing/selftests/sched/dl_demotion_test.c   | 460 +++++++++++++++++++++
 .../selftests/sched/run_dl_demotion_with_trace.sh  |  71 ++++
 15 files changed, 1382 insertions(+), 6 deletions(-)
---
base-commit: e34881c84c255bc300f24d9fe685324be20da3d1
change-id: 20260218-upstream-deadline-demotion-19511e741055

Best regards,
--  
Juri Lelli <juri.lelli@redhat.com>

