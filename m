Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1632331EBA
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 03:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752283; cv=none; b=dzMDblGkbiFOBWYONK+cv2we1cbcEhnOS/z2egN/+vbbGN4kF3EzwAZ7yeMhZY0Xxc8BTmR1nhP5IV/mSgHM4/lY9JYUgVLG2jWdXewdVf3VD1uMY8JuHmpYi/tKJrGqXacL23dZlQwORUbZpNW9Rw+3dXn7kKvEbmgHIrPuhso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752283; c=relaxed/simple;
	bh=Xa5StEN2UH086bDikWsQrqqqrc9uy1URBleR3Pv/RuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mXUGgwDgAqEgWHacNNMHaZruGHeahDdnTCo6LKWCHi5D7RVLlDmzWTDWb5jrOKputdU7j+Fk+tAd5ThJuku1bqGwPTBJA839Z5ZSHnF68cadAtky7HSFRm7PtE1ShPvhF+pZIpMetm970k+d+RqeAWmTMLUljDAj1Zxv6OtUsyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTRDT8rP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTRDT8rP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c132ac5ec2so4924985ad.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 20:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781752281; x=1782357081; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJIpWsHRh9AKKYRu7jgv8q277vRNDwM5z3jTZiQx1lI=;
        b=XTRDT8rPpb1rok5YcsfdkCFn5xepyXLOhNXa+rIw5uMymVh8ILY3E0XxNialBahegb
         aFJ6yi8FTOuNfMUutWSQQWW5hoE5EPNk/e4ZK6wTqK6IUpVYbQTtLNmyQDD8wMe5R1GZ
         hspO2RY2IRxhav77+cE64G6ECphZd8032RI2pb97QhTISlKhzv6gdy65x5xx5ejn5M/y
         PGWwhknRZIrieY02awERilsrb9WarsQuJvQN5lnjhZIijnFkO0u7UO6vqYIIQRjZvgYm
         Z0jAcNrrVZWywlspd4uto83Tl2Di+O6Me5cOdAVCH1KPwd8ilNVeVkDrvc7Ayz0H0h9f
         H2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752281; x=1782357081;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJIpWsHRh9AKKYRu7jgv8q277vRNDwM5z3jTZiQx1lI=;
        b=MwKkYg55Cx6JPX3t+8/FzQ4Wo5C5lJGp2RnZgjRPtL7VELprwrN4J3ExIpKhpSHo3E
         ZEcpk4sU0eLHMhB62hp+MaU2ksGQru255QFnRoyuNGcCisQBaerC+NtpkJCmeCWPX29q
         VK/SMwSO7gPwJZfKBy/kvp6eT2zFuetSLcjObPnMzxtyMOet6oYPAJuyxIZzZVNifAko
         U4Hn4Dr5bbexdx1Uqv9fvioV5k8/hQwLyzK2vR7PL20DTRHGSKUYstG2ZuSh9NNRaqjB
         6r4PbF2mh0llhqNcSV72EQWhGE0YZAKh0ig0SZphCM0Ja8E4PfXRdUUNT+bc1I3bhJW7
         H34A==
X-Forwarded-Encrypted: i=1; AFNElJ8zpdgV7WErdkPGNRSJ49vuc/Km2Cm/Xfp+bPP2/P9b3I6w3pxMxkhvqIQ1qnK/BX4aXUd49rEGOgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGf2DJu/LpuzqAGxhQpm4JybKk6PaVZijvE9DKWLvbFcGYE9p7
	JZ+6MAuU7ejIS/JbjtBRahH1m+yEA3RHB8+ymG0hjRRXOjqlU7CJ2SZn
