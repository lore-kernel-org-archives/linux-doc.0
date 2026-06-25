Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4D33E274B;
	Thu, 25 Jun 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391781; cv=none; b=Q4qMgalIMbmdHEL3qAKnf5lQfrGbOM1v3SOkadLrva1t7mQ/KrW5uNf4b2rBuDCljj17QsAJLoIBM91kP5c/JjI/bgTvpWDD8gPmC8NL5G4h/8MgFjvSm3YGoQjKheMdhHV7I8MLxST6OHc0y8yuJn27xQ+Twxe1lW7G+NCR2nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391781; c=relaxed/simple;
	bh=aD4nZVvnSFJrODFwTPWn44jbQ92xfvYzvenASGGB7A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqhJ8Gz8VH3RTiYBms16P+DvcOD2lDvGNuHpyODRwMMfbWCHUP+oaqAEH02an9pH/5SQG9EsUKcVENVlKxKgQfO/Q8z12eaYRa4F1qSl/qBuSf63yav/l4ZCe8ANev5lndDki2gkb+nRMd5AaQ60GfKAFKEL1fB6Jzq7KmyDtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=DmjLQZ3u; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="DmjLQZ3u"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mgiT2927460;
	Thu, 25 Jun 2026 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=7cunWkxtM3wkwCbuD
	bvx0GuvZ/uKaGX9nuh6QZZj+/s=; b=DmjLQZ3uUaIwxtuIkGusFbmOd+3YthDoo
	AD7EIqcHN3qpa9dMaNjvUVpKNL9RPxNWFcvACgqlo4YAGw2d+zVMW2nyTaznDmMo
	ciGc7O+QLF8kcjqWVxyys9xGSsNkTvWSVPP8NhoqDwhLycHk5zUR/xKCL4gDka1k
	4Wkqcc/Pk/RUYzd0Opj1KYQggzoP4b+1UgQe3+o3owUHJOmb9lCoT0585zBf1T61
	NvJhSckBS6CQKmOnBcCc2CwXYvTDurU0HPSrVZyIGXNvwmvkXjAQvrCVvlqqMyq7
	wIaqJ8pMQTOLGL1U2V5r7YNzp0IPGEEZun4E8gpwm/ARiGdQcxPGA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:24 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYje2021688;
	Thu, 25 Jun 2026 12:49:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex6php3fj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnJce49021314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DA6120043;
	Thu, 25 Jun 2026 12:49:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C294720040;
	Thu, 25 Jun 2026 12:49:11 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:11 +0000 (GMT)
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
Subject: [PATCH v5 16/24] virt/steal_monitor: Define steal_monitor structure
Date: Thu, 25 Jun 2026 18:16:40 +0530
Message-ID: <20260625124648.802832-17-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: HNLNuFmvjBiQ_0VYAXKVoAu_QwufgqmG
X-Proofpoint-GUID: uBmRun6t9tK6PNXdd6IYFnZzXAKtNGPr
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d23d4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=cXayYlmpSY-lSeVCXxMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX8Q3utQNkl0DU
 P8vy2hptPpo6tPPna36/DNKJEq8ceQ618wvGOXdvHIP5h9cb/ukxfHDvNK3+wrmryjvu9DccmQg
 OQtjgk8sO7eDLRzkBNnaw/BIDzdfLUwGvpYvr6ajncbemVpgFBnX15fKEYkys0iYXGNsvvoOEkO
 24J2uJCqXB8THYOdwapGtY4DQAjA72ANTSfo5H7Fbijf2KWB/1iphQUiD97UlVhaqBDGnjsbwvi
 /tLQtHEUt6kwdc663r6FJ/EmpWFVKrDxccb6xhpC3r/aiFKK6YHonZtkPjMRQ5a5Xa/palPrE0i
 rgT0qA8zuAlC9hiVm6Z94spGN4xgcFjSsLUXyHofemd+5T3Y+m+GDiEOWoMYKXEU9feJEMg89+n
 0PVptoteQbBEGC/OTfWdks25PqeNTdapQas7u+hqovuRV+oekT5wQe4M1QDTwst9CJKYPOODVb1
 3PlTdRBEF3+DogR5lQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX2x4y7yphWXA/
 pDkW3GRp0DfIm/wfZvPyK1rcHyre8NWTpzC+rU8aJEi4bWEg879fekNeDGHr+GoZucjxMMGkVA6
 3PEgp3W41KHu3Sai0YibrvEBHfh6O3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Main structure of steal monitor. It has
- work: deferred periodic work function
- prev_steal, prev_time - To calculate the delta in periodic work.
- interval_ms, high_threshold, low_threshold - debug knobs of
  steal_monitor.

sm_core_ctx - instance used by the core code.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c |  2 ++
 drivers/virt/steal_monitor/sm_core.h | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index b1865fcdff93..3feb686dd3c4 100644
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
index 684a258526e1..a4e813319680 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -8,4 +8,16 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 
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

