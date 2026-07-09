Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7943ADB9B;
	Thu,  9 Jul 2026 21:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634317; cv=none; b=RLc/EBM1Yt/nNyk/5S8xnMnRLkntTI4SRyr2fakUTKa9EtCsGMYTIZO7uJWhsf/GOD2qQl2drejtVD1lSIW0Boqo4n0RjyS5ymISn3Va4Es/2fVHZvguFxAXslEcvQMJxD6AdIsCmTSkukdgbJV4YhzStqekqPD51gtJOTPgPtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634317; c=relaxed/simple;
	bh=XcP1YHToX1SsqCEtjTQoI84mUy2g+/YKMRHVjCTvJK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNV8R6HxHk7XI6v+9QN9khjjPPWbzkHD366bqjluMAnxxIic1bxMpAqUSlIL9Vdt4paVR0i0nQ2GlIRb8unYi5CJq0q8slSLyuZ0AsbvuuBNqB/Kjmt3l6ksh65BRnjxvjb54CVDuaqrZI/jVrLCwC7ggWL4LfIcKQdyccmuckk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kz27GzCz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kz27GzCz"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HmEOo2860692;
	Thu, 9 Jul 2026 21:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=RWOB0rGIjKIqQDRio
	Jc4Au2dnol7vrmNgZftpsNPn0k=; b=kz27GzCzSchTcyGOzFrnAnj3pn4m9W3vK
	i+bcaZb/7dHaDrvmK65TpqKEBeM7jJFhsw4/9IHIh7znNfHLKq+FqF+GyMakmh5E
	B0jqhdjyfnMvEBRLVLSLOFhlqPfnRpXYhAi8Y+zlkEIg3dt4jmUfgNj/u8rONlSW
	v29O+MAFDPD0ZpWoytVROE3tfq0J3qA/Cf2X+DK8vC9bD5s6nsbnO8G/BHxssKWh
	xZKq2YbrBCyEKFXzg+ZKJ1unJb5plnePUiMbxm3SmDgwjxAKZ4lpIciLbsMkM0Af
	ZwogyTDpVPv/F5UlFCcGxf8Cwr7RS++eIPQG8IustJ4zQnam57AhQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fafh0936w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669Lncsv027215;
	Thu, 9 Jul 2026 21:58:17 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqfc0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:58:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LwCYH31719958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:58:12 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98B4920049;
	Thu,  9 Jul 2026 21:58:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C81C20040;
	Thu,  9 Jul 2026 21:58:05 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:58:05 +0000 (GMT)
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
Subject: [PATCH v7 09/12] virt/steal_monitor: Add control knobs for handling steal values
Date: Fri, 10 Jul 2026 03:26:45 +0530
Message-ID: <20260709215648.1246821-10-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=VebH+lp9 c=1 sm=1 tr=0 ts=6a50197a cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=6BQKOaM8HJeLFNFErIUA:9
X-Proofpoint-GUID: z1z7IV40a7peYlid85UByGWgEZM29OI1
X-Proofpoint-ORIG-GUID: OO4Pc2UeYvoVaF9LoQG2FOfdNzNirX_Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfXy0W+VGfY0c18
 /tIwFb8FOrDtbDgT3xd2VLwPV/hzUn537cFk4BmHAQoJoy53ivTDOUBXVJsNnblcKQbvuoY9jgn
 zuE4DhoFgUkFH39qvs6+/uaHQt++73Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX9eBvgC9sMIl9
 mi+N+9e46mlg0gzL0Vi4ahdDEuFMY/38OPRiIfRHP2I+4nf6TLhYOQmo3+UnpoGJ8G8zx8Ox7Jj
 acHXkcARLjGWiCxJjrc70qgBCuIn6KvlnPo2KENBaFU0zaxLE2Kbrz10aWZVQw3Or0DhdNrIfwr
 GiP0IWIz/8Ut4tw/Wr9PaI/Ndoqe9cIO6+CLNFHEViyTM4fB//1bDbDKVLAU3sRdBrGLF2EfAhR
 uaKw06jPPN2PbzzWSfKDIVh1+OGJhARtoOIaPnW7TQ0PLC+c1LO2hH5KGzYFaFLhsfTaebOAYfo
 YCcTvWL8KMm9TWW+mmBTCPowU3BCFnbtzmVB/QF1Zps0VicImKJfM2iY20XLW43E3bMvVeaWws1
 /hd0szteaMK3bFlWmjr8YNigtOC7aWuGeM1nyrTyC2f1OsSSVmnpZCVsozaYgyip3dBIA4WikmC
 cJekTIF6unrDV6nfg8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090218

