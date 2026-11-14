Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681403;
	b=n8OQtLsQPMjkt8mBmNLvfOApZDQcGKPmo5hpoLZ5XGW8ggLKeTrJfo73sLf6nCaeETgw
	 whicd7dy3ux666XblhS/yTeteKTXQlTinsjl5G0fhClHmd0+nhYVoRrbTMoCMd5uv3QyH
	 1eZwnLj4HWUA0Je8uOm8LWhVhKsMDjGtJYvtk971M+B1BuBj7WisMuuYfLo4QtmJ1ben7
	 ghc2QIHFmY2J2UmHb7hP3LM+qwSvuLSG6Mr5HjSsqsisXlj3PH9bFku+OkA1BHFLxSTPr
	 6NRUn5oPGOO81UbBN/t3doM756hyKo4nFdK+TS73v5wuy2WtU7UJXNZY4T9WDLmqo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
	b=1R2s+5DoahKgvC0/5zP4hL9zSwzz1dS3HNm17BN99K0HyK8nQMQIIf9L2fMwmaskj6c2
	 7WqksA7yjIJYQi/ICLmqiRh2FIkiBbqCZY3M0wnakNiCmxT5GoU1N4J1KpF5UbsO3b2fw
	 6Kt6QIclx28mLC92ilqKiCPt2QE3wXnAXOCgckJtPhvcm2hgPrSYC0UGhW8d5Cz8hoy6r
	 cKv6hTrjXqz6TuAcsukikjSXFsdZ4edRyXd5bIpe/AqiW1SXcDwXvr1ZOSOk30zG+prmf
	 ZXo1YM7qFQpPn9C3jdkxocNAcjryeiUlEmHyEVeGoY0w4wnP0fDCas0IJVOA+osOleQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R41vpFJi;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85623606A323
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85623606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R41vpFJi
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so2047815e9.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681401; x=1795286201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
        b=R41vpFJiQdc0PDk8ieweZXHgdHHtgMZivH9PPi3Y3b2UmwppVpZh8WXRIZ7FOU9h9S
         lvYE9Shrnax+jyFWUq685uqrvXFBhroGBCsW8TRobUasuUKVfjn1Q90PLw17McKqKS7Y
         l0nhH0PB2BuG1euDgpD9e1q4mi/iRSIUDakUKeKEBOqN2VJP/HnFYb6RkzKj49bVg5QB
         MfzvMV1FtOUs+xF3DMvfAYTGkMMY2Qw2Zab9N+F01k4TkByIbYsMGpFIvEUeDRjOGR6X
         1V+mKMqHsoa85mA3SJsIRME7mdN6sKhOkGV8hWDehbzi/gKExqkAFDS5g13Ovc+bKZ7b
         NDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681401; x=1795286201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2V2xBQvmo7ss6uvRVL8EHtUlkPPaUKe2Ps9ruTZ9eXk=;
        b=PsC0GOzqS/A2Wcd4LZxAzYrQyd2bZoiZO+WkqJy5XakAIyp5LuAjFyDjGgm2fUEe9i
         5IWrYYj5YZUbgZS5ZVvMdlpRKt+HgMo6Aa2XfWNlFTM78owvPPdKv6qHeD8AyB2E0aYb
         GY38iL+sWH9r1vBzD6e2cBgBRUt+cfPJ8JXdwygeTn0+JVQD5VfO+UQfiHaQvA0Oirfp
         8lXZhxzL2AR7MhA+P2dHRE7bc+LEilEWqEqx3zcPhwbgHbRX9eRlnu8JDbGTbMVdncF/
         /7JXyOm0zTeVL1dM67PJs87eu/Ry2aqwK6EH2qyQ1rEPKZAc+KOfGn/6SjUwRhEoS4fj
         8OsA==
X-Forwarded-Encrypted: i=1; AL+hErGgrMoSNVVMavouLibLS0YHaLz0OCXL8f39p1KwaOioKn8ahE4xRUgWXZGX0oMOFI1qjvAPaLG+9Rg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BsqxSoXAHr8c1MZx1SCtJOFmbyXcF92iN0cTxzQbmnJAakcp/
	XmExhjXvcM3UXCbA9IzduWmHIukZjX6jScFwDRBdwGTwm6JbS5OY5rJy
