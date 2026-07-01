Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDC53128D4;
	Wed,  1 Jul 2026 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915780; cv=none; b=Rb05C9VSgIea+3PE40EhnAQsQhs5ZLYNonN+3J6nwRIL5s0W/mp5w9qryFPP3NtPZoLFPYI9PwxjhidNjuuNPAC8TnlLmpxjg9pEcpVJAuRSCWyDdVSR5sNjPWH+I8GvMFci4AHQCiMOapYSqjOztRkKoj+EuN28kpsSPsgmxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915780; c=relaxed/simple;
	bh=q1tnNIdtNKPOcOVd/mVinxLNP4u48O2LKaqTOqfYsMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNOjA0w2mTRv93t9G+fOGS58kdqXmnpRkMkG03CYSV0lDyfgf4PiaefJ96Z5JEvAx9b4rU6bSCr9zAiu0zY6Z6caiUiuLU0UaKjbs8UuK5K+4/s2fgnXdu6YuxTN5sGdVjO5FH46M1GXh+ljED5XQCucUivP1YpJdidRi3HGdjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EpPTnf3H; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EpPTnf3H"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIR4E494414;
	Wed, 1 Jul 2026 14:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=o118WTF5A7ZjXkeCD
	IMxkv48WNHuVj0eP2qQB9MKsiM=; b=EpPTnf3HqdXCSZ+4m0L2/0d1Rhb0PSstS
	xL5sUckTzPf2vNv9SFbmdv582zEJJcvJJ5En8VmJcnkp2IHRY/BcBnb9suDByWTX
	TyZKAndRTtyoFG5S9JTYjuVZmjvjUIe3B1oBEVVre1xFKY69KcKCmR3jIi907mxQ
	TCjDuvVy2nDsuJPpNmqbqVl+haYz95msasg2NIUuK8UsEqtmS/xN9ho46FePW7t1
	RM9Ko01pv7T1SLFzgBfE7AQuNUgtsiR9zmwQ5dF9Zg3fhIsbH2Oxkc0MCjJdE18X
	vnE/bqRvFRQJ7K1IVGSPcnMJO0kpwt0bDrnUy3E99niK1EwEWmPbg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26rf4hj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJh0Y008926;
	Wed, 1 Jul 2026 14:22:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2tbhfju0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EMNeV49480188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:22:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 685FD20049;
	Wed,  1 Jul 2026 14:22:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEF5E20040;
	Wed,  1 Jul 2026 14:22:10 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:22:10 +0000 (GMT)
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
Subject: [PATCH v6 22/23] virt/steal_monitor: Add design check of preferred subset of active
Date: Wed,  1 Jul 2026 19:46:53 +0530
Message-ID: <20260701141654.500125-23-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a4522a4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=p3k0mxhKJztli33hioEA:9
X-Proofpoint-ORIG-GUID: vaUboH5-QiYQ6URWRTYR6w5MOnSvtjvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX+PCt8eEh+/+w
 1Ggo4EgqVVarqUIsI1fsf8NQGojgEKX5xgxCY1PPhqm2AnRA1XUYq+o4nXd2HJ2rZE52JtD8A7U
 pZVTY4RTlp2uY1lixqkdgefvBNdudEWPqok0YBbk56KxG1vJql3WGVQqwRgAf6GKMFVuLnif4So
 4A034dH/rDTftmj73SBgwQgp5+9fb6OH9g0hqBifPJ/CZpjKD3M2h0960gppMjZiU4jEFspNJ7j
 n0/es2fKvVniCroja6lCaQ3Dd5I1qHtsIDBQh3RieDq9XVgIDrwJV57Yv7wqNCGvq9Qpy5IT44j
 KlcyXMKzzcSf4ZyHVOtdzApTJCcK4UK31DIRAeRMnUkFcP0rfuK6t3VtOIJoEqXX9THIurnHfGw
 X2LJ+JeQJv/HR09ZszgcnLVktkZIpQs+zWmNbXJsnfcz1UKIX4GDAT3HRWQnrB2OmQ0Mj9KOuc+
 /ZvhuOPbaq9MGhg8nTw==
X-Proofpoint-GUID: l3ZuGsqUnZX9UqL1QmpXarrppb9yVwLY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfXwpseWjSKDpFN
 lxzPpPobjDg1DeOd4yqVm8a5Yx5wVWJCV85yxG4SNxOIgXJrZY+ZNKGihhl7RLHLQ592rGKouPR
 /l8B2+f73iKzDnI4J2SeAikrAyKS8f8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

One of the main design construct that CONFIG_PREFERRED_CPU maintains is
that preferred is always subset of active. Force that in any future arch
specific implementations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
- I am thinking to keep WARN_ON since it would enforce
  the policy. That's the reason i haven't used WARN_ON_ONCE.

 drivers/virt/steal_monitor/sm_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 4810bad96818..27054bd0bbf1 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -84,6 +84,9 @@ static void compute_preferred_cpus_work(struct work_struct *work)
 	/* At least one core is kept as preferred */
 	WARN_ON(cpumask_empty(cpu_preferred_mask));
 
+	/* Maintain design construct */
+	WARN_ON(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));
+
 	/* Warn if interval_ms is set to 0, that might cause lockup. */
 	if (unlikely(sm_core_ctx.interval_ms == 0)) {
 		WARN_ON(1);
-- 
2.47.3

