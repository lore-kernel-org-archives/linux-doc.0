Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518182E7F3A
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381528; cv=none; b=Vu0SWqlhvVtOubaVdotMpcSkFwuqplbG/Q4FrECJsoAniqayx90clHKo2ZI80pKs6Tw2vH00artk0L+9FTlLG018RjsTpc/DCKjh4CWEIkt618PbOCdfz0lUk6rUbSUAVsbvD7KFaCWK/353qkup+g1yuC+0sE4LZmif4TK70cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381528; c=relaxed/simple;
	bh=QGsL5XcLRkG0ICs0z52lc3ouSUItS9tQwOiL5nUOCTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MaTlNunmmyeWE3Rc3U5rSvRcqsbCIiT6ByH0Lw99esC+jDqv4oD7J/Oqi8fGJUlVmYCnB8r3WrXKiQ/NIFR6dAx2hgN34JQhSaUyR1SBMV98zJvbDyx5pBIIPGTFwBpIFkHBdPLYODQSpT3tEz45fffzSUcj8IpKKULBXe/X5Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVDKBlfE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVDKBlfE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-472326ca506so1144346f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785381525; x=1785986325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeCxALKtqq227AX1dir59yqRYEb9BEUGkKZNdrRjOhE=;
        b=fVDKBlfEBq7AMrypBkAdVmfFuV3cAV0um8PPR+1m9XrvDiiq7T8wkHdRVvYXLzE/sD
         GSeuxJlVQcL9LmRuJqMLnOmeeefEB3LltK3ao0MJPdx0ETLG/oSCVvKBgPxtWO10YRbh
         ZJuzdcoACMwk4+vjCzK13GR1ZoXTGv2py6KcXsfUKohlbETL2Pd7cVh4ZdY3eRLkt99I
         r12+uMojU5/IsnMYCKBVwDELnq5wL7Bq1bTr+wiJ57N6CghWK/LE0k0VOK1BXZRAGf4w
         ZemyNODfHLAkU8RDr5WpVyibJq22OAi6PGYcnahb/nRys1bvV47y9wbz5L0pdIgzwrRA
         jblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381525; x=1785986325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeCxALKtqq227AX1dir59yqRYEb9BEUGkKZNdrRjOhE=;
        b=MAlbJMl33VKCzDgzyyB80+UgDSz56RnvXZwuZ6YXlLwXX/Z93bdYHDNOu9/JTn0xOF
         eimmqmW+7dSS5LgZ17xCNg9iw6MNxB7pAtH1Jv1fF226hlE2gLWXctSltFWmTcdWnTKk
         5LGaGvy0kvOuCLJRPf+eKNsaYtDWAPj0S6M1OCAIVZCKwzBzSf7NoHs8ev13Yq/y1bHR
         BjQ60EZezE55gvTegwXZa8nTy7a4nYLL+PC/1XiP76LS0rIKuPgB08gzkVUyrLgANlxI
         fUWiEiK0DyZDBef6i0qnkp2WQM95BLf2j2FHSVU4lj3AGl4KmnsN6REienCTNjTfrRRN
         c7IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkGQCvQ6r1jgo9yb9L3SzBEUfIDsXE+7Ka0UCnhQh9Y7buD8hN5Ijmry15KR8yhV6aZ8GvfWtJhFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3fxN8xVxQN3XUjgalcP/LcQOojl5a4fm++VbQhb3xYbHLh54
	CuLX4Owc6NB5JPB6lyZjV/DYA3KEnQHGqC9vl/lIlosULA8a6AoncYFM
X-Gm-Gg: AR+sD12ZSqc2duxY6Of8pk0/FXgQCvj6lllX9z4ieUnYrsXc3P/ZQUHKF3V/x+oQ9Iu
	WW6ZtGSn8+mFbguMLEHfpBoC758DlUSyG07kWkzdF15lcUOuocH6kNKe3/o8nvxmZuL+wMxVw/v
	ltle3OM7i/ajNmVFRTONzi43mkXY2Tr6d0HMRfnoR6iXZ6wtSJVIhPJQEEzDlziui+IfpJQx/Ou
	/30dkzINuMF0c29rXMlJ33m8K8deUeNvLOmNhTNATQKlTeFXAFl2nEo+HzqHOEF8RpFVmANO8G3
	M74pSEiQDxybbgCi6aODKI0np0W/lJmF+BzQLIVsdy3idQDyzAlIA8DnKNHI3XVJ/UTSExL1mWR
	h7vsNoHTvOdD7W8mq1soh2VAfXwQNK6WFN+kyiV7t5t9YSFQ5SWZSzaXzMZbN23dZiSgTlmtdpM
	BYoLQd2P6afTVn6QpOWufldfpg4FtuKXzqPpo9QQi15Xdt7tTCCbU1SfXvQEdIujrFuuC55KkXx
	JJu
