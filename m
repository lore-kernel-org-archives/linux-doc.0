Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C893DD85C;
	Thu, 25 Jun 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391776; cv=none; b=T8DM1/ivHw+W7VvHZ2CWKvaKAtP1ZoXokGGQk45gMZp3EnJhI03zpkjZNzMT2761DTOiFeW5PRizTsTpXNjtwWGm3m+Pvpv1pkGoFF7J/mShPOBVS7dxnl01fZ5v+QvgwAzgxu7EG8vIJmnVKVNQ05kqPWfBeQohRnUaS+cbbFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391776; c=relaxed/simple;
	bh=2JEhIoGOdMbi9sT5h4OS3cs+3s31ZyrEXOkTf9jBIOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHqk4ZdSb72L6ldYGVKGAdeWuZuPidd8Knp39xqRpm0J2Qf78pz5u/qnNkr+V0yoRFwGi/aV816M0oUaKe4YIjMOc3dsBB09vMGt6E7C5DVf9XpwBTxJpXeUrSuxWRLEEnCBD1at6erl150JOdWcVAh6Tu9BY6xmOH9/GQwDTpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=g9lkRFVF; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="g9lkRFVF"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mHHL2977654;
	Thu, 25 Jun 2026 12:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=uPgQhaB1b/bb9Mx8F
	2S/WF58AO9YCTcQpP/WE3hTYfk=; b=g9lkRFVFRPwKuUsu/Q9HNadAeLcMFNoHX
	CMYbSbB+BJsYtP07W9b9owI6rcu79942PwKBRNTxtKO+eqA2AT/tHVNmZIGLEjk9
	H+lVbdCCnc7VNnHAa3AXZNacNRrnigkKX7UwwikVuP+4sUGYy+1Kpx069RzS5BaV
	YFDxb8Fy0wzFfTj61zibk7+8wuLBnkf3TAT44f6PF1QX12auQZjmTG0LBrUl5MSF
	busxlE3jj3EnMyWaeZ8Utiu0jeS2ryJPi6+Ol2LDAELnQCzCN5ZcBkws51OQ1jBM
	PqCSiZAVOsUIc5q2ej78Apf/OqmoEBehQBf4paoZ7xyEKrNUjjj4g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4sta5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYfHM002284;
	Thu, 25 Jun 2026 12:49:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:15 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnBqZ51118438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:11 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 643DF20043;
	Thu, 25 Jun 2026 12:49:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9529520040;
	Thu, 25 Jun 2026 12:49:03 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:03 +0000 (GMT)
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
Subject: [PATCH v5 15/24] virt/steal_monitor: Restore to active on module disable
Date: Thu, 25 Jun 2026 18:16:39 +0530
Message-ID: <20260625124648.802832-16-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX7hE2Z0RommtL
 72P2ThXDI5zSHqh2JGJhhzjFHVW6GXJny119J1ZSTRurmr2zs1GugnXicMg6JdssSMniicMrY4M
 2+wFinnWOhxHN2mIWCbUrUKnnARjTGE=
X-Proofpoint-ORIG-GUID: PEfrf9xGmxpRmCW0FEu0OBwfHE2FXOYX
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3d23cc cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=HZc_rA78xny9Mno97mMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX1hWBiXeuay5N
 YWhTq7vCBBjKYhiswoOkVJO95NPQVWIhyzvNpCjiUnW2u8WnflWli6GizLQCQgFPvMOYZjQ/992
 Mc0cBHKvc3G9TNEjeKvTeXPaOMBOYBV3dzSSODsngfZ2kpTCYtt5r0CTU02CW2kY/qMVm4Jjh8i
 H1EL+t8HKhOUCGL3kXWzdvw/5VHMHgZq6q+PI0Yg/tgBXMsMcX0/FH9sLWVDFe4jnVIg/VY3imb
 IoEx1jU2LBGm7RXjSvEGDC+ky6rJpPNJVMZvcLqrAdTFCh2uUeBwmoVm5HrpdB3IDPr5W/FHta7
 lXQO0w7Ur4wPg1fSSbXpBD8DiX/Bs2NYgpzcq/i6w1lrYg44/q1ykKTYBRYeb1pnZ4eGUuB7+T/
 1Esl/CjYGkAnG9cF15YoehcyK5RTE2Ntk1CrgEVQuOl0/NtORymK/bq5dqiZ4PPaywEL1KCMSiQ
 wGw0olxtCh+l678tMMA==
X-Proofpoint-GUID: g4Nsfzs4Pe2Df4bTmbb-dfECRfYwu6zX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

When the module is not in use, preferred CPUs must be same
as active CPUs.

Even if one disables the module during high steal time, it
still restores the preferred CPUs to be same as active CPUs
to keep disable path simple.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index e320559c6576..b1865fcdff93 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -23,6 +23,7 @@ static int __init steal_monitor_init(void)
 static void __exit steal_monitor_exit(void)
 {
 	pr_info("steal_monitor is disabled\n");
+	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
 }
 
 module_init(steal_monitor_init);
-- 
2.47.3

