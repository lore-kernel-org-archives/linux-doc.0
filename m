Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7DC398915
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066325; cv=none; b=UdyREwq8mvo7ixv4ZquC0Bwy1l/YaoUzk+F4N/b2CwvpaNr7psMnHs8IZqThlZo+KvUUnzEqVCnqVgy2v26TzCcOlrelu7QTpvR2BJWUGGKGFFJAhNLnyHLIdHukppX+9mW8er3wO9IEU0vb27ymsePYIHLro34rK+5HkhcV90A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066325; c=relaxed/simple;
	bh=11ce8bUKvUSdcebzsjZtiRLgXFylySnevizU5TDAFts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5xy66vdtn7zpqJl4+JBOQHM7iAIgp6KXUMysfQ8SUbcBpfLf/HZiVurkCjTmJ5rm8hn8dd5vBpu6Ca+VBHcVaAOnLrdTPPtaBi4SJsuQrik016qLIX0twmipAwtGWXUW9wYIGFJd0hb+3C5AqNjILcuqkqN/TiUjlNvbwNs4Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlaFdogi; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlaFdogi"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c45281a06so1611471c88.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 00:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066322; x=1776671122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNYrrMihyJ/UopuSP8NsPFIh0brjDU9y6jBpikXxsOI=;
        b=rlaFdogizaH8E48QTvwAewMKrEOKvjVGk8NUiMvPfxXtudCAn6AJJck1u1sPsjApvw
         V+jykR2eah19Ul04Ggv5O/draHnzso2rriDuTYkLDG69k2TUR5AV1Okwx63H/SEcQT2L
         o/VzvNMyv85GFv4tCobyFzT9S3zFYCjCVqsKNoaufkPQtko+tYf//rrd9BCFCSuG+FK+
         AkhYscxlwAjBzJA22sYZ5r/rxj/rwKw3zptSsQ/VFOLgVdpFWutMjHkQ+VBDXz8p2/Dv
         EoMHOmZOnDj/LNg+fv5UlS4Uhq7el9M/AggMd+8SQFoRSNoia/I7j/qH9kMjuUGwQ1qo
         imOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066322; x=1776671122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eNYrrMihyJ/UopuSP8NsPFIh0brjDU9y6jBpikXxsOI=;
        b=Vw1NgVTpgDY549lbS4zcOy2kF7aDrj0XlzcnlDWIhNKslq1h45l4me09TB313JhslI
         X5g4jciWwdrDh+5sFEREqisRy6B75otGA2JhVzK1r6cE2nFh8r8Zm62pHtZcZcajDjix
         /OafU2z03kxAFVo4QCcjuccW84BDw2NG5grN7dOXwg5Lgp7VWRRE1EYqUDXJDC+wc6d1
         MP9nawkRgpEBpO46qC2pgljeyzQzqLwiog1r8gwmid6L/bMTpYPU+uA/83IfTs1ctiE+
         WZ2nDiPbQPWb5KhrV/pezUxX8FKcdDyojXc/q+iyBhq55kwlYw6KX7CvWvcRg9QhyFZM
         ll6w==
X-Forwarded-Encrypted: i=1; AFNElJ+peJ/DoX9tFY+AfLTsqrLd6F7CZCyMeWVaR2neQ+ZzOr2Qamlc7ZBoH5fsE4GSKNnxJzNWXCDVUIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtkni7jbucac9VeeYAKd/EbpcLuHLAUrV/RSORbF2yYK2y+/OT
	bAXGE2k5ZiXzaQiqIEkZqGzn0fIXjkhvU/Pv1jRW9T/gmDB9hi3k9PrL
X-Gm-Gg: AeBDietMROr2S60sfqpXQbNbbELnwxWhugWw6BTiJ1qppzLlYoiDZwSAIvnPtFqPkCx
	hXX+oiz5C7Buv5Knx56a1fuFKgSZvaFmyS+Df+XrhNK3wUNHmq6a0VjTi8hWzeaz27uFEopVHfm
	rgxsEu8yQFwIuKwPij5i+MC12V4Py1wJ5oyHkAddvuKAX51WzmY68oKSAOUaB512i5GNwHMIAxg
	0ScQCj5Rw8seWIJlQTZ5gBPdF1p5KYUH3SNWuqvhE7EJHAYr0iyebmrHE/xCPIoEy7Dd8VXcUye
	DnK20DWazDf99hc3/lbJ3MlwHZZNloeQIvsyjjg3VSCGQC3G+wOtfMhMHDMf06QYUVyYdVmWHxv
	qWkTrN8X4QyHcBAYz1aFvblOHJwXS4An+fxPbXUsW/LOFcFVED3Rp4xOvW7xBBX0Mga7IZ7PL/a
	qTqfykQj1VBNAtCVAK
X-Received: by 2002:a05:7022:69a2:b0:12c:8b9:7208 with SMTP id a92af1059eb24-12c34eeb95cmr7021315c88.26.1776066322024;
        Mon, 13 Apr 2026 00:45:22 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:45:21 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:17 +0800
Subject: [PATCH v2 11/12] Documentation: cgroup-v2: Document dynamic
 housekeeping (DHM)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-11-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Update the admin-guide for cgroup-v2 to explicitly document the newly introduced
cpuset.housekeeping.cpus and cpuset.housekeeping.smt_aware files.

The documentation explains the use of the DHM framework for reconfiguring
kernel subsystem isolation masks natively through the root cpuset without
incurring system reboots, and describes the functional restrictions of
SMT grouping safety constraints.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 91beaa6798ce0..deb644b88509f 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2592,6 +2592,30 @@ Cpuset Interface Files
 	isolated partitions. It will be empty if no isolated partition
 	is created.
 
+  cpuset.housekeeping.cpus
+	A read-write multiple values file that exists only on the root cgroup.
+
+	This file is part of the Dynamic Housekeeping Management (DHM)
+	framework. It allows dynamic reconfiguration of the global
+	kernel housekeeping CPU mask without a system reboot.
+
+	By writing a mask of CPUs (e.g. "0-3,8"), DHM will update all internal
+	housekeeping subsystem masks (scheduler domains, RCU NOCB, tick offload,
+	timers, unbound workqueues, and managed IRQs) in real time.
+
+	The new mask must have at least one online CPU. The value stays constant
+	until changed or affected by CPU hot-unplug.
+
+  cpuset.housekeeping.smt_aware
+	A read-write single value file that exists only on the root cgroup.
+	It accepts "0" or "1". The default value is "0" (false).
+
+	This file enables the SMT-aware pipeline logic for DHM. When enabled (1),
+	any update to "cpuset.housekeeping.cpus" is strictly validated to ensure
+	Hardware Threads (SMT siblings) are kept together. If an SMT sibling pair
+	is split across the housekeeping boundary, the mask update is rejected
+	with an error to avoid severe cache and pipeline contention penalties.
+
   cpuset.cpus.partition
 	A read-write single value file which exists on non-root
 	cpuset-enabled cgroups.  This flag is owned by the parent cgroup

-- 
2.43.0

