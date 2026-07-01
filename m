Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87803340293;
	Wed,  1 Jul 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915639; cv=none; b=fZ92UpcI1sgqfYOPeOddeVfUOBlId/vkF6ucswyjij9n86C583rL8YRbZqR3iIew2jij/yuoUwlLm0oxUoCdWBtmp0mZqMY76fMj5my1Uqd7t7fDyWuP7Fm+dUFONKUrwLC+3Mo1eU14aLH8giWOFMZIEqh6OAmQYt60IuoLD8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915639; c=relaxed/simple;
	bh=WSfwx7Mwz7o4MEqwWcMvPUKUPvqhoN9VpjUUIwukDAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRfkwCzo0cRb0nIpXZoyf/XXAjwivv4yk5quPSfjyIhNhZ0HbdTwlMLC5KC3CwkGH2LzIv1mI01rYh1/yqpJT31eV4GQofIpiCii/zh1dF6hNKUeMA0lnKpJVAk198HK+JbdlBH4MYwKG3+RBdfItldnKyYKLTd+n2UkjiRIAaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=R4epaOh4; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="R4epaOh4"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIXnN551306;
	Wed, 1 Jul 2026 14:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mcHPD7FtCDWlrWIuy
	t8Cs1qc5tH62JQr4+VMIuk32Fo=; b=R4epaOh48tCnc1eVezxXZ/tpyd9DQM/yH
	W8+Vt8RKDwtKaZLX2jNw5X+QYBbX1AbhIYnNSpBPTp6ZsNdNNG+cN7ObcmMVvRFv
	+8EBSlT1mjex2Gmdftj4T/1RWRr3+ZJzWj18B830G/KEKJ8TqEQvYosVKSihJoIz
	5UCLq/CDEhcLyjF3ME0fzIXkOR2Lxhps1yU/b2ZKd8Nm7paFGNLrp+eCq0bULrtS
	6vchJnNFxcoyVpz57QJJTjd3CirDA0uNdaE/TtI79CEedrpWSp6voMcnxthdPyIW
	kQIEgZp4uK0qYnEx4+maR+33/bbBtXrMt9OXkvPRXmsVtpHTbsAbQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5vybb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:21 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJaK5027955;
	Wed, 1 Jul 2026 14:20:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfucd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EKGqW50397510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:20:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D02F20040;
	Wed,  1 Jul 2026 14:20:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B063A2004B;
	Wed,  1 Jul 2026 14:20:02 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:20:02 +0000 (GMT)
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
Subject: [PATCH v6 13/23] virt/steal_monitor: Restore to active on module disable
Date: Wed,  1 Jul 2026 19:46:44 +0530
Message-ID: <20260701141654.500125-14-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX7hgNb02BTydS
 NoHtXfdG6ZRSRLh1yx3ZJiMlm7aEZHnlCSsxC/L0n4O3FyU7qNWGo1YQ77jXXIxtuw6udyL6QnZ
 VH0JhkIbTrQ//bFtqmOLWL0cl0GP8Y0pZpEmteg8Vnm17p/YtM+2IDzTTRPumm5jvsqv0SzanJd
 xL6ozyO3j1itEh3I+TGHk2s3XXQ6x72uRnojdkjRRR+skol69h4FZxbi/ZcD2QwCqsTcFndxOgg
 1CmswIY8rcfcwro/UZa1DVydKYxDXmqkafYjHsdLxZ4MZwQK75pfUlb8B7QxmvOnMl1FvFpicos
 ABR03j8gvweOBBgnwrHGNyx6hpotIunJQiPs5QpdRtp3BC5vtreROkdbHLULA4c5kb8fvzrsByH
 i6uJ5Z+uCIFklJeQnVWTWzcriDIx0j0PZMHTu/WTdJrUEIZK08pRsPJ7i865PXQjBSdGuqdi9GT
 py9X2DJeeruStEI4l2g==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a452225 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=8xc5pq_vJk3O0FTEJYkA:9
X-Proofpoint-ORIG-GUID: i3yEzC19rjdbpqYQOP1ipw2p6jrvvveS
X-Proofpoint-GUID: USQlpUnSDvGEFc2HfnoWXkGbsxN5uIIp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX4Qu34TaUdG0l
 gp5rRIr3ie44WzaZpxq/XvnecobwWcfbT7tq+Wsw1Crgy8f/rIkizA6BghsMfqgRlMaasAr2IcU
 X3xjVmFoWU39EawJRCuEj1TjpPBCTTY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

When the module is not in use, preferred CPUs must be same
as active CPUs.

Even if one disables the module during high steal time, it
still restores the preferred CPUs to be same as active CPUs
to keep disable path simple.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Add cpus_read_lock() for hotplug safety

 drivers/virt/steal_monitor/sm_core.c | 3 +++
 drivers/virt/steal_monitor/sm_core.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index e320559c6576..222c23286043 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -23,6 +23,9 @@ static int __init steal_monitor_init(void)
 static void __exit steal_monitor_exit(void)
 {
 	pr_info("steal_monitor is disabled\n");
+
+	guard(cpus_read_lock)();
+	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
 }
 
 module_init(steal_monitor_init);
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 684a258526e1..40913aeccf16 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -7,5 +7,6 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/cpuhplock.h>
 
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

