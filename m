Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AF0256C8B
	for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 16:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771088364; cv=pass; b=bNKcRU3wU6GLGrpokoCf3zxag78sVLh9hZ8oMeugBqStYswd8ptC8ccg/buU0S/h3D/3uL4X1VFFRKxhLiOGQh1PteSFzycfDDvkbqLVX0BjDBpz3Jy+aUYNNpXvoZ1AdQK/4D2HxActLKwZAyVr9nk2dzDS+/EcT6DFyE7mQyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771088364; c=relaxed/simple;
	bh=Byx+/V/grJZVAlt+nWwgbeivlWIFK5ntFSsPqDpKAU4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RadtXzu0KPtZxFk7BQjQPYbAAOaQjAhrvYsf2nNvRcHNNOV7Hd41VfMxiS1YfKLySXyPdA6u0HSjvkLZiwubhTV5Pj5Bj0BjgOkV55GN0YdhyGvCaVD24nauDZCpPHSF34BhAwhn7qecw+5kuZvXqy28VWfahnRohI0Hv0fjWdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axqJiW/j; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axqJiW/j"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d1890f7ee4so1158920a34.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 08:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771088362; cv=none;
        d=google.com; s=arc-20240605;
        b=HKQq02JTXrnxvaB9Xgn4Ec7o0fr+ZoPrDxi3+fGnH6lrvDhfpBX7pcb4b39JSm/wsu
         qg3wMiMUnTWjGivsgdwM0Ferb/2V8cAl/2Zit1DReq8tv4yZ476iLxtzFlc5/pc1Izt3
         i7AQ2+xHOM0MirydWFfHNVo+DGXPuJoTJMrcLoEw2iR+D2jtviWvWO5CnOQgKYygxxoL
         KrxbUxDdHz1FbLcmFVIjUvUpRNoeqF81Q+lYdHQ8lerDeESAX/K7a0NCZ+tJ79HOGsi0
         TnJ6tmm3lag+UEUmqn79qqNDj4mwIm1mRJyFWXwZUPI1tgGHLm0YmvmAHvNlSwMcmADs
         hPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6rJVk/bdEpEUkQN/gp0qTcKqFCDGpMds/0JFJsTv7lo=;
        fh=GtPsU0iZkXXN0mq9PsNxYZu22apEQXmVpGcPYSN+ym0=;
        b=gyyH1JFvPLhR1eKjQo2ULsbgs6E5igYl5C2/w2o2+9FqsVS+nAufBMhNQR7FM8QnHN
         1UtKFtIIutubtgHuxheYBBHGNj60hEvfdL62hP/FeM/LpKCNNL+CdBkax683T4PUrZJ4
         kuQP2HebBk2DWPAggpRPG/54TPm3HOzSZc0ompmBl0cdW6Mu0lNokOzpkxhjVrRcrIKd
         7yaoBjIrfcSkqXoPw1Cru3C3QQ+9tJLASA+wIE88+XLn3HlDER7I5e7ctg2DjPhgfpU9
         O9o7H6iS/xOHvmmqIikAUosuerg2D7XoKeFUG+vaYlb/r6FxrqmcLJyiVnfmnEMqLPHz
         HVsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771088362; x=1771693162; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rJVk/bdEpEUkQN/gp0qTcKqFCDGpMds/0JFJsTv7lo=;
        b=axqJiW/jET35VBc9OzeNPNiaEzv+iJacdmHZ06FliWrYqgrWBQk4Bsf1ulRhCjPDzE
         ZjHCsfSU8AasdvTWD8jWGzoEnPd/t8GjaJP3VIA+cW+MGnNwwYdSg+64pvvpXf6nv7vK
         n2rtBZpFuF+jf6DGQQifZead5ZsWZbJh0mWAyqGGlzROeaICNIiNsxeSOuE9D0FkLyis
         YBf7nOnz7f2dodY8sqjYQJZiHoUvxINP+rKdlVeiiWkn2aFP7eZ6z0/SvTnm+/T5Scdw
         SW7VUnHqqL+U9pp8ug33KqFRbDsQAr5QfbvVL+Upgt3Wod4kLr531iMyVR1GrsCdVGU4
         QKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771088362; x=1771693162;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6rJVk/bdEpEUkQN/gp0qTcKqFCDGpMds/0JFJsTv7lo=;
        b=BX9EjT3zBMquxV1seSgAhZusjBuzaRd7U2ZUEMJyj0TZLJWP4OePnnR0Kl3yuB5Hbn
         D072tbpTm1XyiqNH9vzWL5rxaFdPS04UvRl89LfDkdmKTas1Sa0s4GMFEXFB28qTHFNX
         ikeSbWMUwRcP3o9bMvdszEZIMi3mpxJ4yEENYIN3bn+3UlrJChq/nGU1Hauepzrw4xa8
         xFIakQM+KgQPa9oGyHiX4T8wY356ottnlHm7jubv54YgjnfdqdTGrUGxANitlM/zem7S
         VHRpVlhgdl/Mli+eYSM2m8LH0r5vHmFT9LoFnWju/1eZ4/roRm7MkTCp0k6pZ9s4P0va
         vgSw==
