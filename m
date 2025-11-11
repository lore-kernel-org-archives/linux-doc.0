Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585C82FD689
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 02:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762829581; cv=none; b=SzJe1sYqoVhJpCYEbDXVEuAf6SdcJD400vN8nGRAPjGu6Q1xnRl1WcbdxZe3SgAYG5fsNa+19z9LzVZAYoqd6VMfS7aoMiPlJ7Mu3+RQ60dVKDSImPS0JHvmExEKUQCWMvsHrRcLsW1wIuBh7e8izfP/kVYaNIsYk43CQHR2VXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762829581; c=relaxed/simple;
	bh=KVd7HqAGcj+scX8uIet43Z+a5mSnboeu3xvIctXuc3U=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=nqcDakfYrJjn4QJq1ldPE6J1K/3jyMdEsLehGmlfFWI2OqhYgXpdfoPgsvzVgSxZJ/8ko1G7BYgsrYKpHlDC/rbG76WxZr9AENiAPhQ+myngdKaBEiL7gybPq/nG3NF7Lf50ks7miJXHETgXIYxL4BLysKOdcOICGIF4kQBvsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAxzHaJL; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAxzHaJL"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b7272012d30so689418966b.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762829578; x=1763434378; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XJkSjm1SepX8j7VmTKEM6qhV9wL1emDk6X4x3Rbnrr8=;
        b=TAxzHaJL0kxfMlyqvS9QJnxzkbRemO9b8bV9KsTVRMFBupHppBp36iWV5rdZO9vngC
         PLIU6P9yR5Bi3TkFVcNXKKbpNwUVu1/o/ix1M3uxJp1kcfGLGYdeXUjDlwA1qEz+CZsX
         XnQVBGdpsZ5bkRHSBrO+Wn+XRgXWbIY8WQtNAVuR2SIstdUuBZU7R3XGTvDGWfORpWzR
         DGHKJ/4olpa4Ei6l6gUfhwRCihlUanVJGYGQyYehGfXglgQqElVcVWL6waUB9DIkI854
         TgFDRxlxiphcXvkxfvmjvuBcV494daBUNjMmKoBqh86eqrjhC/w0YOKgX+Bk+qthyFZQ
         1oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762829578; x=1763434378;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJkSjm1SepX8j7VmTKEM6qhV9wL1emDk6X4x3Rbnrr8=;
        b=jvykrW/XjTLeWiR5XH7P9nacXu+CPd64AkR1qhaswqS+9J78jfi5RiEwFVCpAXEe4L
         NS5kHFg5l0QQ7hzR19fPfmEnbFxQihOaMG3bnDk4jpNHyTwEWAaw3+7mllT83gQFn2Nx
         X8TRuNJefOKVLmgDyhi9mz7sKP5MRIyQFfDNssc/tF+dYBIHgdfeWqR1QwsIYHYui4nI
         KZc38URhj/HBYwwd3nnNe5KXJl99L0iU1cR6/wu7akiFsvlu6+L/tG6Vi00Aj7JOe0dV
         vytIFhnYr835gqPvfjtBgskX9swV4W4MBKWS17XCd/6hoF/HB3JngM7iBEuHpr/KwnDQ
         6TiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6kGmAsZDk/c/kWaUF4FPW1Pkfywil8jZAejofMwDzEowktL8ka8xgIo4kkS5KbUawKnN/KZ0nPZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxfOPNhNQsd655Qj0YbaShjU805u5zZ7ZsMGG8mxPChsnT52re
	HBP3oVPXM0t3ycyjviv372M91oEiS1LxHI2dST3wsrElCLaor0BvoHAGJhgFmIRKEnu/ma0wHJ6
	0cpjLoNoN/XYqJNs/kN05h7tejQzMkZY=
