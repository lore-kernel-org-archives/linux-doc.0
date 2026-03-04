Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B290386C1A
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615125; cv=none; b=I8LDyr+qVMZ3KxqieVeimDVxeXsd2ydjHKJZ3cih48rpvk+1VDnLdolN3hlTtsgvusQV0Js38O6IUqdsOMvm1huEtHXZapHpTP8DcRPHWtGXIM7J0YYXQk4AoZKf9OU1Uz3bWKkrw2Rc6+8c8mMf8korl46eaj3O5dbYhmWQWT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615125; c=relaxed/simple;
	bh=72eud2gOF6dg4F4idYno/vTCKBArNjndQYztaYt8xig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y96u+hr/NhOy7ghTSI2uAI68np0DBJ+brj94Q3qT/Rn6NxrUDNJxnZ1nHkblimxxeR0GoKC7mCHhJ8V3q5k2wQNC7DfOu4FE8mo98jsWLW15fti6BJtr3er6AGJK/7efDg8ZdQvv29RPlJ++OUC1tDKjj5gINniToC642Xmk04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owhhsKbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6+5r5Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owhhsKbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6+5r5Lv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SQew2861136
	for <linux-doc@vger.kernel.org>; Wed, 4 Mar 2026 09:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE89N+AwceMCfvCnGktXU+WEXFQvLrRRorDv18x7L70=; b=owhhsKblJbbILcSn
	gjf+olddGBxeDwDQuZcTgh8UyBEQyNg5xqWc/UKUoFppECUPsG8xfxwyKEoDcjJ7
	HsWT94HJfAFn1aDzEQJV2rznGhDTDiJAFfI5KpQOKnVHroQxg6sNIx3SIpGLpyve
	gPO3w10ll1FR0vOcbqth8mxuXuFNEhiltP3ynvGlsEdZAUeT5DgykiOEbLDK0sR7
	0+8oQJyVp4KfNgVKjXs6HE6iRb5aioJ1P12d+6puT9bpKBgw9iUSuwj5tEb6QMBP
	LalvHeUED8LdVzFgZCQjSZ5uT/TStyFzrg6GGTGMPa4u5kYwoPWXz8jgIBlW+ipN
	Pi97ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9k9d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 09:05:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae50463c39so31322165ad.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 01:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772615122; x=1773219922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE89N+AwceMCfvCnGktXU+WEXFQvLrRRorDv18x7L70=;
        b=e6+5r5Lv6XN4Lf5T0rUIZtQ0uOut0Mcv12UgDh98IbRwhrwXZlyKhBGTAy7u5obDbw
         rGa53sWvBTZEEuquOzlL23KWihI06VSisv8DXTzUwcO867s5cD/anA/4mu3MBncaxOsq
         Rt4NrNpzs6fBIoJ8Q8Svpqo9MIShH+UQDO8Q+yogzYBag/XHpk2qyxlAbrv+DdoJoqQL
         mxnmp+Zpl2T2pxXeIa2SLKKK3Ioals29v/FLdH4ssaXA9HthOW/Z3xJQhVDfFWe6WpmX
         3Mp97hRTqLNrCC9BUlbCMKA0j7A/1xleJNWfiBKwLi9R47dSLlFqxK+MWoeR/1xKhzFE
         ubtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772615122; x=1773219922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE89N+AwceMCfvCnGktXU+WEXFQvLrRRorDv18x7L70=;
        b=Kj6XdhuzizgdPHlHAhE42Woc1F/26Y/qaOrZPnQmtlE6ldASbd4m4wEUAzuuKUtGRI
         DIXgDn0pTiW32+oAf/huXI0R439VNKItSqy480UEyixUn14vD7dkX3YlxXURlgV9/jPM
         HR7ZgeddrqWdA9xBFwoY4UEuzPj6EOdUD8l15VHP9JQkxwCLe+274Q4Y27vj9mKiuMTk
         v4rxFAmFMAMmZxFdZF8Skut0fUgZ+6/QDNkfGrEiOiZK+OSMyKZH0uAy4xLpaC4dQKis
         B0zN2fDg1yoH1kqN/L5ny/aCDUuJPqafyGmY1bxv12yw2wU9NIEjCEy+qYDkEFoxjq7Q
         Riyw==
