Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0E3D3CFF;
	Thu, 25 Jun 2026 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391759; cv=none; b=coDMSLgGbh71b/hkb8ivONl9jMoSKZ3j15VH9YnXi8l6K1/fcnK9084rElfRbt/IUL8k//MXn23X9jgsqQrKYWYBLxAI0611walNEUDcfZzqtp91gigKbaiLinP7ul4Me57hlEixCbikIT+eV+ByATKyIjxhMNKvasn3kB77qKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391759; c=relaxed/simple;
	bh=tLJDQkjhWwTO4CH5/n617GFy1TB0V6J6CAR9E+N66Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTO12v3M/CWmEHQEoB8wSmzNKQ6vZm9xe7Nq1pJmmsPufpZw2HtbThZohbPnKncOjdhd0FVSIXItHiu0PVCJGCoNVff6goeLRacHqAMiCF2PEFC7nyXpvw7cmubIV20ZTAvCKtSnWj9+5fmvjkqdI8kKiXPZP4gssOUc7w4JBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ni6Gep/3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ni6Gep/3"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mc4L2978117;
	Thu, 25 Jun 2026 12:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aTkfE49WzHgh0CmSW
	NM9L4PLwPnIMwGVZZBnsmA0bhk=; b=Ni6Gep/36UpQVivSvaJ2cd1tEReI7xdF+
	OnrIwXnvokhx2InTHo7PCYCSoqldey5WYvWFYlejYfxUBgY7Gy6XdgwQ+vqjvUro
	cBtwYdw9gOs73r8fHtPOvy31Fnkq19NIwcVHFJ1n5nhvDkgT2cQXMex8X5+q07fh
	2Dtz8ZQvSFovlucCjzKzFbMvEcA/as6tXBFu19LF3n/MqszQdsYBO54q0eBzIn3T
	3zmuwtRZeQORXJ0LDr/0msvbOQzdcIF2qSBlE2oZNbKhSZlHdtYVeJZwSGiuA334
	eHacp9o/5I6rryiCyrm5Oe+aXUL6CHA1Xfmok6bCvfMGVI422r+nw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4st85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYcSl002267;
	Thu, 25 Jun 2026 12:48:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmt1w46530964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1629020043;
	Thu, 25 Jun 2026 12:48:55 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABA0D20040;
	Thu, 25 Jun 2026 12:48:46 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:46 +0000 (GMT)
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
Subject: [PATCH v5 13/24] virt/steal_monitor: Add documentation
Date: Thu, 25 Jun 2026 18:16:37 +0530
Message-ID: <20260625124648.802832-14-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX3VGd2UeUCYC2
 GLJTVO26B1LAkD7Gf7xyRhARyYFc8O/abzdadYk7429/MZ2TdtF4GSUt/1KViqcm/uoLQYP/pit
 /D46V0sDchV5arozfZ/vS0pemsBHJeg=
X-Proofpoint-ORIG-GUID: FsG6pJQlQ-xqwrhNZoJhltlCMhsvItc3
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3d23bc cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=ootIMPnoYyd3EpaM2M4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXyh0Q5zGjUDx2
 Mv6hKQEH3ACp6tA9XDV7lS3An9GL97UbqJeNirMKcBLRzCdQ2dc2vnHWFg5ufUU0OBdZe547+tD
 EviN4Io88/YYltHv27XCJoB0v+KKvcPJ1lOsy16N0qEedl1f8rSZ7em3i6lDQDmgzkQ+5rKlpbY
 WEIW7mTeQ7PzsEnY/SEA7rZhbQVbmfpBCHJ08Asc2Kl2q7mh6gIWZsw8y9nJx/30OfDQu/Otw6U
 1voGdGX3yyBvPB/ymoaA8I1CPcSyNudoJ+EEwkD5cGwgLdnsX5g3GWgJQZ6urLBmQkEG/rICJDc
 1E51uxaeaM94LPmn4lEivOK8L6FFpqmVD7+lGYGVDRHYtFx3NPWkKOX8wpq/ronIlLIkXjeq/7U
 wUl6sd7WPwZdVdViSf7BuAAGnAJ4XTvEKbdGboBNcB4sUhmPE31GtHfNPi2zQWqQL7cXACQvZiC
 BMa8oLYaQzDfZfK22rQ==
X-Proofpoint-GUID: qJ_HPVsydoAxZEzirJAvd7oN3RVKfYYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Document this module named steal_monitor and its parameters.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4-v5:
- new patch

Please let me know if the placing is not right.

 Documentation/driver-api/index.rst         |  1 +
 Documentation/driver-api/steal-monitor.rst | 93 ++++++++++++++++++++++
 2 files changed, 94 insertions(+)
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
index 000000000000..997a22d0812c
--- /dev/null
+++ b/Documentation/driver-api/steal-monitor.rst
@@ -0,0 +1,93 @@
+.. SPDX-License-Identifier: GPL-2.0
+=============
+Steal Monitor
+=============
+
+:Author: Shrikanth Hegde
+
+Introduction:
+=============
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
+Core idea:
+==========
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
+Module Parameters:
+==================
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
+Notes:
+======
+This is available under CONFIG_PREFERRED_CPU. Selecting that includes
+this module. Module is not loaded by default.
-- 
2.47.3

