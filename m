Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAAE3C73E9
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 17:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286779; cv=none; b=qtGDLaPhUF0DUXKBfcNVmFWRv3nP7jPrB0hm2PCXZnijBWRVzD5SVb8DTC4YsDhFVDQ8pKVXHQvRabkW8tt/awuu6R2jY2+f21Qi3OuNguzJOz5NZDLfhU44+H2JqF6cDybJKIq1foHRwFCLT+sAOtju1Z/m0oQpULYm0xN08VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286779; c=relaxed/simple;
	bh=I5nfBe7ZYQarmct5zO3CqK559RrmqfX0/MjL2MK5Shc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoNViNTKAaCPwgrFZzahB+bdUsJTxQcJCT1dtLlSpo1gNp25Y4Q2hLsiEdxBVfn1xtOYA6QYBdJfGp1uWVDvM0yXRjpySJT6rTpxe7tb2kxN1vyKGCp8p3bm5YkNsWkmRmWbOAZfQJFzk+stJMc5B1rPOXzcmJ5PtEaSQj5G2KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HPX9jL9K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HPX9jL9K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso3514455e9.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774286776; x=1774891576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7CHRrhh+DKEXsEahgNJuuauFy8SGarPHR3wDkt7cx8o=;
        b=HPX9jL9KwTrM7Y6VGNZHnNxmKDVF7rxFIvPcyhMv1YojT9KTw6paublD9TMBv7YZIb
         DVlVYXCWWvB3+6IaYlohS+utCW0eWmsJSZtVdhafbhA+zoPS1mKjPbiK+GYsOBRcNMuU
         JdL+NvaEFTz59cpsjrigXFLEGsKLExoGdpIjpvzBfJl3+lcKjvID3YfLQNFV2e1GXoAM
         Ig7v0fAT7da45//VyLg2fTyAk9qHF3p0c3//LpnmJoVEt0UmmDbwSXvNedUrnSlIxUXo
         vckFvuDmUpO6wKcmdv35Kfugcyil0yIW0j7d+f3fvqQEyKTX/LjEaNx2jRh2ySRSFTb8
         LcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286776; x=1774891576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CHRrhh+DKEXsEahgNJuuauFy8SGarPHR3wDkt7cx8o=;
        b=qttwq1ca/MGIKDs29EqQ5Y4vsG3XdeAbDf2TkfKb5d8w6mD87IeOQNkv6jcyFAnZ5F
         ctUT7gYDvg+E6AswSmlvkMnNeQYIPpals0Go9EPZy8DGeqMQJio/WxSdVySACRyLAjzz
         7unzDtTyH39tKDOq/iOu2XhBOyCFu3gR5gCGmcJeAL0zLZaQ4sqR6IYBzB399JP399t8
         uzZxSzDydiE13K2g/do7CUy9XBdlG5f2+GCC8YiNZW+tRKIPg8OY54mZaa0H8n25MskV
         EpOFZMVTzL86cVNyyyMDL25jha1v3M3ZQ7+zQE4AhM7j/ZJ7gEzXk2ZMbQ1gm+HoT8QC
         WS8w==
X-Forwarded-Encrypted: i=1; AJvYcCWujaqlHN/GYnUtXYmL/5PlctM1KwG8r3ZE2Y57oIJz09sxSkiOyzD/YmAYjZMQtxLIkIQ9KbAcpdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbEvSj+HhJJjdcj+RJ4Q8lEZ/uDBrxnq0jCBqUDUrc3t2SdCjg
	HMCWDkF8bAEUO+rMtAAMkywovj1E5kYCv+/ukEpEg46K7is8ryi/XUJ9X7K8yYIVU+4=
