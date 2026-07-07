Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA683AB5DC;
	Tue,  7 Jul 2026 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406906; cv=none; b=fUBjklkmqO/vcbINcjt1+MwBbvGGKnkuDtPNDBU8Cg4PDYOJQXs2NuQXMv4pwI8lUz85cHwgflDqVbhPBpCTDuUY9D06BqAWoWrOWxY4mfCAa7Xbj45/jgUymuQxzWZutIqoZrzVKdAS8BIJLYu+KlknhziLfLhs3M9rffsFPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406906; c=relaxed/simple;
	bh=1ydsa+fOQJZODM1Y+IOoRshQlH1TQjxeguwrEGSBnrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDyXdXPzGcmMfaXX5i6rXymmitySY/goLWHFJtOb+6I3cOtDpjdJJH+QNFLQ+gceuwXs4hDXsRym0jQLtQ/5yQBD0hShfPf7drcPReRp8Hl3ofGxEP8FrXiPJHPmybCj549Shq0gXyVfdB2inQms2u67L3vMOOJOl2g8oQNfcks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tb68d3LC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tb68d3LC"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674IMCj2519194;
	Tue, 7 Jul 2026 06:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HRvaSa
	kncrh09qu13k1xczOPMDayMpdxhshKMIwUdJM=; b=tb68d3LC9aMr8GRzjpEy0h
	i3u59pb2dvwhOzn4siG/g5GdLx0nydZa2ZdkG4fBPcg3oiJSKX6FzIMAZc4oRlu5
	hrgeptBBl9hbT5DG2ZcYTrVppzZh3UCJGka7EGk8hbgiazYARdjDfwBzWQUP9EIy
	Fnz2qcvIxX8cVqxjr6Vdl7L97Vxr1OuiTCJB5vzbtc+oQknulOnKlbgsKXbPpPJ6
	+dpQHX2E8vnMon5GDhpbPO/HPCGPrLnohD9tFegRwl6Ylimun+lGsLiw3/cqtzTb
	MqqQnLlIEc2cCbBPArZ99HhZ4RSj6+xNoA3tjKMTmUNkEW9S7Syk4fiIoMuEqPgg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qkndfqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:48:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6676Yc6A010050;
	Tue, 7 Jul 2026 06:48:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7dgk1ce6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:48:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6676lvur48628022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jul 2026 06:47:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B60BE20043;
	Tue,  7 Jul 2026 06:47:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19A2520040;
	Tue,  7 Jul 2026 06:47:49 +0000 (GMT)
