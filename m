Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C631A044;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770930733; cv=none; b=FzGiWOzFmghPU/WlQpGgcab/vkZRrE9fen8M/ZLAD0/zeQsAwKXhb3KvYwFFVllzG2KQLS7OBAtoaIrrBYN1Pux5mHM8jktmQpIZWJUL9rSkPUkqrt9naEUQn67wcWqaWb1zel6zsKLXAPNlqciEvt2mtThBfI2nPityGW/FzTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770930733; c=relaxed/simple;
	bh=OzjdI4PRkfQOu56QOGogikmXev7K2jhS7+htkQFK1rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6MpCJdNAYEBdIk5vn6SPPDZ3jV9kpqj9D2e7Ri8YRXpaid7L9zFqSpzOjuN8pH+9svb2/dUxE6wsNG3X4G1QCIekqO8Kgh5IkMM3SEfI3T44ECSu0WWGNhQiNsScmceoqRPnmD/nkCV0MPal96u6z46P+n++ixV7CBuO7DA6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlwG8gEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlwG8gEb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF6D7C19424;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770930733;
	bh=OzjdI4PRkfQOu56QOGogikmXev7K2jhS7+htkQFK1rA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BlwG8gEblEXOBj13tNy6TYSiOI0MjZO4JSs+d4Jo0PN4+G9ml3o0H9pl9/c/NHA0z
	 i5cC6dZZ1994vnPdy5wGQwIrGalPYRZ5HcfbJ0Jk7I/ogwJA2gDRBPhw3MvRl4SN7U
	 dBqZNIqgkEtxfO6pD70/e7QwWoINf8KzY7JfA6ktkmOiRRU/pKG/3UQ6U7CfZ8BCyh
	 U4CSpKY2XVr7zNE7YJMFXmmmX2xlD2i2K9gc/Ktv1ex4Dqn91eQZ3NDGUb5NQZZWzC
	 zTmOjxe05oUCvS3QYhi/agtUrQoF41LOp6wv9KHIwkg12dOTJvvvx6UuKNrAARIwJW
	 ExDXwYEe4EL0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C68EEA850;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Feb 2026 14:12:13 -0700
Subject: [PATCH 4/4] doc: watchdog: Document buddy detector
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-hardlockup-watchdog-fixes-v1-4-745f1dce04c3@google.com>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
 Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770930732; l=9260;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=zQJ5AME8IRJnyw3jfYBu6R/B2xO/DNdkDnl61rje4aw=;
 b=toFHZ4xPh9Rwtyl9nRS1I8kdpONsLEyLmZky1cWcVD5z9MmcoaspJHHjJPhCzdCKOs0J88MOO
 pkF7YBQHDqKDBfWl3iNyx8/WKdqAFz4MOpiHXhNbgdzT3dOFpzroXsK
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com

From: Mayank Rungta <mrungta@google.com>

The current documentation generalizes the hardlockup detector as primarily
NMI-perf-based and lacks details on the SMP "Buddy" detector.

Update the documentation to add a detailed description of the Buddy
detector, and also restructure the "Implementation" section to explicitly
separate "Softlockup Detector", "Hardlockup Detector (NMI/Perf)", and
"Hardlockup Detector (Buddy)".

Clarify that the softlockup hrtimer acts as the heartbeat generator for
both hardlockup mechanisms and centralize the configuration details in a
"Frequency and Heartbeats" section.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 Documentation/admin-guide/lockup-watchdogs.rst | 149 +++++++++++++++++--------
 1 file changed, 101 insertions(+), 48 deletions(-)

diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentation/admin-guide/lockup-watchdogs.rst
index 1b374053771f676d874716b3210cade55ae89b28..7ae7ce3abd2c838ff29c70f7a32ffaf58531e150 100644
--- a/Documentation/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/admin-guide/lockup-watchdogs.rst
@@ -30,22 +30,23 @@ timeout is set through the confusingly named "kernel.panic" sysctl),
 to cause the system to reboot automatically after a specified amount
 of time.
 
+Configuration
+=============
+
+A kernel knob is provided that allows administrators to configure
+this period. The "watchdog_thresh" parameter (default 10 seconds)
+controls the threshold. The right value for a particular environment
+is a trade-off between fast response to lockups and detection overhead.
+
 Implementation
 ==============
 
-The soft and hard lockup detectors are built on top of the hrtimer and
-perf subsystems, respectively. A direct consequence of this is that,
-in principle, they should work in any architecture where these
-subsystems are present.
+The soft lockup detector is built on top of the hrtimer subsystem.
+The hard lockup detector is built on top of the perf subsystem
+(on architectures that support it) or uses an SMP "buddy" system.
 
-A periodic hrtimer runs to generate interrupts and kick the watchdog
-job. An NMI perf event is generated every "watchdog_thresh"
-(compile-time initialized to 10 and configurable through sysctl of the
-same name) seconds to check for hardlockups. If any CPU in the system
-does not receive any hrtimer interrupt during that time the
-'hardlockup detector' (the handler for the NMI perf event) will
-generate a kernel warning or call panic, depending on the
-configuration.
+Softlockup Detector
+-------------------
 
 The watchdog job runs in a stop scheduling thread that updates a
 timestamp every time it is scheduled. If that timestamp is not updated
@@ -55,53 +56,105 @@ will dump useful debug information to the system log, after which it
 will call panic if it was instructed to do so or resume execution of
 other kernel code.
 
