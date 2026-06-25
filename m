Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A2C3DD85C;
	Thu, 25 Jun 2026 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391705; cv=none; b=LQsx10B8pxrZQyRUKA9M+jIRDxDD3mYtd5D1h6wJAKaSE52Q8ygEPAV/wgsmxragxFODG9hPv75VLA63az61x8tXmlKrZTHm/utwbBEDb1axmqHAo/IR3tmZZCmXrzk2s9pGmeX68hyglDwouRmPziDl8msxnmzfC1ORABqnnq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391705; c=relaxed/simple;
	bh=JM+byUMZzGQgkqDjFUnXPxQCdKM87hCWoZyt1AQiPgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3Cdd4D3KYamP5HbynOse4CXiZaGwYNQ4qjIJX6RmPVXq4VCFk7qr+51sytIfVGhiSidpQxSJBiGf2gWFXLslGOGiT8XZ40L2kWNdCS3gsvGrNn3HoU4LDqkzD5McXcCv5A++BfPSWBPzKcXZPTqWvAlfXCA7OXMgh1UPQaQ9/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=js2u5F1a; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="js2u5F1a"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3nOis2890517;
	Thu, 25 Jun 2026 12:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tqFRua6+m8QHTPBj+
	RKv5eqCW8gZZ6zz4wxYRIMh7H8=; b=js2u5F1a2awGOUlRi0RdB/8clDyQEXCg3
	gz8Ydx5Y/3x+orPIV+gbIMMW9bD5cyIxU57TpWHOSGD90NlIfIR/+l+7Iy1zOWI9
	JHIyC1Ic2chbsnv5py4Dd+klp3Xmv6O8DJtJvaDgsw+rFLANgTC4ee87jKI3unKx
	Px3lcprSh/pzUZFOM8+TXyCWuMCjRaQfCi6CGSgNkgO25gQBB/GUVUkk0h8VWrdI
	ttRmnCMaqfhiDGeK6az8AD8NNKHA4KijsSbSDSZy6Qdq6UX7+XfzuO9bHk6HocGl
	ls6CqBCtC0+d9uAH4v6SjInWqCSUdJUR4a9vAtrRGYLXqUofxw1JA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjgt1cn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbxc002242;
	Thu, 25 Jun 2026 12:48:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywusc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:48:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCm3sb13762872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:48:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF2220043;
	Thu, 25 Jun 2026 12:48:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB52420040;
	Thu, 25 Jun 2026 12:47:55 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:55 +0000 (GMT)
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
Subject: [PATCH v5 07/24] sched/fair: Select preferred CPU at wakeup when possible
Date: Thu, 25 Jun 2026 18:16:31 +0530
Message-ID: <20260625124648.802832-8-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX2Syq9SwxluA1
 11C6RcWTvy7yTVBOrbHW2M9F4sqdsXECutm4PEXMAO76loQenhvZIhQh/K5R8110bQi5PX6ivwq
 /Q2UDkOrhdxsKD9S7twg3oab/lcR/r3rMPk+68znixaTIahg3nqsXABaz5XSpTxZ1lO/uPMbIVb
 Ygg6RB5voIPF3kOGjgSU0c8XvYCYhaJNu8uX1MYIGwguHJ4tIYV4eEGgGVsRWKmOmbortlEgxX+
 ARTKxy8hVO2cGU3j8NOmQMPCdv5+VUz7/UhaDsyYiKbgDEKx4fQCzcS1ZhHvkPyc0pvMHLd4U3V
 uHMElQ93AGPZiIbOcAy/73QMfOHBnh7W7/f4vkVnaLctosgOFBUCk13Th817g3vY2jywASJYxoI
 EXVs9LNEg6HJFh9SpfKWU2EbdjIIodYPRImoR9lMeQqGeoBUzgSDrJmSO1g6HJA+rGP0Ei9VqhS
 hyMqJI6tDpKNYNyyvPA==
X-Proofpoint-GUID: WwsDf1xEg6l2l3zGyQJaHQjUAe7P5MAs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX43IXY4t8oziF
 GRjiQjgS+FX2JLaWkqHZlAsBGs3GNJ4b4QZmSjpuZlLdbWY30kSaVB1RhJocxzZUY047RlByCsE
 xKs/jC5MZevgcF5Dc3a7kgxz/3iegVE=
X-Authority-Analysis: v=2.4 cv=I/lVgtgg c=1 sm=1 tr=0 ts=6a3d2388 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=aa2H8g5P-lxy6MgAFPcA:9
X-Proofpoint-ORIG-GUID: DfHWljze3ILVVyLacAatY5kZwSz7ykJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Update available_idle_cpu to consider preferred CPUs. This takes care of
lot of decisions at wakeup to use only preferred CPUs. There is no need to
put those explicit checks everywhere.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/sched.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 5d009c2529b2..148fe6145f1a 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1434,6 +1434,9 @@ static inline bool available_idle_cpu(int cpu)
 	if (!idle_rq(cpu_rq(cpu)))
 		return 0;
 
+	if (!cpu_preferred(cpu))
+		return 0;
+
 	if (vcpu_is_preempted(cpu))
 		return 0;
 
-- 
2.47.3

