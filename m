Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBA039DBEC;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357754; cv=none; b=UgqmOAazSzlhxeZ2p3+4KLrMeTa0GQ2G51GE3OSRhXHiY1jLwBCHVsEoSsfjUwZTFt6K7z64MPxT6nETJ2ztygbSwYKhk6fejOMQaDMBypnOwcd3J2xpNst9s1lXXR1DhRk2H5q+ewvqlAbQFl5n3oypDcic0w6vGGQZoWkwhW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357754; c=relaxed/simple;
	bh=ByJnEZI8QFOxbIYQDUBN5eDPkGo3Il86k/QbZHrUJ+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fR0zkpzt2El9gwR0iJgIuUN6rs2/EBMKaV2zijqV4TpenLdTEkPtFPViCC1wMgkC4TSVDsjiwy2lpaSeucJ3Fs8Eut4FjwnOiiWp686/8zq/51a0C/JlNlBKP+JKvH+697sIBWJehUsZHvEnUyHXzGE8I8f+YBEtImIyYg9CIJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCEEjuel; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCEEjuel"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9B44C2BC87;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773357753;
	bh=ByJnEZI8QFOxbIYQDUBN5eDPkGo3Il86k/QbZHrUJ+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jCEEjuelE2PMkS9edIPPnGJEwj5L5voXC57NNlx78BjKLWraBHivvGvwVpFB0n4JE
	 k5X7YU+2aD2pkuLTDu/Xg7BzWIQ8vLzON9HKaWK4ps5wvxXSXI6sz2608EG8qjMzRk
	 OGRGzP52fpomrUfSF7S6HWQML+IUfD5x9gp65JaMGgDvFcXl2Q6tssOQmTVDo24MuE
	 WvUUN6of54d+eDUL8+97wcc0UWnvjV3YLTbBvg046TR8NVLM4dVLnwY2bQSe65Lgm5
	 Ra9RYwP6gGWPdN2Ab5mIAHgtKkucooGblN+apgoaO3Ne7SXtasIL8c8fqnG9D3oH8g
	 klLYXqejfn8Eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0498FED2F5;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Mar 2026 16:22:04 -0700
Subject: [PATCH v2 3/5] doc: watchdog: Clarify hardlockup detection timing
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hardlockup-watchdog-fixes-v2-3-45bd8a0cc7ed@google.com>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
To: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773357752; l=3703;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=i35ZyFlJNjhl6osHQxeTEcPG+44w2tOOkFaSeusqbQ8=;
 b=4HY4TTU3VfyWx5uaGcGREg3VgDAbDYasdvalGDgnIB9Gmcy5UZOgogoRSUtub5SNrrLoLHXJp
 ICQg76rZwgyB3mzqZ82s8ycPp/su8VGsl+82bGkh0WB00M61CKEyMJS
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com

From: Mayank Rungta <mrungta@google.com>

The current documentation implies that a hardlockup is strictly defined
as looping for "more than 10 seconds." However, the detection mechanism
is periodic (based on `watchdog_thresh`), meaning detection time varies
significantly depending on when the lockup occurs relative to the NMI
perf event.

Update the definition to remove the strict "more than 10 seconds"
constraint in the introduction and defer details to the Implementation
section.

Additionally, add a "Detection Overhead" section illustrating the
Best Case (~6s) and Worst Case (~20s) detection scenarios to provide
administrators with a clearer understanding of the watchdog's
latency.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 Documentation/admin-guide/lockup-watchdogs.rst | 41 +++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentation/admin-guide/lockup-watchdogs.rst
index 3e09284a8b9b..1b374053771f 100644
--- a/Documentation/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/admin-guide/lockup-watchdogs.rst
@@ -16,7 +16,7 @@ details), and a compile option, "BOOTPARAM_SOFTLOCKUP_PANIC", are
 provided for this.
 
 A 'hardlockup' is defined as a bug that causes the CPU to loop in
-kernel mode for more than 10 seconds (see "Implementation" below for
+kernel mode for several seconds (see "Implementation" below for
 details), without letting other interrupts have a chance to run.
 Similarly to the softlockup case, the current stack trace is displayed
 upon detection and the system will stay locked up unless the default
@@ -64,6 +64,45 @@ administrators to configure the period of the hrtimer and the perf
 event. The right value for a particular environment is a trade-off
 between fast response to lockups and detection overhead.
 
+Detection Overhead
+------------------
+
+The hardlockup detector checks for lockups using a periodic NMI perf
+event. This means the time to detect a lockup can vary depending on
+when the lockup occurs relative to the NMI check window.
+
+**Best Case:**
+In the best case scenario, the lockup occurs just before the first
+heartbeat is due. The detector will notice the missing hrtimer
+interrupt almost immediately during the next check.
+
+::
+
+  Time 100.0: cpu 1 heartbeat
+  Time 100.1: hardlockup_check, cpu1 stores its state
+  Time 103.9: Hard Lockup on cpu1
+  Time 104.0: cpu 1 heartbeat never comes
+  Time 110.1: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
+
+  Time to detection: ~6 seconds
+
+**Worst Case:**
+In the worst case scenario, the lockup occurs shortly after a valid
+interrupt (heartbeat) which itself happened just after the NMI check.
+The next NMI check sees that the interrupt count has changed (due to
+that one heartbeat), assumes the CPU is healthy, and resets the
+baseline. The lockup is only detected at the subsequent check.
+
+::
+
+  Time 100.0: hardlockup_check, cpu1 stores its state
+  Time 100.1: cpu 1 heartbeat
+  Time 100.2: Hard Lockup on cpu1
+  Time 110.0: hardlockup_check, cpu1 stores its state (misses lockup as state changed)
+  Time 120.0: hardlockup_check, cpu1 checks the state again, should be the same, declares lockup
+
+  Time to detection: ~20 seconds
+
 By default, the watchdog runs on all online cores.  However, on a
 kernel configured with NO_HZ_FULL, by default the watchdog runs only
 on the housekeeping cores, not the cores specified in the "nohz_full"

-- 
2.53.0.851.ga537e3e6e9-goog


