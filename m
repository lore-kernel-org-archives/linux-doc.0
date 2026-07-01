Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025FF341062;
	Wed,  1 Jul 2026 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915684; cv=none; b=nFCemVfc1tBwxqZmifNcfbkUI8NzR5a2p7jVHX2JDsYaEQrMSJbUgJFO/MM8tAFpWeglQ5xBZertiKPTRMD9wRxk7nfGQbBpd50d2MAxAPVwm/SnChGGx/Kk1UifgqvFOIK2TN8coPt8itnTEQZq4crY7Ich20wHV8UHSVmXOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915684; c=relaxed/simple;
	bh=uDEi31bjLuy8r3AZpd0GbousW/QD1xn+7YDHd83hKQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jx+zcfjmGmEYMuTIDgHb5f5QUFmlGHl24aFYIxf9NU3aqNlWn5gDw1paLYMO4bFl9u00TjBCK9uW01p/nPowCxstSlh9XWKmL4RthSygXkhtAdeuVXHRqtn2CT5oKAPl0Ik0Ty+3dtfa4EaIkOPHdX23136t99yuOmw92avxZ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ntR32cOn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ntR32cOn"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIJBD609031;
	Wed, 1 Jul 2026 14:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JB0pY4vZh+KnCM8TD
	gfRat8xT0xot8FNofGe0uj2rdc=; b=ntR32cOnjgam/X6DZS4H48gAuGLzvCW9L
	zUnKeC1MNHGBx/J1LY6ZW6nawJPDUy6/5pr1yVnf8fexCnUpqbFP0TG1cUouMOOe
	x4jSG1m3eUtGQRIWv3wp+PDMJ3pwkq/mwpgnnl4y1WepMVdID+NjF7GDh8LQ/CKO
	DusLYQuM2pCdbrCbrHFiYAdRs7oIsyqb1nxc3EzT040Mb4B4hfBBw63Bnh16Hj+S
	mf8w0um0awzhN+smBURPvHzAAv9A7jjB40/d2sUDQI3nkqTr6j/9I1RSkSEitXdT
	8e46tcfyog2n4roKZUgDxRs+h7vNxP0OpVnVimXe9Y9kVvit56vIQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe50g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:04 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJeB0001113;
	Wed, 1 Jul 2026 14:21:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2u2gfgmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:03 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EKxjo50528526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:20:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62F5C20049;
	Wed,  1 Jul 2026 14:20:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E479920040;
	Wed,  1 Jul 2026 14:20:45 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:20:45 +0000 (GMT)
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
Subject: [PATCH v6 16/23] virt/steal_monitor: Compute work at regular intervals
Date: Wed,  1 Jul 2026 19:46:47 +0530
Message-ID: <20260701141654.500125-17-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: 0cWP6BE3kFMNgrWUiFDX3FQoNfYVbDho
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfXxoQtYNKz8H3M
 N6XgUTjoqOhghcuDYltVnRX7y2i40wD8hmTixTiEdLJK3VJwm7kktw4W/fScwPyc2aRx1FqWMeK
 WnnKQhZPvKAWce/D7EU0jd8zJ0sEZSk=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a452250 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=FaF7mGpESULvgM3RsB4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX7rUOEk5cwhiF
 zz+8NQ/u1nwgfrCYVO9M0hEMrX3Xvoc62EDorhA2SMvB3xVDmJyuXvPPOp1tKrHn88Ej2GXKwBt
 /8mcjs2lkeEdCHkKes/s9lJ9O3r6CBzFmir877CM24cOdgOpT5P548WzwLG092NvAr0jgkIyjPW
 rigK0cMv9g7bwu86I0rmowS7qo4iwrMPx9cCctTUTqLIskFMpqqBkx2kXrARKGCXGziQ9Aws7kQ
 GcJUmFxGcI8xUm6GzWp8XmT98yVp70bWP+kCfs4Q5SGtfoAv+QqKJbAQpCwAE4HberM6Dzy7P+9
 aMjPCI0W87SHxmLvXyQz2GdYClFk8vhv6til6Fa3Hx6Eg3nARROptZp9CQCTCqdA54EiRSgPHTi
 23ghJuWOH5IcIyMieweGWUlpOa48WoYoQad+abnkpmj/xFLJouFUjSgR1ozrQnDPSS2r0dLHt91
 9Adh3N0zilLY5jqrLmA==
X-Proofpoint-ORIG-GUID: kBwWJN7W-ZXbDLAQPN1SKmCMG4oAov9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
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
 drivers/virt/steal_monitor/sm_core.c | 26 +++++++++++++++++++++++++-
 drivers/virt/steal_monitor/sm_core.h |  3 +++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 1ba638224abb..b499faa61010 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -32,9 +32,32 @@ module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
 MODULE_PARM_DESC(low_threshold,
 		 "Low steal threshold (default: 200 i.e 2%)");
 
+static void compute_preferred_cpus_work(struct work_struct *work)
+{
+	/* At least one core is kept as preferred */
+	WARN_ON(cpumask_empty(cpu_preferred_mask));
+
+	/* Warn if interval_ms is set to 0, that might cause lockup. */
+	if (unlikely(sm_core_ctx.interval_ms == 0)) {
+		WARN_ON(1);
+		sm_core_ctx.interval_ms = 1000; /* Fallback to default */
+	}
+
+	/* Trigger for next sampling */
+	schedule_delayed_work(&sm_core_ctx.work,
+			      msecs_to_jiffies(sm_core_ctx.interval_ms));
+}
+
 static int __init steal_monitor_init(void)
 {
-	pr_info("steal_monitor is enabled\n");
+	pr_info("steal_monitor is enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
+		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
+
+	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
+
+	schedule_delayed_work(&sm_core_ctx.work,
+			      msecs_to_jiffies(sm_core_ctx.interval_ms));
+
 	return 0;
 }
 
@@ -42,6 +65,7 @@ static void __exit steal_monitor_exit(void)
 {
 	pr_info("steal_monitor is disabled\n");
 
+	cancel_delayed_work_sync(&sm_core_ctx.work);
 	guard(cpus_read_lock)();
 	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
 }
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index e5c3ea0a63c9..ea06e83c228c 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -8,6 +8,9 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/cpuhplock.h>
+#include <linux/cpumask.h>
+#include <linux/workqueue.h>
+#include <linux/sched/isolation.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
-- 
2.47.3

