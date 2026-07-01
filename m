Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A133F8DC;
	Wed,  1 Jul 2026 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915614; cv=none; b=jJrRGKn2K5gFrJkHlbnUsOdvQpoRgEd3BSBfpby1MP/hmBvj0aAaZSyaTQvashUu62YDqeWCy5KKKnuiZDEo/m8Bx+WoGcs7ela7rm5SkK1cRFieT1fc1nfUFecDXMlBPSELDlqQNSP5+pzf+/CuvaJwm218nVyJgNiOuX/gJHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915614; c=relaxed/simple;
	bh=M+bj+TUi7qXmod9aV8/67aWmeQFVGjXO9iBNHxx1OE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eg1qZPqMvsJIyjdbkgHBdRS1w568YZeqroTYlQ7BBidi2FDpvsdWCTap+viympKfwlawUcKLCLfCPvwmT/a6T85X23C+cOUpgVCPegykuUfx/9/FiJw9bnKVaCldqKzculA0i1bY7qV3iRFoVi+tj9sF3d/yFgkxu4xzwZ/QZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z7f3kCA6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z7f3kCA6"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIUrD609524;
	Wed, 1 Jul 2026 14:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VG7+M3MGwTRKQIKWw
	7ryfsAlqZ0vXkZQhCC++4JDQcE=; b=Z7f3kCA6NGJXVow33IuMdEHDbvqnJtw/j
	+t5uElWcOaqSTDEHGCJgGCBJe/LRsBnIrn0OxKkQ2lS/4YMMygDf8NbpGzD0QpJP
	22D0VVXH5qQ8tQJ1+iXTKonluifwvaetIwiyCrhQuG5gCRxEKtorrOLDBIYyAEI2
	hktLFiMDo9/4EjCreiBp9OYNFG/jYFH35OS0AZa4MsBVUSiBJ1k3EEdR6AoBqCku
	lXZ7laBVUB6oD5tKZE1+xjtr8Cywh2qwgCO5F5Xtr1lMFLTcCIZfZbQ0dffldG7g
	igdQ9N90LR1pfUIz7PdiG5NB2pkFXSPXQ1UW5R+v/EE0o6qjD/6rQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe50ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJr36029948;
	Wed, 1 Jul 2026 14:19:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2suk7mug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EJlmo15270364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:19:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C45B2004B;
	Wed,  1 Jul 2026 14:19:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5799C20040;
	Wed,  1 Jul 2026 14:19:34 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:19:33 +0000 (GMT)
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
Subject: [PATCH v6 11/23] virt/steal_monitor: Add documentation
Date: Wed,  1 Jul 2026 19:46:42 +0530
Message-ID: <20260701141654.500125-12-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: EFOzgWsTDtEEIOo0J7DbMiC_GzAplOWW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX03ZRMenCka+/
 SfZhmTmmhS1Ef14U6dXNKURJX+Ed1yo3gDFLfQKtnAz/VBkUMUvrT6pSkWNOw5lFo2PpUOzRcWA
 K55W7FHFejbuzjV/e5qE9g0sIFRgE+A=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a45220b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=ootIMPnoYyd3EpaM2M4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfXzMIBf9vG6lNF
 zaOOC2sUOrexP1GMKo+1cvj/0V0p0Re27SCk8SBWbBDML/Kath5FCuMm+8wC4mw6lIKF783Ehvw
 DukZ9v2FrWpI3rT4D0iDN7WwbNfrlEqS2xizQeCc4xm2M2YU24XaEMrtyB8P/VOSHc4vmoj9OZl
 vS1eaGqh4JzThbXl4xi8JibASEPQXDqlcR/OoSNkgpMsqIkJi5pgoFDjVczd3Kd0KnVwYirtSzu
 YspGqifLyKXkwoMNZDgSXKf6DxlXAxoB/GE5sq+eaBPniD2B7kYyysCXvWrHM3g0jSxQwrvhI2w
 VWF7Ipbw3DCwvS03YOD772OodLUDmVKH+js3aOx+GscU1jobCq+I0GUjnk2b+25K4vXfCz/HPB4
 22dwjReC1HarM8BlhNJ8GPgmVperqONO3v4QwaYqzszpDUPcZ5AuDRw2LUzdpGZW4weRCzx593n
 wZUp9HJdktW/jZUz+gw==
