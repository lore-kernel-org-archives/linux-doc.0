Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ED7449997;
	Thu,  9 Jul 2026 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634255; cv=none; b=dsQsjSjbMYdsgeAF1J0n+vJyxuG+jhKeOvtnkqkK1JKdvvyLLvTzT0QH1GGvuQUf5SKY9W+fIY7oWHJkGJ1GyHNsXEqH3H/I6ts71BBesnznilZRcxgwnh9wnI10DjgxBUG3WkBNE66fr6d4rPC7FC/iyFGs1D1y4DboEuoAQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634255; c=relaxed/simple;
	bh=q+33cTgu30CPOSGj6CIm8FqU0bzvOEz1GWSNnZ4TNPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S5CEmxtXKuWm/DPljZnFC6grbo4K5RKv4nWohmZpgVfUHXJAj8oi4nXl6q6eiImVmtkrRKOrxTzxBX1ZejkX7cNLtWOD1ugCfetJGQ4GS4kyCHKBBj9PLMhik91BTC84YDukn76D1sLpzJ7LcBCHSCkbN4XUUGkqtuBtfucalmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gc8WV+W+; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gc8WV+W+"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmDrJ2860682;
	Thu, 9 Jul 2026 21:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=LNm7U0W3ZhKUaNMRclXRw4l59M4f
	wGrnx8U2LqAD0x8=; b=gc8WV+W+08panTr+F+sa5GFbHJJr5DNlKhdcCetwhc+N
	FINaP1WVG8HMF6hn7mxgl0f0f/DGj3+fFpJYzAnvjfMOZTMivdEGL6Pb1WAwwoe9
	vJFDO12ErMz5P94QVlKaIOWtu4La4JxzACH1/4HWVUMB1UqfbCPn65z49zfHcH5u
	lqBTkTpVd/Bpv21xdIRlJM2X4k55ZzJgY7QewBZ2KEQMCiBD75xygilif3yzBIcA
	sY6J1HMX866zocqECuIa1pD2bSO8PsRH+htqXy1Gn4aOoFfS9R1JHDBSmkRKlD9i
	emlt0AzgM1Q8Drd9eF4ZbkrFI0oXACIENsAHOz0m+Q==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fafh0933b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LnfaJ023369;
	Thu, 9 Jul 2026 21:57:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqgexbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lux7A50725154
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:56:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B14D20049;
	Thu,  9 Jul 2026 21:56:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA97220040;
	Thu,  9 Jul 2026 21:56:51 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:56:51 +0000 (GMT)
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
Subject: [PATCH v7 00/12] sched, steal_monitor: Introduce cpu_preferred_mask and steal-driven vCPU backoff
Date: Fri, 10 Jul 2026 03:26:36 +0530
Message-ID: <20260709215648.1246821-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a501931 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=jJrOw3FHAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=TxNYD-fR7wKLvxLjV80A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZJVQxywQ2t8rGA6BDM9CJEqA2hZ1Hkjx
X-Proofpoint-ORIG-GUID: 9Jw354q_Mvtbl32jqcjUIZPyqcndo_I3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX4oyUyVpR3uRf
 NHsQFlj9y7BvlGgiGfhvDjoFTDzlpwfwh/9BW7RloNkZxk2UV4htMaUWezd20radBGLDcfY2IB6
 Q3WQ3tlrJOkidgEwpJTLdTd3mvvEVd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXyoXugcLsApPs
 CDO7z/XmX92+873cbb20UJP7sq4svm+senWIwGHJaVeoyCTU19fjygHpsS+6+JK3+OtXMBvNMtr
 XelfTwZFoKZEqPPQcP++r0s5ySJ6sdYqLvBSVZXhuk3Ibv6Fcn6y/nUha1Oxj83lUEAxEqwnKdF
 tEc8h0we2IMvK89/+ZVvZdJhvqbEZSTfUmmmO53sczCkfN+4so+lw0vr3YlNr8IwzYXhbToHYBX
 6VrOoJm4yoq94Wi7CqNpsz10ZZ65BTiKud2fMpyN95qOxxj+EWoKzXtAtpBhI/iTKXSHDvadnRt
 918wUvB1i+fTNhyXDPqdJlnLWLoX4aAMFzbCjfzHlKImy5lC7LNR/r0CdSHVzu7uvh74q9oMAru
 H7q3nbY4FXO3eomRLcKo4XdjuaG8+Sh9xsT5WrWYHGXw4/FnAa3qfvf54ZDldnTnc9NJFepbFe5
 +GI4jWKAs5gp0wz2Lrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

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
[3] v6: https://lore.kernel.org/all/20260701141654.500125-1-sshegde@linux.ibm.com/#t

