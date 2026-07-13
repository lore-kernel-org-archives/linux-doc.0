Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515813FF8BD;
	Mon, 13 Jul 2026 12:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944410; cv=none; b=QRwnkASbnaaYUYfkDT6m5syP9xlLQ+Olyd+jJ7JfketSx3u0muhyzHRk623qlAAEFXVZi1u3XOtfxEye7dRewQ/6j6mxy+YrmDF1dO6AgEZ2Z6Z/gOUijuKg8gyp/e9y1oC93DUztyUxAAQKMzWMzKcyrWtJFBojYgw0VyJz2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944410; c=relaxed/simple;
	bh=PBnt0Q0clVRvXFz7UPmITy4Tp9Lm80ILOlGw/NtC38g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3rJzXba1EeNuY0VP7ppIw8ie0ALU3XVC1GAMxL1/BKVJWt38Xa0UUH2ujtWk7kYokzNteSqbjms35dKXikE1GYWu2VzyOdql0fEfHRz+moiB2WdduM3Pr531Yeg+z5qIQrhARBvdQzJJuevCyHQjy+Jj5KGjf0ThFoLstuyvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=GGFbGnse; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="GGFbGnse"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6g63U1741163;
	Mon, 13 Jul 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nfErtu
	gnBPnqxsVxnBgkxCn4vdvzTBO1aUFoyIO6SC4=; b=GGFbGnseIRGim1LkWHF55Q
	KjvUhVGxSaX2vc9KoIjWHvgB1Np/rU2zcwunuemhFMMw0NFaAsuu745f9CosQxkg
	zGyS0/h8TbVJB+eD7775EQaBQwiauHVo3aPcOz/eNIp6EcjOxGLbu87FXyuSdL6w
	A+bGm0rJHa7O0HQ3MGQQI5fAuCPSnQq1Hcmz/l1yodKJcRDPNYLBckbgaB3+s/Ys
	yAxVYtpqYaGsQSyNWDS4crd+ijvEMx8hobYQ3pUP8xOAGleDRllEek8fomvBeQ17
	Tt6ucsnoJhouhbaK3w6msiehdEJ0fidAK2tLJ7o+EtpErtQQenN+OKSPPGrqlj8A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbegt0guy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:06:30 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66DC4jmx026448;
	Mon, 13 Jul 2026 12:06:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2uxw7t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 12:06:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66DC6PDp30737080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Jul 2026 12:06:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DC6C2004B;
	Mon, 13 Jul 2026 12:06:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C08420040;
	Mon, 13 Jul 2026 12:06:17 +0000 (GMT)
