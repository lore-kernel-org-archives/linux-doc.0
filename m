Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4A345CDA;
	Wed,  1 Jul 2026 14:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915476; cv=none; b=RXRAs9r2Y2hUTyGbM9R18+3tbwADcsaK56SzL2VcvNzn6k2t3QTG/OuFpOZlpO8w87p3KSBNNiilSbnlBIrO5eZEsKrhdPpnieTnDy117RyA3GuUY2oE+6v4a6DtF1t8VmopN8fqJiv+6aROfK95At5xRb0edzWeN8ioptYMd0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915476; c=relaxed/simple;
	bh=Fv8dvYV+pbbVyM7TtFtcmMO8QpL17YnfoDZ/B3ziI4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9dBPnlL0CuIGgRvYd/Aa7PZ8U7NGl4HhzUeospoWMwjg3Vgn3vLyoE4PBhxbzVK3CVJDaPkrY8Q/BBqquh6zag3lxfL1nezUKN40HcaV0hDQ4a6zinDQ78gZ6MfuSyjV92n83Mlv/W4Cx/Ur7AhK0hL5QL90yD8ft+GhXCij8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=j7BKNWBU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="j7BKNWBU"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIRY1492339;
	Wed, 1 Jul 2026 14:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Y2/8yihGhdVgvFxmj
	IiN0F4noSkaZ1+bLkL5aNLblQM=; b=j7BKNWBUhGFFIF8RcTD95KJBu1txXGRWc
	+AjTKTDBrngeeqRCLyqV+a59nXGYqZrbGVm3iLI9L6F3ytAg2YMsJ35UB4Jeg/Em
	8YNpel/vV2wp6DiDYIoP/Y9FxdHjMwDN0axdq8P/sy6ObyXrqAjyFRSVHzMU1aYL
	QJRtMKTFde7mRvqBCbVPZOAJrF5RX5sMyIOQvjVHe3CTjTl/jBwheHTZJtG6vY3U
	7ZYSuVhLcRMFDRVXOhc0pZvbB6OkMEkBqp6/NJSVoaFxmvrHfI3BWhjektIhKmV5
	Ft6JR5fkvUYM30fP5PRmZ+ofXKv5i0sg6Z3kBaw3jpo8WiFhbYVeA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qa4kvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4ckl012719;
	Wed, 1 Jul 2026 14:17:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfu44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EHRJe28377650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:17:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C232420049;
	Wed,  1 Jul 2026 14:17:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC45520040;
	Wed,  1 Jul 2026 14:17:13 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:17:13 +0000 (GMT)
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
Subject: [PATCH v6 01/23] sched/docs: Document cpu_preferred_mask and Preferred CPU concept
Date: Wed,  1 Jul 2026 19:46:32 +0530
Message-ID: <20260701141654.500125-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX5lVfE5D1q0o4
 KlDva0A+OTIOtmQSpitxBUMpdnhPSIO/OhuvJC3By6PwFmmmxrYkFy9XtpPwR0FG++D3R/anmcn
 eHFlw6m36O8wJTBlI7OTEWsPUk1QvU2MbdiwMBKLDGDxMTkXjv1nuGlai78bfNy0csPVsCisO41
 hi6uAKZxltsWb+AOkZXDC3sGwPyeTDnOmE4iXhEilZaTBU67CKPCXSiAC0LlMD0YjmqYTaCVTt9
 ETvTqlYFX8rdfZxEPZepr99XKbtoEx50lOdMwMVYMq/z/y181dqo8Nto0He2TY4a9otBC99RsIl
 BxMG5nMvBYMGoHmfNlGCZD6+MVMxVk6TsMGK6xPJeSQDlrREj6Nb1UT4yO8CSznWyjXqhe0Rf3M
 PGDoY2Cb02SXjh1ISVV6aXSLa+vlFfWpe1OvgK/730zTQRlLYAoD1A1giITr0rS6xr+aVu3ZSih
 thwjIYW/OW+i5J95Lqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX9wkFO9XMB6n0
 P7WekmAE5q4QlfbFTbeR8GXPEHZTDcopm6lH/w+UqroSTkjO3C27mAS3pzU08oAujwNni64Aciu
 OctUUNIJJqe/WAD9eT4NcO7kOeGolEs=
X-Proofpoint-GUID: tx_Sjs_TMNQINGCNJvQc90En64M4IZdk
X-Proofpoint-ORIG-GUID: u89rZo44ePCAugnWY9wK-Z3WaFEHMLDp
X-Authority-Analysis: v=2.4 cv=WZ88rUhX c=1 sm=1 tr=0 ts=6a45217d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=d8MiXRUMn4SEn--m04oA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010145

Add documentation for new cpumask called cpu_preferred_mask. This could
help users in understanding what this mask is and the concept behind it.

Document how to enable it and implementation aspects of it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Add block on co-operative scheme

 Documentation/scheduler/sched-arch.rst | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/scheduler/sched-arch.rst b/Documentation/scheduler/sched-arch.rst
index ed07efea7d02..a8612d55b9fa 100644
--- a/Documentation/scheduler/sched-arch.rst
+++ b/Documentation/scheduler/sched-arch.rst
@@ -62,6 +62,62 @@ Your cpu_idle routines need to obey the following rules:
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
+1. This feature is available under CONFIG_PREFERRED_CPU. This builds
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
+
+5. This feature works best only when all the VMs enable the feature as
+   it is a co-operative scheme. If a specific VM doesn't enable this feature
+   it may end up with more CPUs than others, still should lead to better
+   performance when seen from system view.
+   Ones who are enabling this driver has to ensure it is enabled in all VMs.
 
 Possible arch/ problems
 =======================
-- 
2.47.3