-The period of the hrtimer is 2*watchdog_thresh/5, which means it has
-two or three chances to generate an interrupt before the hardlockup
-detector kicks in.
+Frequency and Heartbeats
+------------------------
+
+The hrtimer used by the softlockup detector serves a dual purpose:
+it detects softlockups, and it also generates the interrupts
+(heartbeats) that the hardlockup detectors use to verify CPU liveness.
+
+The period of this hrtimer is 2*watchdog_thresh/5. This means the
+hrtimer has two or three chances to generate an interrupt before the
+NMI hardlockup detector kicks in.
+
+Hardlockup Detector (NMI/Perf)
+------------------------------
+
+On architectures that support NMI (Non-Maskable Interrupt) perf events,
+a periodic NMI is generated every "watchdog_thresh" seconds.
+
+If any CPU in the system does not receive any hrtimer interrupt
+(heartbeat) during the "watchdog_thresh" window, the 'hardlockup
+detector' (the handler for the NMI perf event) will generate a kernel
+warning or call panic.
+
+**Detection Overhead (NMI):**
+
+The time to detect a lockup can vary depending on when the lockup
+occurs relative to the NMI check window. Examples below assume a watchdog_thresh of 10.
+
+* **Best Case:** The lockup occurs just before the first heartbeat is
+  due. The detector will notice the missing hrtimer interrupt almost
+  immediately during the next check.
+
+  ::
+
+    Time 100.0: cpu 1 heartbeat
+    Time 100.1: hardlockup_check, cpu1 stores its state
+    Time 103.9: Hard Lockup on cpu1
+    Time 104.0: cpu 1 heartbeat never comes
+    Time 110.1: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
+
+    Time to detection: ~6 seconds
+
+* **Worst Case:** The lockup occurs shortly after a valid interrupt
+  (heartbeat) which itself happened just after the NMI check. The next
+  NMI check sees that the interrupt count has changed (due to that one
+  heartbeat), assumes the CPU is healthy, and resets the baseline. The
+  lockup is only detected at the subsequent check.
+
+  ::
+
+    Time 100.0: hardlockup_check, cpu1 stores its state
+    Time 100.1: cpu 1 heartbeat
+    Time 100.2: Hard Lockup on cpu1
+    Time 110.0: hardlockup_check, cpu1 stores its state (misses lockup as state changed)
+    Time 120.0: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
 
-As explained above, a kernel knob is provided that allows
-administrators to configure the period of the hrtimer and the perf
-event. The right value for a particular environment is a trade-off
-between fast response to lockups and detection overhead.
+    Time to detection: ~20 seconds
 
-Detection Overhead
-------------------
+Hardlockup Detector (Buddy)
+---------------------------
 
-The hardlockup detector checks for lockups using a periodic NMI perf
-event. This means the time to detect a lockup can vary depending on
-when the lockup occurs relative to the NMI check window.
+On architectures or configurations where NMI perf events are not
+available (or disabled), the kernel may use the "buddy" hardlockup
+detector. This mechanism requires SMP (Symmetric Multi-Processing).
 
-**Best Case:**
-In the best case scenario, the lockup occurs just before the first
-heartbeat is due. The detector will notice the missing hrtimer
-interrupt almost immediately during the next check.
+In this mode, each CPU is assigned a "buddy" CPU to monitor. The
+monitoring CPU runs its own hrtimer (the same one used for softlockup
+detection) and checks if the buddy CPU's hrtimer interrupt count has
+increased.
 
-::
+To ensure timeliness and avoid false positives, the buddy system performs
+checks at every hrtimer interval (2*watchdog_thresh/5, which is 4 seconds
+by default). It uses a missed-interrupt threshold of 3. If the buddy's
+interrupt count has not changed for 3 consecutive checks, it is assumed
+that the buddy CPU is hardlocked (interrupts disabled). The monitoring
+CPU will then trigger the hardlockup response (warning or panic).
 
-  Time 100.0: cpu 1 heartbeat
-  Time 100.1: hardlockup_check, cpu1 stores its state
-  Time 103.9: Hard Lockup on cpu1
-  Time 104.0: cpu 1 heartbeat never comes
-  Time 110.1: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
+**Detection Overhead (Buddy):**
 
-  Time to detection: ~6 seconds
+With a default check interval of 4 seconds (watchdog_thresh = 10):
 
-**Worst Case:**
-In the worst case scenario, the lockup occurs shortly after a valid
-interrupt (heartbeat) which itself happened just after the NMI check.
-The next NMI check sees that the interrupt count has changed (due to
-that one heartbeat), assumes the CPU is healthy, and resets the
-baseline. The lockup is only detected at the subsequent check.
+* **Best case:** Lockup occurs just before a check.
+    Detected in ~8s (0s till 1st check + 4s till 2nd + 4s till 3rd).
+* **Worst case:** Lockup occurs just after a check.
+    Detected in ~12s (4s till 1st check + 4s till 2nd + 4s till 3rd).
 
-::
+**Limitations of the Buddy Detector:**
 
-  Time 100.0: hardlockup_check, cpu1 stores its state
-  Time 100.1: cpu 1 heartbeat
-  Time 100.2: Hard Lockup on cpu1
-  Time 110.0: hardlockup_check, cpu1 stores its state (misses lockup as state changed)
-  Time 120.0: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
+1.  **All-CPU Lockup:** If all CPUs lock up simultaneously, the buddy
+    detector cannot detect the condition because the monitoring CPUs
+    are also frozen.
+2.  **Stack Traces:** Unlike the NMI detector, the buddy detector
+    cannot directly interrupt the locked CPU to grab a stack trace.
+    It relies on architecture-specific mechanisms (like NMI backtrace
+    support) to try and retrieve the status of the locked CPU. If
+    such support is missing, the log may only show that a lockup
+    occurred without providing the locked CPU's stack.
 
-  Time to detection: ~20 seconds
+Watchdog Core Exclusion
+=======================
 
 By default, the watchdog runs on all online cores.  However, on a
 kernel configured with NO_HZ_FULL, by default the watchdog runs only

-- 
2.53.0.273.g2a3d683680-goog