X-Forwarded-Encrypted: i=1; AJvYcCVzIFtMNWVSUtWPIiPkw9M/P8+HBGckVYfCrXl4m+P0YwwYtZtdfMVjum2I2dofm4k0tNbCqO0lKXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfynZJ//tM/wNlWdMInP+7Y6SmavEOcr8g7qTpSMCj5Pk4jBs
	dlhyXTbktk/4boQx2b9oDZpZ5cLzurD5A5zosvrgYW6x0Pn9Na4QOUpfbP0i5xq3Bgu3Bl9NgVp
	lh24MeK7+ioFpwWAT7SKN3evGh/Nk6qj3lX8F2soN6X65AFPiLhabwBNQfA9fE1s=
X-Gm-Gg: ATEYQzysyeaGVK1oM2vWIovPNajR0j1AFiQrLpfxLruNY1SLU4F+Ttqjvxwj6uhxqXo
	h1T7FpnlC/OQHyCA6VWl5zahUoP30Fsmi9cULx77eIR+VEumZAANxMIQoTihlHliWlJM0FPnz0l
	1GZ8f0cQ8SRtdAeY3NkBZWTEJTAYr+B8/3vn8UgN1FGPC8b5C/sDIB2dOVip43LaLWOZoUxEAc3
	5lyy0gkkHJZHfQoK/0/DUM6Kiuj9ndN1B001aqyYid8fT+92OTE7oOUrOl6aYneQOL2nGnnC//2
	cu654T9lY3SIcUGLMH1eq82aTJsF2zCaQXkAiajX09H2dZltrpjHMUI9mNk0Ua1GWJZdLolgYbl
	XK16ZXQhULRJdf7afNY70t3GtVuEhKAT7Z5YoQLbSPmx9II0MqKdx1dturkqsHrm7qREeqvPWIJ
	dmvSbkNQScSowyLg1+UQ==
X-Received: by 2002:a05:6a21:4cc3:b0:395:cbe8:e155 with SMTP id adf61e73a8af0-3982dda41ddmr1405788637.16.1772615121924;
        Wed, 04 Mar 2026 01:05:21 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc3:b0:395:cbe8:e155 with SMTP id adf61e73a8af0-3982dda41ddmr1405736637.16.1772615121335;
        Wed, 04 Mar 2026 01:05:21 -0800 (PST)
Received: from [10.133.33.194] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a060331sm17484729b3a.62.2026.03.04.01.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:05:20 -0800 (PST)
Message-ID: <d19eed6d-48ca-4df2-9739-0455f47f1485@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 17:05:13 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH 1/1] PM: QoS: Introduce boot parameter
 pm_qos_resume_latency_us