X-Gm-Gg: AYBFou3B9CHTzsVx25+f4ns0zdgA8gnAB9osI/oS9my+y2603ksokoZTGcSlV1nWye5
	cEV6LOloYRseSxUQPfQ9h2Gh9+nsc2egmVnmurU6ojpqAgcO1dGHiKxSVg4tlfto6GBMfZhMZ1o
	hviPfXhPSyjmc4jEldelj8I+/1gBd5sN/plsjU+qxfp/dCsnXqp8ihJgXNhD4bytOkFJV3ChZqK
	xO1O/uxRbVLr8JyXG/kaNx1FzQjPIOYTu0lVR1LNRPh+Bt+yVWz5QilL8w7RhVKqj6rHYVDq8Nr
	O+z27/KGqrcU85SWlJPxeArC6iXmnYQrdp78iQveZMhpCrqdFtWMsY+qvGOu7N2z3r9iMi63pqH
	HjrunBuIi5/a7ho6z+BIbtS2R1TiXiMMfQmdZkSU0mos6Ey6HBkvwZ3ZIqYwRgjnwuo+EhnbJ0z
	Buf2cjJROnYZbGO+xY6+X3I1AOYOBIrLtGbby2Vde2vTYuYZMSblzb5oxy/bjPe0CzvQ85CergP
	rNmeP1lmaXfKA8hUS0fYcL8cM7YGczPN0OT5CXJLgMuvi3F1ybt7PmNd1LqhUQBwVYIK67WUzqd
	3y0L4kvc5eY65RvR2FqW3BncW2BjR3QW4iJBAUztsHsPjsTW6tU=
X-Received: by 2002:a05:600d:8654:20b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4bb55a40159mr100887715e9.2.1794681400654;
        Sat, 14 Nov 2026 10:36:40 -0800 (PST)
Received: from lima-kdev.local ([88.243.154.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm256300075e9.15.2026.11.14.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:36:40 -0800 (PST)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: corbet@lwn.net,
	peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH] sched/docs: Rewrite sched-eevdf.rst
Date: Sat, 14 Nov 2026 21:36:17 +0300
Message-ID: <20261114183618.56111-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The current sched-eevdf.rst doesn't explain most of
the concepts in EEVDF.

Describe the concepts (V, vruntime, deadline, eligibility,
lag, etc.).

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
Hi!

I tried to rewrite this whole sched-eevdf.rst thing.

The current sched-eevdf.rst doesn't explain most of the concepts as
the commit says too.

There are some other little issues too, like the second link shows a
random reply instead of the cover letter.

Hope I did not miss anything :-).

 Documentation/scheduler/sched-eevdf.rst | 194 +++++++++++++++++++-----
 1 file changed, 155 insertions(+), 39 deletions(-)

diff --git a/Documentation/scheduler/sched-eevdf.rst b/Documentation/scheduler/sched-eevdf.rst
index 83efe7c0a30d..5c74e3b5672a 100644
--- a/Documentation/scheduler/sched-eevdf.rst
+++ b/Documentation/scheduler/sched-eevdf.rst
@@ -1,43 +1,159 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===============
 EEVDF Scheduler
 ===============
 