X-Gm-Gg: ATEYQzwd5LnKxfGUOpygW0Y1qx3wYryTLbnJQLHBm962H5kx+rRWnMLmOobELOsrcg5
	HANZUEQOy8yzRfo89GeJtCmu+wiJ2YtMnK9RKS7YAEhSlnYggqiaZWX9y1JHMup/T3YwQqv9PDH
	YOljMaS8aHUZhtjGQ+VdonB3MHf9Kb33sOStNL5og0gidj/fhXZOcrSwmii3GZVdYCzXYtcmBw7
	nZ3ab3va/pvNaBq2tEZNdGmRllmjJax0hEtleHzrF7Y+88te0D3l3ZddRv0Fx6V6S0ctt2FdglY
	vivjlUmLyDHQnqGOTrea60d/ZkKsoQBII3ZuOih4c2z/lTM/n1cNUChiObJMZDvBCv4CVCH+qif
	ZS1XPPzl4C5zRbqzt7uAVYe36q8Gxf1GwR1HeiXaFd+fXKdC676ovXJ6qIxsrwakI4+Ufwrme66
	FjaYQDHl+HfhFK42ePfE5BquNjjg==
X-Received: by 2002:a05:600c:c083:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-486fedf9b7cmr148100375e9.11.1774286775939;
        Mon, 23 Mar 2026 10:26:15 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm30726754f8f.25.2026.03.23.10.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:26:15 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:26:13 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Delizy <fdelizy@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/5] doc: watchdog: Document buddy detector
Message-ID: <acF3tXBxSr0KOP9b@pathway.suse.cz>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
 <20260312-hardlockup-watchdog-fixes-v2-5-45bd8a0cc7ed@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-5-45bd8a0cc7ed@google.com>

On Thu 2026-03-12 16:22:06, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> The current documentation generalizes the hardlockup detector as primarily
> NMI-perf-based and lacks details on the SMP "Buddy" detector.
> 
> Update the documentation to add a detailed description of the Buddy
> detector, and also restructure the "Implementation" section to explicitly
> separate "Softlockup Detector", "Hardlockup Detector (NMI/Perf)", and
> "Hardlockup Detector (Buddy)".
> 
> Clarify that the softlockup hrtimer acts as the heartbeat generator for
> both hardlockup mechanisms and centralize the configuration details in a
> "Frequency and Heartbeats" section.

This is a great step forward. See few nits below:

> --- a/Documentation/admin-guide/lockup-watchdogs.rst
> +++ b/Documentation/admin-guide/lockup-watchdogs.rst
> @@ -30,22 +30,23 @@ timeout is set through the confusingly named "kernel.panic" sysctl),
>  to cause the system to reboot automatically after a specified amount
>  of time.
>  
> +Configuration
> +=============
> +
> +A kernel knob is provided that allows administrators to configure
> +this period. The "watchdog_thresh" parameter (default 10 seconds)
> +controls the threshold. The right value for a particular environment
> +is a trade-off between fast response to lockups and detection overhead.
> +
>  Implementation
>  ==============
>  
> -The soft and hard lockup detectors are built on top of the hrtimer and
> -perf subsystems, respectively. A direct consequence of this is that,
> -in principle, they should work in any architecture where these
> -subsystems are present.
> +The soft lockup detector is built on top of the hrtimer subsystem.
> +The hard lockup detector is built on top of the perf subsystem
> +(on architectures that support it) or uses an SMP "buddy" system.

This looks like a too big simplification. In fact, the hrtimer is
the core of all these detectors. The buddy detector uses only
the hrtimer. Also it would be nice to mention the scheduled
job used by softlockup detector.

See below for a proposal.

