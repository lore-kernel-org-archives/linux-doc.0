Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4A346A0C;
	Wed,  1 Jul 2026 14:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915739; cv=none; b=fugzpOGEX/jwpLNHJjxj0cw0lN5R6mVE+Pry+THRT4i86Se0wMASApjZTlZsLImszCRYE8DxRQh46HEGOiXoSIZpXH7YEmaiO3gZZTXXW+oUsqHPLo59qw5YcKNwMQH6SK0ntAgU+rVs6fi9hNM5BNAeD6RUV6I2jxl5rVMNg7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915739; c=relaxed/simple;
	bh=Sbkg5OwwgnEO0sDWUe+2uXCAxitgaviMBt6JOsyk1nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZzcm8Ls7aVhpz1UpVuUyuDq/qSQNc5RbjkBs0ELW3FXNU/URBBmhiCzx8u2bQ+o9V3C7d13dHZr5WARdEQwp7jrw/NVhL/e43Rg3+zeOd1eqgmQDFNoAW31hw1SGYQi86khfF6XX5g2jr2BDh5I88yDI17RMKmRSqqC5jfv93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=sr8jbj7g; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="sr8jbj7g"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIU2v446595;
	Wed, 1 Jul 2026 14:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=TyLssex7z2UmUChiF
	l3PRIUSalfB+n669mPuMzqVPMQ=; b=sr8jbj7gfBRCj89T74oAPaUcZEOY8ABlc
	dlHIW1d3KOhunBT6VIbuLQltBh3BeUoD7J8+Onc+ro+TWGA+OpTEfXNgWFCvRmok
	REPwfe6AmSZhgpaUawgKL3hdhqZ8EY6zjRqQIg5yNqlBO4HpDrg7XVc6pci+2tTC
	1vwxAPauQrTk0XL7ec0Vs6y0vLs2Zftet8wUlvOvHOs0rXesNwbDBY7DlL7pE3pJ
	ukURCcXjNXyADOISeVb6wuuIyVcu76vEEtGKGc0IqU9FtAFJp6vWu6H3lsALR7Vj
	XndkMGckf9WO10NSS3GjavY5gTD9ktK+YdFEEpGO67Gh/oGIw0RvQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26mjvn6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJhEp008832;
	Wed, 1 Jul 2026 14:22:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2tbhfjsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:22:00 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661ELuUq47579414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:21:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3321B20049;
	Wed,  1 Jul 2026 14:21:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB38C20040;
	Wed,  1 Jul 2026 14:21:42 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:21:42 +0000 (GMT)
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
Subject: [PATCH v6 20/23] virt/steal_monitor: Act on steal values at regular intervals
Date: Wed,  1 Jul 2026 19:46:51 +0530
Message-ID: <20260701141654.500125-21-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX8OqbK5zrjiny
 QzgmIU1I+0mcO9bxWyf0FJDiaLVZwwwGNQasei158yxTCUJhGXgM7bYrMqUTut+sKDvcFuHoDg/
 NozVf1LYDO5C6gimNKAZpWyADpsCaw4NF1x31Ke8lOV8LvrwjjsDMRKyqrmTxW3hwjOty+Uv/mX
 1ZQj8xN3mk77HcCa4ir6VefE3TX9yKvWFmvl9PlbygWhbGfAyVffNICQqzMY/zLqqVKYdn6xewh
 NoHPRadNUFisCSqUOD6WZZAnlZY/8ImeEHG2GXPsT52bLgCD/JBb58n9l9NIhRLNDvNVlslRfuN
 /r2S8tBwgQQ3Z2g3BJgukPM3scVmgqfm9Naf4+6dWxtTYNKuT0OiATrH4hsiHbUwTgc2EkBxKsH
 BLJgOqnc18Qj3a7wRVHGrtkEu8xoEESkKCR3OXHwqH9xSi7a9izy1T1b4zQWTp6ZZbKmS8PxCoq
 o8gv7Rh6rfEbEr0OLOQ==
X-Proofpoint-GUID: dsWdfTs6UoBs6mxlM7kLQXxxTEQS5IQz
X-Authority-Analysis: v=2.4 cv=Z8bc2nRA c=1 sm=1 tr=0 ts=6a452289 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=FaF7mGpESULvgM3RsB4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX+ulopwaoVxk8
 MfDl6GBltzEJPrXey/ZqF2ElKgOqG0+Ygk2JkBrqnVdXA+Xr0/9yA1ODLEmmAo+u3NKqK2FRmPe
 vIDg0rh1GE1FdlqLgrzRPVuC9xy5RTs=
X-Proofpoint-ORIG-GUID: eOpWVBdvgxfUcu64x2iKa4gbwVvWHEIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

This is the steal_monitor core functionality done in periodic work

- Calculate the steal_ratio. It is multiplied by 100 to consider the
  fractional values of steal time. I.e 10 means 0.1% steal time.
- If steal value is higher than high threshold, call the method to reduce
  the preferred CPUs.
- If steal value is lower or equal to low threshold, call the method to
  increase the preferred CPUs.
- If the steal value is in between, no action is taken.
- Save the values for next delta calculations.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Address u64 overflow concerns.

 drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index b499faa61010..7b7435f79b85 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
 
 static void compute_preferred_cpus_work(struct work_struct *work)
 {
+	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
+	ktime_t now;
+
+	curr_steal = get_system_steal_time();
+	now = ktime_get();
+
+	/* get the deltas */
+	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
+		      curr_steal - sm_core_ctx.prev_steal : 0;
+	delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time)), 1);
+
+	/* Update for next calculation */
+	sm_core_ctx.prev_steal = curr_steal;
+	sm_core_ctx.prev_time = now;
+
+	/*
+	 * Multiply by 100 to consider the fractional values of steal time.
+	 * steal_ratio = (delta_steal * 100 * 100)/(delta_ns * num_cpus())
+	 */
+	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
+	if (unlikely(!delta_ns))
+		return;
+
+	steal_ratio = div64_u64(delta_steal, delta_ns);
+	/* If the steal time values are high, reduce preferred CPUs */
+	if (steal_ratio > sm_core_ctx.high_threshold)
+		decrease_preferred_cpus(&sm_core_ctx);
+	/* If the steal time values are low, increase preferred CPUs */
+	if (steal_ratio <= sm_core_ctx.low_threshold)
+		increase_preferred_cpus(&sm_core_ctx);
+
 	/* At least one core is kept as preferred */
 	WARN_ON(cpumask_empty(cpu_preferred_mask));
 
@@ -54,6 +85,8 @@ static int __init steal_monitor_init(void)
 		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
 
 	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
+	sm_core_ctx.prev_steal = get_system_steal_time();
+	sm_core_ctx.prev_time = ktime_get();
 
 	schedule_delayed_work(&sm_core_ctx.work,
 			      msecs_to_jiffies(sm_core_ctx.interval_ms));
-- 
2.47.3