Received: from [9.124.214.176] (unknown [9.124.214.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jul 2026 06:47:48 +0000 (GMT)
Message-ID: <796920fb-7355-4c5f-aa7c-6ff8a4c55b7a@linux.ibm.com>
Date: Tue, 7 Jul 2026 12:17:47 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/23] virt: Introduce steal monitor driver
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-13-sshegde@linux.ibm.com> <akf9cE22wvPeYNiM@yury>
 <akf_Kg3jaenNbb-g@yury> <ce2b5699-8e22-4eb4-bd55-c3df5ff30f74@linux.ibm.com>
 <akv4vGpII2tx4gSZ@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <akv4vGpII2tx4gSZ@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a4ca123 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=NEAV23lmAAAA:8
 a=7b60b9dzrNT4AM6lYCgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dkpKwFEarqz-Pm6DD6P1_dyhKgddLeEt
X-Proofpoint-ORIG-GUID: VkeC1_Ti8Y1XqOMbmrvwe9lvWGR7yPY7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXxbzcie/fOYO4
 dNp89MCtawOWOfZSO2gnqRmk+arH9jgraqZzOxF2AxoaoaJI+MFcTUmHI8GpocFRvBqpBf3+BHd
 aWaRxiLJtSUX6I3dxm1U0Lpx60cT2Uc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXxHAj3IF9qY5T
 blHJJOPdmZLIbMC+f3+QHMSuFO9rUv+cv2HG1VLve9rxW+lai/c+sjYrqdKBnfc1lhtd86z1bA0
 RRvSgU6JEqBKVMhGH2vhLiHec3pbgvkLOJsC7LRqFUW3P5r7wn5a8y22wy8wGmqHA6Cq3b5tHMT
 ENV9pf7yJphlXX/CWfFu3keHxUw3Wu+WxNQgX4MQCf6IKhp7MUmNXMf28cOHJZqRccKBzy6OsuA
 tzbfZ8F/JtaiwFpPcHOwSL/7NSdf+L9KHvjVeJRvLEKTEkPc7cuvcbmswQC7RymZrK5MKuUuPcg
 exE6FY3VELhn/KB+ySRM8uC1Ymh0pGQzm8yf0daoMcg1y5j2Axo9GH4h6CeaSfR8vMEcQPMWTra
 BOFQR3dBmZ5FzXFENPl1CTqo81cI9NQdJQdmqAnyQXiU16/HMF8oLEM1uvtl2QNQwmkBpnBDHgD
 pWZO5SlmEqz7FRH6QpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064

Hi Yury,

On 7/7/26 12:19 AM, Yury Norov wrote:
> On Mon, Jul 06, 2026 at 01:54:05PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 7/3/26 11:57 PM, Yury Norov wrote:
>>> On Fri, Jul 03, 2026 at 02:20:32PM -0400, Yury Norov wrote:
>>>> On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
>>>>> Introduce a new driver in virt named steal_monitor. This driver
>>>>> will compute the steal time and drive the policy decisions of preferred
>>>>> CPU state.
>>>>>
>>>>> More on it can be found in the Documentation/driver-api/steal-monitor.rst
>>>>> Introduce the skeleton code first.
>>>>>
>>>>> There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
>>>>> - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
>>>>>     loaded by default.
>>>
>>> What if I've got my own monitor, and don't need this one? Please add a
>>> way to not compile it, even if CONFIG_PREFERRED_CPU is enabled.
>>>
>>
>> You mean make a new config like VIRT_MONITOR depend on CONFIG_PREFERRED_CPU and
>> make it as default n?
>>
>> Can we defer this until such a new monitor is needed?
>> We will in state where CONFIG_PREFERRED_CPU=y & VIRT_MONITOR=n.
> 
> I think the VIRT_MONITOR should select PREFERRED_CPU. Whether
> PREFERRED_CPU should be enabled without an in-tree driver using it -
> IDK. Probably yes.
> 

That's good idea too. User has to enable VIRT_MONITOR, that will select
PREFERRED_CPU. If any other driver wants this feature, it will have to do the
same. Assumption is whichever driver selects PREFERRED_CPU, it has to ensure that
design constrains are met.

I did below. I think this is what you meant. Let me know if i got it wrong.

---

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 52eb7e4ba71f..a52233b2502e 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
  
  source "drivers/virt/acrn/Kconfig"
  
+source "drivers/virt/steal_monitor/Kconfig"
+
  endif
  
  source "drivers/virt/coco/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index aff715cea42d..b67fd8968ec3 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,5 +9,5 @@ obj-y                           += vboxguest/
  
  obj-$(CONFIG_NITRO_ENCLAVES)   += nitro_enclaves/
  obj-$(CONFIG_ACRN_HSM)         += acrn/
-obj-$(CONFIG_PREFERRED_CPU)    += steal_monitor/
+obj-$(CONFIG_STEAL_MONITOR)    += steal_monitor/
  obj-y                          += coco/
diff --git a/drivers/virt/steal_monitor/Kconfig b/drivers/virt/steal_monitor/Kconfig
new file mode 100644
index 000000000000..efb94b3a60e4
--- /dev/null
+++ b/drivers/virt/steal_monitor/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config STEAL_MONITOR
+       tristate "Dynamic vCPU management based on steal time"
+       depends on PARAVIRT && SMP
+       select PREFERRED_CPU
+       default m
+       help
+         This feature helps to reduce the steal time in paravirtualised
+         environment, there by reducing vCPU preemption. Reducing vCPU
+         preemption provides improved lock holder preemption and reduces
+         cost of vCPU preemption in the host.
+
+         By default preferred CPUs will be same as active CPUs. Depending
+         on the steal time when steal_monitor driver is enabled,
+         preferred CPUs could become subset of active CPUs.
diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
index 7c16f8cf9583..d206e048a9ea 100644
--- a/drivers/virt/steal_monitor/Makefile
+++ b/drivers/virt/steal_monitor/Makefile
@@ -9,6 +9,6 @@
  # It is always compiled as module if CONFIG_PREFERRED_CPU=y
  # One has to enable the module.
  #
-obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
+obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
  
  steal_monitor-y := sm_core.o defaults.o
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 01b908ff1740..ed02e4431230 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -194,15 +194,4 @@ config SCHED_CLASS_EXT
             https://github.com/sched-ext/scx
  
  config PREFERRED_CPU
-       bool "Dynamic vCPU management based on steal time"
-       depends on PARAVIRT && SMP
-       default y
-       help
-         This feature helps to reduce the steal time in paravirtualised
-         environment, thereby reducing vCPU preemption. Reducing vCPU
-         preemption provides improved lock holder preemption and reduces
-         cost of vCPU preemption.
-
-         By default preferred CPUs will be same as active CPUs. Depending
-         on the steal time when steal_monitor driver is enabled,
-         preferred CPUs could become subset of active CPUs.
+       bool


> Enabling some random driver, and even worse overriding user
> preferences looks questionable, at least.
> 
> I'm one of those who build VMs with the localyes config, particularly
> because it decouples me from rootfs headache. So please let me just
> compile-in your monitor, if I want.

