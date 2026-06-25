Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795103E3C5B;
	Thu, 25 Jun 2026 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391820; cv=none; b=rkYUFy2lGrz5IAvMNnaxMVbAEbqskKaGlHsdrio+ZzYqv7XHgz+aPqpg2iXsSOLsjjuh0Lc3Widgk4m4uuapWssXnZkC68qzKgHrnjnkpLvAQUwhlPgm4Y4mPxCKZDky/Wv3IuFnyQbHUcrQ0Np1+JTQFtHCcYgglxveyd3fkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391820; c=relaxed/simple;
	bh=myxE4rsJaNmJJ99ul4+YASdD+ip7KC6WxrWKeAtidyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qc1ZY1IkindasCKfNthUVmxdwID/4v+bwlR9WwTwBtTFRjRBKepBXA6veS797u5zcNu2wGBPE4y9uYjerx7SaqkpxAKY/zqN4wWoPlzW06JnXqVNrMKSpAUnBL72PndJ4r47q7h4YaXVOp+gsG/CzCkVjKP7pGb0TtPH5rhYBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rYtQNakb; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rYtQNakb"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mMQ22927284;
	Thu, 25 Jun 2026 12:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=jAOiZ5I8tc4VxvnRs
	PqXrIAhEgCebiIhKF7VskR8RVs=; b=rYtQNakbwerCgion4XsneTVoWmAh504d+
	H8ypHoVUzgeVKOdZqiTUNv6SYqn6wrTiCYnDkg1ncl//dhc3ilJSG/2ye3kKqHCP
	vTacvESSxsKg8olcCBDgJu1UN3mY1dGlGwNlsXFUDAgfyXchv/xXQdQ15lXx/Wh0
	3jD4gZuWykf8uRszkYBauEZA3ihWabsndBkI+rEMV6LVW18B8c3i5MuQU1kEoq1H
	OjaD550mJfbz3CxahHVvwY2T77lggZpnF2pc4H2Acku9pal8ypGqVQhcCDiVZ2ZS
	Y/ym5Wa9imWlx3xX6zfL/Rf1LAlrHkrdKx2NkR6ivPqwW9OvMGGmA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gsh0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCneJj031063;
	Thu, 25 Jun 2026 12:50:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66ke5vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:50:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCnx2A53543412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:50:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA6EF20043;
	Thu, 25 Jun 2026 12:49:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2466720040;
	Thu, 25 Jun 2026 12:49:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:49:51 +0000 (GMT)
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
Subject: [PATCH v5 21/24] virt/steal_monitor: Provide default method to get num of CPUs for steal ratio
Date: Thu, 25 Jun 2026 18:16:45 +0530
Message-ID: <20260625124648.802832-22-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: 1vardfsL68v3cgubHK7mUUaRb8WDswJp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfX7EHpdUQbkUHa
 spRFRSsaF/fkoIvEsx3xiM4M8UTmqDPYqlax45nK9TnJa/Uh9Pj27/hl/3p1+RZQd0u1rV9hAsr
 CdO4GIRIgyQjHstce03Jruuev1NYCGU=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3d23fd cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=drlZgsKemknilDNKuT0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExMCBTYWx0ZWRfXw9RRYfWcxnSk
 RgJatQCNOfuvPG0bQ2vtpDDcUkmPx6vAceXw/l/hsCO5DPB/3I6XZwTSbBD/tUFqK+g1WZoUFSs
 sUnIknoOHaumadK1+maxYiThJ5+/8lJU4jfjbnplgj1k7an2xl9sttI6yE25WdWrvZlqyUVFd8o
 OBZiuvF4CedjyBfIFjCk3LLEnJ1FHp+ZDgadCMVtCHY6x8ra5wl5k0Hzt0E7L6TlaaHEYaEdK3m
 cmmWBa8MlGTpbTILUHugNofB1QM1GcsdWHSfhJEcdU4RHi2ClhppbsfasriRZ4ee8SHe5k8AhsW
 ykq6xzgdoLmYPquPiW99OwkaaZKpwddW3ttVoagNiSW3N4zyAKy3hfrSZ2Kj+WSS5eOWRvfUKKa
 kO22xnVwdhQoRNZlFNXBvVtpikycIVsAPJo2dZZoXcGoxPHcYZV/z3Dc1DeQI78eMeH45HzkbxS
 +OyHoMPjDpFvPlK0MHQ==
X-Proofpoint-ORIG-GUID: OQJ6KKqgTLxDYGOn8Ub7KfKX3G9z1WeN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250110

This method informs the steal_monitor core, how many CPUs it needs to
consider for steal ratio calculations.
steal_ratio = (delta_steal * 100 * 100) / (delta_ns * number_of_cpus);

Default method returns number of Active CPUs since it calculates steal
time across active CPUs.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- new patch

 drivers/virt/steal_monitor/defaults.c | 10 ++++++++++
 drivers/virt/steal_monitor/sm_core.h  |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
index 90ede838491f..3232fa8f4032 100644
--- a/drivers/virt/steal_monitor/defaults.c
+++ b/drivers/virt/steal_monitor/defaults.c
@@ -26,6 +26,16 @@ u64 __weak get_system_steal_time(void)
 	return total_steal;
 }
 
+/*
+ * Return number of CPUs to consider for steal ratio calculation
+ *
+ * Default returns number of active CPUs.
+ */
+unsigned int __weak get_num_cpus_steal_ratio(void)
+{
+	return num_active_cpus();
+}
+
 /*
  * Default implementation of decrementing the preferred CPUs based on steal
  * time. This is simple logic and decrease the preferred CPUs by 1 core.
diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
index 1857d6a9a295..17732c8bc136 100644
--- a/drivers/virt/steal_monitor/sm_core.h
+++ b/drivers/virt/steal_monitor/sm_core.h
@@ -26,6 +26,7 @@ struct steal_monitor {
 extern struct steal_monitor sm_core_ctx;
 
 u64 get_system_steal_time(void);
+unsigned int get_num_cpus_steal_ratio(void);
 void increase_preferred_cpus(struct steal_monitor *ctx);
 void decrease_preferred_cpus(struct steal_monitor *ctx);
 #endif /* __VIRT_STEAL_CORE_H */
-- 
2.47.3

