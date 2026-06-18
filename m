Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64687331EC9
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752299; cv=none; b=rFgUiLTupWMw+HD6eIh9ixYCp6RdLxbAAV/WabAZiGCVpuKRwoQXIIVZK7kdLc9WDPkqTc8+pzwq7jwPDROfeUhLwIIerpNU+muR4Tm2WGvrDV/juHZVHR7wfrZ+G9ezOmIGJGZyo+XU//B/0HP0gD4SiGVkwSiZgy6eaBDfHtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752299; c=relaxed/simple;
	bh=wNAVoY+2XUhNXD7ws5hDG4Y7LngUTCxkc6ilR6rWf9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XV7vXuT4LofhXuCe7S0cGepMk7LzhZkCVW73Vob0PM3EC7684+Ms156vGj6KnXVTQtnxjfxE+BC/OU5+eL2WtM224bYxq4aFFu6YvS1GX1tJKypymIjBqRukN06u6Zx1TwAg99lT/mkIj1LX/EM/efzqKv3PKyZ4DzQhrBZHHQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNbVv9Mb; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNbVv9Mb"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c88b59bfba7so168701a12.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752298; x=1782357098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH2J//DFdecoNTzDNyFAADQileJGwCOemNHhoqIoONY=;
        b=RNbVv9Mb9PpiUrdAQpE9vJagWCFUYRcE4SfoUFAoTQjFEO/62sIBh5NDM+zQtGy48C
         CLRHkE0ctwXA9zcmEbRa3fLDapHAQnWkU+TqIscCln0iqqviIt7iCg8xYMABo8onmNJG
         Rby8kq6RpslJcF/iy+8aBy4ZbncoWvcjXlWFCzJtxFIoey93oo7m6ieRNRHOo3aOTvB6
         +3caSVFAgM7vYRzjBKNU21wBmhhKRVAxhcjZ+Hwoj1uvl7vgUO7ub82M+P4Q9UC83GSE
         4oJbOS4+8sJeiG6KEX2KfTgcjx4uewd7z9n+1mqdQ9y7R/oCrdT+TgZtesptSoF1Slbt
         qAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752298; x=1782357098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GH2J//DFdecoNTzDNyFAADQileJGwCOemNHhoqIoONY=;
        b=Q2rzLg1FHQopaBrJMqm6ZoP2lkQ624akgyYluGZ67/Xz+r6yxEvE9mvgWm4jGokOMC
         kAvy76ZgKeUTyvsxxotNJX6cnB0ZAzLvjtx/LJGpHAAUR8ryqJuQ3TF+CEgkUEYQ09SP
         JN3nVRGW+k+/ptACfFe4piZd64cluddTNDhF7bgtmpRcwTUMX7LZG36MD5tdQLJBtDrF
         W44t0wWo1DVknNeAjqn4DkgK9NiHsKZVaFKL16wiZxS+nU2iChuGlTCQjxDFOpcLPDXh
         Vx0R7tYYGjBp/fkPMvF2cmVpKOASw/eIXYco2ZEYmzqpFooWZZ2pxpMz9cd3zu7Zv/JM
         CpUg==
X-Forwarded-Encrypted: i=1; AFNElJ9ze41GFmlULqstuyQznzOM+Q0Ar6aoSlnC5Aq+djU46uqhbgqINRdvLNLhN1O2iVbBo9zKkmZbvNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQrfMgr12FYnOZYFdNGQXrFXapjYNcpcdGaaf7KhH6DMJGLu68
	EcKXKfuV7/qD9VXLXxMYZ4APKpE7L1kOJyLcMLQYLObgUNcmIZMvLfoh
