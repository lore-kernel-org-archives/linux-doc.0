Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25253DCDB7;
	Thu, 25 Jun 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391721; cv=none; b=pTdPkqOwfvBX9dX959XjFxYYQ10K1+DYWDMIipAYUzbXjuiUcp85oSd1ctU5SPaFrJ3VgvV/hlgc8TvnxEbRVe9v06deB1ULhbK8ICkLzQCrD7TqZ/YWchtBuR/d6npGeb2tGMQHYP/vYXH52yPc2wFEzb+Eh6kVzi9wbeRmdz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391721; c=relaxed/simple;
	bh=BbPNNTmGxflxx5nsxiik9Q/1e3mkvoFlZccHRZWlDUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrdChS/BsP85GVJ2gsoGWvRiXY2FW9fOdmSzfZ8NrGlHGoK1CvVnFRNSsx1PpOLWUUb4aNi4f4Kjjp4MVLZLldDrIwNw++dnp+cPyGjuYh8PNUIlUMD1ZyKfRYBOFe5ZmVxPDEB10qEJUTh6yCAO5hwVcIe5N3RbaSaYAi5wsiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HF//Dk4v; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HF//Dk4v"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3nEWA2927886;
	Thu, 25 Jun 2026 12:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=9U8lOf0dEsrCdXgJA
	pRQ51+YbfWWETAVjkkZLvtYDOI=; b=HF//Dk4v3jp0oFMzHUztTDlQXvBIpYT/7
	bn1gNHtxNxuysYkKyKU0noeYcb0PlH+IE5K5HiidULhW2IRy9OzwRPr5bje4eBRe
	0TTxH8HiXikbCBoTjFKHQeua3wlmSnaCmnfavHazVnayOC9/TdkRxRtA18QaXtE+
	0vpnD5FdWW81LICl4P5MWmQ6NG2j4xdSym63egPdzs6bFHK4mGn4K9YqeQlAPnf8
	zde1Y1I5tQ/0oUyYdDSKwbDwCX0sHFUznYYlxrkHUYMe1mpse7LXpPoFfedhIg0Z
	OtwOSvCyd9IlHFeYA43LwI8wLVxR2z2r3nx3GneW2axFjkmhuId6A==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:24 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYhPE014990;
	Thu, 25 Jun 2026 12:48:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke5r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmKpd51577232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 181C920043;
	Thu, 25 Jun 2026 12:48:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CD9120040;
	Thu, 25 Jun 2026 12:48:12 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:12 +0000 (GMT)
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
Subject: [PATCH v5 09/24] sched/fair: Pull the load on preferred CPU
Date: Thu, 25 Jun 2026 18:16:33 +0530
Message-ID: <20260625124648.802832-10-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: pOaiIyqQp6bzKW_N2bovocIORB6gqIl0
X-Proofpoint-GUID: 0vZdCQKV8Kc0nO3ThTUGuOWdLg2h-utC
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d2399 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=cJ85lkNbBMoCKVTUgsMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX8mjRwLck/05X
 35GYe997IwhQOFnHU4LZAgcd/eX82oiz8SooxtZa/+Mj1LsGhw/rxaI5qKKpAtM2+WgQXwr6IVW
 3hL1tUExXPq/hM2KrSpQ/q+M78feN7S6yeCt2g0dtlIGT+Sq2UsArP/ZYOuFHWjwlwFVhEHW6V8
 9zQgdwlq8G0YDQno1GWX7zm0gW8jfdeL+UI2ZNXKgTs9CPpTfgIYPpqnoZEUzX0vXwp/ehabQqg
 Q++KZY709tqL3R4C/BxpP8QXOOctkCkPm4wYYwOfR5IfKgQQ3IvCIZ2n9xyg8uiy5SVq486vehP
 4gSwi6py0qVxWuF3KUm/Tygyrdyx+CNYa5FOdcJOgy4+LA5P7dXhnwxulU2cVqsuDPp6wRzB4eK
 Z4XNQfkbukg/CGFa69ibgXKTzRxp+9FKSwamqUwO79Q+ksW6fOKiq2EC35RGPyXwQ/yK8N0YkHM
 SZddfV7g7P879wvmVkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX+46Ws0WinBHK
 mAU6EB/a4ZZx9/qGbsAGCubxh4niLLCXhdaQ0ag/Ofl2oMQxBWZqqvip6FUxX56Vu9NJ9EcqJkf
 9iK4mGhbtUTo4+aVNqDmXiXpLz3H8oo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

When cpu is marked as non preferred, any load pulled towards it is
pointless since in the next tick task will be pushed out again.

Since load balancing only happens among preferred CPUs, should_we_balance
will bail out. But for NEWIDLE and IDLE balance, this bailout can
happen even earlier.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- new patch

 kernel/sched/fair.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 44a0d9736b67..fda8966d9d87 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -14196,6 +14196,10 @@ static void _nohz_idle_balance(struct rq *this_rq, unsigned int flags)
 		if (!idle_cpu(balance_cpu))
 			continue;
 
+		/* There is no point in pulling the load, just to push it out next */
+		if (!cpu_preferred(balance_cpu))
+			continue;
+
 		/*
 		 * If this CPU gets work to do, stop the load balancing
 		 * work being done for other CPUs. Next load
@@ -14375,6 +14379,10 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
 	if (!cpu_active(this_cpu))
 		return 0;
 
+	/* Do not pull to a !preferred CPU just to push it out next */
+	if (!cpu_preferred(this_cpu))
+		return 0;
+
 	/*
 	 * This is OK, because current is on_cpu, which avoids it being picked
 	 * for load-balance and preemption/IRQs are still disabled avoiding
-- 
2.47.3