X-Gm-Gg: AfdE7cl5zaPFIzUPqaXeafYb5TZLEpfOfSUvQnIhgfzcruLE6jkEP2V5KSsj9vlv0mc
	tPCz8o30tFlJWpWsE3AA6aPFpAXFZ6F12AtroF893Qsj3ZU+d8zuyqMB1CSSfwup2rPqc6qH4d4
	hg3/mqfF7QhTlaU1EyIs4ZFpwVhoa8JxS1iWQhiVV0NENNrFJGV0ZTCDGZdmTyHVX/GEE9jvnqD
	N4xUD2Kt2qT6aDU9wVKgZyl9UqTPdu4TAM0fCurhfMVqZI+PkGCQcP2NLjJlXOkfmeeLCjAB90b
	9XAGSzgdIfVvTvxLvmrSyHmME25C7JLTh9MToLO1uso2a0ht/UK84wF/14V01v9qvGXssIhkc/B
	Y5sJxuskv6gPG0kD3osGcLEQVAv0GNO2rpWQ54SISuDg2LkPiWfxSY3YfHZ9/1rIQniVENTafrW
	QMTZ8NjkeJUVs=
X-Received: by 2002:a17:903:1d2:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c6e2464d52mr16755565ad.0.1781752281045;
        Wed, 17 Jun 2026 20:11:21 -0700 (PDT)
Received: from [127.0.1.1] ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a403b242sm60152975ad.31.2026.06.17.20.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:11:20 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
Subject: [PATCH v3 00/13] Dynamic Housekeeping Management (DHM) via CPUSets
Date: Thu, 18 Jun 2026 11:11:11 +0800
Message-Id: <20260618-wujing-dhm-v3-0-28f1a4d83b68@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM9hM2oC/13O0YrCMBCF4VeRXG+WZFJr69W+xyISJ5N2ljaVx
 MYV6btvKoKydzkD/0fuIlFkSmK/uYtImRNPoQzzsRHY29CRZFe2AAW1qlQjr/MPh066fpSNrwy
 Bq1p0jSjBOZLn3wf2fSi753SZ4u1hZ1ivT0abdyaDVFLVzoNGe7Jb99WNlodPnEaxMlm/UgPb0
 hDLrEF6DnYor5K3ukW0YNA6/y+PHl89qFp6spc5knS3YEfGI6dpwPOcjk94/Y2yO63ppHBXvXP
 LsvwB3W6kfjIBAAA=
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

This series introduces Dynamic Housekeeping Management (DHM) to the Linux
kernel, enabling runtime reconfiguration of kernel-noise housekeeping
(nohz_full tick suppression, RCU NOCB offloading, and managed IRQ
migration) through the existing cgroup v2 cpuset isolated partition
mechanism — no new kernel ABI required.

When a cpuset partition is set to isolated mode, the CPUs in that
partition are removed from the kernel's global housekeeping masks.  The
housekeeping subsystems (tick/nohz, RCU NOCB, genirq) react via explicit
registered callbacks, applying the new masks at runtime.  Destroying the
partition restores the CPUs to all housekeeping masks.

The architecture uses a per-type callback table (struct housekeeping_cbs)
with pre_validate/apply hooks, replacing the previous notifier chain.
Housekeeping cpumask pointers are RCU-protected to allow lock-free readers
during updates.

Signed-off-by: Jing Wu <realwujing@gmail.com>
Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
---
V2 -> V3:
- Replace notifier chain with explicit per-type callback interface
  (struct housekeeping_cbs with .name, .pre_validate, .apply fields).
- RCU-protect all housekeeping cpumask pointers; callers must hold
  rcu_read_lock() or use housekeeping_cpumask_rcu() in apply() callbacks.
- Drop 5 patches from v2: HK_TYPE enum separation (upstream aliases are
  already correct), no-op timer/hrtimer patches, kthread dead code, and
  workqueue double-update.
- Fix deadlock in rcu_hk_workfn(): remove cpus_read_lock() wrapper around
  remove_cpu()/add_cpu() which take cpu_hotplug_lock write side.
- Fix UAF in rcu_hk_apply(): snapshot the housekeeping cpumask inside the
  work function under rcu_read_lock(), not at apply() time where the old
  pointer may be freed by synchronize_rcu() before the work runs.
- Fix tick apply(): snapshot housekeeping_cpumask_rcu() under
  rcu_read_lock() as required by lockdep for runtime-mutable types.
- Activate context_tracking dynamically via ct_cpu_track_user() /
  ct_cpu_untrack_user() in tick apply(), eliminating the dependency on
  CONFIG_CONTEXT_TRACKING_USER_FORCE flagged by tglx.
- Fix genirq apply(): snapshot HK_TYPE_MANAGED_IRQ mask under
  rcu_read_lock() before the IRQ iteration loop.
