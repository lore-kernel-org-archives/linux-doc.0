Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FB3E44F5;
	Thu, 25 Jun 2026 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391680; cv=none; b=igEp3PEINpGuNfYK6TFk9Gzw1q97YrS3MTI+a3JfMdxddKdyTeB0Nro9kGz2ssN3lngvO40qGruiDP1dYC0fItdJQCPMEuZDzuem2CHbbT4NkzQPx2ttb8L60k4beCoMc8nvBso/MRRyqvSaNw7J/+luu5BzhBfUzn+AU2I8SJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391680; c=relaxed/simple;
	bh=1pL7qmp5XR5+eLV4jdtrdMZRuSmlbJvtUMCmX5S4Hp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ogDqPU5anwO9inhMiSI6Hh3T3dr01PugtIQdgqGiS5Iq/cfeYFZimj4zJDnEBG1asVzGbJJtvL6FMnifbeCKAB9qtFZzR3PsRL3YkRqwZ5iM9yI7XvIT41XtV+MyB4bhrbqEONG/3wZAobLxnYhUCEnyeLQMSD3ZJtFI0HAv6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Xk1M+ZFr; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Xk1M+ZFr"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3o5dH2929272;
	Thu, 25 Jun 2026 12:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lugr/M
	vCAiyPlrXsVqXnUlMM57kBVV6maKbxu4mF3e4=; b=Xk1M+ZFrmF6yiuKWkJnHwP
	DJQYl4dACOxM85vNDQsNoQbsjAbsdwzTRTaaJab1UagsERgJK7mk02Yq57PW+LH1
	yDuyVYJY+9yyId4fJSEEvp4mGo7LQ62KJSNVch3z9wi6NWt9HZsg7F9+akDA8GpC
	2T+XfUuMjnOtQYqM07M87A2BwNhKkU91JxHOlkIvC03NJTPgYX0x4lKYzYbLZLSK
	d+cUNi9tzx2IFW/BgPCE+ZlLQWw0+f0NdqHsekLhPbBwtEIg51M5vEKUsoBJhZUf
	Q/WWeODl3BHLjPsQypBL8wKv9ovvn30MVF860lX5sofkj587/WVaiNUO6YxJHw2g
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewg9j1sxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbTc019807;
	Thu, 25 Jun 2026 12:47:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex56qpcbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:42 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCldYP53543352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2235520043;
	Thu, 25 Jun 2026 12:47:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FDCA20040;
	Thu, 25 Jun 2026 12:47:31 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:31 +0000 (GMT)
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
Subject: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Date: Thu, 25 Jun 2026 18:16:28 +0530
Message-ID: <20260625124648.802832-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625124648.802832-1-sshegde@linux.ibm.com>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: BmESdySgGYoWGR_ci6G3dLGNv5lNDP2s
X-Proofpoint-GUID: 2iCD421l3Lf0DSrSEPqik2y2A8alyLiw
X-Authority-Analysis: v=2.4 cv=Y4XIdBeN c=1 sm=1 tr=0 ts=6a3d2370 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=0mhcXptKf_jZ1Pm6q6UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX6lvkLXkImdqo
 BZOFZd7Q+5fV5rmjJyqtEgUBJwUZMmLK0wTSg8+5WI6ROmW/5yoOE4HNdTz4CHbaElfByNW+sx9
 dRyfH13hXjwkrbYPTmUaySgpn/7LVYWC9SFl+QG3ElKgnMu3nJ/hdlXKaqDGUMMH01+j6P7fNhO
 JyK9n8GFSf7XDOa9QKzMM7Yp0lugCpRs+8cB4cgH7cxzBUtFPtJk2W5+HVtfkYyXPFhE+8MQ0qW
 vqRt+oQzrOadFKNJqk4pkqMLtERTfwg/uLcCYwQn8XMW3+DHsfbzjPRhDFplm++U7WPiWNN65sL
 lxCDANPzzpFN89moe7E3Do1ft1AB13edS81m/W56FwaTxSv2Hrb+7HhPKQo8AeYhx5AdE+Y+urP
 V7R5ah6Rkl7me7cxLbTScKj1X/9Xb1qFChkyNcmPW3ecEPf+rnn7Mf4Ym5PcrIyUvVpjtyxlobQ
 tpC25Y67muzT1UgCiIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX0T4BejzPEQcN
 NerVLXrmNDgxtQu+QPsEkNOXSowD9xuf5b7WOxKIGasTNLpAYbTegT17B/pCdr/Bp0Y9pgTTOuj
 Ughmu+EiigU6t/dlMd3Osj1BBoSpvBI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