X-Gm-Gg: AfdE7ck4PCpM9/6+XaOjtN9ttd3F/jI5Xok+7+946S0HSd4b+gMxXnyitLoG9S9n0Ef
	uqhJDFXL3/kkia0X910tQ/XP8BMCKejvGDzeNBjwDAAsPAz93B/r2gZZ/Jfy56z10raXSCJITd1
	r9aJD3EBO7O2N8O54ffN9QzZWt3wDAcp0kNyrexBEVthwJLAcZNBd0ALRnu2QqUZORJCUGaL7tZ
	3XZrP869Px1D/Q6FxqRSCV6Co10R0PMBMWShq1Eu7AoVBtFLkPk7IOoAjJQZz0XyDZ3XXKACrAk
	dVnoM9RFHh2LaHex/kCTB/h4gdaGzy5jZwrCa+2KYnFB6/UhUtZs0JLSXImYGT5Dy+XfUItr++i
	yL5DGcKzl74cdYox/zVWCBSesc0FlsjoO+DzHWT7moLbH+jQyXVep/Ng1FPed4x4+DyUSGw1Ipg
	ecmaH3IONxoxk=
X-Received: by 2002:a17:903:3550:b0:2c0:e5ee:f56c with SMTP id d9443c01a7336-2c6e527622dmr16575975ad.20.1781752297602;
        Wed, 17 Jun 2026 20:11:37 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:37 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Date: Thu, 18 Jun 2026 11:11:13 +0800
Subject: [PATCH v3 02/13] sched/isolation: Add housekeeping_update_types()
 for kernel-noise masks
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wujing-dhm-v3-2-28f1a4d83b68@gmail.com>
References: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
In-Reply-To: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
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
 Anna-Maria Behnsen <anna-maria@linutronix.de>, Tejun Heo <tj@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jing Wu <realwujing@gmail.com>, 
 Qiliang Yuan <yuanql9@chinatelecom.cn>
X-Mailer: b4 0.13.0

Introduce housekeeping_update_types(), which updates the cpumask for
each specified housekeeping type atomically using an RCU pointer swap.

For each type in @type_mask the trial mask is computed as
(base & ~isol_mask), where the base depends on the type:

  - Most types use the current housekeeping cpumask as base.  For
    types that are only set at boot this is equivalent to the boot
    mask, so trial = (boot_mask & ~isol_mask).

  - HK_TYPE_KERNEL_NOISE always uses cpu_possible_mask as base.  Its
    semantics are "all possible CPUs minus the currently-isolated set";
    using the current HK mask instead would leave it stuck at its last
    non-trivial value after de-isolation, breaking subsequent isolation
    cycles.

HK_TYPE_KERNEL_NOISE also supports runtime first-enable: if it was not
registered at boot (no nohz_full= on the kernel command line),
housekeeping_update_types() registers it in housekeeping.flags on the
first call.  All other types must already be boot-enabled.

For each type the function validates the trial mask against
cpu_online_mask, runs registered pre_validate() callbacks (which may
reject the update), swaps all RCU cpumask pointers in a single pass,
calls synchronize_rcu(), frees the old masks, and then runs apply()
callbacks.

The existing housekeeping_update() continues to update only
HK_TYPE_DOMAIN and remains the entry point for the cpuset partition
path.  housekeeping_update_types() enables the partition path to also
drive the kernel-noise types (HK_TYPE_KERNEL_NOISE,
HK_TYPE_MANAGED_IRQ) through the explicit callback interface added in
the previous patch.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
 include/linux/sched/isolation.h |   4 ++
 kernel/sched/isolation.c        | 112 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
index f362876b3ebdf..eecbcbe802bd0 100644
--- a/include/linux/sched/isolation.h
+++ b/include/linux/sched/isolation.h
@@ -44,6 +44,8 @@ extern bool housekeeping_enabled(enum hk_type type);
 extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
 extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
 extern int housekeeping_update(struct cpumask *isol_mask);