To: Aaron Tomlin <atomlin@atomlin.com>, rafael@kernel.org, dakr@kernel.org,
        pavel@kernel.org, lenb@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, pmladek@suse.com,
        rdunlap@infradead.org, feng.tang@linux.alibaba.com,
        pawan.kumar.gupta@linux.intel.com, kees@kernel.org, elver@google.com,
        arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com,
        bhelgaas@google.com, neelx@suse.com, sean@ashe.io, mproche@gmail.com,
        chjohnst@gmail.com, nick.lange@gmail.com, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20260128033143.3456074-1-atomlin@atomlin.com>
 <20260128033143.3456074-2-atomlin@atomlin.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260128033143.3456074-2-atomlin@atomlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA2OCBTYWx0ZWRfX/sNaKKWaJCIU
 7wrc12v8+L1+ZcNnl5YFlJDjNUsAZ5ngDsfMqQYyFj2LtCDVXHBKHuXImbCpu3Gyq1vBLJFPmZu
 l5b5ezyb5xekZYINTe7zCNM/PV3kY6bFx6UrfLgW9nyy/mcSOFrhN+hxI3TBDZXfnTX/lRFEhuk
 JuG6k81BQkViEyvltyQKsLxBCZzTCHwWJ3MAPtwuxTgBIqEvkeAYQqnx4a8vE8+W8wEsJwWfPUK
 oB7Juo0XbX541OSaRe/OXMJaq4VoLtGcOI+Bb23x02MpIzF4Ad+cerFWHTM4xfgvDzBZmWqIfu8
 cfQjxrDd2iHbaBdlUZH4Lrg34RYpJlk73OAxrTYyVo69rIYSTMtMAHsEIV+8ObcHCj2PcvCWE+t
 iSDFOHEMx90s4P6prRnnEiusSl/vGWh0//8F/79KKBCJMo/9cZW4hByRmEWRslTiJTtoN3f1/+m
 ibLP2a+kHo+4qauFSwA==
X-Proofpoint-ORIG-GUID: dHdnd3gsrxNSa2uFRd9c8929C1gDr96G
X-Proofpoint-GUID: dHdnd3gsrxNSa2uFRd9c8929C1gDr96G
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a7f5d3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=j-LfP5YGAAAA:8 a=ZtVDmMFY8a3-9KWIWZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=pci6KG57UX3UzFLC8IW4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_04,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040068

On 1/28/2026 11:31 AM, Aaron Tomlin wrote:
> Users currently lack a mechanism to define granular, per-CPU PM QoS
> resume latency constraints during the early boot phase.
> 
> While the idle=poll boot parameter exists, it enforces a global
> override, forcing all CPUs in the system to "poll". This global approach
> is not suitable for asymmetric workloads where strict latency guarantees
> are required only on specific critical CPUs, while housekeeping or
> non-critical CPUs should be allowed to enter deeper idle states to save
> energy.
> 
> Additionally, the existing sysfs interface
> (/sys/devices/system/cpu/cpuN/power/pm_qos_resume_latency_us) becomes
> available only after userspace initialisation. This is too late to
> prevent deep C-state entry during the early kernel boot phase, which may
> be required for debugging early boot hangs related to C-state
> transitions or for workloads requiring strict latency guarantees
> immediately upon system start.
> 
> This patch introduces the pm_qos_resume_latency_us kernel boot
> parameter, which allows users to specify distinct resume latency
> constraints for specific CPU ranges.

Hello Aaron,

Therefore, once a PM QoS constraint is set via boot parameters, it
cannot be relaxed afterward by any means, except by applying a stricter
constraint, right?

> 
> 	Syntax: pm_qos_resume_latency_us=range:value,range:value...
> 
> Unlike the sysfs interface which accepts the special string "n/a" to
> remove a constraint, this boot parameter strictly requires integer
> values. The special value "n/a" is not supported; the integer 0 must be
> used to represent a 0 us latency constraint (polling).
> 
> For example:
> 
> 	"pm_qos_resume_latency_us=0:0,1-15:20"
> 
> Forces CPU 0 to poll on idle; constrains CPUs 1-15 to not enter a sleep
> state that takes longer than 20 us to wake up. All other CPUs will have
> the default (no resume latency) applied.
> 
> Implementation Details:
> 
> 	- The parameter string is captured via __setup() and parsed in
> 	  an early_initcall() to ensure suitable memory allocators are
> 	  available.
> 
> 	- Constraints are stored in a read-only linked list.
> 
> 	- The constraints are queried and applied in register_cpu().
> 	  This ensures the latency requirement is active immediately
> 	  upon CPU registration, effectively acting as a "birth"
> 	  constraint before the cpuidle governor takes over.
> 
> 	- The parsing logic enforces a "First Match Wins" policy: if a
> 	  CPU falls into multiple specified ranges, the latency value
> 	  from the first matching entry is used.

