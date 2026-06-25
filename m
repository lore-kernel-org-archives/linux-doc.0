Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB11862A;
	Thu, 25 Jun 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391846; cv=none; b=MN5TApjBgkB+911HzlaIPjVDGo2tQi8/RQiB3bSyrgv8R/yPdd3Pj7bgD1jQC7DnS3XnKceq3nZECdhoW6kIB2aW5srmc/P43Tta+eDmGmfLcu7anSyZGV7ZdBWQdLIrLkgOanpBT+D8KVEVNy2yCE1Ngp80Yddp/joSThJeKoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391846; c=relaxed/simple;
	bh=WIbVHbNsuHSDp8K22xEg8v2WCMSpSLYrE54ZshS+f7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJixC86I6kPZupRiH86fCBy9S3GEpQ1FBXsT5cFOht1bpFgiYtX1zPg8AXxQqabU92whdHercy6VwWu5IHDJr4i9ehciWeep3AeeF2U6Akm9fBudJo15+oXgUO0K72+kyqWeqsEQI/L/34WAkz7gf4DHbnDI8sNnAjRvJCdg5io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Vo+9NmMt; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Vo+9NmMt"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mZGR2927737;
	Thu, 25 Jun 2026 12:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=F5xeP1tUP7P/WkExP
	bI/9YmprtX1H2Z13NgpvGBOHVY=; b=Vo+9NmMt9mtlt/WsogdVirxWX9UxMODRV
	9h6uSW4yf1+sJKA3SZPzvLosqB/VtHzX7WICJgrsrN5POWa85qw5qfh00sz1R5L5
	Xh0LX5pVyW76PgYDOTcQw6BLgk+tU7O6g/Dg0qgl4BHYT9vQicKhO2UGC4NbbOiu
	9TFRkWYr+VQ6Cc6fdXTASClOtChq0E0uxtLoAsudfSfJLkrb7EJBmolkXwdSGPYg
	UPejWiKKJza33EC09k5rm33oqS30hKM0sOjFcrfemzo9Y/IrsRwuhHat6TLfexJP
	yqqpE4KtmS81bbjrxS08UL82sS+WbUf1+/iANjY6wFQobELTkI/rQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gsh2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCnmXR031108;
	Thu, 25 Jun 2026 12:50:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke5xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:28 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCoOOL35455282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:50:24 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 638C720040;
	Thu, 25 Jun 2026 12:50:24 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9812B20043;
	Thu, 25 Jun 2026 12:50:16 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:50:16 +0000 (GMT)
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
Subject: [PATCH v5 24/24] virt/steal_monitor: Add design check of preferred subset of active
Date: Thu, 25 Jun 2026 18:16:48 +0530
Message-ID: <20260625124648.802832-25-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: O62-VmUflhXJW8pBt8gkv7fC0tzR7XL2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX/oViz9ZeYJm+
 mbZTkzpI5RXzvW7UJesIIw6h8aflKFNmtGFwnpUGJJHZpLOleh1DWxuGwbUHnnBj+ZrNS0e6P6d
 OeQu3xeNIUWAh97A0ZbNKi4MSMcXIak=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3d2415 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=9Wsn3OEGW-XOoOitwxAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX/dlyvsBRlQfS
 gOgRS/Xx6lK7unQLHDcWB/6BOllSOELQkyS2Z+voZjwApKlO7evuynPSa5VdTpMxyoBUQDZrTqJ
 GZIprKRhMg9bOE9zu9jGwwI7qMTzDPU//4vnEjuCR23oLX2+tz0Krij5NX9mtiscdDSWgpfT9MU
 K9ZlG4UqM4IO0QAS4HYihtw04BiHmnp0H+CC+6LWrg4NW3o6mgPUVQopCHMCLSbsy4sPJ1OxkoE
 e9hpo6qXWQ0xQDKg0K3HKN/Zji0scldZ6nJ6X5HVH90YfaAMoZuZfsEXUWgbU1trBOndxFw2c2J
 9q/Ms6eKlqaH7219l4rw3dB2xy8rySzJnfCQ9cVUwYANKLIXH7tLdf+YYoWK2ccnlergeDWTcxP
 FMoI/WoaheQPPFINe8CQcr8uTTmWkv4Ciarp0oY28EiCLSmUIi3jWpx3c0b+75W/KVQWzpDXjk5
 AFfu5nQVXKFiRZjRJ1Q==
X-Proofpoint-ORIG-GUID: Wf-aqPZWqcOkn6i43wuvHQuNmN5_30M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

One of the main design construct that CONFIG_PREFERRED_CPU maintains is
that preferred is always subset of active. Force that in any future arch
specific implementations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- new patch

 drivers/virt/steal_monitor/sm_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index f5b0e568eb32..82beb2b94083 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -80,6 +80,9 @@ static void compute_preferred_cpus_work(struct work_struct *work)
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