> -A periodic hrtimer runs to generate interrupts and kick the watchdog
> -job. An NMI perf event is generated every "watchdog_thresh"
> -(compile-time initialized to 10 and configurable through sysctl of the
> -same name) seconds to check for hardlockups. If any CPU in the system
> -does not receive any hrtimer interrupt during that time the
> -'hardlockup detector' (the handler for the NMI perf event) will
> -generate a kernel warning or call panic, depending on the
> -configuration.
> +Softlockup Detector
> +-------------------
>  
>  The watchdog job runs in a stop scheduling thread that updates a
>  timestamp every time it is scheduled. If that timestamp is not updated
> @@ -55,53 +56,105 @@ will dump useful debug information to the system log, after which it
>  will call panic if it was instructed to do so or resume execution of
>  other kernel code.
>  
> -The period of the hrtimer is 2*watchdog_thresh/5, which means it has
> -two or three chances to generate an interrupt before the hardlockup
> -detector kicks in.
> +Frequency and Heartbeats
> +------------------------
> +
> +The hrtimer used by the softlockup detector serves a dual purpose:
> +it detects softlockups, and it also generates the interrupts
> +(heartbeats) that the hardlockup detectors use to verify CPU liveness.
> +
> +The period of this hrtimer is 2*watchdog_thresh/5. This means the
> +hrtimer has two or three chances to generate an interrupt before the
> +NMI hardlockup detector kicks in.

As I said, the hrtimer is the core of all detectors. I would explain
this first.

I propose the following changes on top of this one:

From f1cfdc330cfbc68568dfe6bf2513bde9373c89d7 Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 23 Mar 2026 18:21:38 +0100
Subject: [PATCH] doc: watchdog: Futher improvements

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 .../admin-guide/lockup-watchdogs.rst          | 44 ++++++++++---------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/Documentation/admin-guide/lockup-watchdogs.rst b/Documentation/admin-guide/lockup-watchdogs.rst
index 7ae7ce3abd2c..d0773edf3396 100644
--- a/Documentation/admin-guide/lockup-watchdogs.rst
+++ b/Documentation/admin-guide/lockup-watchdogs.rst
@@ -41,31 +41,35 @@ is a trade-off between fast response to lockups and detection overhead.
 Implementation
 ==============
 
-The soft lockup detector is built on top of the hrtimer subsystem.
-The hard lockup detector is built on top of the perf subsystem
-(on architectures that support it) or uses an SMP "buddy" system.
-
-Softlockup Detector
--------------------
-
-The watchdog job runs in a stop scheduling thread that updates a
-timestamp every time it is scheduled. If that timestamp is not updated
-for 2*watchdog_thresh seconds (the softlockup threshold) the
-'softlockup detector' (coded inside the hrtimer callback function)
-will dump useful debug information to the system log, after which it
-will call panic if it was instructed to do so or resume execution of
-other kernel code.
+The soft and hard lockup detectors are built around a hrtimer.
+In addition, the softlockup detector regularly schedules a job, and
+the hard lockup detector might use Perf/NMI events on architectures
+that support it.
 
 Frequency and Heartbeats
 ------------------------
 
-The hrtimer used by the softlockup detector serves a dual purpose:
-it detects softlockups, and it also generates the interrupts
-(heartbeats) that the hardlockup detectors use to verify CPU liveness.
+The core of the detectors in a hrtimer. It servers multiple purpose:
 
-The period of this hrtimer is 2*watchdog_thresh/5. This means the
-hrtimer has two or three chances to generate an interrupt before the
-NMI hardlockup detector kicks in.
+- schedules watchdog job for the softlockup detector
+- bumps the interrupt counter for hardlockup detectors (heartbeat)
+- detects softlockups
+- detects hardlockups in Buddy mode
+
+The period of this hrtimer is 2*watchdog_thresh/5, which is 4 seconds
+by default. The hrtimer has two or three chances to generate an interrupt
+(heartbeat) before the hardlockup detector kicks in.
+
+Softlockup Detector
+-------------------
+
+The watchdog job is scheduled by the hrtimer and runs in a stop scheduling
+thread. It updates a timestamp every time it is scheduled. If that timestamp
+is not updated for 2*watchdog_thresh seconds (the softlockup threshold) the
+'softlockup detector' (coded inside the hrtimer callback function)
+will dump useful debug information to the system log, after which it
+will call panic if it was instructed to do so or resume execution of
+other kernel code.
 
 Hardlockup Detector (NMI/Perf)
 ------------------------------
-- 
2.53.0


Best Regards,
Petr