+extern int housekeeping_update_types(unsigned long type_mask,
+				     struct cpumask *isol_mask);
 extern void __init housekeeping_init(void);
 
 /**
@@ -99,6 +101,8 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
 }
 
 static inline int housekeeping_update(struct cpumask *isol_mask) { return 0; }
+static inline int housekeeping_update_types(unsigned long type_mask,
+					    struct cpumask *isol_mask) { return 0; }
 static inline void housekeeping_init(void) { }
 static inline int housekeeping_register_cbs(enum hk_type type,
 					    struct housekeeping_cbs *cbs) { return 0; }
diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index aae4dff7fbfc8..4eca18cc5e8ce 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -249,6 +249,118 @@ int housekeeping_update(struct cpumask *isol_mask)
 	return 0;
 }
 
+/**
+ * housekeeping_update_types - Update housekeeping masks for specified types
+ * @type_mask: Bitmask of housekeeping types to update
+ * @isol_mask: CPUs being added to the isolation set
+ *
+ * For each type in @type_mask that was enabled at boot, compute the
+ * trial mask as (boot mask & ~@isol_mask), validate it against
+ * @cpu_online_mask, invoke pre_validate() callbacks, swap the RCU
+ * mask pointer, and run apply() callbacks after synchronize_rcu().
+ *
+ * HK_TYPE_KERNEL_NOISE also supports runtime first-enable: when an
+ * isolated cpuset partition is created without nohz_full= at boot,
+ * cpu_possible_mask is used as the initial base and the type flag is
+ * set in housekeeping.flags on the first call.
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure, -EINVAL if
+ * a trial mask has no online CPUs.
+ */
+int housekeeping_update_types(unsigned long type_mask,
+			      struct cpumask *isol_mask)
+{
+	struct cpumask *trials[HK_TYPE_MAX] = {};
+	struct cpumask *old_masks[HK_TYPE_MAX] = {};
+	enum hk_type type;
+	int ret = 0;
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		const struct cpumask *base;
+
+		if (type == HK_TYPE_DOMAIN_BOOT)
+			continue;
+		if (!housekeeping_enabled(type)) {
+			/*
+			 * HK_TYPE_KERNEL_NOISE supports runtime first-enable
+			 * for DHM isolated partitions created without nohz_full=
+			 * at boot.  All other types must be boot-enabled.
+			 */
+			if (type != HK_TYPE_KERNEL_NOISE)
+				continue;
+		}
+
+		/*
+		 * HK_TYPE_KERNEL_NOISE always uses cpu_possible_mask as its
+		 * base.  Its semantics are exactly "cpu_possible minus the
+		 * currently-isolated set", so the base never shrinks across
+		 * successive isolation/de-isolation cycles.  If we used the
+		 * current HK mask instead, de-isolating all partitions would
+		 * leave the mask at its last non-trivial value rather than
+		 * reverting to cpu_possible, breaking subsequent isolations.
+		 */
+		if (type == HK_TYPE_KERNEL_NOISE)
+			base = cpu_possible_mask;
+		else
+			base = housekeeping_cpumask(type);
+		trials[type] = kmalloc(cpumask_size(), GFP_KERNEL);
+		if (!trials[type]) {
+			ret = -ENOMEM;
+			goto err_free;
+		}
+		cpumask_andnot(trials[type], base, isol_mask);
+		if (!cpumask_intersects(trials[type], cpu_online_mask)) {
+			ret = -EINVAL;
+			goto err_free;
+		}
+	}
+
+	if (!housekeeping.flags) {
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (!trials[type])
+			continue;
+		ret = housekeeping_pre_validate_cbs(type,
+						    housekeeping_cpumask(type),
+						    trials[type]);
+		if (ret < 0)
+			goto err_free;
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (!trials[type])
+			continue;
+		old_masks[type] = housekeeping_cpumask_dereference(type);
+		/* First-time runtime enable: register the type now. */
+		if (!housekeeping_enabled(type))
+			WRITE_ONCE(housekeeping.flags,
+				   housekeeping.flags | BIT(type));
+		rcu_assign_pointer(housekeeping.cpumasks[type], trials[type]);
+		trials[type] = NULL;
+	}
+
+	synchronize_rcu();
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX) {
+		if (housekeeping_cbs_table[type].nr == 0)
+			continue;
+		housekeeping_apply_cbs(type);
+	}
+
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX)
+		kfree(old_masks[type]);
+
+	return 0;
+
+err_free:
+	for_each_set_bit(type, &type_mask, HK_TYPE_MAX)
+		kfree(trials[type]);
+	return ret;
+}
+
 void __init housekeeping_init(void)
 {
 	enum hk_type type;

-- 
2.43.0

