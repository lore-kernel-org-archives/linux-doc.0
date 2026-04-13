Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCED399003
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066312; cv=none; b=mgs++LQYL0vaA8jSgZogt31s1h++orFi4ADvHFHnu2OspxtX0vsUFI1575i2ZhBwawT7EjUrA2HmoB17CFAheS2+dQAJVmWOlCezj/X9/0q9QY1COV4jobDIOeudS1OBkHzvHtEbqWyE/IQ7hHLjhGwKPDKfQH/xzJQPtlHCTs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066312; c=relaxed/simple;
	bh=BGMSu12m2mn0mDNFXLqooOThMAxDQT2Mpe3BqGwJF8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UcREuSHV0XKspwi8sJWzI6ekR3exeTL/CAG5owfskSnEqR3RARkcIu8J97TX1gg+SqWCxXfOw1He0hSkAwh0WDF2qDWdymjF/VcwWj5hgQxYNmTwVXQz3i8r0cmjV3rPsIUhzMFZSYFQxOu3KlE1GpigJB6tfRlH58QEudHm28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLKXdpPB; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLKXdpPB"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c19d23b19so4090750c88.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 00:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066310; x=1776671110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ44lW/U6rKhLB+VxvVCzN9hwjYmEMV1dg+CBNB6cSw=;
        b=lLKXdpPBMfBYy76+CaTZ33G0g/SF17GwUZRxr6TaGpM1c/pn9+CFp7k6HDUpgtWK+w
         12P+NEGwSwE/oboTGvqWLLkki9Uq+qJDl6Vjdne/YwUZpCpRuEOIkKqDO9knbPi0LASN
         8lUgZLI3pMxtaWTNiP1FVf5G8wuYV+iDs+TTGmZ4r4Hzvtqp5HD5aLGm4QsydsbewFF6
         boXG+moFtgYW8VPVYRCf2LccEt3drxdXLAqbcmM2piO0XSd3F2PuroqdMD2wwCpcD4he
         /bbOqj2cHlUVAmuqwal7MhQb2sLwnjjkUDUya0oSuIWh7D+Rj8waMGiz+8b/rscAg6FD
         wZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066310; x=1776671110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ44lW/U6rKhLB+VxvVCzN9hwjYmEMV1dg+CBNB6cSw=;
        b=Qi3LiOKfMWdp7YXXe3eNRU8CG+34mWvMv00dIDZpccGpjrAoKOwfij5+gXeWQ+obHK
         xhVpsroplZwYS/84aEp9CVDK1rXOF3ywjOR1gUCxd/NloNgwb/l1mvdZ7nfoObIuEIWv
         akU+yKYY6uP/8cYSDCDu6AZOmR1C+AM+3C+rG3PAKG0/vYG4GpHTD+6t9WNdcTlwPbC4
         2WmFXJsDLq4Udu/IqmsT69ghpuJ8j+9BvpKe9CM9pfGPsZheH0Azia+lepB+cOu0U9Rg
         3HlryKfQ+mpKFEAvdsAHfJCq3nb9c9s2woUsqP17nwdtJ18c4lUu54Lm/59wM7LiMuv7
         gQrg==
X-Forwarded-Encrypted: i=1; AFNElJ81qe0fpaCiBADo1PX5wR6L9R/wVX/R49Wt63Fre3vUjX0Mlp0Qz9wO9PXmqZieoW4yw4tL3PuuTKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0m+Brie4ue1KqevoHPretNCVWJUSZnbGWYkB9z9q6gHpMRdXu
	wTI6FVLMHPdxwgDIqM/rrz7ocQI1T/jSvDI978gi1jKB8oIk4QwR8fBu
X-Gm-Gg: AeBDiet4JNJoIcLwsTn7/jyQoNVz7TEGMebhepL5WCQELVvxXr9i/VfVA4QVh7LjkGl
	JCqTOXP9mnxjfTE2SYUSiCcQMNMUXXAJnuIzfZMEEVzIwSpuHYEaWF8CEIKRQfWR5cLOge2jC78
	CbHYcwlIc4GL6LNMMZ6jmkoNLp2FrBSYnG9zlxOLzR9I95y9dVKuWSJcu208gKht5Ogzrx0jnab
	C0Tjxmprs4fPAUOJOpkulBFMXdANsZLnpAxg5PmKaSddY665i2Sdfj37yk5SfTeGOKjIVL09n4F
	5fENjPiZ8OInCzmycw0dPAG6FTLqpYKNStSSS0SupmVtZwzY34ACDAIpDGxous9rKybNJ5XqJrQ
	BQvYL+ifgE6KZOR1EQm/4xrZ3d+iRAMEbWXemNKQuBPn03rQPO8WHKvhOe6xBSbsmo7ZD1cB/ew
	eksjexd6ca0iQqROtN
