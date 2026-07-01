Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CB346AFD;
	Wed,  1 Jul 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915524; cv=none; b=rLaUsriDLpgSVc99YSynjwirr1SmW7tDooNK3Eb4KMHx7ZMhVp17rvQNb9RG68Sitcj0//w/dGUDsXVpwRI8ML7HW3C4XVUQzem3qoJ7hNp0Bu7hB4ZpD3GaNyZKN9iggCrn097YDhqxFf28cW+cyaNSUhyzNZZpeIHFhgvED4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915524; c=relaxed/simple;
	bh=2m/0mRyGQl7R5ITwFrhrGnPJFGFFTw+kC7SDoedhAys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWx66EjsjTFg7cS8itSqgUepUuaSVl4/8u1L2m5pdis3mGdIRlVnAAdELKe8ZcEAcrQ4X8sEVxaRm1g6TrheFV7KTzVuFldwCia9TvnBLPAEfyejiNPnwaStlaBIOn8/ytadhWiZVy/Z4pADIiSJIgb9msUUhfbhYG+TiKA+H9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RgsQQVzK; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RgsQQVzK"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AITRS609502;
	Wed, 1 Jul 2026 14:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=FJ1LDDxenWiBUVGVQ
	JeJXBbjuVkr1WOiK4fFk06uy5g=; b=RgsQQVzKj2XrxeZDwzXr/hPD6E9Xdv48b
	f4PjvxWJhcwJo+D7MdefCqtlhGjl9wI92PigVBQPfML4jgJFaQpaHKqnIxKGzr9u
	EszjYbaFz0QknZ/J+b9WLIUYFHEfdRuTNIs+9aJEAstFG7Rk1e0HSXVThxOnBiAp
	XGwZRFDEMfVaHQIPSNGVeJGGFNt/0n4aEJYBfIfGy9W5u3TJxUOJbpFe2Gyd2u3M
	sco1RKsaHft3UVzy30jT6Ju0BbxngsndXoJlKZZIETaRV3EGY0sx/8coycQRyp5Z
	Gq7ifHfeWWf82/LBU34rtGyl/KKB2r7MSMGsE+4dU31+rLgIJqS7Q==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe5021-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4iAH013600;
	Wed, 1 Jul 2026 14:18:14 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f2suk7mq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:18:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EIAmX27984136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:18:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DBEF20049;
	Wed,  1 Jul 2026 14:18:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A387A20040;
	Wed,  1 Jul 2026 14:17:56 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:17:56 +0000 (GMT)
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
Subject: [PATCH v6 04/23] sysfs: Add preferred CPU file
Date: Wed,  1 Jul 2026 19:46:35 +0530
Message-ID: <20260701141654.500125-5-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: Skcjt2DKyiYSWtPamZKTLmtssWK8fJkK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX+XUOzsemHPKa
 lM/eTkeBEgJcC+V5Qnx1H1U6gSWh8QkJvVr7PJ+rQn6EnXKsbUbOYj6e/4sQqaltiWJkDtd9QZh
 +xi7d0d7++ztCYpTSFyVFOnnmkY7Ruo=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a4521a8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=md4hqiRJsRObfrzgdmAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX1fM5puy2/pa4
 Kux8z5iBGQ5T4HNH43aXPG+yP48hrcaCi5sUVrmHLIccT21AHJqfRzL8cb/Awr3LCihhImZa/T9
 wD96xHdMle/AitaZmx6Uj9+GsXYyq8z/ZpPh/09dyho6NLirEnzQ13qfh+zQC/pnR2lfLw0X+W5
 zYJREhKBXu+hT0tbNxT1nKsBQ+C6VL7r71x28peJfQZui/ifr6QR0m8/aMjdnl6wjbwa2cvrfTK
 tEoJEM4Tv88zhtmyo7UJgH96zphr8MZA+cqaMLbsngzLpH3SW/ne4mSNgbKwpkanouA512ukjrd
 OhOorX9k8VnJUvIaNxBDQMYv8RC/Z1zkXBsCHnTz/uxD24EvN8d6LfhsR37cWvM4k3gXzJxZhcc
 1dxCU7poaVcQGw9WNVcMQZNxxO1qknp/ymEz7qTRsZKuKKYzNx88c4aF4/7YnDJaFYGYUCUL8Vy
 0Z8vn9i9nZa57rjAF5A==
X-Proofpoint-ORIG-GUID: EptDlQYxw9wzaU7JRV4aHIAPPOw16fWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Add "preferred" file in /sys/devices/system/cpu

This offers
- User can quickly check which CPUs are marked as preferred at this
  moment.
- Userspace algorithms irqbalance could use this mask to send irq into
  preferred CPUs.

For example:
cat /sys/devices/system/cpu/online
0-719
cat /sys/devices/system/cpu/preferred
0-599        <<< Implies 0-599 are preferred for workloads and 600-719
                 should be avoided at this moment.

cat /sys/devices/system/cpu/preferred
0-719        <<< All CPUs are usable. There is no preferrence.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu | 11 +++++++++++
 drivers/base/cpu.c                                 |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 82d10d556cc8..ac1dbb209cc7 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,14 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/preferred
+Date:		July 2026
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		(RO) the list of preferred CPUs at this moment.
+		These are the only CPUs meant to be used at the moment.
+		Using CPU outside of the list could lead to more
+		contention of underlying physical CPU resource. Dynamically
+		changes based on steal time. With CONFIG_PREFERRED_CPU=n it
+		is same as active CPUs. See sched-arch.rst for more details.
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 19d288a3c80c..4ac990efee7c 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -391,6 +391,13 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 }
 #endif
 
+static ssize_t preferred_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
+}
+static DEVICE_ATTR_RO(preferred);
+
 const struct bus_type cpu_subsys = {
 	.name = "cpu",
 	.dev_name = "cpu",
@@ -532,6 +539,7 @@ static struct attribute *cpu_root_attrs[] = {
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 	&dev_attr_modalias.attr,
 #endif
+	&dev_attr_preferred.attr,
 	NULL
 };
 
-- 
2.47.3

