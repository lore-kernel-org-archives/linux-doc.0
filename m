Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE572D8DD6;
	Wed,  1 Jul 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915657; cv=none; b=nC0tqsGRgkR8B/aNi2ZqMGR1XVrp5NhuPzF/WXC7beUBUytZovbXgc5+6ojDyCMs93lyiXiDo884kmH0r6WtBY4hvPIE7Wajjgb8IhENBAa5nSNzqqSgnIL2c0HvXGWPrUTxwfy5/fELHVqpzR5REcUgsV7LC28N2Ab6ctR6GBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915657; c=relaxed/simple;
	bh=z1wu2EWForqVys0YhPn6RArhWeoKk29z84rUxkg2DIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eaVYM6Tw+71+qDkBF/VuBfaTyy6OdrB+/prJ7+blccbNr4VPCMWN1sTYB57kItnAUl2vz3AUhInS9MDH8+WYrF+9cBSAcC+N4ik2PsZgkmFA59tUnAPqXvIZzbfrkMdKKeeKIpxASVhlo9XcfJXJWLsDe+cV1cf7N41/ILNFj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=AI2FNA3h; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="AI2FNA3h"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIRq4609469;
	Wed, 1 Jul 2026 14:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tU+rx6Wy/HtMsdy5Y
	tgjo/9qsTUuWZppv2eQZjp8HHE=; b=AI2FNA3hjPkVrmRbGm1FZjqXkQTKqqjyN
	iQ/5tdwhk4ZuAKe8x3WfcVfucR6Y+9vTcNDOq6etWclHk9mPDClR92xHhU8LC9fV
	SBLF0Z7tNb2mNRNjQ/LkqdkjyeXmJ1XMLIdce/W76MhGQB/kTVjZLcOqdA+fFxQf
	bDUEeuwG3GyrG9Bq7lonrx4xNp8d8KEWwOPbvr8el18nDtlOWL6g7YDW3fuJ+xgJ
	rerhX/s2fjBGr0ie/EbH/EoFOmbT92DQTLjWe2UtWVe2hyJYZrYaDZDxCA3YeFsX
	dlGTBGVUnqaAGiVAZJze87aZAWeibyhjPBhZkPvMC2zGg5/068HTw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe50dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJaJx027970;
	Wed, 1 Jul 2026 14:20:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfud4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:20:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EKUEd45351250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:20:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C56742004D;
	Wed,  1 Jul 2026 14:20:30 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 402B820040;
	Wed,  1 Jul 2026 14:20:17 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:20:16 +0000 (GMT)
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
Subject: [PATCH v6 14/23] virt/steal_monitor: Define steal_monitor structure
Date: Wed,  1 Jul 2026 19:46:45 +0530
Message-ID: <20260701141654.500125-15-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: EO6olhsThHO5zuM90K8CcRhZu0StzIVb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX0JMyPNAsSrvy
 SvN3is42OdL6Iv45ax0xrMLMC3w8BwmKLKqjNc4ql3qkuTAtKNNSDqotDzfPDHgOoNprcsfF4TR
 RRpZT7XIM5Jaql6aN3LIsA0jBny7i30=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a452234 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=cXayYlmpSY-lSeVCXxMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX1924AMEd7tn1
 wypQ/yZ3A898UzjpDh54lxdPX6Ootb1qJzHkx18hdGolBFmD2jwKWu9wDVRyrT/GiyXt91RgcZu
 7Kvs+h62D8vzAzrxidInXF0Fcm/eaGdovO55FeO95jWmi6sb5AZcfluwQprmzi6wolJ1a62KjjO
 Olju6o4+zO9LVLG3jyTTjngLD0qfuw/xpuOJ6Fbx5eyS1wR1PCh8CAn1ac0Cd2VGIdFLLvrdxZO
 vLpZ6/X6q6EITtfiA7OjkmNw5aByG4Oy9UJVtE19t6qZ82nKdUSEfCErBdKrkZQ1hqElzlW0TJ9
 WXeXTL0CGnf/46IUehPTiYHWAkqKpmmPJWmpSeQeRDA9DIKiYImFpiv0maxlKIG4Y+QtEqL4fAI
 RGCnjVR4LUBnfcTHgSU0NXctbqsY98Azov4RSiqW2ah/CjjYEwCaBc7QNi2huCDZV65sk04Mr4/
 6oqtHe/duh4TpAjuLoQ==
X-Proofpoint-ORIG-GUID: 12z4Opeh8sC4Yq_ls3RAdhpqLlw3LcuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Main structure of steal monitor. It has
- work: deferred periodic work function
- prev_steal, prev_time - To calculate the delta in periodic work.
- interval_ms, high_threshold, low_threshold - debug knobs of
  steal_monitor.

sm_core_ctx - instance used by the core code.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/virt/steal_monitor/sm_core.c |  2 ++
 drivers/virt/steal_monitor/sm_core.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 222c23286043..92d5a0e3d8bf 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -14,6 +14,8 @@
 
 #include "sm_core.h"
 
+struct steal_monitor sm_core_ctx;
+
 static int __init steal_monitor_init(void)
 {
 	pr_info("steal_monitor is enabled\n");
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 40913aeccf16..e5c3ea0a63c9 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -9,4 +9,16 @@
 #include <linux/init.h>
 #include <linux/cpuhplock.h>
 
+struct steal_monitor {
+	struct delayed_work	work;
+	u64			prev_steal;
+	int			prev_direction;
+	unsigned int		interval_ms;
+	unsigned int		high_threshold;
+	unsigned int		low_threshold;
+	ktime_t			prev_time;
+};
+
+extern struct steal_monitor sm_core_ctx;
+
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

