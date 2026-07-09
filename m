Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD43ADB9B;
	Thu,  9 Jul 2026 21:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634294; cv=none; b=eJVzItSRQUO6D4Ff/7gR4ncAHIKQwMlvDZPtcdw9wJ+D/dTljZFsKRm+gSVaHleTG+tO5c7QNC6BU/XV+8OtXPnFOhMli+Tn0EQ3P8/Od0nR4Njc8vtNM06aF2L1ttKKScVV/xRJTEw1M610JTmQZ+/nyaO01zPA1lICe4tONBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634294; c=relaxed/simple;
	bh=0cDEOPja1HSuFx588bbI/ECaDC3Zj02GinqNbWIZPxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVmagCpLqlfWyslxinmUD7aWuQQm+uU7YJxnHn8+2V2eh1PpDqOGfjtgBQaE5Av2G2xHiIP0D+c7JI5OVGIsKnj7vGWA3T1k05bp6ZNdW4R2cZ9J9YwTQUQ067WwUYScaGm/jFdhJPMOxB3erm7HhHeE2hnrWJl3PPk2/WZyTKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bRJZh6tX; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bRJZh6tX"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Hn7uT3005819;
	Thu, 9 Jul 2026 21:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=nyYD+vXANwLVlmZTs
	9JyJror/O4m7uFfr9bzlVcYsdU=; b=bRJZh6tX8Dz5NfKO8u0dyWvbnq4Fjeicw
	5pAd2y6M2qenvoU6mKk/ymYN1LEtaSPEskwhtZNk9vKsxAlmRvZ9rf7E0cWlWER7
	xbeGpsGnHfe1X6qDGMZXhROuto6znKiEAHlRIKngdujGOVfuuld6duNgkKMSeFJ2
	Fjy4wTroC6PRXvyqf9bYdIzwLJwyfGqsaHktVZgDmKDR/Lrp3eXGFzKV/hlwuBH7
	pvc35qpFy0zQsX1AxPaKK5Vd06T/U/TRALIGUQ6/rRHxhQ7o83JdVCTu9+3Vnr47
	TCAmMulC2/7iJopyZKGIpmpwgBrnIECZQZl5oBAyOyoL/bz/WBG1w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qknu8rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 669LnoIL023882;
	Thu, 9 Jul 2026 21:57:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7eqgexd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 21:57:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 669LvOsD49086890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 21:57:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02D4E20040;
	Thu,  9 Jul 2026 21:57:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA38D20049;
	Thu,  9 Jul 2026 21:57:15 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.26.144])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 21:57:15 +0000 (GMT)
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
Subject: [PATCH v7 03/12] sysfs: Add preferred CPU file
Date: Fri, 10 Jul 2026 03:26:39 +0530
Message-ID: <20260709215648.1246821-4-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a501949 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=md4hqiRJsRObfrzgdmAA:9
X-Proofpoint-GUID: Bw-7cGqKhZrIEmfXAfabpSZ1wmvL58ER
X-Proofpoint-ORIG-GUID: JoeWxLCuNdg5-T0iONB7MkOPRNfJVAn7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX8blbPTVeYmqt
 9owElbmhLSuT6WCIJ0L4ChurMMu87Emmw3MSTUJ6RRbdUPZv7mI9xCz0oAZe4cKI7Ku1TXl8mQb
 t3IAn0y6udpmU/FlsunlcE26OZlOdtE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIxOCBTYWx0ZWRfX/2Qla959E8sZ
 G0KyROHeRXB/VQYFNTMaY8ppygHYGy7u/luSm4DfLYccqWuBZ/CjXFnTBCfXQdnTBpjTM5bWMW0
 RMkXGLbDow8Ab7MXjyjwlVmYklmn1pf5o+P6D8Oeb8oSjPIatEhsOovAkzUMq9OUZy+On7vuyqc
 rs7la/09FLMTYyZ1FiDJp4h0448ZVHUkjUZXZCenM1hQyS9lmv2K4MOaoYnWY0I7IkCIORY+/Fn
 Oyg8FSAhYnnvhaZuf/0zMMBS3VrXjIaelUwnuQxP+qwtr1P/xu18jN0M+SVGvmxM7zeL8+mKxq1
 9q/kqZ7eNru+6Jq9Pr8tsquVT3cq2XgKrL4vyuN37c0CuEGic2p9tl+0nPDdkpzNHkcOSfXTMBM
 XIGJ5Hb3r39yiZSHZcIq7QHInbCyZ5VHUaZQuHrgE7h/ZTJwxCQk9e9TbzEC1MFfoZ+98heLty4
 EQiS8NzauVJAsqftBaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090218

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
0-719        <<< All CPUs are usable. There is no preference.

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

