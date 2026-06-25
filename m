Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32153DCDB7;
	Thu, 25 Jun 2026 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391667; cv=none; b=RJJYAK/kK02pBi6oYFDVP7KKMhazN9vZNS7WMPSqvCmYHf7deFyRc72lsBV5xutNoV7Z5UWJkvXewMfo9Nsb458T43QZS90jxEC+26eF7YzkP8sjhNq99DHVr+icU8DYFswzT7Gfvlls3rFZuffJ0rIuUso0JjNOzeUt3y+xP58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391667; c=relaxed/simple;
	bh=5FJSspe7Vvz8y9Zk/BSpjU04dxRD20RcAXo2yyJcxfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQnEWPSJgFs8ll6D3qek35RT+56TYyfpqem4g3OmmYUFdM9XbrCk7mFhKhsJQG1bhNEba6EEdBjpdf7U3M/Fnd8aIr5jTsCQBXPkU1eFSRS6fVZJQc7sQddOL9wuFoJe74B88oejsMgEEbvR0bIfouNEhCfyhokocTgl/O8YZ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=V0Siw1/2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="V0Siw1/2"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3n2GS2890175;
	Thu, 25 Jun 2026 12:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mwkmhSCS7yxAoODzn
	I3jf/qivyWD3w+bgV0PgJvKc0g=; b=V0Siw1/2GSfuujX/T1QV1DFDVWkfGqGCu
	1wMHFlZxos4B0YURWojNtQ/BMf3EESd9OWN+v0KmfJK4AH8F6ftVrTuaEGLiR7wK
	0kBjRiKhCsBUosCUMyJ4zl5l5tcI0PfHGMr7fVDxsepu0hxpl6l6On4EfGiAvLas
	9tfffLqoKUA5P6/j3C0LSdmgAX4EQRt3OBUL8JXfvQ05S49TiNsQPRYQVQ/vd6ng
	uoSstCBWzDONDweq4VWGen+lG6lY9kQd4yL7OIHGZMAq2twxXMP+U7hVHQBzQqjC
	MGmHR4mczRMFWFtK5jl2LNq2bbSbcfrkerCpFKP4aMd2wALlbJrzA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjgt1cje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYdME013541;
	Thu, 25 Jun 2026 12:47:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwp9jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PClMlX48627968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:23 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D322F20040;
	Thu, 25 Jun 2026 12:47:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4E8720043;
	Thu, 25 Jun 2026 12:47:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:14 +0000 (GMT)
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
        linux-doc@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: [PATCH v5 02/24] sched/docs: Document cpu_preferred_mask and Preferred CPU concept
Date: Thu, 25 Jun 2026 18:16:26 +0530
Message-ID: <20260625124648.802832-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625124648.802832-1-sshegde@linux.ibm.com>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfXxr/zHBCh9aAD
 VTlSiV4a2jm0sn1yX0yfhf3LE77u39slsRdlO9mb3qvm6/W5WZ+l5Y48tR+c/zdpTERGeXKv0Po
 vX+YNSAg8/1R6ves/cR2/sYZjMIddFaHe5aXZBWNTYUe0ud8x761Z2mK7BbGasd0cWWT1+Hhh2W
 O7zE30Rw9sAmees7tVUyWnUDl9jEcE63Hpf/jk+fdtNBgPDK/AdDmBSZx2P110vHbm7HTX5sfQB
 rbgqYvkW2s3aYrbKnYngfjsHGzelX0ZxtGHKjFCFhO833PrKnkyDdZhiEEpX0UOaOjiY90SNQ+A
 wVM5AMDWzPzFGeO06j0Tv0Z75imu/33Xs2LITOMeSEGKVqDGbww0nDYcQbedRIZao3vxav93oDZ
 PA/16AGHLC3bL30SAjmYFp4yjpCcBdqnCYqboeX3IU4T+xNdnoX35Kfunk4rSd6BgpGM2eXr2yD
 klD4K+YYgvQ06SRTI1Q==
X-Proofpoint-GUID: 1hxJeLGaUsQTsScwGQeK5GFursc5NdZk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX6pr4XBe1VOC/
 5AC6uqJgfVqYc9Ya/UUt/tzi9ipvhRgqWjx4TSFcGd4zCTYjbwvTEnvlczfkqZZ+k5krrqkPLp1
 S+5DNurmRAP5/QIdnRZOS6wnjWfIe2U=
X-Authority-Analysis: v=2.4 cv=I/lVgtgg c=1 sm=1 tr=0 ts=6a3d2360 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=d8MiXRUMn4SEn--m04oA:9
X-Proofpoint-ORIG-GUID: 5QsT6k7eD2J5M0UTPZCXsmeMHcHvv60-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

Add documentation for new cpumask called cpu_preferred_mask. This could
help users in understanding what this mask is and the concept behind it.

Document how to enable it and implementation aspects of it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Change text to reflect new driver info.
- Changes suggested by Randy Dunlap.
- Sashiko nitpicks

 Documentation/scheduler/sched-arch.rst | 50 ++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..8fc56edd8e03 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,56 @@ Your cpu_idle routines need to obey the following rules:
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+Preferred CPUs
+==============
+
+In virtualised environments it is possible to overcommit CPU resources.
+i.e sum of virtual CPU(vCPU) of all VMs is greater than number of physical
+CPUs(pCPU). Under such conditions when all or many VMs have high utilization,
+hypervisor won't be able to satisfy the CPU requirement and has to context
+switch within or across VMs. i.e hypervisor needs to preempt one vCPU to run
+another. This is called vCPU preemption. This is more expensive compared to
+task context switch within a vCPU.
+
+In such cases it is better that combined vCPU ask from all VMs is reduced
+by not using some of the vCPUs in each VM. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called as
+"Preferred CPUs".
+
+Main design construct is preferred CPUs is always subset of active CPUs.
+In most cases preferred CPUs will be same as active CPUs, when there is pCPU
+contention, Preferred CPUs will reduce based on the amount of steal time.
+When the pCPU contention goes away as indicated by steal time, Preferred CPUs
+will become same as active CPUs again. This is done by loading the
+steal_monitor driver available at drivers/virt/steal_monitor.
+
+For scheduling decisions such as wakeup, pushing the task etc, needs this
+CPU state info. This is maintained in cpu_preferred_mask.
+vCPUs which are not in cpu_preferred_mask should be treated as vCPUs which
+should not be used at this moment provided it doesn't break user affinity.
+
+This is achieved by
+1. Selecting a preferred CPU at wakeup.
+2. Push the task away from non-preferred CPU at tick.
+3. Only select preferred CPUs for load balance.
+
+/sys/devices/system/cpu/preferred prints the current cpu_preferred_mask in
+cpulist format.
+
+Notes:
+1. This feature is available under CONFIG_PREFERRED_CPU. This enables
+   steal_monitor driver. On enabling the driver, CPU preferred state
+   can change based on steal time. With CONFIG_PREFERRED_CPU=n,
+   preferred CPUs is same as active CPUs.
+
+2. This feature works for FAIR class only.
+
+3. A task pinned, which can't be moved to preferred CPUs will continue
+   to run based on its affinity. But no load balancing happens.
+
+4. Decision to use/not use is driven by kernel. Hence it shouldn't
+   break user affinities. One of the main reasons why CPU hotplug
+   or Isolated cpuset partitions was not a solution.
 
 Possible arch/ problems
 =======================
-- 
2.47.3