- Simplify cpuset noise_types to BIT(HK_TYPE_KERNEL_NOISE) |
  BIT(HK_TYPE_MANAGED_IRQ), replacing the redundant per-alias bitmask.
- housekeeping_update_types(): always use cpu_possible_mask as base
  for HK_TYPE_KERNEL_NOISE, so de-isolation restores the mask to all
  possible CPUs rather than leaving it at its last non-trivial value.
- Initialize watchdog_cpumask from HK_TYPE_KERNEL_NOISE (not
  HK_TYPE_TIMER) at boot; keep it in sync at runtime via a new
  housekeeping_cbs callback.
- Add kernel-noise selftest to test_cpuset_prs.sh, including
  cpu_in_cpulist() for correct cpulist range membership detection and
  nohz_full sysfs verification when CONFIG_NO_HZ_FULL is active.
- Add RCU caller fixes: sched/core (HK_TYPE_KERNEL_NOISE) and
  drivers/hv (HK_TYPE_MANAGED_IRQ) are required because those types
  are updated at runtime; hrtimer (HK_TYPE_TIMER) and arm64/topology
  (HK_TYPE_TICK) are defensive fixes.
- Reorder patches so all subsystem callbacks are registered before the
  cpuset patch that triggers housekeeping_update_types().

V1 -> V2:
- Rebrand series from DHEI to DHM (Dynamic Housekeeping Management).
- Drop custom sysfs interface entirely.
- Integrate housekeeping control into cgroup v2 cpuset isolated partition
  mechanism.
- Add SMT-aware isolation constraints to prevent splitting SMT siblings.
- Add comprehensive documentation and cgroup functional selftests.
- Refactor mask transition logic to use RCU-safe handover.

v2: https://lore.kernel.org/r/20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com
v1: https://lore.kernel.org/all/20260325-dhei-v12-final-v1-0-919cca23cadf@gmail.com

---
Jing Wu (13):
      sched/isolation: Replace notifier chain with explicit callback interface
      sched/isolation: Add housekeeping_update_types() for kernel-noise masks
      sched/isolation: RCU-protect all housekeeping cpumask readers
      sched/isolation: Fix RCU protection for runtime-mutable cpumask callers
      cpu/hotplug: Reserve CPUHP states for nohz_full and managed IRQ down-paths
      tick/nohz, context_tracking: Prepare for runtime nohz_full updates
      rcu/nocb: Add explicit housekeeping callback for runtime NOCB toggling
      genirq: Add explicit housekeeping callback for managed IRQ migration
      watchdog/lockup_detector: Register housekeeping callback for kernel-noise
      sched: Guard sched_tick_start/stop against uninitialized tick_work_cpu
      cgroup/cpuset: Extend isolated partition to trigger kernel-noise isolation
      docs: cgroup-v2: Document kernel-noise isolation via isolated partitions
      selftests/cgroup: Add kernel-noise isolation test to cpuset selftest

 Documentation/admin-guide/cgroup-v2.rst           |   8 +
 arch/arm64/kernel/topology.c                      |   9 +-
 drivers/hv/channel_mgmt.c                         |  50 +++--
 include/linux/context_tracking.h                  |   1 +
 include/linux/cpuhotplug.h                        |   2 +
 include/linux/sched/isolation.h                   |  41 ++++
 kernel/cgroup/cpuset.c                            |  23 +-
 kernel/context_tracking.c                         |  23 +-
 kernel/irq/manage.c                               |  86 ++++++++
 kernel/rcu/tree.c                                 | 104 +++++++++
 kernel/sched/core.c                               |   7 +-
 kernel/sched/isolation.c                          | 256 ++++++++++++++++++++--
 kernel/time/hrtimer.c                             |   5 +-
 kernel/time/tick-sched.c                          | 157 ++++++++++++-
 kernel/watchdog.c                                 |  56 ++++-
 tools/testing/selftests/cgroup/test_cpuset_prs.sh | 204 ++++++++++++++++-
 16 files changed, 968 insertions(+), 64 deletions(-)
---
base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
change-id: 20260408-wujing-dhm-8f43e2d49cd8

Best regards,
-- 
Jing Wu <realwujing@gmail.com>