May I know would it be more reasonable to apply the minimum constraint?

> 
> 	- The constraints persist across CPU hotplug events.
> 
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  23 +++
>   drivers/base/cpu.c                            |   5 +-
>   include/linux/pm_qos.h                        |   5 +
>   kernel/power/qos.c                            | 141 ++++++++++++++++++
>   4 files changed, 172 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6a3d6bd0746c..afba39ecfdee 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2238,6 +2238,29 @@ Kernel parameters
>   	icn=		[HW,ISDN]
>   			Format: <io>[,<membase>[,<icn_id>[,<icn_id2>]]]
>   
> +	pm_qos_resume_latency_us=	[KNL,EARLY]
> +			Format: <cpu-list>:<value>[,<cpu-list>:<value>...]
> +
> +			Establish per-CPU resume latency constraints. These constraints
> +			are applied immediately upon CPU registration and persist
> +			across CPU hotplug events.
> +
> +			For example:
> +				"pm_qos_resume_latency_us=0:0,1-15:20"
> +
> +			This restricts CPU 0 to a 0us resume latency (effectively
> +			forcing polling) and limits CPUs 1-15 to C-states with a
> +			maximum exit latency of 20us. All other CPUs remain
> +			unconstrained by this parameter.
> +
> +			Unlike the sysfs interface, which accepts the string "n/a" to
> +			remove a constraint, this boot parameter strictly requires
> +			integer values. To specify a 0us latency constraint (polling),
> +			the integer 0 must be used.
> +
> +			NOTE: The parsing logic enforces a "First Match Wins" policy.
> +			If a CPU is included in multiple specified ranges, the latency
> +			value from the first matching entry takes precedence.
>   
>   	idle=		[X86,EARLY]
>   			Format: idle=poll, idle=halt, idle=nomwait
> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index c6c57b6f61c6..1dea5bcd76a0 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -416,6 +416,7 @@ EXPORT_SYMBOL_GPL(cpu_subsys);
>   int register_cpu(struct cpu *cpu, int num)
>   {
>   	int error;
> +	s32 resume_latency;
>   
>   	cpu->node_id = cpu_to_node(num);
>   	memset(&cpu->dev, 0x00, sizeof(struct device));
> @@ -436,8 +437,8 @@ int register_cpu(struct cpu *cpu, int num)
>   
>   	per_cpu(cpu_sys_devices, num) = &cpu->dev;
>   	register_cpu_under_node(num, cpu_to_node(num));
> -	dev_pm_qos_expose_latency_limit(&cpu->dev,
> -					PM_QOS_RESUME_LATENCY_NO_CONSTRAINT);
> +	resume_latency = pm_qos_get_boot_cpu_latency_limit(num);
> +	dev_pm_qos_expose_latency_limit(&cpu->dev, resume_latency);
>   	set_cpu_enabled(num, true);
>   
>   	return 0;
> diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
> index 6cea4455f867..556a7dff1419 100644
> --- a/include/linux/pm_qos.h
> +++ b/include/linux/pm_qos.h
> @@ -174,6 +174,7 @@ static inline s32 cpu_wakeup_latency_qos_limit(void)
>   #ifdef CONFIG_PM
>   enum pm_qos_flags_status __dev_pm_qos_flags(struct device *dev, s32 mask);
>   enum pm_qos_flags_status dev_pm_qos_flags(struct device *dev, s32 mask);
> +s32 pm_qos_get_boot_cpu_latency_limit(unsigned int cpu);
>   s32 __dev_pm_qos_resume_latency(struct device *dev);
>   s32 dev_pm_qos_read_value(struct device *dev, enum dev_pm_qos_req_type type);
>   int dev_pm_qos_add_request(struct device *dev, struct dev_pm_qos_request *req,
> @@ -218,6 +219,10 @@ static inline s32 dev_pm_qos_raw_resume_latency(struct device *dev)
>   		pm_qos_read_value(&dev->power.qos->resume_latency);
>   }
>   #else
> +static inline s32 pm_qos_get_boot_cpu_latency_limit(unsigned int cpu)
> +{
> +	return PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
> +}
>   static inline enum pm_qos_flags_status __dev_pm_qos_flags(struct device *dev,
>   							  s32 mask)
>   			{ return PM_QOS_FLAGS_UNDEFINED; }
> diff --git a/kernel/power/qos.c b/kernel/power/qos.c
> index f7d8064e9adc..e23223e3c7e8 100644
> --- a/kernel/power/qos.c
> +++ b/kernel/power/qos.c
> @@ -34,6 +34,11 @@
>   #include <linux/kernel.h>
>   #include <linux/debugfs.h>
>   #include <linux/seq_file.h>
> +#include <linux/cpumask.h>
> +#include <linux/cpu.h>
> +#include <linux/list.h>
> +
> +#include <asm/setup.h>

Including <asm/setup.h> in generic PM/QoS code seems not appropriate,
and pulling in an arch specific header creates unnecessary coupling and
potential portability issues.

>   
>   #include <linux/uaccess.h>
>   #include <linux/export.h>
> @@ -46,6 +51,10 @@
>    */
>   static DEFINE_SPINLOCK(pm_qos_lock);
>   
> +static LIST_HEAD(pm_qos_boot_list);
> +
> +static char pm_qos_resume_latency_cmdline[COMMAND_LINE_SIZE] __initdata;
> +
>   /**
>    * pm_qos_read_value - Return the current effective constraint value.
>    * @c: List of PM QoS constraint requests.
> @@ -209,6 +218,138 @@ bool pm_qos_update_flags(struct pm_qos_flags *pqf,
>   	return prev_value != curr_value;
>   }
>   
> +struct pm_qos_boot_entry {
> +	struct list_head node;

How about to use array instead of list to optimize lookup and cache
hitting? but array may use more memory.

> +	struct cpumask mask;
> +	s32 latency;
> +};
> +
> +static int __init pm_qos_resume_latency_us_setup(char *str)
> +{
> +	strscpy(pm_qos_resume_latency_cmdline, str,
> +		sizeof(pm_qos_resume_latency_cmdline));
> +	return 1;
> +}
> +__setup("pm_qos_resume_latency_us=", pm_qos_resume_latency_us_setup);
> +
> +/* init_pm_qos_resume_latency_us_setup - Parse the pm_qos_resume_latency_us boot parameter.

Nit: style issue, /**

> + *
> + * Parses the kernel command line option "pm_qos_resume_resume_latency_us=" to establish

pm_qos_resume_resume_latency_us typo?

> + * per-CPU resume latency constraints. These constraints are applied
> + * immediately when a CPU is registered.
> + *
> + * Syntax: pm_qos_resume_latency_us=<cpu-list>:<value>[,<cpu-list>:<value>...]
> + * Example: pm_qos_resume_latency_us=0-3:0,4-7:20
> + *
> + * The parsing logic enforces a "First Match Wins" policy. If a CPU is
> + * covered by multiple entries in the list, only the first valid entry
> + * applies. Any subsequent overlapping ranges for that CPU are ignored.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +static int __init init_pm_qos_resume_latency_us_setup(void)
> +{
> +	char *token, *cmd = pm_qos_resume_latency_cmdline;
> +	struct pm_qos_boot_entry *entry, *tentry;
> +	cpumask_var_t covered;
> +
> +	if (!zalloc_cpumask_var(&covered, GFP_KERNEL)) {
> +		pr_warn("pm_qos: Failed to allocate memory for parsing boot parameter\n");
> +		return -ENOMEM;
> +	}
> +
> +	while ((token = strsep(&cmd, ",")) != NULL) {
> +		char *str_range, *str_val;
> +
> +		str_range = strsep(&token, ":");
> +		str_val = token;
> +
> +		if (!str_val) {
> +			pr_warn("pm_qos: Missing value range %s\n",
> +				str_range);
> +			continue;
> +		}
> +
> +		entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +		if (!entry) {
> +			pr_warn("pm_qos: Failed to allocate memory for boot entry\n");
> +			goto cleanup;
> +		}
> +
> +		if (cpulist_parse(str_range, &entry->mask)) {
> +			pr_warn("pm_qos: Failed to parse cpulist range %s\n",
> +				str_range);
> +			kfree(entry);
> +			continue;
> +		}
> +
> +		cpumask_andnot(&entry->mask, &entry->mask, covered);
> +		if (cpumask_empty(&entry->mask)) {
> +			pr_warn("pm_qos: Entry %s already covered, ignoring\n",
> +				str_range);
> +			kfree(entry);
> +			continue;
> +		}
> +		cpumask_or(covered, covered, &entry->mask);
> +
> +		if (kstrtos32(str_val, 0, &entry->latency)) {
> +			pr_warn("pm_qos: Invalid latency requirement value %s\n",
> +				str_val);
> +			kfree(entry);
> +			continue;
> +		}
> +
> +		if (entry->latency < 0) {
> +			pr_warn("pm_qos: Latency requirement cannot be negative: %d\n",
> +				entry->latency);

Nit: It would be cleaner to use pr_fmt() for the log prefix rather than
embedding "pm_qos:" in every message such as:

#define pr_fmt(fmt) "pm_qos_boot: " fmt


> +			kfree(entry);
> +			continue;
> +		}
> +
> +		list_add_tail(&entry->node, &pm_qos_boot_list);

I saw there is no protect for pm_qos_boot_list, my understanding is that
during early boot, pm_qos_boot_list is fully initialized before any
other register_cpu() calls. For CPU hotplug, there only reads the list
and it’s never modified afterward, so there shouldn’t be a race.


> +	}
> +
> +	free_cpumask_var(covered);
> +	return 0;
> +
> +cleanup:
> +	list_for_each_entry_safe(entry, tentry, &pm_qos_boot_list, node) {
> +		list_del(&entry->node);
> +		kfree(entry);
> +	}
> +
> +	free_cpumask_var(covered);
> +	return 0;

The function comment says "return a negative error code on failure",
but in the cleanup context the function unconditionally returns 0.
should it be:

set "ret = -ENOMEM;" before goto cleanup and then just return ret?


> +}
> +early_initcall(init_pm_qos_resume_latency_us_setup);
> +
> +/**
> + * pm_qos_get_boot_cpu_latency_limit - Get boot-time latency limit for a CPU.
> + * @cpu: Logical CPU number to check.
> + *
> + * Checks the read-only boot-time constraints list to see if a specific
> + * PM QoS latency override was requested for this CPU via the kernel
> + * command line.
> + *
> + * Return: The latency limit in microseconds if a constraint exists,
> + * or PM_QOS_RESUME_LATENCY_NO_CONSTRAINT if no boot override applies.
> + */
> +s32 pm_qos_get_boot_cpu_latency_limit(unsigned int cpu)
> +{
> +	struct pm_qos_boot_entry *entry;
> +
> +	if (list_empty(&pm_qos_boot_list))
> +		return PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
> +
> +	list_for_each_entry(entry, &pm_qos_boot_list, node) {
> +		if (cpumask_test_cpu(cpu, &entry->mask))
> +			return entry->latency;
> +	}
> +
> +	return PM_QOS_RESUME_LATENCY_NO_CONSTRAINT;
> +}
> +EXPORT_SYMBOL_GPL(pm_qos_get_boot_cpu_latency_limit);
> +
>   #ifdef CONFIG_CPU_IDLE
>   /* Definitions related to the CPU latency QoS. */
>   


-- 
Thx and BRs,
Zhongqiu Han
