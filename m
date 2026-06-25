Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7593DDDBE;
	Thu, 25 Jun 2026 12:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391656; cv=none; b=tCq4HmbO7zbgxbbQTrST2ulB/x/CC2C+X0M1xauheIxhdpCWNcNWuLn+0i2qHyEAagdl9iuCRCDkXnxV4TgwcdX3l6gBxLQLvVgjr/C0jLK2ggMfy+ZoTnQY9nnz/kvOxi7D/OCvL9EKNVXMu8FVc26rTyIlvdyuHdGDFwJS3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391656; c=relaxed/simple;
	bh=kvH86qriMXso7p6vNe1NN6gdmYqeNVkNo4C+sWYHJZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rrOUHgZJrVpyUITwatOM1ISOGHfi4LidHsz8sh7jNOelm5eSqs/40bP+WSI7x4XeqGWJCXYXDE1tKgy/VJr9E6nFULIrDJLc4c9KYs61sVtQH77Bff1pfdOBB0teorf/RVCOjUcin6Jf1vBB7Z63XOcGH/eGHIrplP/b+U8crqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=H/pQYdgZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="H/pQYdgZ"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mq9s2927537;
	Thu, 25 Jun 2026 12:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=CePuFedM/iOTUDX8JbTNOvq2SjTe
	np6dRCKvwSCgOz8=; b=H/pQYdgZjU7x310WjSyKtcd4U44xUiFx3CIjZ33jidz7
	2HP80li5Y4YLvO/S5k/buQ/G9tBQsbqIg/cib81AFGa9bCQiNtRFbHSd5mJoYiff
	Zme/V1SlVf3uaJo/bsbLoXIlUXRC3d99VnssNZ+Ue/puy/nLsEB/4u1TQ8ymXeTx
	F1m/OZWM8MhDQNdo2HE1Vv+IFzKhImFxwVd84wjvoXVvE/jkk5jJJIG59llo6YNC
	CkT/JSX6GamZVSHysW+dNMo197duJE5/kvTsDZpfKBog7zLK5QUCKDyz1PwATxwS
	nI+f2xEe6bj6n6KMSL85ODc2gD6XPh+bfJ8nJSs8Qw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1suq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:10 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbog002240;
	Thu, 25 Jun 2026 12:47:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywunv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCl60F52691200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1628A20043;
	Thu, 25 Jun 2026 12:47:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45DC220040;
	Thu, 25 Jun 2026 12:46:58 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:46:58 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 00/24] sched: Introduce cpu_preferred_mask and steal-driven vCPU backoff
Date: Thu, 25 Jun 2026 18:16:24 +0530
Message-ID: <20260625124648.802832-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: oStpu6f0Put5OJ2MPK-Z3NYaZLLaZ5Zh
X-Proofpoint-GUID: kYDXBZfmtYRp2M6bNvaVES3pephnGo5q
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d234f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=jJrOw3FHAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=CMil3U05EXRAGL9-UckA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfXycM1b2FoACL4
 t+f8me9N54V48d9fbVz6Hz4trKPhoFaJplRpfM9eRjB/VbKHnUvatBLZkMaRpK6hcqIfqlnJ8R2
 NY+fz5FnVgXKoG/V88nSEfpNNuRF18qXGWMb+ZIRAHGLQTFJDcOYm5T899s+4i7Y+aPNM+LCdsz
 VaIk4FSsfUZ+41IfGhySjIDYwo5oBlW2VTnj0iW8R59nlh8LgkekI0P1B8kD6rG62Utlxur5Kq5
 YwBGlQJ/XtfqtoesBwTj22N0kAfiMRpVUHvf4eAheTNcp9uOX/LNFmMnRNe7KE9F9n/MtRikWiL
 WNMJ0LwT38qBoGjweuizAnioqFGvZRH/FTYJjkSJbDzMvJ5OcVT7yDcpHDLtM3fSW/2UdpB7wmw
 9jnbYsrQUuPXP2AlJI+v+idVQMy2TSOYHXGwnBhhOmEZ8Bb0whGAOdSXsUhzpApNAB8tKYRa+9Y
 VGt8LariVGNi6XnRBgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX86XP0KLdImPe
 Zn2VS1+WOJJUlH9/yqRiHKZlt1NX5TVi0Csv2PfwQgZq3pRAyE8xa3xY0wRvZLxagJji0AZb9JB
 2kXv+fyEXd8gabdYWD7Kqm303P/TuKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

Very briefly,
- Maintain set of CPUs which can be used by workload. It is denoted as
  cpu_preferred_mask
- Periodically compute the steal time. If steal time is high/low based
  on the thresholds, either reduce/increase the preferred CPUs. This is
  handled in a new driver called steal_monitor
- If a CPU is marked as non-preferred, push the task running on it if
  possible.
- Use this CPU state in wakeup and load balance to ensure tasks run
  within preferred CPUs.

For more details on idea, problem statement and performance numbers,
please refer to cover-letter of v2[2] and OSPM talk[1].

*** Please review and provide your feedback!! ***

[1]:https://youtu.be/adxUKFPlOp0
[2] v2: https://lore.kernel.org/all/20260407191950.643549-1-sshegde@linux.ibm.com/#t
[3] v4: https://lore.kernel.org/all/20260617174139.155540-1-sshegde@linux.ibm.com/#t

Thank you very much for feedback so far. This has helped the code to
evolve towards a clear abstraction layers and get simplified.
(Hopefully). Apologies in advance if I have missed any comment.

