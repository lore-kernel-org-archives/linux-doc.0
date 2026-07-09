Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202E3B14D0;
	Thu,  9 Jul 2026 21:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634287; cv=none; b=T0hLxReBJNRsrypgtbSpsYzTLv8Tm7VNl08mnfP28HKmzKsIuisFBmjxZ7LobqxN7rIPP8/gpuKTZVxEDBhsQhIHkwctmm4HhXIuwov8jEi3Wl6GssJLie4sD+a+UnJefL2sAfpcnzCcvnmvj3SQ3Qk1ssLzvf5odeKJcBaIPPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634287; c=relaxed/simple;
	bh=XjASERtwNt7y8iweOmjzy3aQl5Po6a977gjnwaKOrgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGHCvVbqFJz2hmO6IsGM0uZJhJt9xJnyglDZp/Ts6BSJ6TM0MT+7wtgNcPeQYRDQdMhdwvhLPjGcd79yk8LWkLdxNvMfFAToX51NbDV10aJwvTeFzkEU/2vCCsCr3xQ+P4/b31e2AYFm9wU6h6VzkF9WRmOnei6WBMNShA+V++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ltpQtO4n; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ltpQtO4n"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmV7B2860929;
	Thu, 9 Jul 2026 21:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6h59Llnv0E/RJXVgL
	Glkw0meMz533KxrdALnqwtPCxg=; b=ltpQtO4njTm0rTjOmHF1kHhnjUPl3SBye
	ClwIIIQfJ1aRAGCrFhOHu8XQwrdjfTr1Pyi7DSo2tMPylbqo8NY55BULJWVflzpw
	SEZEMWEiy8ovMJguTwCmiqSls2bfWOiC8YElnXmmUmTRDo/kzXmPvT80CPRJualY
	m1D73TTzeWsCz499FVhsjIuhlL3md+0gaIYcxJQ1XDGGsekjsG1u8xaLtdUXpuXZ
	rlafkJFTbnX32XngmCwT/Aq9d4OFE0S5RNcb8omzhjP4p5beEKXEVgyPb6wqTzYn
	jOG9ZxvULcHYWlfazh1bGyL1yREAXhjMmO1bpk96niW7w/AYe+OkQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fafh0935a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LngWB027225;
	Thu, 9 Jul 2026 21:57:45 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqfbym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669Lvf0Y33161508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:41 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1517120040;
	Thu,  9 Jul 2026 21:57:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 304A820049;
	Thu,  9 Jul 2026 21:57:33 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:32 +0000 (GMT)
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
Subject: [PATCH v7 05/12] sched/fair: Load balance only among preferred CPUs
Date: Fri, 10 Jul 2026 03:26:41 +0530
Message-ID: <20260709215648.1246821-6-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709215648.1246821-1-sshegde@linux.ibm.com>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a50195b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=cfBiKZLIvTo6CoJ2J0oA:9
X-Proofpoint-GUID: d-p43GNLe9EaBmIRFztVlB_NnzGTcGxN
X-Proofpoint-ORIG-GUID: vr5WnLWC72nvtZIDbFvI0JucIKGlUSN4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX0tzz2sFL8sMP
 Xi+vRvD4Wa4G4gsqNSAemb/inje1ZXEuYpiEqkAqTn9ZMP+kHR8a9tj7JxDg0LVXZssg3jIgWW3
 NJ3RmpzTMBBvo/CGu1hbYByN82Izb4U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX7FWi6aJ4Tmh4
 OrMskwef6i60ihj8U0AJlpJvEuaDIMJXaJcnDcM8zOspwgEsULx3ryQBwbOrClQ8XRHd9qu6rR5
 oFNgQE+dT/ptPK29I7C0Q3h1x7pG7hyj5we7RxxX7sYDEpPCVd8FMS6eGpg3NPj5gtIim+zsyV1
 4uTq/TD1I5wGYdL3+6WlbXW3oWMu7K3pTyhGA0kJ4hR29OH5XmlvEDzVbvqT8+41fWWOZTVL6VO
 uV/2MgL4bpY9xyuf/bJWQBkF1RsuqEolSp4rDdQVeSEXRCh/guYDG1TnI8iwtpkyckgefv+ApkQ
 av32hv37kQLNVUjnz5r7hy47nReRrKQnuyoXA7+jEWxCu2HRTMx4X+dERsGlm39/LWjvXn1LOp8
 l7ZyJhAES6iwTTXeYgHTRz0aYdyQu6gjlGBLu96oKKDFjMaksw4b9/6lwPuNxAfTGEl/Dttlkhb
 S/h8vanE2Dtrzwn8mfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

When cpu is marked as non preferred, any load pulled towards it is
pointless since in the next tick task will be pushed out again.
So, Consider only preferred CPUs for load balance.

This makes it not fight against the push task mechanism which happens
at tick. Also, this stops active balance to happen on non-preferred CPU
pulling the load.

This means there is no load balancing if the task is pinned only to
non-preferred CPUs. They will continue to run where they were previously
running before the CPUs was marked as non-preferred.

Bailout early for NEWIDLE and IDLE balance as load balancing is done
only on preferred CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Merged two load balance related patches.

 kernel/sched/fair.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index df8c9c2c7918..53a34daf78d7 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13399,7 +13399,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	};
 	bool need_unlock = false;
 
-	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
@@ -14308,6 +14308,10 @@ static void _nohz_idle_balance(struct rq *this_rq, unsigned int flags)
 		if (!idle_cpu(balance_cpu))
 			continue;
 
+		/* There is no point in pulling the load, just to push it out next */
+		if (!cpu_preferred(balance_cpu))
+			continue;
+
 		/*
 		 * If this CPU gets work to do, stop the load balancing
 		 * work being done for other CPUs. Next load
@@ -14482,9 +14486,10 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
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