X-Proofpoint-ORIG-GUID: xctS3wveg3Cmyzk1LBMl191MA-YwhHP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Document this module named steal_monitor and its parameters.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Fix documentation nits.
- Add block on co-operative scheme

 Documentation/driver-api/index.rst         |  1 +
 Documentation/driver-api/steal-monitor.rst | 99 ++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/driver-api/steal-monitor.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index eaf7161ff957..ec12f396a5e6 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -138,6 +138,7 @@ Subsystem-specific APIs
    sm501
    soundwire/index
    spi
+   steal-monitor
    surface_aggregator/index
    switchtec
    sync_file
diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
new file mode 100644
index 000000000000..f71534322b14
--- /dev/null
+++ b/Documentation/driver-api/steal-monitor.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+=============
+Steal Monitor
+=============
+
+:Author: Shrikanth Hegde
+
+Introduction
+============
+
+Steal monitor is a driver aimed at solving the Noisy Neighbour problem
+in virtualized environments. I.e performance of workload
+running in one VM gets affected significantly due to other VMs and
+combined they make slower forward progress.
+
+When there is overcommit of CPU resources, i.e sum of virtual CPUs(vCPU)
+of all VMs is greater than number of physical CPUs(pCPU) and
+when all or many VMs have high utilization, hypervisor won't be able
+to satisfy the CPU requirement and has to context switch within or
+across VM. I.e hypervisor needs to preempt one vCPU to run
+another. This is called vCPU preemption.
+This is more expensive compared to task context switch within a vCPU.
+
+In such cases it is better that combined vCPU ask from all VM is reduced
+by not using some of the vCPUs. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called as
+"Preferred CPUs".
+
+See more on "Preferred CPUs" in Documentation/scheduler/sched-arch.rst.
+
+This driver helps in setting/clearing the CPUs in the "Preferred CPUs" list.
+This list is obtained using cpu_preferred_mask.
+
+Core idea
+=========
+steal time is an indication available today in Guest which shows contention
+for underlying physical CPU. Use it as a hint in the guest to fold the
+workload to a reduced set of vCPUs. When there is contention, steal time
+will show up in all the guests. When each guest honors the hint and folds
+the workload to a smaller set of vCPUs(Preferred CPUs), it reduces the
+contention and thereby reduces vCPU preemption.
+This is achieved without any cross-guest communication.
+
+Steal monitor driver effectively does:
+
+1. Periodically computes steal time across the system.
+
+2. If steal time is greater than high threshold, reduce the number of
+   preferred CPUs by 1 core. Ensure at least one core is left always.
+   This avoids running into extreme cases.
+
+3. If steal time is lower or equal to low threshold, increase the
+   number of preferred CPUs by 1 core. If preferred is same as active,
+   nothing to be done.
+
+4. Ensure preferred CPUs is always subset of active CPUs.
+   On feature disable it is same as active CPUs.
+
+This feature works best only when all the VMs enable the feature as
+it is a co-operative scheme. If a specific VM don't enable this feature
+it may end up with more CPUs than others, still should lead to better
+performance when seen from system view.
+Ones who are enabling this driver has to ensure it is enabled in all VMs.
+
+Module Parameters
+=================
+interval_ms
+-----------
+How often steal monitor checks for steal time.
+(Default: 1000 i.e 1 second)
+
+This controls how fast steal monitor driver reacts to changes to
+the contention of physical CPUs. Since it does fair amount of
+work, setting too low will have overheads. If set to 0, on next
+work it will be set to default.
+
+low_threshold
+-------------
+lower threshold value in percentage * 100.
+(Default: 200, i.e 2% steal is considered as low threshold)
+
+This determines what values should be considered as nil/no steal values.
+When steal monitor see steal time is below or equal to this value, it
+will increase the preferred CPUs by 1 core. Having value as zero
+might cause too much oscillations.
+
+high_threshold
+--------------
+higher threshold value in percentage * 100
+(Default: 500, i.e 5% steal is considered as high threshold)
+
+This determines what values should be considered as high steal values.
+When steal monitor sees steal time is higher than this value, it will
+reduce the preferred CPUs by 1 core.
+
+Notes
+=====
+This is available under CONFIG_PREFERRED_CPU. Selecting that includes
+this module. Module is not loaded by default.
-- 
2.47.3