base commit:
tip/sched/core at c095741713d1 ("sched/fair: Fix newidle vs core-sched")

v4->v5:
- Move the computation of steal time and decide on preferred CPU state
  to a driver. Drop those changes in core scheduler. (Yury Norov, K Prateek Nayak)
- A new driver called steal_monitor is added in drivers/virt/ (K Prateek Nayak)
  (Please let me know if there is a better place for it. I can move it
  there)
- New driver does periodic computation of steal time and
  increments/decrements the preferred CPUs.
- Debug knobs can be changed via module parameters. (Yury Norov)
- Default implementation are weak symbols. Archs may override by
  providing strong symbols in new respective arch specific file.
- Everything is centered around CONFIG_PREFERRED_CPU. No new config
  for new driver. Driver gets added to kernel, but not loaded by
  default.
- Load the driver to enable steal_monitor functionality. Unload to
  remove the same.
- Make CONFIG_PREFERRED_CPU depend on PARAVIRT && SMP (Yury Norov)
- move set_cpu_preferred to a macro. (Yury Norov)
  on CONFIG_PREFERRED_CPU=n it will just act on active CPUs in that case.
  It shouldn't alter any functionality.
- Do a simple encoding for has_preferred_cpu_state, which aims to avoid
  repeated cpumask_interest in is_cpu_allowed. 
  (Please let me know if new variable based approach to is_cpu_allowed
  should be done instead).
- Move select_fallback_rq above the rq_lock. (sashiko)
- Few documentation nitpicks (Randy Dunlap, sashiko)
- Avoid any decision for is_cpu_allowed for other classes (sashiko)
- Don't pull the load towards a non-preferred CPUs in idle and new
  idle balanced. (Inferred when seeing sashiko comments)
- Fix leaking of task_struct in push_work_done (K Prateek Nayak)
- Module parameters aren't checked for sane values. One should know
  what they are writing to it. If one writes 0 for interval_ms,
  then it gets set to default value again to avoid workqueue lockup.
- Added a few design construct related checks in the periodic work
  to ensure any future arch specific implementations follow it.
  1. preferred is subset of active.
  2. preferred cannot be empty.
- Added Documentation of steal_monitor in Documentation/driver-api/
  (Let me know if there is better place for it)

performance numbers are expected to be same or slightly better than v2.
With driver, one major overhead in sched_tick has been removed. i.e
finding the first housekeeping CPU which was O(N). 

Apologies in advance if there is any critical information is missing
regarding new driver such as policy, documentation or missing
implementation. Please let me know, and I can make those changes.
I have ensured checkpatch --strict is happy.

Also, I think there should be a MAINTAINERS file entry for new
driver. I don't see a drivers/virt/* entry.
Either as a new entry for driver or a few file in SCHEDULER entry.
Let me know if/what I should add it. I am bit cautious about such
change. I am willing to maintain this driver, other than that
I don't know what else i going to be necessary for it. I don't have
any maintainer experience either :)

PS: Sorry for the long CC list. Please unicast it to me if you want to
be dropped for the CC list.

Shrikanth Hegde (24):
  sched/debug: Remove unused schedstats
  sched/docs: Document cpu_preferred_mask and Preferred CPU concept
  kconfig: Provide PREFERRED_CPU option
  cpumask: Introduce cpu_preferred_mask
  sysfs: Add preferred CPU file
  sched/core: allow only preferred CPUs in is_cpu_allowed
  sched/fair: Select preferred CPU at wakeup when possible
  sched/fair: load balance only among preferred CPUs
  sched/fair: Pull the load on preferred CPU
  sched/core: Keep tick on non-preferred CPUs until tasks are out
  sched/core: Push current task from non preferred CPU
  sched/debug: Add migration stats due to non preferred CPUs
  virt/steal_monitor: Add documentation
  virt: Introduce steal monitor driver
  virt/steal_monitor: Restore to active on module disable
  virt/steal_monitor: Define steal_monitor structure
  virt/steal_monitor: Add control knobs for handling steal values
  virt/steal_monitor: Compute work at regular intervals
  virt/steal_monitor: Provide default method to get systemwide steal
    time
  virt/steal_monitor: Provide default method to inc/dec preferred CPUs
  virt/steal_monitor: Provide default method to get num of CPUs for
    steal ratio
  virt/steal_monitor: Act on steal values at regular intervals
  virt/steal_monitor: Add direction control
  virt/steal_monitor: Add design check of preferred subset of active

 .../ABI/testing/sysfs-devices-system-cpu      |  11 ++
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/steal-monitor.rst    |  93 ++++++++++++
 Documentation/scheduler/sched-arch.rst        |  50 +++++++
 drivers/base/cpu.c                            |   8 ++
 drivers/virt/Makefile                         |   1 +
 drivers/virt/steal_monitor/Makefile           |  14 ++
 drivers/virt/steal_monitor/defaults.c         | 105 ++++++++++++++
 drivers/virt/steal_monitor/sm_core.c          | 124 ++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h          |  32 +++++
 include/linux/cpumask.h                       |  21 ++-
 include/linux/sched.h                         |   5 +-
 kernel/Kconfig.preempt                        |  14 ++
 kernel/cpu.c                                  |   6 +
 kernel/sched/core.c                           | 133 +++++++++++++++++-
 kernel/sched/debug.c                          |   4 +-
 kernel/sched/fair.c                           |  11 +-
 kernel/sched/sched.h                          |  36 +++++
 18 files changed, 659 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/driver-api/steal-monitor.rst
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/defaults.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

-- 
2.47.3