X-Received: by 2002:a05:7022:622:b0:128:df80:1852 with SMTP id a92af1059eb24-12c34e55bc9mr6509824c88.9.1776066310149;
        Mon, 13 Apr 2026 00:45:10 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:45:09 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:16 +0800
Subject: [PATCH v2 10/12] cgroup/cpuset: Implement SMT-aware grouping and
 safety guards
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-10-06df21caba5d@gmail.com>
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

Dynamic Housekeeping Management allows runtime configuration of kernel overhead
isolation boundaries. However, configuring CPUMASKs that separate SMT siblings
(e.g., placing one hardware thread in the housekeeping mask and leaving
the other isolated) can lead to severe performance degradation due to
shared L1 caches and pipeline resources.

This patch introduces `cpuset.housekeeping.smt_aware`, a robust safety guard
to prevent user-space from splitting SMT sibling pairs across isolation boundaries.

When `cpuset.housekeeping.smt_aware` is enabled (1):
- Any write to `cpuset.housekeeping.cpus` must include all SMT siblings
  for each CPU presented in the new mask (verified via `topology_sibling_cpumask`).
- If an invalid mask is supplied, the write operation is aborted with `-EINVAL`.

This ensures the kernel's housekeeping constraints are met while maintaining
maximum hardware thread efficiency.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/cgroup/cpuset-internal.h |  1 +
 kernel/cgroup/cpuset.c          | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
index 3ab437f54ecdf..162594eaf8467 100644
--- a/kernel/cgroup/cpuset-internal.h
+++ b/kernel/cgroup/cpuset-internal.h
@@ -61,6 +61,7 @@ typedef enum {
 	FILE_EFFECTIVE_XCPULIST,
 	FILE_ISOLATED_CPULIST,
 	FILE_HOUSEKEEPING_CPULIST,
+	FILE_HOUSEKEEPING_SMT_AWARE,
 	FILE_CPU_EXCLUSIVE,
 	FILE_MEM_EXCLUSIVE,
 	FILE_MEM_HARDWALL,
diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 5df19dc9bfa89..4272bb298ec3d 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -37,6 +37,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/task_work.h>
+#include <linux/topology.h>
 
 DEFINE_STATIC_KEY_FALSE(cpusets_pre_enable_key);
 DEFINE_STATIC_KEY_FALSE(cpusets_enabled_key);
@@ -156,6 +157,9 @@ static bool		update_housekeeping;	/* RWCS */
  */
 static cpumask_var_t	isolated_hk_cpus;	/* T */
 
+/* DHM: Enable SMT-aware boundary checks */
+static bool cpuset_housekeeping_smt_aware = false;
+
 /*
  * A flag to force sched domain rebuild at the end of an operation.
  * It can be set in
@@ -3218,6 +3222,16 @@ static ssize_t cpuset_write_housekeeping_cpus(struct kernfs_open_file *of,
 	if (retval)
 		goto out_free;
 
+	if (cpuset_housekeeping_smt_aware) {
+		int cpu;
+		for_each_cpu(cpu, new_mask) {
+			if (!cpumask_subset(topology_sibling_cpumask(cpu), new_mask)) {
+				retval = -EINVAL;
+				goto out_free;
+			}
+		}
+	}
+
 	retval = housekeeping_update_all_types(new_mask);
 
 out_free:
@@ -3225,6 +3239,18 @@ static ssize_t cpuset_write_housekeeping_cpus(struct kernfs_open_file *of,
 	return retval ?: nbytes;
 }
 
+static ssize_t cpuset_write_housekeeping_smt_aware(struct kernfs_open_file *of,
+						   char *buf, size_t nbytes, loff_t off)
+{
+	bool val;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	cpuset_housekeeping_smt_aware = val;
+	return nbytes;
+}
+
 /*
  * Common handling for a write to a "cpus" or "mems" file.
  */
@@ -3317,6 +3343,9 @@ int cpuset_common_seq_show(struct seq_file *sf, void *v)
 	case FILE_HOUSEKEEPING_CPULIST:
 		seq_printf(sf, "%*pbl\n", cpumask_pr_args(housekeeping_cpumask(HK_TYPE_DOMAIN)));
 		break;
+	case FILE_HOUSEKEEPING_SMT_AWARE:
+		seq_printf(sf, "%d\n", cpuset_housekeeping_smt_aware);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -3464,6 +3493,14 @@ static struct cftype dfl_files[] = {
 		.flags = CFTYPE_ONLY_ON_ROOT,
 	},
 
+	{
+		.name = "housekeeping.smt_aware",
+		.seq_show = cpuset_common_seq_show,
+		.write = cpuset_write_housekeeping_smt_aware,
+		.private = FILE_HOUSEKEEPING_SMT_AWARE,
+		.flags = CFTYPE_ONLY_ON_ROOT,
+	},
+
 	{ }	/* terminate */
 };
 

-- 
2.43.0

