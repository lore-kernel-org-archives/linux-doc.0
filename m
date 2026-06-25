Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67E3E0087;
	Thu, 25 Jun 2026 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391749; cv=none; b=qAU5IzkqehG+QOvKROcgQZiyH6UwjouQScWJP55VkiKeDLqft9KzKQ0Dgjw17MrgYne3fZlMWglMNtdIfcN2sihPdMGLJGXcbowlWfdjNXi0dMlmA9JjOGrsuJINQ/bVSs4Zy0YcaTbcE4QfwrE44JogBcmoPGqviGEinRzzivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391749; c=relaxed/simple;
	bh=JzJPKc21H8pZZq8N6Vbh6r0Qw2ALS0gCFGYtZjOkOgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDJ9XOzoerXJK7SdICGVSWmw6Nk1Ebpw2aO326H+Tq+scO6mWkncSf4nqvLqRBKe/Ydp94GiGrq6rGIlLD6tRsnd3yVSjhym+XCw3irLG5UGP+WdkilVBTcGVFpqUuCFOcqE8ZFaExc61+zHpt5+Wef+Yhxq+0mvIZ94NGxXdQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VwJ95pkw; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VwJ95pkw"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mHWF3040722;
	Thu, 25 Jun 2026 12:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=akqdjoOLD38kZE4G9
	1ivjxHVgJiEWq0/Ka5nl/0hDaE=; b=VwJ95pkw/Fp6hdC5FN5pL/F2ZTeNJFpQ2
	5RHGEXfElvwCZkbtsU7/zrnUcogSjDL5uhU2Qe/qVybFeAIDkNv0WF4U7G+MA1l4
	QwH4hkHliigm/BTclenYOT/jwXUsonyJnwI8Eb22A2aIWaebAXBoLTA/wRmlbxxp
	0CmVkpg0dq48HzQ/Tj0TfZ07EJAeBwHdv8PDNvkAce5L5lA4yYRD1mMlHggl6kOx
	gZeT4ghiMZ1lDf3FTyZBiDMWHkwDOLgOsm9DVbvdaM5gCGFU8YnQ7cRoc+JkNsZ4
	4dOGBmhkJRVbAc6uVzEUuB0hPyD4rxIMkv/bgqQ2ViIPJ+9x9HuRQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3svtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:51 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYbos002240;
	Thu, 25 Jun 2026 12:47:50 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywurc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PCllMm60883280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:47 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1C1520043;
	Thu, 25 Jun 2026 12:47:46 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8519D20040;
	Thu, 25 Jun 2026 12:47:39 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:39 +0000 (GMT)
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
Subject: [PATCH v5 05/24] sysfs: Add preferred CPU file
Date: Thu, 25 Jun 2026 18:16:29 +0530
Message-ID: <20260625124648.802832-6-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d2378 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=md4hqiRJsRObfrzgdmAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX4aBuf+1Qc659
 Ib/XLu2WYVrlauvioiCw1nI6Z930R5NvGhsw3nV0a6WlZ/fB3iefu1GdR0dhfnhAERg98Pmx18s
 gfiI2/U0LWWT+BlzSo+P0Yf89k0Pma4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX4YrJhqkrlBhU
 JsbtyFGCyqJrMw8qc/PPvD7gnC8AGDVy66/C/04k+nahw+r06ne1P26H1NBcBwgJxqqAXDjM67p
 LGtDBoO+W/7e58GJ1q1n/6b6w+6cV7/mbsZGq9hGh6DTvoz4cB5NP7Nhc4nHfK5ti4zTU8c04kc
 c1SA0xMd0pzlvMEnYJTq/GdJX4NrRrD8xr2B+2gttGFVtuM1FTGNoXolNZWR7ssCCVZRK9k7z/W
 d2a/wHknK7s3wGzSEocBFuyWhjk59iub8pp2fB2i6tAsP3++4NveBqlmokPESvch2sf13/OCbAm
 R3BeWG3JaxVRo3g5W6/YyMn8cyvjPqunHalhKX6H1lrFyVRJgRdCQfGVVzmITbET4nOZjXmMtul
 Rgh3EL3h+UEZP1xq6tbhPCwQ5EVR6YwU0CjtoccnCBRELynDUlgsKPl1dncnkVPBgREnaEYg+AN
 CnIPNZUo5E4y0niEgBw==
X-Proofpoint-ORIG-GUID: M6pcn4O5TrRfrNDex3HBs1TE2crNotNw
X-Proofpoint-GUID: EmUHC0TvEUfDkBvYKxcXpuw_TzYsRf-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

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
index 82d10d556cc8..5fb973d53287 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -806,3 +806,14 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/preferred
+Date:		Jun 2026
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		(RO) the list of preferred CPUs at this moment.
+		These are the only CPUs meant to be used at the moment.
+		Using CPU outside of the list could lead to more
+		contention of underlying physical CPU resource. Dynamically
+		changes based on steal time. With CONFIG_PREFERRED_CPU=n it
+		is same as active CPUs. See sched-arch.rst for more details.
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 875abdc9942e..0c6647805805 100644
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