Received: from [9.39.29.148] (unknown [9.39.29.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Jul 2026 12:06:17 +0000 (GMT)
Message-ID: <abb3fbf3-bdd6-44ca-85e7-0e1659381e61@linux.ibm.com>
Date: Mon, 13 Jul 2026 17:36:16 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] virt: Introduce steal monitor driver
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
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-9-sshegde@linux.ibm.com> <alFb0PBu8P44DmXD@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <alFb0PBu8P44DmXD@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 7RIM5g2KP79OOOHUTqJk1Hi6kYCWSAeO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfXwX4cLtNLOnDN
 WTMBZ4mjhUJTN6E1Vh5DUdOgjk6eyXS+OHRLDvVrxyhJNzUQrkmKNI1z4+IvCpVtfCtKCZtxeY0
 K3/TDJNDMzQ5KKVxe9dtK+rRDZ1zf2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMiBTYWx0ZWRfXyNmjITfq9jzs
 hTNnBcE86ca1mEsAR0hKyzTFFDEDc6/TCDpmMeIrp7eylI0qwT31Gx0zPxnEzEhZPqSFLyGDX3L
 0U4NKGDC4Ub30/xIj4YNL02LhnxzVOvq+dtazy44TK2oBS0h2mB110az3EjpPXcDHzzRvwzKFiM
 ZJeL/qW8i9Rk270w1I6xoOnv8mPSOx22JW8JEsHthEiQLlAgo+Eku9NeknPDK+gt81vLR2WVXny
 9xEjXqAactpOJMPtGrnqbZBFXhr2VxLDQ/f1DvNOppcCB4KP54EfCqRLhD58ZuDhRrjTMb//Iju
 3lAKx1Q1BZYFcBNEqQa/6o/fwlJ3Vviy3rLTFV88knEnp9EvfhNS2fq+Qdf6Epcv5vFLENGFAMk
 ZxgTEoIVlvJL0+sxdapGZ1gNEtIUJa+fm+2UzMPBQSctscs2IHpfwS4lkf+56a+BTCn25IalF+s
 lXbrIvc0c/Bvv73/2+g==
X-Authority-Analysis: v=2.4 cv=IqMutr/g c=1 sm=1 tr=0 ts=6a54d4c7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=8b9GpE9nAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=5OWW77sWjGQZ-1i09dAA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: isiyC9aMNYEgkUNF_98puM-yIvW7r1Ec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130122

Hi Yury,

On 7/11/26 2:23 AM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:44AM +0530, Shrikanth Hegde wrote:
>> Introduce a new driver in virt named steal_monitor. This driver
>> will compute the steal time and drive the policy decisions of preferred
>> CPU state.
>>

[...]

>> +
>>   STI AUDIO (ASoC) DRIVERS
>>   M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>>   L:	linux-sound@vger.kernel.org
>> diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
>> index 52eb7e4ba71f..a52233b2502e 100644
>> --- a/drivers/virt/Kconfig
>> +++ b/drivers/virt/Kconfig
>> @@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
>>   
>>   source "drivers/virt/acrn/Kconfig"
>>   
>> +source "drivers/virt/steal_monitor/Kconfig"
>> +
>>   endif
>>   
>>   source "drivers/virt/coco/Kconfig"
>> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
>> index f29901bd7820..b67fd8968ec3 100644
>> --- a/drivers/virt/Makefile
>> +++ b/drivers/virt/Makefile
>> @@ -9,4 +9,5 @@ obj-y				+= vboxguest/
>>   
>>   obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>>   obj-$(CONFIG_ACRN_HSM)		+= acrn/
>> +obj-$(CONFIG_STEAL_MONITOR)	+= steal_monitor/
>>   obj-y				+= coco/
>> diff --git a/drivers/virt/steal_monitor/Kconfig b/drivers/virt/steal_monitor/Kconfig
>> new file mode 100644
>> index 000000000000..c7d7599c30ce
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/Kconfig
>> @@ -0,0 +1,18 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +config STEAL_MONITOR
> 
> The config should go in the last patch of the series. Otherwise,
> in case of bisection, you'll have half-written driver enabled by
> default.

Ok. I will keep it a patch at the end.

> 
>> +	tristate "Dynamic vCPU management based on steal time"
>> +	depends on PARAVIRT && SMP
>> +	select PREFERRED_CPU
>> +	default m
>> +	help
>> +	  This driver helps to reduce the steal time in paravirtualised
>> +	  environment, thereby reducing vCPU preemption. Reducing vCPU
>> +	  preemption provides improved lock holder preemption and reduces
>> +	  cost of vCPU preemption in the host.
>> +
>> +	  By default preferred CPUs will be same as active CPUs. Depending
>> +	  on the steal time when steal_monitor driver is enabled,
>> +	  preferred CPUs could become subset of active CPUs.
>> +
>> +	  It is recommended to build it as module and load the module
>> +	  to enable it.
>> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
>> new file mode 100644
>> index 000000000000..bd7d120a79b5
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Steal time monitor to alter preferred CPU state.
>> +obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
>> +
>> +steal_monitor-y := sm_core.o
>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
>> new file mode 100644
>> index 000000000000..180db424846c
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/sm_core.c
>> @@ -0,0 +1,38 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Steal time Monitor.
>> + *
>> + * Periodically compute steal time. Based on the thresholds either
>> + * reduce/increase the preferred CPUs which can be used
>> + * by the workload to avoid vCPU preemption to an extent possible.
>> + *
>> + * Available as module with CONFIG_STEAL_MONITOR=m
>> + *
>> + * Copyright (C) 2026 IBM
>> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
>> + */
>> +
>> +#include "sm_core.h"
>> +
>> +struct steal_monitor sm_core_ctx;
>> +
>> +static int __init steal_monitor_init(void)
>> +{
>> +	pr_info("steal_monitor is enabled\n");
>> +	return 0;
>> +}
>> +
>> +static void __exit steal_monitor_exit(void)
>> +{
>> +	guard(cpus_read_lock)();
>> +	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>> +
>> +	pr_info("steal_monitor is disabled\n");
>> +}
>> +
>> +module_init(steal_monitor_init);
>> +module_exit(steal_monitor_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("IBM Corporation");
>> +MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
>> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
>> new file mode 100644
>> index 000000000000..8bbb606add99
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/sm_core.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __VIRT_STEAL_CORE_H
>> +#define __VIRT_STEAL_CORE_H
>> +
>> +#include <linux/types.h>
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/cpuhplock.h>
>> +#include <linux/cpumask.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/ktime.h>
>> +
>> +struct steal_monitor {
>> +	struct delayed_work	work;
>> +	u64			prev_steal;
>> +	int			prev_direction;
> 
> Did you run pahole on it?

Ah my bad. Will do.

> 
>> +	unsigned int		interval_ms;
>> +	unsigned int		high_threshold;
>> +	unsigned int		low_threshold;
>> +	ktime_t			prev_time;
> 
> This 'prev_' prefix is useless and distracting. Just drop it.
> 
>> +};

Ok. will keep it as time, steal. (prev_direction is being removed in v8)

>> +
>> +extern struct steal_monitor sm_core_ctx;
>> +
>> +#endif /* __VIRT_STEAL_CORE_H */
>> -- 
>> 2.47.3

