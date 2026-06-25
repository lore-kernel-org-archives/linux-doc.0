Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44C3DD85C;
	Thu, 25 Jun 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391798; cv=none; b=CAfJ5sPQRvx0aRPP7ZgOE81OO9XLIHZp+3qs96aXEsfd6Ko710uNLC4MGUSRtsCutw+qIHeIagite9UyNSw3qcAHqdRZxOWsXtx0uIxONJW9JkUcLuEHSD6fdJ1R9BfYiXnHVnYhdGXnWzudlbfPNR0oqKU6XQbCSKnsBWe6A3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391798; c=relaxed/simple;
	bh=hD8cWCE9uf+MxOPhY0Y7F4AMh+IjaA9bdIGcwut5fCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMLnPbWRHcWxFCBNskoeAG0cwUKwXzdV1znb7m+oW4czRdI2MVXrPISPToPImqAXD9+QsJdG4ovlD/aJPV6L9YDIurTZOArTHFhfwxx+uVve7wsfjVCy93DQzKlaie+q6KIVs3U92crF5qgn4Dq38Ih7wSfURZ+M1GTpojFDxyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TifWEDtH; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TifWEDtH"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3o5dR2929272;
	Thu, 25 Jun 2026 12:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zeZlMjcnxtJRyart3
	p68lAQc5ZorK5uXH0zbHlO6z3Y=; b=TifWEDtHQ0/PUneQsO1Gz7khFmydCrLkn
	LI6Flg2SwgV4RHGguwTsyIcNlQsL1bEDavK6VmU/M63sztDNKV+ZMbBfkQHDjmu6
	q3BcbvUvV5PQSxJ25P02JZIJwaVybyjNqEEYImaRFY2pje8EJYKHlDOwaUKUwaf7
	yZAl3ClK63hpLE026pHuTFQvQwQ7jAM19P8hMYorNMggHyeJobPnWVYeN9yqZEwB
	V2lJlom9Lm906McEUZbAw3G7YicwzEcHRUqi0HHr35Jc+0XoacCCcD9NDa0d39DA
	826i3mjVJfwN5j6+AWg8YiMM6i5i6CpylCOOlXDMb82TMJUihxNQg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1t5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCndKn018568;
	Thu, 25 Jun 2026 12:49:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:49:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnZb548300500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:49:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57D9E2004B;
	Thu, 25 Jun 2026 12:49:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D525320043;
	Thu, 25 Jun 2026 12:49:27 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:27 +0000 (GMT)
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
Subject: [PATCH v5 18/24] virt/steal_monitor: Compute work at regular intervals
Date: Thu, 25 Jun 2026 18:16:42 +0530
Message-ID: <20260625124648.802832-19-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: CiWVhGmoRmVf5t83HP9mgUppGEm9fXqZ
X-Proofpoint-GUID: lPao1IB9AMqRhj0kdz59Jf8stl7J36Eg
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d23e5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=4qTup0LEVVWhnuKkurcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX/McJLzRKX5nL
 vp+HOBEGget4guoLKRx1VRmGmXa6BcMQLKBAyTbKNlpfgzYtnP/rjqBHUCB/8PHWdN1nJx82cko
 kpUk9Z+fCKx2FeEQlK+KwTxDxAAfYdSEN5J98l+9RQR9gdvuO/1SZ0nBzTAzsU5Afv6hwueCJWS
 omPdIVTDVJMWs5lfJ90gA2TrA+ZrS3G3XNkt71m540W/NVeVrm0tbkBHTaTY6BC8gMOQU5FKL6V
 I4pV/cY8lbBjqpsrI/jod/Hf4jSPle2o3LOM56qxczzO1fT5naqIm4YNkajOB7HtQYo/c6gF13R
 A5BUvwlXHuzrMge5EmlFWWw/F70y8alz+EJm5PXbPmOE3DbUmhqFyqUwpbCJKx50HaYixMS6K5H
 jnt3tYu5BbOKY3y9X8G2akwtVF7N13k+AIsUjC/vc0eRoTfhl93OjRasei8rYtKniMRt0dm9Slk
 MO9xM+nrIGUwJn6IDwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXyiM51dT2tW+j
 QuqGg56iHVFaWw+NH4+heDvzbUxJ5ujXKChJf3yvTGj0qYkNE0lJS80tlnwBekzjYD7DjHsBDKS
 2sZ6ybCljJ86bxtLA4Aohinns/dwQek=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

Trigger periodic work at intervals specified in interval_ms.
schedule_delayed_work is chosen since this work need not happen at this
instant and this variant is safe w.r.t to CPU hotplug.

Reset the interval_ms to default if one sets it to 0 to avoid workqueue
stalls.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Modified for steal_monitor

 drivers/virt/steal_monitor/sm_core.c | 26 +++++++++++++++++++++++++-
 drivers/virt/steal_monitor/sm_core.h |  2 ++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index b95b37e37a16..fac8f4d5dac7 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -32,15 +32,39 @@ module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
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
 
 static void __exit steal_monitor_exit(void)
 {
 	pr_info("steal_monitor is disabled\n");
+	cancel_delayed_work_sync(&sm_core_ctx.work);
 	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
 }
 
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index a4e813319680..d50138ad8c42 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/cpumask.h>
+#include <linux/workqueue.h>
 
 struct steal_monitor {
 	struct delayed_work	work;
-- 
2.47.3

