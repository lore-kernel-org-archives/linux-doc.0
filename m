Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95523EFFB4;
	Mon,  6 Jul 2026 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327678; cv=none; b=JQDatpq8zTjmlcOIx5O9Jmgn4UEuvni4VoVrwCKpmKR++WRXeWwaTYaR3GN3QBGrFMC0P+Q//ento6RfGtIWGPuXy1QcRnTqVwclen7nNewL+Oq8YyI1uPMvD/zpq/u6Gkb49sbkv+zuiQWqYSRDR38dAAaPDiGYDV2QiYr77Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327678; c=relaxed/simple;
	bh=FCXkYmpXn9ZkeVOsghQf0zBMpiOjtbDFljADxP2+Ueo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ok5J+/4ZcPaPp4dDtutk3wag0PGDMrI+S44wM4/m4AiGoTzORNTzVYF4aCS4rzdCTuUUvLZOaJ8u2/N/nVRAhDTLglR83wDOVsTsL+8+YdqWMLLczdY7vhwqLXFGwmGD0Oy7srlhxfhUwZUznAMxybdRbN8V0uzvRC2/1Fp/hZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=efs6qEu6; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="efs6qEu6"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665MIA6s2303810;
	Mon, 6 Jul 2026 08:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SMsXSz
	U48L3rh4majOTUCS1voA0xBEVTaL291ujNLZ8=; b=efs6qEu6xdRowISoXASNlI
	McK0lOFJ+0kmzzTusbWJHRUajPLLBsz8dBLGWYDiiIDALWr4G09OIWyKGZ2cP5jl
	E5IpyBHrsHjRtoE03MMYh/3zoWYCTY7Ns4hnZbO2b5GgnznvE+5FBTwnNL92MswD
	vv1fLC1gDEF0k5vXV73dlVcoTxXlngSSWgRSFcIDNXkdEroz5LBIRRynn1afC5Jr
	MHSDVfLMv1i+O6VJrGBfhZ3sgg9L05tWegauponXot9RcagYNNHiE9ZXal1BlLB5
	QO300sQk612rtj9T6NVcWXEQI5oA5Vhtd3+v/byOaAhtARpXANybNMpVv59aAo2Q
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sp3gjgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:47:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6668YiWe007412;
	Mon, 6 Jul 2026 08:47:29 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0h4pu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 08:47:29 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6668lPRj16187830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 08:47:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D2E42004B;
	Mon,  6 Jul 2026 08:47:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D985620043;
	Mon,  6 Jul 2026 08:47:16 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 08:47:16 +0000 (GMT)
Message-ID: <8efa7a72-18c1-44b8-aaaf-80006a7c8fff@linux.ibm.com>
Date: Mon, 6 Jul 2026 14:17:15 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/23] virt/steal_monitor: Provide default method to
 get systemwide steal time
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
 <20260701141654.500125-18-sshegde@linux.ibm.com> <akgKfm_sSl_ZAXfT@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akgKfm_sSl_ZAXfT@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a4b6ba3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=y1RYhKU3uvHFaDme0DIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3TJAyHYtCgRz
 13v+d4FRGbY+YvndknJWQ8rBdXa9Gc+ro73Av4oywl9z4SJSoaF/w6syTDCeqeMkKgt7sKmpcvQ
 5p2BKX86JjKWTQ1lfuefifwSUJeZ5J4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX3gnjdW26G43h
 sWRax4W9fbAcnbnwUkWaMZgPiZLp1FntA7YHLbETuAcEmA50jfZQ+/Gbje9fRqBArBHYzDyNrH2
 oDJ5tHQ9lL1fZNWZ+fQ+L1pr5KEGUOEmK7zHuhrkA3PfD083k80rOmi73exdC1CdAPLuy4f0WCE
 ljvbwvpT4UcXxlTx0zZ/fPa8EUG28sDzjbKP2YvB0pQWpow2aycDIpyq0ADL3yPZyxk1Cj0gLrq
 Nr2TRKPfiNMWonL7KRoOVfIi4+yR3mR2kQLX3aXd3uSKT5vpi2sSiL8OEmxokKY4LEu8ZVb9w0J
 sHsVReXqKu6H+xXbK5nk19dUcWWyT6gNGEg5OBj0KcxB5YfBEU5pSMLRFYLnfG9QRL4rL5yc+vH
 t4bMkxLe1feq2QMWD/98ewZBzFlj5yoPIpamVaTk3Wqf3T5AzmEvp6g2oALf6blN6V6CIFpB8ml
 lqOXL5ir0i55wsGq2AQ==
X-Proofpoint-ORIG-GUID: ej5gsWGFbsm7-AY4bTQWvRbZmmJ9CyIE
X-Proofpoint-GUID: 42FPwaWLWfX3u8QtVjjPdTG4kyB5wcyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083



On 7/4/26 12:46 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:48PM +0530, Shrikanth Hegde wrote:
>> steal monitor takes global view of steal time instead of individual
>> vCPU. For this collect overall steal values across all the vCPUs or
>> vCPUs of interest.
>>
>> Default implementation chooses steal time across all active CPUs.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Add cpus_read_lock() for hotplug safety
>>
>>   drivers/virt/steal_monitor/Makefile   |  2 +-
>>   drivers/virt/steal_monitor/defaults.c | 28 +++++++++++++++++++++++++++
>>   drivers/virt/steal_monitor/sm_core.h  |  3 +++
>>   3 files changed, 32 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/virt/steal_monitor/defaults.c
>>
>> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
>> index 24cee55342ce..7c16f8cf9583 100644
>> --- a/drivers/virt/steal_monitor/Makefile
>> +++ b/drivers/virt/steal_monitor/Makefile
>> @@ -11,4 +11,4 @@
>>   #
>>   obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
>>   
>> -steal_monitor-y := sm_core.o
>> +steal_monitor-y := sm_core.o defaults.o
>> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
>> new file mode 100644
>> index 000000000000..6681f9938f6a
>> --- /dev/null
>> +++ b/drivers/virt/steal_monitor/defaults.c
>> @@ -0,0 +1,28 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Base file contains the default implementations.
>> + * These are defined as __weak so that arch may define
>> + * strong symbols to override.
> 
> But there's no arch doing that, right? It looks like overcomplication
> with no benefit.
> 
> There's just ~50 drivers defining weak symbols, so this is not a
> common practice. I think it would be much simpler for the arch people
> to simply write their own driver controlling cpu_preferred_mask,
> rather than tweaking your code.
> 

s390 folks asked for explicit hooks since they have some of the info
coming from HW w.r.t to vertical high/vertical low etc. So i have designed it that way.
(I know code is not there yet)

If each arch writes its own driver, wouldn't that lead to
- code duplication as each arch more or less may have to do same.
- each arch has to catch up any improvements that happens to default monitor.
- each arch has to honor design construct and not violate it.
- kconfig puzzles, to choose generic or arch specific ones etc.


If it makes sense,
- I can make it as strong symbols for now.
- when the arch specific implementations arrive, can make it as
   __weak to accommodate that.

