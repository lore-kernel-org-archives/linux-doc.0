Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93B3DCDB7;
	Thu, 25 Jun 2026 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391678; cv=none; b=Yr6WTeAsfIrIywWUoriR1rDVps+QY13iwbYkjkZqMn7lJLvnPMNOleaw+omfQWBX8rgWtmhozAVGtoY9nvFSZMK7m+5O65c8NWrik+ZlB3S26gr5UYZqUlYZK5829HJnjTU0IeJPDHqQ/yrWn/Mzab68c9GvpAhpy+2RcEpMYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391678; c=relaxed/simple;
	bh=qxOXcezANNyjjghGOCsWqm6vsNzzfUmo1bQkC62VLjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYdyG78ONHhuTBBLq9P5jsutKJuOwFK/uqJvRdSSbk+qqv/78MWKe1drcEkZRXP9BTmB9Zh3e/JvAUajUWQ0whSDVuxDbRejrNW1ES4JM09wX4uzjkDv67PjuiGPTUkkBCy1k6k9Otko1nrWbwVrKmnNMf+sy5PT9IiuVlpAQSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=q44ZPQX2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="q44ZPQX2"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3mKp03040804;
	Thu, 25 Jun 2026 12:47:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=2giyrz63Z6HaaK/uE
	JvX5rpIgKrr+DHy8UTlZ9gnny8=; b=q44ZPQX2c4B69n2R55n88EL67h4cMOihT
	lVwPjzGYZG5l+jPv7FktGjKcq+qNyMN+HIjzHpgGWU0iJSQEl4PxZVweEDphX6gX
	54iTErPstsOOTsXQg6Gdsf+aVLCo/xQlPCjW0CWrRQN+BrFz06XnoEy42PPLRYKb
	CC3B0ajF7Cg4kefy0WXD3vjazR13jFHnmCdzfpEhvoibahbMfXpo2fawm7PxiXwJ
	QEF9X9vpkvvKN96vblqIAv8VH3SI+oNVPfHNQEt62bkYYF7XgO+gATW6mlqK48FC
	uJxP0dvKZFaBZtOGQWKkCmdCYfxq1JN7A1573yVUuOUiCDRXHl77w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3svsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PCYcEs002251;
	Thu, 25 Jun 2026 12:47:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7vywuqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:47:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PClVYI51577140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 12:47:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E79D620043;
	Thu, 25 Jun 2026 12:47:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 417AB20040;
	Thu, 25 Jun 2026 12:47:23 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.20.6])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 12:47:23 +0000 (GMT)
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
Subject: [PATCH v5 03/24] kconfig: Provide PREFERRED_CPU option
Date: Thu, 25 Jun 2026 18:16:27 +0530
Message-ID: <20260625124648.802832-4-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d2368 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=BWPB87uJ6lDr-Q8--dwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX7lDN5t0U+W+a
 GWqtPzbuxFG1+UyJwlJq4ZHDvLIecNd6UEaxZF/bqGYOWnRseqjE1OnfQWPqyLOueBxb04+DXZA
 l5/EIlGbNWCXGsEDfmy1UwvTkLCKvvE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNiBTYWx0ZWRfX2zub9DO6M+47
 5kEppv048fl/3qmNeEdC37wk81OhU5wV3hvxd0OZAFtkMS4pA3HBhGd9MdmjdcYXwqmLCeOQtyP
 TzY/vkYxxGZCRor1ToB2S41AUYdgKohlHarzzTb4gONFg9aPIF6LM/eSAPgNeALlbdts2PyNPro
 b1YsLn2P0T5TOKc0RLC7km00rHv9Yr7Y3Xy2z7P06XtVscSPRQlQ6InEVbIO0uv8zDzQMbpLebv
 +Ydhu/t5o19Il7LYH4sY2vq/t3yJ8GnFcjJrXoy20at5xTfjv+X5GrAS5VpseC4NpMChWZkJIen
 ouFLNNVT3rQ1An3CBnU37am6/Nes+Aucch4Ce+em+sOic0I4wRwGwaiDCxYgFHqtZML7HQjPR8K
 I0oGgN2C+nPij0zNkc/JYY/97DbHQNsepTjmqA7cOogAq7g/VdKxxeACkzA9RiRcKbwVbTjf4/3
 gDLtuYbY9RZCpPHb4Sg==
X-Proofpoint-ORIG-GUID: UUFQ660aiWSbEPKAdleuJ5HlK4CEgbzX
X-Proofpoint-GUID: HE9Oqa2Uc3u_kUKpCIPrcNqwZJLyGUSJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250106

Introduce a new config named PREFERRED_CPU.

This helps to:
- Avoid the code bloat when PREFERRED_CPU=n. In that cases preferred
  is same as active.
- Avoid the ifdeffery around PREFERRED_CPU in many files.

Since paravirtualized use case is the main driving force of this
feature, make it default for kernels with PARAVIRT=y

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v4->v5:
- Make it depend on instead. (Yury Norov)
- Fix helper indentation (sashiko)

 kernel/Kconfig.preempt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 88c594c6d7fc..b3a543cb44cd 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -192,3 +192,17 @@ config SCHED_CLASS_EXT
 	  For more information:
 	    Documentation/scheduler/sched-ext.rst
 	    https://github.com/sched-ext/scx
+
+config PREFERRED_CPU
+	bool "Dynamic vCPU management based on steal time"
+	depends on PARAVIRT && SMP
+	default y
+	help
+	  This feature helps to reduce the steal time in paravirtualised
+	  environment, there by reducing vCPU preemption. Reducing vCPU
+	  preemption provides improved lock holder preemption and reduces
+	  cost of vCPU preemption in the host.
+
+	  By default preferred CPUs will be same as active CPUs. Depending
+	  on the steal time when steal_monitor driver is enabled,
+	  preferred CPUs could become subset of active CPUs.
-- 
2.47.3

