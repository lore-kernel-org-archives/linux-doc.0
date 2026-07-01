Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9A734041D;
	Wed,  1 Jul 2026 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915493; cv=none; b=QoBMF/mO8UcvcNzxXHkRziLB206Y87O3R7UPX1L3Z0AL/WBxwM1kqiJ7jpV7dWWJjsDuT+naXXbafQcetFmSjiTo3k+mZ8ZRCVKjEJZBDvZGFBpF387TUnY1QtCInyxNsKzZiW6UwdYdqONbtIGIIB+KfvZ/RMbRFwqJCagpEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915493; c=relaxed/simple;
	bh=Xb38qVrZiGBBAWXDWNxGgxHwqlLUTIB3ca3Q/BS5pF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orTwBpdNZwojAqvm9OalWGVzac/Heq7uiGuwNTNcHOWdlx3wlTKS02HBcctEo7GIeaSV0SAPkAqSnSiFbnyAP28VwU+HOJWqKf+a3P3dxZ5OerL3CbEBEteSvkA221rPqH/g2hWbvHYfO/IjwOAtjixlGuxlLzi1y1XfGZCCKgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=U0l0B2Pi; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="U0l0B2Pi"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIaTw551454;
	Wed, 1 Jul 2026 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MWME8Hb9M66seMfqY
	Ht3SMWEg9IyDcta5lF+1bBf3Uo=; b=U0l0B2PimdwG/YfAktW2O1GsQ0xv/sh9D
	o6yX3RUgGYODZ6Dvrt6vzZBFteJ+geE0v6ZtgsXKAnEDaAGVP0CuTV9UbYRmLzD5
	8jT//fxuSA94tmTYxcehTbScHBAeDTm48o5sxjKZi+6mQhSwkntzdPvgLI8CWZUP
	UGBJ1wLdtAG+dgJZDhb4aKG8A7d35fTd2Y6Hij0uqYMcau3XBJRXLguAFgHZz/JV
	UWkgwBCQWbWZLpFsErzVVR1/PC6Ey/Y8AbMYRHv+xLTyX1UMmJWydzAG7MBd7XzG
	61CGsc9VDnrl1vqv6Z160knC+Lc7L4FEH9iIkFIMMZ99p6sLe9F/w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5vxy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661Dnbtn009610;
	Wed, 1 Jul 2026 14:17:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyfd3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:17:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EHfIQ14942700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:17:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CD7E20049;
	Wed,  1 Jul 2026 14:17:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BF3420040;
	Wed,  1 Jul 2026 14:17:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:17:28 +0000 (GMT)
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
Subject: [PATCH v6 02/23] kconfig: Provide PREFERRED_CPU option
Date: Wed,  1 Jul 2026 19:46:33 +0530
Message-ID: <20260701141654.500125-3-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX5NJez2By3EHv
 kxMPr3HnI56LsmHeAHbj4Kqbi6li/aZwQbB5QgAKQxtU7qa7XKyvcUKgoIX5J9JEB8+CZi/LORl
 McsNVfDOGhLgIvG0sJff5E9ElsGu1ZY6zJrfOLB6pewQx8QD3dKxa9rhpagHDMO32uaUWnQQigT
 ur9sOn+E84V2wD0iT+gASP3/tR3QA/zLhFWVjEpySNJ4DYm1r/9o4d3HziZsk8oj7MUAI0nRvFc
 92c9rBBAt0taa04B3wfhIrGSN60/yt/5XAy4c7qb5FgHzwiurUnTkiWh6m8/L9+EJOeTgzCCDoX
 9/PTte7pKzWmf/XeGjNN3ZK1fe2B1ROX8R3kp1vNjQjoi29ue7fR2KgnZ90M+SaMT5X+nHhV4Af
 eHSVJgCptTNv/y8AkY04x2tuc9p+xs88yzTR2iOST3aEkG+8gMXrk+2TFJeIeiLSwwW6WZgM0oy
 fEOpB96qTTS+4T2x+uw==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a45218a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=BWPB87uJ6lDr-Q8--dwA:9
X-Proofpoint-ORIG-GUID: Q_hGE8EZ-uKJieGhFEryFqwX4ozMKPJX
X-Proofpoint-GUID: a1pf1RueYaGyWzogejjjMDeypZzV4OtJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NSBTYWx0ZWRfX7cAECclg/9zh
 68Wb7U5b+Zdr84vwzH11gbC68vnqtpz+dVKaPxlkK5WCItdaCT/ozN1c/KyKVeh6m1i2KSAfr5I
 CP6QQQIbtMKRF2wV186QfYVrr61nAfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010145

Introduce a new config named PREFERRED_CPU.

This helps to:
- Avoid the code bloat when PREFERRED_CPU=n. In that cases preferred
  is same as active.
- Avoid the ifdeffery around PREFERRED_CPU in many files.

Since paravirtualized use case is the main driving force of this
feature, make it default for kernels with PARAVIRT=y

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/Kconfig.preempt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 88c594c6d7fc..b3a543cb44cd 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -192,3 +192,17 @@ config SCHED_CLASS_EXT
 	  For more information:
 	    Documentation/scheduler/sched-ext.rst
 	    https://github.com/sched-ext/scx
+
+config PREFERRED_CPU
+	bool "Dynamic vCPU management based on steal time"
+	depends on PARAVIRT && SMP
+	default y
+	help
+	  This feature helps to reduce the steal time in paravirtualised
+	  environment, there by reducing vCPU preemption. Reducing vCPU
+	  preemption provides improved lock holder preemption and reduces
+	  cost of vCPU preemption in the host.
+
+	  By default preferred CPUs will be same as active CPUs. Depending
+	  on the steal time when steal_monitor driver is enabled,
+	  preferred CPUs could become subset of active CPUs.
-- 
2.47.3

