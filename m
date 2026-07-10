Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E70036F8F2;
	Fri, 10 Jul 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702880; cv=none; b=ga5MuCZEMBvL6xuEW841YGz1RbCkYEyTMdYeFJHDzg1orZrMV3HRj98OZPVhHo08p+KLjXY6XihXj5BQEofm4iVi6gcSQkOOUvgqZA/7WFxTzyP6DxO1mdBdrwAeLxx9tyViLBnmu5VzZwhqpf0H2xpNTwbvWPmEFFfsomArmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702880; c=relaxed/simple;
	bh=pBhVGgXihsS7JSd2j9CCGrfoN2VkYkM43VlY5dvYqMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfUc31uIWNjhPOI1TK+RdDmQ5nCSpOHVJqRg+cpMX93SuiCl1816tGqqxJbE6zqQ8QZOxchIEdLpxH0AlT9tiDO4exGn6C8szWPQzfzMFJ/ij0bNqGf5vSy8m7+e6g11x9h7paJIAZYWDKXIS3fGZGESVukwpVqmdUuZ4JGTRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YRikNqW7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YRikNqW7"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEmtXO766191;
	Fri, 10 Jul 2026 17:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gWL6+2
	+11Ak6xPt+/T38r29J2Zat27ABKXMu0i0y5rQ=; b=YRikNqW77Z3+YC/HRrdLXD
	hHWgDftoxtYdwapbRHvvHCc+W7sQpJTsqyj1oqguZTRBfJr/JWf/e7YRTRJgWP0b
	Ueanf2hLfo2guzCvwdnwwp8VMgLn5a3edSgUmubox/WHyC4i6pJpJz0TQwN7xxpv
	kdWm0DOg23Z6VLFPCytLAlmbqd/YRsbWzRwLsiUNuKQCAn3HBTiqQH/R+7mR3nKB
	S/SiU2yPj1Wchp60Tp+wcB87OyHOJocAVP6ENRenunbDmmThNJ563ZHevOCTDHFh
	CUyHNKOga7ilFcxDk1XiPfQBHAi78egSln8kSJadABw1qxOtBRRIwy+o3xDJkhgQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6rke7y16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 17:00:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66AGnc4A032058;
	Fri, 10 Jul 2026 17:00:56 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvwk4gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 17:00:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66AH0qwC50332090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 17:00:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A66A82004B;
	Fri, 10 Jul 2026 17:00:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C236920040;
	Fri, 10 Jul 2026 17:00:44 +0000 (GMT)
Received: from [9.124.216.30] (unknown [9.124.216.30])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jul 2026 17:00:44 +0000 (GMT)
Message-ID: <adc1793e-694f-4531-ae61-b6b3eef568c5@linux.ibm.com>
Date: Fri, 10 Jul 2026 22:30:43 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] sysfs: Add preferred CPU file
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
 <20260709215648.1246821-4-sshegde@linux.ibm.com> <alESuG6IYZCRESJY@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alESuG6IYZCRESJY@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a51254a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=f7GhLAGFv2NyNaRqmGgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2OCBTYWx0ZWRfX0ue827LpTDR3
 UPkGZsXDXzhdp8ZxmaEH+0GI9Hplj9e2BQEiVEs/9g0BlnmlQPXiFawAk1ftiL6Bk736C9WZof3
 nt8/GYM2UFf03LoeGo1ntsokHpJzHkOgWAeRMxw6oMzciv4zLQSjfPbXSP9IiZyAgVNBDodT1nn
 IxvTtdpKLgz+xqjiu8dwCyFB0Cg4mPVuSSvg+oYkmYlcwYTd+TZ6sNJFmUH4Ta085DQyPK9fnTI
 7VFq9oLRtrNCt/CWKXXWHDnrrZOJ1LJfIzaxnZOdoaAAztPXcsJJWdcI9d+5fNtmivRrU1IFHIL
 DnQomteW8m5x5uXQ+jXidgeb8RIuNAhSCCvAP7gqYjhPS6NvDAoH0xwv9ogZXox23MHt/Ow7ui2
 YZ9I12WcxENQT1gVbobOqXhgF9ZiNZrBGf9g/pD2pv5WAFvqYCZnc9pq7ZB9UNqV7XU8bVYqZOp
 IkgEDB05VGxhLYUP83g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2OCBTYWx0ZWRfX3keYd35B3D0U
 n39roeHIm7vV5kY7d7XwpiefBxLDybb+jYChSr+42D2qe17nbGHbI/+n3T2fplmMpMPPvtxKnLe
 olqCs7AiOdonNXJV0EugLc7qcqofdJw=
X-Proofpoint-GUID: t0Po62chkBLVtpus0_5t3WT5pDCwiBg7
X-Proofpoint-ORIG-GUID: -5m9RnASPag7_uJm3zgRH7mwp0d0iiEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100168

Hi Yury, thanks for taking a look.

On 7/10/26 9:11 PM, Yury Norov wrote:
> On Fri, Jul 10, 2026 at 03:26:39AM +0530, Shrikanth Hegde wrote:
>> Add "preferred" file in /sys/devices/system/cpu
>>
>> This offers
>> - User can quickly check which CPUs are marked as preferred at this
>>    moment.
>> - Userspace algorithms irqbalance could use this mask to send irq into
>>    preferred CPUs.
>>
>> For example:
>> cat /sys/devices/system/cpu/online
>> 0-719
>> cat /sys/devices/system/cpu/preferred
>> 0-599        <<< Implies 0-599 are preferred for workloads and 600-719
>>                   should be avoided at this moment.
>>
>> cat /sys/devices/system/cpu/preferred
>> 0-719        <<< All CPUs are usable. There is no preference.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-devices-system-cpu | 11 +++++++++++
>>   drivers/base/cpu.c                                 |  8 ++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> index 82d10d556cc8..ac1dbb209cc7 100644
>> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
>> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
>> @@ -806,3 +806,14 @@ Date:		Nov 2022
>>   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>>   Description:
>>   		(RO) the list of CPUs that can be brought online.
>> +
>> +What:		/sys/devices/system/cpu/preferred
>> +Date:		July 2026
>> +Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>> +Description:
>> +		(RO) the list of preferred CPUs at this moment.
>> +		These are the only CPUs meant to be used at the moment.
>> +		Using CPU outside of the list could lead to more
>> +		contention of underlying physical CPU resource. Dynamically
>> +		changes based on steal time. With CONFIG_PREFERRED_CPU=n it
>> +		is same as active CPUs. See sched-arch.rst for more details.
> 
> This should mention that it's about paravirtualization.

Ok. I will rephrase it.

> 
>> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
>> index 19d288a3c80c..4ac990efee7c 100644
>> --- a/drivers/base/cpu.c
>> +++ b/drivers/base/cpu.c
>> @@ -391,6 +391,13 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
>>   }
>>   #endif
>>   
>> +static ssize_t preferred_show(struct device *dev,
>> +			      struct device_attribute *attr, char *buf)
>> +{
>> +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
>> +}
>> +static DEVICE_ATTR_RO(preferred);
>> +
>>   const struct bus_type cpu_subsys = {
>>   	.name = "cpu",
>>   	.dev_name = "cpu",
>> @@ -532,6 +539,7 @@ static struct attribute *cpu_root_attrs[] = {
>>   #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
>>   	&dev_attr_modalias.attr,
>>   #endif
>> +	&dev_attr_preferred.attr,
> 
>   #ifdef CONFIG_PREFERRED_CPUS ?

Not needed no? It will print active CPUs.

> 
>>   	NULL
>>   };
>>   
>> -- 
>> 2.47.3

