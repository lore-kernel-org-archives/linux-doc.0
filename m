Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71601DF27D;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770930733; cv=none; b=TCrKAxKEgAMhnk2Eq97HT/t7UonZqr0aD9qDm8qWDbrp/CI6ppIUxtrMZPITnMpQkocWATyGnKBQ6ZCZnw2gs5R5T+xmzyTj7M9IBYlhdj2/vuVTuvmLu6WSnJZx+JWEPClKPOR6nz2x1SH7eoDm7JlzuMHbn66wbwEFub6hgvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770930733; c=relaxed/simple;
	bh=pBYkUxk5sriANA7AD+AFfUWPlwyQ7z+ZcPf2VHhn1KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZbb4PGmYX8LRyd2t6v+b10ralchrY4oLB92nSk36SuAN8jSvq6cqNII7NectDccAaHpN6JP6eus829txbMROvsW6cr5xBiy+Nsz/QMfFR06UidmiWhZ2q4r1sRfMDZA32xGX2TMvjUTz7gASPpmcbMhnjF6YeL2p1193sNqbIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oplOu05P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oplOu05P"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84612C19421;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770930733;
	bh=pBYkUxk5sriANA7AD+AFfUWPlwyQ7z+ZcPf2VHhn1KY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oplOu05P6bmfFlxXQSG/nQf3wyC+PGZzQ3QivleEsSP9YZVi+8P1UElWmGoLsrLiG
	 abthGSTlM9+8eNCFl//u2dcklwfCX3v76ezhLgNNzxC0wRSl64mbhD9eCuzKVshGXO
	 g7qmB44D2PS6mDBGX7LFSC3Avth8/Ds0ysjTad3OdMAi3tKoYRJCM2IBdXBkAzkueN
	 4S78cYdDjiqA0Ai2LHhFw0HpfJbHNUaZMtSVn229Aagylw+b0d6fxXlsl91AEJZ8ui
	 AdoGXlm6a9PBbZIx0OWvgEJb6sTuzo2wbPGleEFLMoNXSeR/KlXba0RXb2mtsjunnE
	 KEZ+bPJJgOL0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71317EEA852;
	Thu, 12 Feb 2026 21:12:13 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Feb 2026 14:12:11 -0700
Subject: [PATCH 2/4] doc: watchdog: Clarify hardlockup detection timing
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-hardlockup-watchdog-fixes-v1-2-745f1dce04c3@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770930732; l=3659;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=++s1kaAYhwZaNT4DoKQnleAcHjzb5H5RPunWGGQZXyE=;
 b=P6tB2IvFkwwyq1h/kVwBVF6voCYYnE72u6l9PJLok7d0W7hMtpFTRn4NoE8HwXu3pELeoM9dp
 d6IAMGMwF0hDzbv+6dWmc8+J539YyagHreV1SAv7S6/rgKL7e5zdbJF
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

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 Documentation/admin-guide/lockup-watchdogs.rst | 41 +++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentation/admin-guide/lockup-watchdogs.rst
index 3e09284a8b9bef75c0ac1607a1809ac3b8a4c1ea..1b374053771f676d874716b3210cade55ae89b28 100644
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
2.53.0.273.g2a3d683680-goog