X-Gm-Gg: ASbGncvasw1eJ1j2OOVRqzs7L3xkuGhj+qvLD1ZTPCQS2XG7Zh/95IlITpO1eoNfhXY
	FYXt4AeKqkXIvmFowLggOapQwCi8/S2hhm7p+eC14gGAEF8SDHSHwnoXQKpYxjKyJIwk/eaV80Z
	D/dEZIP32013VOF6V27YP7lJYAkA7pYNDeDJAnXay74AUqKbcJCU/vVZ74sbML1o3/ULhXkXrO0
	LJgf0DgcAAJ5g3ExP11FYSfntqcCiDSVbH1p6A1ZAjDNpqmXiGzDKWvEJm+lx9Sk3Pn17mvlRg2
	VpMxOvE=
X-Google-Smtp-Source: AGHT+IEDwglFlhA5go9hbIfKsyVeakB6296g88EgEZVOmF45KZrQmSaZNNkkxZSEw3FDJT2dzivguIu5RBJBgSpUhTg=
X-Received: by 2002:a17:907:a0c8:b0:b70:50f1:3daa with SMTP id
 a640c23a62f3a-b72e053a7f4mr1059273866b.57.1762829577536; Mon, 10 Nov 2025
 18:52:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ying chen <yc1082463@gmail.com>
Date: Tue, 11 Nov 2025 10:52:44 +0800
X-Gm-Features: AWmQ_bmcyWU386QL8AUws25bKToFphDyeQOauEHesNSm89kwVHLWVzA53k-nyJY
Message-ID: <CAN2Y7hwttMyUn0qsEcSBbrQ1h+aSzNpHMhgAxEbqJZn4vf5hBw@mail.gmail.com>
Subject: [PATCH] workqueue: add workqueue.mayday_initial_timeout
To: corbet@lwn.net, tj@kernel.org, jiangshanlai@gmail.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, laoar.shao@gmail.com
Content-Type: text/plain; charset="UTF-8"

If creating a new worker takes longer than MAYDAY_INITIAL_TIMEOUT,
the rescuer thread will be woken up to process works scheduled on
@pool, resulting in sequential execution of all works. This may lead
to a situation where one work blocks others. However, the initial
rescue timeout defaults to 10 milliseconds, which can easily be
triggered in heavy-load environments.
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 kernel/workqueue.c                              | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt
b/Documentation/admin-guide/kernel-parameters.txt
index 149bfa7..be3f488 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7376,6 +7376,10 @@
                        When enabled, memory and cache locality will be
                        impacted.

+       workqueue.mayday_initial_timeout
+                       Set the initial timeout (jiffies) for the mayday timer.
+                       Default is MAYDAY_INITIAL_TIMEOUT.
+
        writecombine=   [LOONGARCH,EARLY] Control the MAT (Memory Access
                        Type) of ioremap_wc().

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 003474c..c810b61 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -481,6 +481,9 @@ static DEFINE_PER_CPU_SHARED_ALIGNED(struct
irq_work [NR_STD_WORKER_POOLS],
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct worker_pool [NR_STD_WORKER_POOLS],
                                     bh_worker_pools);

+static unsigned long wq_mayday_initial_timeout = MAYDAY_INITIAL_TIMEOUT;
+module_param_named(mayday_initial_timeout, wq_mayday_initial_timeout,
ulong, 0644);
+
 /* the per-cpu worker pools */
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct worker_pool [NR_STD_WORKER_POOLS],
                                     cpu_worker_pools);
@@ -3050,7 +3053,7 @@ static void maybe_create_worker(struct worker_pool *pool)
        raw_spin_unlock_irq(&pool->lock);

        /* if we don't make progress in MAYDAY_INITIAL_TIMEOUT, call for help */
-       mod_timer(&pool->mayday_timer, jiffies + MAYDAY_INITIAL_TIMEOUT);
+       mod_timer(&pool->mayday_timer, jiffies + wq_mayday_initial_timeout);

        while (true) {
                if (create_worker(pool) || !need_to_create_worker(pool))
--
1.8.3.1
