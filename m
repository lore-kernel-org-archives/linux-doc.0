Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67F23446AF;
	Wed,  1 Jul 2026 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915557; cv=none; b=UpqQGf4NS+Gph9FAOPV848miAdx7TiJXzRjKqF6kRGyda2lT4DROrRZUqVZSXGSmOqxk2go37dqYXP7zkqXFn3dBcFm4bSImxZIg2plIeFOIYzHN/Z62QVWXdQjTsIzLSX5PMsHey+kPOOuI7oPwSTvYVyblgSZo1MKDqmuq4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915557; c=relaxed/simple;
	bh=+YkRzs4sIZQ64aGicL2edPdao7yUADcVAjsR+KCLRsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/2YAi3h/k/8x9pcuSCHHEd+lkBuGHJt+mCkAErcS6qREx3X/YSDY3YkF5d0aOFb4KZI2GnXamy6CeR2cWCNVFidVW08M6wF78DHkbOWLBATzS/Mpqc3UYlgXNaymgZnAuEIx2WhD4aEGPLTh1XHpixCcrU7OUH2RHpPtUIDQNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=P+oXmViw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="P+oXmViw"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIQVa746257;
	Wed, 1 Jul 2026 14:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=l6X7MrSjDwnQBV6KH
	HB0+coutnxr00T6RkoNuvNNSJ8=; b=P+oXmViwnoZ9GTzmLj3QvdANRsBEWTS4+
	iv+7IeZiFYu7K5i9pu/xVtDN24AzCpYiegBGhhMu2TDywPGnSPJInEE+f4oRYFo/
	n7kCkv5symcj9pN5BSl5qIo2LeT1EJKUtrqO0czCX0IX/JTiY0Jjva4ARf1QLyV1
	BV+ZZ9O08tIdy9q6+SCaFFPfiw0lLVnM2amfWIbkBIEo5XOS8RUhgs6uTgOPWzj4
	/9rH5hiEW7VbMv5K3c6OMNUbUiP6xP+263nkotlIhuR0Rgsk9xxHg0eW/7pnJbwf
	vJxNVt9PyNAwD3DljuQkcAMCnVCaiBWgRlh32q3UULM++3LyhMrTg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26qg4wcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661DndQu009619;
	Wed, 1 Jul 2026 14:18:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyfd7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:55 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EIp2S16646524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:18:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D34D020049;
	Wed,  1 Jul 2026 14:18:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CED320040;
	Wed,  1 Jul 2026 14:18:38 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:18:38 +0000 (GMT)
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
Subject: [PATCH v6 07/23] sched/fair: Pull the load on preferred CPU
Date: Wed,  1 Jul 2026 19:46:38 +0530
Message-ID: <20260701141654.500125-8-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=RYqgzVtv c=1 sm=1 tr=0 ts=6a4521d1 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=Te7KJ22NY234Wc-1fPQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX07pPIY4FfBgN
 nvjB8BLK/MMKdqMIS4heZu9mR3DvDwMCwdjJP1wa1pcuIEtcho7NyeduXIQuGrxn86FiSd6lowF
 Y38dtAAxpY4JzeKDBrWiOJTpXZhTev8=
X-Proofpoint-GUID: 9vccZGMZAWFcgA_j2fNwpX7M9-0FZeKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX2J0NPfxfsq76
 TexdYxlpTrapwGKrdA22i20/0+NNBj57MyX8uVWEo3PLizirP2cahc6SDPoRvfkh/0NEQ0Agm18
 0B9w0FkqgkyN/KwtCm8fghAq9qGemeYxb+YzijN3WUtMb8j2+CfJbFpTJwTsTM9B4TX7bkwmPxR
 Xei0pHOTZ60QF/w3Hfxhkt08V5XTB9B0pFu7zE71tDIuisq7aOL9JSrk1d6kGpGhyTG5hh2rXCz
 PPH//1RJtPd5fkVdE7/gPSuFtekXmApgxTT+ICNTzcdogGLFPT2QO4XOcIqu8v0e+uZOjIlypSN
 z69uwxa65WzkEVIBCrQhRRmAD1k7IVGWVGcGvd7kpCeqsr3BwTpua75rxuTTmF3do0b4+trSUOT
 3nLfaTgRUYDCmRW5InzqnCJfnl5/obcds5kf0G6kxGtJZMAYS/xzBwLtaHwxq3hkWxMRQU3awAI
 T04/K+xc5LLcWH1sCxg==
X-Proofpoint-ORIG-GUID: i_NJ8N14EXnEV_Ir7ncRkz2N7RA7LIru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

When cpu is marked as non preferred, any load pulled towards it is
pointless since in the next tick task will be pushed out again.

Since load balancing only happens among preferred CPUs, should_we_balance
will bail out. But for NEWIDLE and IDLE balance, this bailout can
happen even earlier.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
- Replace active check by preferred instead of adding one.

 kernel/sched/fair.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 9b2931b559d6..f2bcf5ff6058 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14301,6 +14301,10 @@ static void _nohz_idle_balance(struct rq *this_rq, unsigned int flags)
 		if (!idle_cpu(balance_cpu))
 			continue;
 
+		/* There is no point in pulling the load, just to push it out next */
+		if (!cpu_preferred(balance_cpu))
+			continue;
+
 		/*
 		 * If this CPU gets work to do, stop the load balancing
 		 * work being done for other CPUs. Next load
@@ -14475,9 +14479,10 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	this_rq->idle_stamp = rq_clock(this_rq);
 
 	/*
-	 * Do not pull tasks towards !active CPUs...
+	 * Do not pull tasks towards !preferred CPUs...
+	 * preferred is always a subset of active.
 	 */
-	if (!cpu_active(this_cpu))
+	if (!cpu_preferred(this_cpu))
 		return 0;
 
 	/*
-- 
2.47.3