X-Received: by 2002:a05:600c:1553:b0:497:ff4c:246 with SMTP id 5b1f17b1804b1-49800e8666dmr8659875e9.16.1785381525528;
        Wed, 29 Jul 2026 20:18:45 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc893fe58sm3015590f8f.31.2026.07.29.20.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:18:44 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] docs/scheduler: fix EEVDF-related inaccuracies in the scheduler docs
Date: Thu, 30 Jul 2026 11:18:33 +0800
Message-ID: <20260730031833.2228115-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

While checking the scheduler documentation against the current code I
found a few inaccuracies:

 - sched-design-CFS.rst still describes the fair class as always running
   the smallest-vruntime ("leftmost") task and references the
   rq->cfs.min_vruntime field.  Since commit 147f3efaa241 ("sched/fair:
   Implement an EEVDF-like scheduling policy") in Linux 6.6 the fair class
   implements EEVDF -- pick_eevdf() selects the eligible task (lag >= 0)
   with the earliest virtual deadline -- and the runqueue's zero-lag
   reference is now cfs_rq->zero_vruntime (the min_vruntime field is gone).
   Add a note that sections 2 and 3 describe the original CFS design and
   no longer match the code, rather than rewriting the historical text.

 - sched-eevdf.rst said Linux 6.6 was released in 2024 (it was 2023) and
   described the per-task slice request as "the new sched_setattr() system
   call".  sched_setattr() has existed since Linux 3.14; the slice is
   carried in the sched_attr::sched_runtime field.  Fix both.

No code changes.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 Documentation/scheduler/sched-design-CFS.rst | 10 ++++++++++
 Documentation/scheduler/sched-eevdf.rst      |  7 ++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-design-CFS.rst b/Documentation/scheduler/sched-design-CFS.rst
index 03998f6c8f9c..55163506407b 100644
--- a/Documentation/scheduler/sched-design-CFS.rst
+++ b/Documentation/scheduler/sched-design-CFS.rst
@@ -15,6 +15,16 @@ scheduler's SCHED_OTHER interactivity code. Nowadays, CFS is making room
 for EEVDF, for which documentation can be found in
 Documentation/scheduler/sched-eevdf.rst.
 
+.. note::
+
+   Since Linux 6.6 the fair scheduling class implements EEVDF rather than
+   the original CFS algorithm.  The task selection and placement described
+   in sections 2 and 3 below (running the smallest-vruntime / "leftmost"
+   task, and the ``rq->cfs.min_vruntime`` field) describe the original CFS
+   design and no longer match the code: EEVDF picks the *eligible* task
+   with the earliest virtual deadline, and the runqueue's zero-lag
+   reference is now tracked in ``cfs_rq->zero_vruntime``.
+
 80% of CFS's design can be summed up in a single sentence: CFS basically models
 an "ideal, precise multi-tasking CPU" on real hardware.
 
diff --git a/Documentation/scheduler/sched-eevdf.rst b/Documentation/scheduler/sched-eevdf.rst
index 83efe7c0a30d..e3d62de004c6 100644
--- a/Documentation/scheduler/sched-eevdf.rst
+++ b/Documentation/scheduler/sched-eevdf.rst
@@ -4,7 +4,7 @@ EEVDF Scheduler
 
 The "Earliest Eligible Virtual Deadline First" (EEVDF) was first introduced
 in a scientific publication in 1995 [1]. The Linux kernel began
-transitioning to EEVDF in version 6.6 (as a new option in 2024), moving
+transitioning to EEVDF in version 6.6 (released in 2023), moving
 away from the earlier Completely Fair Scheduler (CFS) in favor of a version
 of EEVDF proposed by Peter Zijlstra in 2023 [2-4]. More information
 regarding CFS can be found in
@@ -28,8 +28,9 @@ by sleeping briefly to reset their negative lag: when a task sleeps, it
 remains on the run queue but marked for "deferred dequeue," allowing its
 lag to decay over VRT. Hence, long-sleeping tasks eventually have their lag
 reset. Finally, tasks can preempt others if their VD is earlier, and tasks
-can request specific time slices using the new sched_setattr() system call,
-which further facilitates the job of latency-sensitive applications.
+can request specific time slices via the ``sched_runtime`` field of the
+sched_setattr() system call, which further facilitates the job of
+latency-sensitive applications.
 
 REFERENCES
 ==========
-- 
2.43.0

