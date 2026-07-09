Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04664499AB;
	Thu,  9 Jul 2026 21:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634281; cv=none; b=m7LzeKirOQzl3e8297W5nvLA5eoP4+9prc0068Elmhb2DQ+CEUc+3RJ1oS159NQLWFI1jP0fqAdUNl9u/kEvdPCyn3pdm+UVkHez0qm3oGCbU9oDiHFuuVdqrz+ygjr/6jXpKLPax/Gn1yiEYcMWkj76ZioWX23DAp7O0RETMHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634281; c=relaxed/simple;
	bh=o68AkbvsF/aaUqQiQspWVJrd+DQZZelLQqlqNBOOCMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TqiSsc/brymjL3H2r+niIefWvEXTZZh8jER/WEQ3OF/0JaGKnB4qn2KwwUoEWIBrGMpc3MsT/5LKHJOkdu1jsATS2a5K3/+YZeWIEApQ0/dEjnZ7q9pb23ihW9KCRUL6EwGnNe8R1+QR9zMeKWR7/qhIBitGkGntRTYV2CmIv7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pNsWhfUY; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pNsWhfUY"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmhDv2623989;
	Thu, 9 Jul 2026 21:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=SVLfK3hvsva//4hJn
	U3q/ERmJ2eyFRUJeo8VK/yC0GU=; b=pNsWhfUY7kqwcOIH7BE1C8GEGdNajHbts
	BOQeqa4P6o0QyjEpFYAQ6dnGVL9caNRxEyNd0EoH5U9CRz5aKcv1fwGwSdhVGZAI
	wTKXKckOnRRqaMTsm7IDwuScNDXUCnEhI4Z8TstXe/L7hJSrCKhdyZWZPz2zHhO5
	R+7Weo+oRKE8l9qS8p2vuQ8XT1ZP34ihmOEuD3AaW4xcqHKn/tMPJ5hYFSSieFbX
	sXkGJzDe6yGMn+eUkq4eUWpoaCdAWziZT1Qnp4ojDNcXkQl/gUAxjmpoDzaFjF/x
	CCw50v2NXnZvlKq7kf01i4IqZs0yedRbgNfDMoQ+Yv34shH599qlw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sw53ueg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LngW2027225;
	Thu, 9 Jul 2026 21:57:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqfbx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lv7hG52494630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABFB720049;
	Thu,  9 Jul 2026 21:57:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD11D20040;
	Thu,  9 Jul 2026 21:56:59 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:56:59 +0000 (GMT)
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
Subject: [PATCH v7 01/12] sched/docs: Document cpu_preferred_mask and Preferred CPU concept
Date: Fri, 10 Jul 2026 03:26:37 +0530
Message-ID: <20260709215648.1246821-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709215648.1246821-1-sshegde@linux.ibm.com>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Qo-xgbweHZWQnFaGhVNFA524YCwY-V-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX7HjIAIpyZqOn
 s7m5ASAKhwvQx5IGTqbkpfjUFRv9mSeKbstC/6dNtIexq1YZqbxO+ryP+fpVMAZivuJPiGcUEM+
 yScWt1oeoRDV4lg8r/cCHItoQqebeYtLK7cs9ILrKt4mgoNVpj7ynhlBxvQbnpSvNmhDUD3TZU8
 F1nEXsOVTthzfushKV8lBWJ/bWIy7CZzYstI+y/NvkcjvEC57/bCTRjEQADGyAmMPaatmJtBAol
 Jp9UgbFU2ptALBegMzNa283TxwLCI4sEQnWy3biKowdo5wPf1p5LPN/3JyH87KQ9/ereZfy3Tio
 co0Zjyv3D9ZFYOu2rdFZSf+t4ZTsyx5Zn7rpUsLsxishwJaGiysOZqyrhleW+HRAFKgi24rTnGe
 WopmCEZCyFqFr4COD+iK5BrLILOIj4R+FHCboBzTaUOn1FvZI3bhgbrmXIJpAK7HvMAy7mOfWsJ
 8I4fdOzRWgcUZx/8/vA==
X-Proofpoint-ORIG-GUID: CVZnBEzxMStcDing9OGenmHL76GmNlXD
X-Authority-Analysis: v=2.4 cv=FqQ1OWrq c=1 sm=1 tr=0 ts=6a501939 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=d8MiXRUMn4SEn--m04oA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX+y8chdtNExgV
 8Z0etvGwPxnWaANiKuY9zpk5uFLO9COJ37VWFmKNCnDRshaRQN897qicNCBv3vYeaPReIRmOzw7
 bPk6EXRyQhLeLHYGqEzSQ3KGcnGN+0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

Add documentation for new cpumask called cpu_preferred_mask. This could
help users in understanding what this mask is and the concept behind it.

Document how to enable it and implementation aspects of it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/scheduler/sched-arch.rst | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..82bc27c7daac 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,64 @@ Your cpu_idle routines need to obey the following rules:
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+Preferred CPUs
+==============
+
+In virtualised environments it is possible to overcommit CPU resources. i.e.
+the sum of virtual CPUs (vCPUs) of all VMs is greater than number of physical
+CPUs (pCPUs). Under such conditions when all or many VMs have high utilization,
+hypervisor won't be able to satisfy the CPU requirement and has to context
+switch within or across VMs. The hypervisor needs to preempt one vCPU to run
+another. This is called vCPU preemption. This is more expensive compared to
+task context switch within a vCPU.
+
+In such cases it is better that combined vCPU ask from all VMs is reduced
+by not using some of the vCPUs in each VM. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called as
+"Preferred CPUs".
+
+Main design construct is preferred CPUs are always a subset of active CPUs.
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
+This is achieved by:
+
+1. Selecting a preferred CPU at wakeup using fallback mechanism.
+2. Push the task away from non-preferred CPU at tick.
+3. Only select preferred CPUs for load balance.
+
+/sys/devices/system/cpu/preferred prints the current cpu_preferred_mask in
+cpulist format.
+
+Notes:
+
+1. This feature is available under CONFIG_PREFERRED_CPU. It is selected
+   by steal_monitor driver (CONFIG_STEAL_MONITOR=y). On enabling the driver,
+   CPU preferred state can change based on steal time. Without that driver,
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
+
+5. This feature works best only when all the VMs enable the feature as
+   it is a co-operative scheme. If a specific VM doesn't enable this feature
+   it may end up with more CPUs than others, still should lead to better
+   performance when seen from system view.
+   Users who enable this driver must ensure it is enabled in all VMs.
 
 Possible arch/ problems
 =======================
-- 
2.47.3

