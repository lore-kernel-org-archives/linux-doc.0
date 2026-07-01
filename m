Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B731F341057;
	Wed,  1 Jul 2026 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915467; cv=none; b=FSvqseTK24baS6yP94neXv9Ci+X79KATDh7zIZUQyOciXmoDSf+iLdcSBJ0TrsrjK8KFXgyZLdT8MLkL7B6wU0dU3UTBejelXoi0NHyvMnfBn85HvPQOYUVx/C0AA4MXQvYMEfDNQ9OaZqGXZmsunESsE1WuSFlSpl0PwiGMqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915467; c=relaxed/simple;
	bh=59q8naSq0mT2cYrp/C6ZTnOtLwYgR3n76twp5+SJoAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OzOkVGsjpUIxmcY9SyixC/ppCzQx+WUdY2nkktTHZ49EXO7MGorfPlyHvQv8q15EtCCDmP6Y7Xe5pDZUwo+9IA/tqOoJOPkPdB588GYVGBCIleiqhS3FwMGp848DvzdS5JzCJSsRXNPqjQqJcULl+o+ciS5RHy4y1OM4a/mcta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=oKYSumU+; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="oKYSumU+"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIvtS493285;
	Wed, 1 Jul 2026 14:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=JgGQw5qMyIcynEF/LGOysYTHKQIU
	t/JQc9IGc1di01U=; b=oKYSumU+XmNX8VMRLcwm++TDCzmK38GAo1G02aiuHeil
	Wdu+T/BXhJmCO0MWQwFkcZEUUmbOogVGTNkv/ud0Is2rH2uX9pvLEYmhAn+8/ABi
	kdygdIe+Ftd6pLKC5PXrNScqN5I9c50qCRZ0g/SYKCdB8EdHarEFqL0FQQimRuMk
	gzZpXqlPlQcYsbw0rktaQDMe/2Rb87uNORm4b/sBiXt5xy5y3KfM/VlyfCE8HENN
	KdRkvCLLCysDCU6H1qwk1Oc8lLkn2jlOw49bd64LYPpCQM5LXv4UG5mROhR67lBu
	9b8GWDqjyJMy3zDgfD4a3wJlMCTni6HayJGtXvz3Kw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qa4kuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4bmt012708;
	Wed, 1 Jul 2026 14:17:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfu2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:17 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EHDff28770994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:17:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 401CE20040;
	Wed,  1 Jul 2026 14:17:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B369320049;
	Wed,  1 Jul 2026 14:16:59 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:16:59 +0000 (GMT)
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
Subject: [PATCH v6 00/23] sched: Introduce cpu_preferred_mask and steal-driven vCPU backoff
Date: Wed,  1 Jul 2026 19:46:31 +0530
Message-ID: <20260701141654.500125-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX59tAp+0YWUBM
 GaLg6OWFLPBnzAZ/7GmHKRHGl+lGnqskm4TOoMJKfSe90que3ipqOb1e4leZyk7+NRTPlaFfUk5
 XUlRmGtvih5Kz++GFhV8HyBqROixdU5TM0Ck/crDrbq3FWIZxJIlbke2HwORM1WK7ju7NwKb5nZ
 mQBF64nQuHkdtWVaN9DaV0Y0s3wR3hL39FH1/drwVpW0H2RGhMNEDXM08wsu1PZw+AOpPW1KFhs
 +ZFyuqFBIJyW0OXhumUYztVSbGhGMAGyPgQmjm/vDrCqmCpHItgDMYCuZHJ9Fx84mPYYP9dBya3
 GHfu2ByQmwSTe+jY+zy8NhvjxHy2v1Y/Gq5upN6lX2PWQvkxq4CocaZlrY8QZXCKmptohI1EMqG
 7ifANRdCxszYjfOu5xLYjS/uqTfsrpdzQZbN11W3P15bB8X21LNlAzGJ3Np0577ni+Xor62w0dG
 I1HGtDWl3s3oawE3oQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX28jN01C3OY8o
 WbUfTgYbAaIL4aXsLeU/fhIMOaJSBFB/x1lT9lsRHwKS6JOI1wdODnR5KyAUAWxatfXoYf1y9Ya
 7w7XCqO2GLtf7FN1kp41iOV7YWOOeBI=