This patch does
- Declare and Define cpu_preferred_mask.
- Get/Set helpers for it.

Values are set/clear by the scheduler by detecting the steal time values.

A CPU is set to preferred when it becomes active. Later it may be
marked as non-preferred depending on steal time values with
steal monitor being enabled.

Always maintain design construct of preferred is subset of active.
i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Make it macro instead (Yury Norov)

 include/linux/cpumask.h | 21 ++++++++++++++++++++-
 kernel/cpu.c            |  6 ++++++
 kernel/sched/core.c     |  5 +++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 80211900f373..5a643d608ea6 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
 extern struct cpumask __cpu_present_mask;
 extern struct cpumask __cpu_active_mask;
 extern struct cpumask __cpu_dying_mask;
+
+#ifdef CONFIG_PREFERRED_CPU
+extern struct cpumask __cpu_preferred_mask;
+#else
+#define __cpu_preferred_mask __cpu_active_mask
+#endif
+
 #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
 #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
 #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
 #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
 #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
+#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
 
 extern atomic_t __num_online_cpus;
 extern unsigned int __num_possible_cpus;
@@ -1161,6 +1169,7 @@ void init_cpu_possible(const struct cpumask *src);
 #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_mask, (present))
 #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
 #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
+#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
 
 void set_cpu_online(unsigned int cpu, bool online);
 void set_cpu_possible(unsigned int cpu, bool possible);
@@ -1256,7 +1265,12 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return cpumask_test_cpu(cpu, cpu_dying_mask);
 }
 
-#else
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_preferred_mask);
+}
+
+#else	/* NR_CPUS <= 1 */
 
 #define num_online_cpus()	1U
 #define num_possible_cpus()	1U
@@ -1294,6 +1308,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return false;
 }
 
+static __always_inline bool cpu_preferred(unsigned int cpu)
+{
+	return cpu == 0;
+}
+
 #endif /* NR_CPUS > 1 */
 
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
diff --git a/kernel/cpu.c b/kernel/cpu.c
index bc4f7a9ba64e..d623a9c5554a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3107,6 +3107,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
 atomic_t __num_online_cpus __read_mostly;
 EXPORT_SYMBOL(__num_online_cpus);
 
+#ifdef CONFIG_PREFERRED_CPU
+struct cpumask __cpu_preferred_mask __read_mostly;
+EXPORT_SYMBOL(__cpu_preferred_mask);
+#endif
+
 void init_cpu_present(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_present_mask, src);
@@ -3164,6 +3169,7 @@ void __init boot_cpu_init(void)
 	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
 	set_cpu_online(cpu, true);
 	set_cpu_active(cpu, true);
+	set_cpu_preferred(cpu, true);
 	set_cpu_present(cpu, true);
 	set_cpu_possible(cpu, true);
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2f4530eb543f..9e16946c9d62 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8685,6 +8685,9 @@ int sched_cpu_activate(unsigned int cpu)
 	 */
 	sched_set_rq_online(rq, cpu);
 
+	/* preferred is subset of active and follows its state */
+	set_cpu_preferred(cpu, true);
+
 	return 0;
 }
 
@@ -8698,6 +8701,8 @@ int sched_cpu_deactivate(unsigned int cpu)
 	if (ret)
 		return ret;
 
+	set_cpu_preferred(cpu, false);
+
 	/*
 	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
 	 * load balancing when not active
-- 
2.47.3