These are the knobs to control the steal_monitor.

interval_ms:
How often steal monitor checks for steal time.
(Default: 1000 i.e 1 second)
This controls how fast steal monitor driver reacts to changes to
the contention of physical CPUs. Since it does a fair amount of
work, setting too low will have overheads. Setting it too high
might render the feature ineffective.
Can be set between 10 to 100000. i.e. 10ms to 100seconds.

low_threshold:
lower threshold value in percentage * 100.
(Default: 200, i.e 2% steal is considered as low threshold)
This determines what values should be considered as nil/no steal values.
When steal monitor see steal time is below or equal to this value, it
will increase the preferred CPUs by 1 core. Having value as zero
might cause oscillations

high_threshold:
higher threshold value in percentage * 100
(Default: 500, i.e 5% steal is considered as high threshold)
This determines what values should be considered as high steal values.
When steal monitor sees steal time is higher than this value, it will
reduce the preferred CPUs by 1 core.

module_param_cb methods are used to do the validation checks.
This helps to ensure one configures sane values.
Parameters values can't be changed at runtime. One has to unload
the module and change it.

Also available at: Documentation/driver-api/steal-monitor.rst

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v6->v7:
- Add module_param_cb to do parameter checks.
- Make parameters read only after module load.


 drivers/virt/steal_monitor/sm_core.c | 92 +++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
index 180db424846c..4a03c14337be 100644
--- a/drivers/virt/steal_monitor/sm_core.c
+++ b/drivers/virt/steal_monitor/sm_core.c
@@ -14,7 +14,97 @@
 
 #include "sm_core.h"
 
-struct steal_monitor sm_core_ctx;
+struct steal_monitor sm_core_ctx = {
+	.interval_ms = 1000,	/* 1 second */
+	.high_threshold = 500,	/* 5% */
+	.low_threshold = 200,	/* 2% */
+};
+
+static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
+{
+	unsigned int interval;
+	int ret;
+
+	ret = kstrtouint(val, 0, &interval);
+	if (ret)
+		return ret;
+
+	if (interval < 10 || interval > 100000) {
+		pr_err("steal_monitor: interval_ms must be between 10 and 100000\n");
+		return -EINVAL;
+	}
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops interval_ms_ops = {
+	.set = param_set_interval_ms,
+	.get = param_get_uint,
+};
+
+module_param_cb(interval_ms, &interval_ms_ops, &sm_core_ctx.interval_ms, 0444);
+MODULE_PARM_DESC(interval_ms,
+		 "Sampling frequency in milliseconds. default: 1000");
+
+static int param_set_high_threshold(const char *val, const struct kernel_param *kp)
+{
+	unsigned int threshold;
+	int ret;
+
+	ret = kstrtouint(val, 0, &threshold);
+	if (ret)
+		return ret;
+
+	if (threshold <= sm_core_ctx.low_threshold) {
+		pr_err("steal_monitor: high_threshold (%u) must be more than low_threshold (%u)\n",
+		       threshold, sm_core_ctx.low_threshold);
+		return -EINVAL;
+	}
+
+	if (threshold >= 100 * 100) {
+		pr_err("steal_monitor: high_threshold (%u) can't be more than 99.99%%\n",
+		       threshold);
+		return -EINVAL;
+	}
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops high_threshold_ops = {
+	.set = param_set_high_threshold,
+	.get = param_get_uint,
+};
+
+module_param_cb(high_threshold, &high_threshold_ops, &sm_core_ctx.high_threshold, 0444);
+MODULE_PARM_DESC(high_threshold,
+		 "High steal threshold. default: 500 i.e 5%. Must be > low_threshold");
+
+static int param_set_low_threshold(const char *val, const struct kernel_param *kp)
+{
+	unsigned int threshold;
+	int ret;
+
+	ret = kstrtouint(val, 0, &threshold);
+	if (ret)
+		return ret;
+
+	if (threshold >= sm_core_ctx.high_threshold) {
+		pr_err("steal_monitor: low_threshold (%u) must be less than high_threshold (%u)\n",
+		       threshold, sm_core_ctx.high_threshold);
+		return -EINVAL;
+	}
+
+	return param_set_uint(val, kp);
+}
+
+static const struct kernel_param_ops low_threshold_ops = {
+	.set = param_set_low_threshold,
+	.get = param_get_uint,
+};
+
+module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0444);
+MODULE_PARM_DESC(low_threshold,
+		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
 
 static int __init steal_monitor_init(void)
 {
-- 
2.47.3