Thank you very much for feedback so far. This has helped the code to
evolve towards a clear abstraction layers and get simplified.
Special thanks to Yury Norov for reviewing this and improving the series
significantly. Really appreciated.

Apologies in advance if I have missed addressing any
comments. If so would be purely accidental, not in any way intentional.

base commit:
tip/sched/core at 'commit 04998aa54848 ("sched/eevdf: Delayed dequeue task can't preempt")'

v6->v7:
- Make new driver steal_monitor into 4-5 patches. (Yury Norov)
- Define CONFIG_STEAL_MONITOR and Make it select CONFIG_PREFERRED_CPU
  (Yury Norov)
- Make module parameters fixed at module load (Yury Norov)
- Make module parameters checks using set/get methods via module_param_cb - sashiko
- Simplify is_cpu_allowed. (Yury Norov)
- Added MAINTAINERS entry for new driver.
- Split nohz_full optimization into its own patch.
- Merged load balance patches.
- Use possible CPUs instead of active for steal value calculations.
- Drop __weak symbol for now. Once the need arises, framework can be
  designed at that time. (Yury Norov)
- remove whitespace in scoped_guard (Yury Norov)
- remove class check in sched_push_current_non_preferred_cpu (Yury
  Norov)
- Make empty stub to do { } while (0) in set_cpu_preferred
- Move is_migration_disabled check to sched_non_preferred_cpu_push_stop - Sashiko
- Increase the migration count only if rq changed - sashiko
- Add missing requeue work on early return - sashiko
- Use WARN_ON_ONCE for design checks instead of WARN_ON.
- Few updates to documentation, comments and changelogs.

Let me know if there is any critical information is missing
regarding new driver such as policy, documentation or missing
implementation. I have ensured checkpatch --strict is happy.

Shrikanth Hegde (12):
  sched/docs: Document cpu_preferred_mask and Preferred CPU concept
  cpumask: Introduce cpu_preferred_mask
  sysfs: Add preferred CPU file
  sched/core: Try to use a preferred CPU in is_cpu_allowed
  sched/fair: Load balance only among preferred CPUs
  sched/core: Push current task from non preferred CPU
  sched/debug: Add migration stats due to non preferred CPUs
  virt: Introduce steal monitor driver
  virt/steal_monitor: Add control knobs for handling steal values
  virt/steal_monitor: Provide functions for managing steal values
  virt/steal_monitor: Act on steal time periodically and decide on
    preferred CPUs
  sched, virt/steal_monitor: Keep tick on for faster push on nohz_full
    CPU

 .../ABI/testing/sysfs-devices-system-cpu      |  11 +
 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/steal-monitor.rst    | 111 ++++++++++
 Documentation/scheduler/sched-arch.rst        |  58 +++++
 MAINTAINERS                                   |   9 +
 drivers/base/cpu.c                            |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/steal_monitor/Kconfig            |  18 ++
 drivers/virt/steal_monitor/Makefile           |   6 +
 drivers/virt/steal_monitor/defaults.c         | 107 ++++++++++
 drivers/virt/steal_monitor/sm_core.c          | 202 ++++++++++++++++++
 drivers/virt/steal_monitor/sm_core.h          |  37 ++++
 include/linux/cpumask.h                       |  24 +++
 include/linux/sched.h                         |   1 +
 kernel/Kconfig.preempt                        |   3 +
 kernel/cpu.c                                  |   6 +
 kernel/sched/core.c                           | 105 ++++++++-
 kernel/sched/debug.c                          |   1 +
 kernel/sched/fair.c                           |  11 +-
 kernel/sched/sched.h                          |  20 ++
 21 files changed, 737 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/driver-api/steal-monitor.rst
 create mode 100644 drivers/virt/steal_monitor/Kconfig
 create mode 100644 drivers/virt/steal_monitor/Makefile
 create mode 100644 drivers/virt/steal_monitor/defaults.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.c
 create mode 100644 drivers/virt/steal_monitor/sm_core.h

-- 
2.47.3