X-Gm-Message-State: AOJu0Yw81el0NQ9IHAFoD9s6iF+ZlTm+7pbpwfBAw3HP15DicXDsr+SQ
	uwXM1O8Ri0/m3gwKdCIwHUBLNZ2ZlsOjMbxqLFlRfVFV05B3wuvCkrGqv7K3eZq9n76bHKgcKrj
	56V7v+eCi3/GjUdL02x5fS/iy1GU3nTE=
X-Gm-Gg: AZuq6aJVZKN5wdx+QliJaRxlK+f0dEKNvafvAD5Yih4FD1JpHwsM341nRkX3JT3qvF+
	5pAHhpuXWszFBVLC6/HrcbncRDwV3/M+ukLhs7vRPSDCp3YGEeUzejP+6v7bW/B52e+Tn2zPBGr
	vzGs2YLkK3CSnmDyD6GFrMj0To2NgvFFhVem7eQFG2Jzngz4WgX9S+l0o9kBNocrmoVbOtA+Gu0
	PQWAED7fFMNT3PPY97Xv1Vt+ykwQoVWjizMF8mIy8UpIwpld9wgJBRFSZ0UEGDsxk7qhmq3PbKV
	8j+Qtlfewu8cGdbXbeuRAjJmEJ/11o3wS/HNBVbwozmSdR4JsecaAw==
X-Received: by 2002:a05:6830:82a8:b0:7c9:5ac6:12de with SMTP id
 46e09a7af769-7d4c2fe5d0dmr3761447a34.5.1771088362280; Sat, 14 Feb 2026
 08:59:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Wojciech <wojciech.develop@gmail.com>
Date: Sat, 14 Feb 2026 17:59:11 +0100
X-Gm-Features: AaiRm50kydXZsFl4_Wloace2fxxbWycbvsGQn1DJF-jb9ndu95KmkFAndiZR-pw
Message-ID: <CALGt97_8_oYByt5-Eghz8FR9x0v90OEvVr9t8Dz2U9wOt0N=jQ@mail.gmail.com>
Subject: [PATCH] docs: scheduler: remove extra whitespace in sched-debug.rst
 and sched-deadline.rst
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 8c49fd00f04b0a4281d40cc69071b2182cd36498 Mon Sep 17 00:00:00 2001
From: "Wojciech S." <wojciech.develop@gmail.com>
Date: Sat, 14 Feb 2026 17:48:16 +0100
Subject: [PATCH] docs: scheduler: remove extra whitespace in
sched-debug.rst and sched-deadline.rst

Signed-off-by: Wojciech S. <wojciech.develop@gmail.com>
---
 Documentation/scheduler/sched-deadline.rst | 2 +-
 Documentation/scheduler/sched-debug.rst    | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/scheduler/sched-deadline.rst
b/Documentation/scheduler/sched-deadline.rst
index ec543a12f..87f8baa14 100644
--- a/Documentation/scheduler/sched-deadline.rst
+++ b/Documentation/scheduler/sched-deadline.rst
@@ -54,7 +54,7 @@ Deadline Task Scheduling
  "deadline", to schedule tasks. A SCHED_DEADLINE task should receive
  "runtime" microseconds of execution time every "period" microseconds, and
  these "runtime" microseconds are available within "deadline" microseconds
- from the beginning of the period.  In order to implement this behavior,
+ from the beginning of the period. In order to implement this behavior,
  every time the task wakes up, the scheduler computes a "scheduling deadline"
  consistent with the guarantee (using the CBS[2,3] algorithm). Tasks are then
  scheduled using EDF[1] on these scheduling deadlines (the task with the
diff --git a/Documentation/scheduler/sched-debug.rst
b/Documentation/scheduler/sched-debug.rst
index b5a92a39e..ea874690b 100644
--- a/Documentation/scheduler/sched-debug.rst
+++ b/Documentation/scheduler/sched-debug.rst
@@ -10,7 +10,7 @@ numa_balancing
 ==============

 `numa_balancing` directory is used to hold files to control NUMA
-balancing feature.  If the system overhead from the feature is too
+balancing feature. If the system overhead from the feature is too
 high then the rate the kernel samples for NUMA hinting faults may be
 controlled by the `scan_period_min_ms, scan_delay_ms,
 scan_period_max_ms, scan_size_mb` files.
@@ -21,15 +21,15 @@ scan_period_min_ms, scan_delay_ms,
scan_period_max_ms, scan_size_mb

 Automatic NUMA balancing scans tasks address space and unmaps pages to
 detect if pages are properly placed or if the data should be migrated to a
-memory node local to where the task is running.  Every "scan delay" the task
+memory node local to where the task is running. Every "scan delay" the task
 scans the next "scan size" number of pages in its address space. When the
 end of the address space is reached the scanner restarts from the beginning.

 In combination, the "scan delay" and "scan size" determine the scan rate.
-When "scan delay" decreases, the scan rate increases.  The scan delay and
+When "scan delay" decreases, the scan rate increases. The scan delay and
 hence the scan rate of every task is adaptive and depends on historical
 behaviour. If pages are properly placed then the scan delay increases,
-otherwise the scan delay decreases.  The "scan size" is not adaptive but
+otherwise the scan delay decreases. The "scan size" is not adaptive but
 the higher the "scan size", the higher the scan rate.

 Higher scan rates incur higher system overhead as page faults must be
-- 
2.47.3
