Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ACB3438A0;
	Wed,  1 Jul 2026 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915726; cv=none; b=cWWGwrNWxxUqOJYsmiAP5gRYLngxDj6YP0/l53LGh4gxli+p6IrUEi1hG6f/f+XEp4J13JwxR16TbIRFLo3eoyh4PEwjDdGd1e8iW+YQIfgjLsJMUZ6l+qIQxKibM0ezMAQrjoaJKvIXvqNme97DVhhcxqf2rB2SbC1oJMipSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915726; c=relaxed/simple;
	bh=YI3dpKG6oqvL+bzYDZH3NdR56UlwbQQ/PTwaPZcizs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5PTRsKMnxufITEemc9sb9dHZFS6ljhYkjQL3uapnfBdRrmJ8m9h8ogHwZHqL/m4qRNDbqmUxr3AwfAKxdOqHmKYtbi6Ssk5oct933CDc/MYnGUJW570HS5aNyYSiu57aFOSCHlprXFThkhr7LlZkY6iJGxo0XFzK63SD6fJGqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FBBkSVMn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FBBkSVMn"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIMGW550940;
	Wed, 1 Jul 2026 14:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=u2YCdinzlnnXSYMnc
	Xe7yJ6B9rwvpThMrLJ4gMTWSos=; b=FBBkSVMnXZnt/WxMmQ2n1bFn7rFYlp8pR
	2iEv3BNGAeocyh8TSx3pyMl8ohHEYDIjDKmIV+jgbjX41skn/u0bxcKVqfkn8MG6
	7UUEk4usr0VeC+YXmuU7CQF2+hBZ5W5w/Dth7fCmkzgCiBHVIRJPVTGoZhQLkpl3
	HJZ+MM3pAGWMiD8ObDj9hkZwkolMBedjLupYqmpe+txveoc8BI+LMsxq2I+8QYw/
	05RsDhAjKBS/1gkMq1pU02uahf59q/Tfm7cZltTLKmoatfBnB3y4VPU9AW//Ip7w
	1biEbqrgEkPOK1Vaz4Gy/Zu9+pPrQ0mPd5BKAoB+vH1n2UX6PKEIQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26n5vyh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJaKE027970;
	Wed, 1 Jul 2026 14:21:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfugh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:21:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661ELf5I49742244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:21:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E079E20040;
	Wed,  1 Jul 2026 14:21:41 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3DB620049;
	Wed,  1 Jul 2026 14:21:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:21:28 +0000 (GMT)
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
Subject: [PATCH v6 19/23] virt/steal_monitor: Provide default method to get num of CPUs for steal ratio
Date: Wed,  1 Jul 2026 19:46:50 +0530
Message-ID: <20260701141654.500125-20-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX5o0hyZ55J5Ld
 Fwy1dH/PbGgZotRyJUCrm+Z3mb/nKySO7fEYFwRKMh0wKX+vYh65BlWKcU3N5OWTA65SQY+ehhR
 APJtmQ8iKDuEO2Fvhvmf+LKRFraQpHsdpRRgqyH3oRUp4XqcdvOAHkWnqJ4Fnk6OFT/epUaBYrU
 zjafZYKaRV7KaKp80KDA/RxVVh/cP3uNazPW8FFQvt0RdML6gR+eFu+9e3ZYBqlaXc7gTwJq1x4
 eK7AGJ5OkXQGWCFGhr8sEdHaGvfcndKjkuOx0ZMBbmW4yRk2crYzxZlCjP/PViyX/Jqowt/purN
 YvfHO+0xc1PreWI68BJlJPr5lsDVplTWRf+OmxEDv/QDzm3y/R8FCT6ObaTZHapaanwrBY6HTWz
 lZVb1z2r9yvhRtOkNFd/E0liZbzV8Rpa+t+At/taRt67AuAapchCZ5452nj5LgkSghCE5iO22ae
 ngRO0Qw4+pt4BB1teYA==
X-Authority-Analysis: v=2.4 cv=V45NF+ni c=1 sm=1 tr=0 ts=6a45227b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=drlZgsKemknilDNKuT0A:9
X-Proofpoint-ORIG-GUID: Z2G0-62jx_N8ns8K9jnTjIhQDWEoEXM1
X-Proofpoint-GUID: _RE0bLI3_bsQI0VH4R1DcXb70KwjsT5R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX69hMb7fvwi2o
 3OCJW5RivW2Ap4wfoBNzkWCMUtx1PlFjxmL3WOIWv3llI15CVnyZSaHV6M7caatZ3lYht0WZaxH
 pMhKtjV1MurZ7/5QusZhfFOfspkYGEs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

This method informs the steal_monitor core, how many CPUs it needs to
consider for steal ratio calculations.
steal_ratio = (delta_steal * 100 * 100) / (delta_ns * number_of_cpus);

Default method returns number of Active CPUs since it calculates steal
time across active CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v5->v6:
- Add cpus_read_lock() for hotplug safety.

 drivers/virt/steal_monitor/defaults.c | 11 +++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index 4e2e5b233948..70dcfb1ce4cb 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -27,6 +27,17 @@ u64 __weak get_system_steal_time(void)
 	return total_steal;
 }
 
+/*
+ * Return number of CPUs to consider for steal ratio calculation
+ *
+ * Default returns number of active CPUs.
+ */
+unsigned int __weak get_num_cpus_steal_ratio(void)
+{
+	guard(cpus_read_lock)();
+	return num_active_cpus();
+}
+
 /*
  * Default implementation of decrementing the preferred CPUs based on steal
  * time. This is simple logic and decrease the preferred CPUs by 1 core.
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 030f6236c38e..794d3be04248 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -26,6 +26,7 @@ struct steal_monitor {
 extern struct steal_monitor sm_core_ctx;
 
 u64 get_system_steal_time(void);
+unsigned int get_num_cpus_steal_ratio(void);
 void increase_preferred_cpus(struct steal_monitor *ctx);
 void decrease_preferred_cpus(struct steal_monitor *ctx);
 
-- 
2.47.3