-The "Earliest Eligible Virtual Deadline First" (EEVDF) was first introduced
-in a scientific publication in 1995 [1]. The Linux kernel began
-transitioning to EEVDF in version 6.6 (as a new option in 2024), moving
-away from the earlier Completely Fair Scheduler (CFS) in favor of a version
-of EEVDF proposed by Peter Zijlstra in 2023 [2-4]. More information
-regarding CFS can be found in
-Documentation/scheduler/sched-design-CFS.rst.
-
-Similarly to CFS, EEVDF aims to distribute CPU time equally among all
-runnable tasks with the same priority. To do so, it assigns a virtual run
-time to each task, creating a "lag" value that can be used to determine
-whether a task has received its fair share of CPU time. In this way, a task
-with a positive lag is owed CPU time, while a negative lag means the task
-has exceeded its portion. EEVDF picks tasks with lag greater or equal to
-zero and calculates a virtual deadline (VD) for each, selecting the task
-with the earliest VD to execute next. It's important to note that this
-allows latency-sensitive tasks with shorter time slices to be prioritized,
-which helps with their responsiveness.
-
-There are ongoing discussions on how to manage lag, especially for sleeping
-tasks; but at the time of writing EEVDF uses a "decaying" mechanism based
-on virtual run time (VRT). This prevents tasks from exploiting the system
-by sleeping briefly to reset their negative lag: when a task sleeps, it
-remains on the run queue but marked for "deferred dequeue," allowing its
-lag to decay over VRT. Hence, long-sleeping tasks eventually have their lag
-reset. Finally, tasks can preempt others if their VD is earlier, and tasks
-can request specific time slices using the new sched_setattr() system call,
-which further facilitates the job of latency-sensitive applications.
-
-REFERENCES
-==========
-
-[1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
-
-[2] https://lore.kernel.org/lkml/a79014e6-ea83-b316-1e12-2ae056bda6fa@linux.vnet.ibm.com/
-
-[3] https://lwn.net/Articles/969062/
-
-[4] https://lwn.net/Articles/925371/
+Earliest Eligible Virtual Deadline First, or EEVDF for short, was
+first introduced in a scientific article that was written by Ion Stoica
+and Hussein Abdel-Wahab in 1995 [1]_.
+
+Then Peter Zijlstra suggested it as a replacement for CFS
+(Completely Fair Scheduler) [2]_. First parts of it got merged into Linux in 6.6.
+
+Our objective is to select the task with the earliest
+deadline from the tasks that are eligible.
+
+
+Core Basics
+============
+
+Every task has its own *weight*, derived from its nice value.
+
+The bigger the *weight*, the slower the *vruntime* increases.
+The slower the *vruntime* increases, the easier it is for a task to be eligible.
+
+
+Formula for virtual runtime is::
+
+   (delta * NICE_0_LOAD) / weight
+
+*delta* is calculated by this formula::
+
+    now - exec_start
+
+*exec_start* is the last time that we accounted the task.
+
+And every runqueue has its own average virtual runtime. We'll call it *V*.
+
+Formula for *V* is::
+
+     Sum(weight * vruntime) / Sum(weight)
+
+
+Eligibility
+~~~~~~~~~~~~
+
+For a task to be considered eligible, its vruntime must be smaller than or
+equal to *V*.
+
+
+Deadline
+~~~~~~~~~~~~
+
+Deadline is like a point on vruntime. We calculate it by::
+
+    vruntime + ((slice * NICE_0_LOAD) / weight)
+
+*slice* is usually equal to sysctl_sched_base_slice,
+which is 0.70 ms by default. It's the time the task requested to run.
+
+However, a task doesn't have to run exactly as its *slice* says.
+It can get preempted, it can sleep, etc.
+But we will reschedule when the task's *vruntime* gets equal to its *deadline*,
+or passes it. Or at least when we realize it did.
+
+Examples
+~~~~~~~~
+
+==== ====== ======== ========
+Task weight vruntime deadline
+==== ====== ======== ========
+TA    1     7        8
+TB    2     5        10
+TC    3     6        9
+==== ====== ======== ========
+
+Here, *V* is equal to 5.83.
+
+The only task that is eligible is TB. It has the farthest deadline
+but the other competitors T{A,C} are not eligible, so TB gets picked.
+
+Sleep Handling
+==============
+
+The problem with sleeping tasks is that their runqueue's *V* continues to increase/decrease
+while they are sleeping. Normally, sleeping tasks leave the runqueue, so we need
+to save their *vruntime*'s position relative to *V* in order to place them correctly.
+
+(Delayed Dequeue is an exception to that, as explained below.)
+
+We call that *lag*::
+
+    V - vruntime
+
+Example:
+
+==== ====== ========
+Task weight vruntime
+==== ====== ========
+TA    1     1
+TB    1     3
+==== ====== ========
+
+Right now, *V* is 2, TA's *lag* is 1, TB's *lag* is -1.
+
+Now let's say TB sleeps and in the meantime TA's *vruntime* gets to 12.
+If we try to place TB with::
+
+    V - lag
+
+It equals 13, so *V* gets to 12.5. So now TB's *lag* is -0.5 instead of -1.
+
+So to fix this, we use a formula while placing lag::
+
+    ((Sum(weight) + weight) * lag) / Sum(weight)
+
+
+Here, *weight* is our own weight, and Sum(weight) is the sum of all of the tasks weights in the runqueue,
+in our case both are equal to 1.
+
+Now let's try the same case with this formula:
+
+*lag* equals -2, *vruntime* of TB equals 14, so now *V* equals 13
+and both TB's lag and TA's *lag* are correct.
+
+Delayed Dequeue
+~~~~~~~~~~~~~~~~
+
+Negative *lag* means that the task is in debt to its runqueue.
+We don't want to carry a task's negative *lag* until eternity.
+
+Because while a task sleeps, the other tasks in the runqueue work.
+And if the task were not sleeping its *lag* would increase since
+it was paying its debt by not working.
+
+Sleep is similar to this, the only problem is that normally while sleeping
+we wouldn't be on the runqueue. Since we are sleeping and we don't want
+to be chosen. So our debt wouldn't be paid.
+
+With Delayed Dequeue, if a task has a negative lag and if it's going to sleep,
+we don't immediately dequeue it.
+
+It stays in the runqueue, as if it's not sleeping. However, because it has negative lag
+it's not eligible.
+
+A delayed dequeue of a task can end in 2 ways:
+
+1. When the task's debt is paid fully, (*lag* >= 0) it becomes eligible. So it can get picked.
+   When a delayed task gets picked, we really remove it from the runqueue.
+
+2. If the delayed task wakes up before it gets picked, we just clear the delayed
+   status and the task stays in the runqueue.
+
+
+References
+============
+
+.. [1] https://citeseerx.ist.psu.edu/document?repid=rep1&type=pdf&doi=805acf7726282721504c8f00575d91ebfd750564
+.. [2] https://lore.kernel.org/lkml/20230328092622.062917921@infradead.org/
-- 
2.53.0