X-Proofpoint-GUID: G27GwQ2uE4sTR2gKXZRwigpAsXZBIpvs
X-Proofpoint-ORIG-GUID: u8ev5_gCukEBdOCgZ23Xc-FKk_CDic4N
X-Authority-Analysis: v=2.4 cv=WZ88rUhX c=1 sm=1 tr=0 ts=6a45216e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=jJrOw3FHAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=TRj42ZJRnVwp5FPpzUcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010145

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
[3] v5: https://lore.kernel.org/all/20260625124648.802832-1-sshegde@linux.ibm.com/

Thank you very much for feedback so far. This has helped the code to
evolve towards a clear abstraction layers and get simplified.
(Hopefully). Apologies in advance if I have missed addressing any
comments. If so would be purely accidental, not in any way intentional.

base commit:
tip/sched/core at 'commit b2463ebf2674 ("sched/debug: Remove unused schedstats")'

v5->v6:
- Drop 1st patch. It is already in sched/core. Thanks Peter for picking
  it up.
- make cpu_preferred_mask as EXPORT_SYMBOL_GPL (Peter Zijlstra)
- Make set_preferred_cpu a NOP when CONFIG_PREFERRED_CPU=n, and still
  keep assign_cpu macro for =y case. (Peter Zijlstra and Yury Norov)
- Drop the optimization of caching the preferred state in
  select_fallback_rq. Initially had thought of splitting v5's patch into
  two. Then later found that having the cached value exposes a race
  scenario where task affinity could get reset due to cached value if mask
  changed after it was cached.
- Drop wakeup patch (Peter Zijlstra).
  No performance degradation seen.
  If CPU is non-preferred select_fallback_rq gets called in wakeup path.
  Additional checks of available_idle_cpu is not necessary. Hence the drop.
- Address CPU hotplug related concerns of accessing active_mask in 
  steal monitor driver code (sashiko)
- Address concerns over u64 overflow (sashiko)
- Make decrease_preferred_cpus work correctly if
  nohz_full=<last_set_of_CPUS. Don't assume
  housekeeping core is always at beginning, (sashiko)
- Added a optimization for common case where nohz_full=<empty>
- Fixed a few documentation nits (Randy Dunlap)
- Fixed "this patch" reference in changelogs (Peter Zijlstra)

Let me know if there is any critical information is missing
regarding new driver such as policy, documentation or missing
implementation. I have ensured checkpatch --strict is happy.

As mentioned in previous v5[3]'s cover-letter, I am looking for guidance 
on the below concern that will arise.
I think there should be a MAINTAINERS file entry for new
driver. I don't see a drivers/virt/* entry.
Either as a new entry for driver or a few file in SCHEDULER entry.
Let me know if/what I should add it.

Shrikanth Hegde (23):
  sched/docs: Document cpu_preferred_mask and Preferred CPU concept
  kconfig: Provide PREFERRED_CPU option
  cpumask: Introduce cpu_preferred_mask
  sysfs: Add preferred CPU file
  sched/core: Try to use a preferred CPU in is_cpu_allowed
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
  virt/steal_monitor: Optimise decrease_preferred_cpus when all CPUs are
    housekeeping

 .../ABI/testing/sysfs-devices-system-cpu      |  11 ++
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/steal-monitor.rst    |  99 +++++++++++++
 Documentation/scheduler/sched-arch.rst        |  56 ++++++++
 drivers/base/cpu.c                            |   8 ++
 drivers/virt/Makefile                         |   1 +
 drivers/virt/steal_monitor/Makefile           |  14 ++
 drivers/virt/steal_monitor/defaults.c         | 129 +++++++++++++++++
 drivers/virt/steal_monitor/sm_core.c          | 130 ++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h          |  33 +++++
 include/linux/cpumask.h                       |  27 +++-
 include/linux/sched.h                         |   1 +
 kernel/Kconfig.preempt                        |  14 ++
 kernel/cpu.c                                  |   6 +
 kernel/sched/core.c                           | 127 ++++++++++++++++-
 kernel/sched/debug.c                          |   1 +
 kernel/sched/fair.c                           |  12 +-
 kernel/sched/sched.h                          |  17 +++
 18 files changed, 682 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/driver-api/steal-monitor.rst
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/defaults.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

-- 
2.47.3

