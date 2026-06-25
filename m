Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E83DDDBE;
	Thu, 25 Jun 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391716; cv=none; b=DAgba2AS/Ji/w4vwmO4fzhNYqAG8G30I7VhNb2zuIL3F0CqnuvPHz922rLfHt7r0O6vK7sj3vdFWVCDOhGPoXgANiePTH8CUpsbVxdPAWXWxUuDLWrtUqyuHjCB43RRQmPb/0CShI/e7ZdvcugJwe42UdERO6JnoQXiFFY+w65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391716; c=relaxed/simple;
	bh=PJG/CAHduTLSu7kZKPCw6sTHRfvv1QhGHFr9ycFKTO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p2X+mfj9XXKxJYRvetGELuj5OR89tWvhfVxu8MpyD6dNo3dnSoYyln9/kpRbDnbd+kVXHkNxjpXYWpYNRWbWMU6YBtMx/EkiPFN05MRIEJym7DMVFVKQfGMk0pgadLcVKSPFNeYobdHHqrZPtv2ny/uTOIL+ZQbtw5EMWmKW29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ICmkDoV7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ICmkDoV7"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mOJI3040919;
	Thu, 25 Jun 2026 12:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+FcXdv5mBNjxohXTU
	OzoP59Q//aM2j83bhrLygunbJs=; b=ICmkDoV71GjliFVhB+N5plmVHGw7E4x/p
	CCo++L2gw3WDsQHWUOkY4BlOA23T/vfsJLvBnwqZxY7JSuOHm60lDQnaeHqfe25K
	q5HDej/O0Xswiy2Nd75gglOwgDNQgKeI+GxdGVl/EqxPgoaqsYWYNjfjOT9skO/G
	1f8ggetv1Y60t9hZnHX/oJPieyoLNCxzPzQsuuAAQHXKwje0D4zsEegVc5fwyJIi
	4vvhJa/V7OEAMX0D7kSwLYTKpyRb2mMgd4lhUKWEb6W2BVZhMNmGGkGxbefAS6pW
	MpuhVMyPhc6r4SPoxoo5kjvWAyStW/Eh8m/I7D5W2v6I7FjkqnV1g==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3svv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYcWH002258;
	Thu, 25 Jun 2026 12:48:15 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywusv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:15 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCmCHk17301762
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0516A20040;
	Thu, 25 Jun 2026 12:48:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E020E20043;
	Thu, 25 Jun 2026 12:48:03 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:48:03 +0000 (GMT)
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
Subject: [PATCH v5 08/24] sched/fair: load balance only among preferred CPUs
Date: Thu, 25 Jun 2026 18:16:32 +0530
Message-ID: <20260625124648.802832-9-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d2391 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=5ICBfrR2l7P1yX5hQRsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXwGpN604sncuc
 7ghlMeH6e3gSBbFiA7VGCxxRcegLkONEJ58TMiCdB4xyw8BAI20u4wad3oFtueao3IayXq7Jxs6
 wUz0Y4cZ42Nt8xHV0ZktzKtJX9Yo4Qw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX895vlcDJ9PKG
 G613+FS3u/7AlaqSGSG701Mk4K6JAXk0yeNQya26LLTrIvgLumkkKH9X3u7ujSEnVia2UJ6mSh2
 eUw9iXep7adjjkyTrs94n5+F81/wYyGdZeeLU63E6xctjGYUOg84Sw7Aohon6fYLs+g1MsNYahC
 XEW+TBcu8QzkcBTdXvdY5xtyrCJGDXPFV5OOkao+/nDiQMPJfkGGKH3L2Wb5efErjcv5nVWO7MH
 M8AKUKAyhnSLn0V94jXC4QVorb9lFRU9I5tHJxlkpvhTBWgtG7keWU5NV0ZWzgXS+wxuIRxh2GY
 dNEHkt+F498hRxvMtjJr+YMCuwWqGgCcR+lZgd9JNqzB7TowFqx79DaX+aWKYymzpnfjcKAz6f4
 NBKDZrlf1fduTNYmEE35sjxX0aZ1A6xZVoSzz7+8ZVdoKxNQ+UaeUMI8JiT+sK6hM1+gRPZrV5N
 m5Y99J+cC2axofRFusw==
X-Proofpoint-ORIG-GUID: QyWcO4AWMQV3mMgZIicumcBp-Sz6eLNi
X-Proofpoint-GUID: iaQXZf-nY5cKjg1SDKufp2ANa00OkZuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Consider only preferred CPUs for load balance.

With this, load balance will end up choosing a preferred CPUs for pull.
This makes it not fight against the push task mechanism which happens
at tick. Also, this stops active balance to happen on non-preferred CPU
pulling the load.

This means there is no load balancing if the task is pinned only to
non-preferred CPUs. They will continue to run where they were previously
running before the CPUs was marked as non-preferred.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Remove previous cpumask_and (K Prateek Nayak)

 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index d78467ec6ee1..44a0d9736b67 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -13289,7 +13289,8 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	};
 	bool need_unlock = false;
 
-	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	/* Spread load among preferred CPUs */
+	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
-- 
2.47.3

