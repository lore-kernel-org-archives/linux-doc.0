Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9B439E6F0;
	Tue,  7 Jul 2026 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408656; cv=none; b=u0h2ASJYRiJzyjpwjTn6Lg+xf/PGKrgraz3xVrX5MOrnuQAOzaZLAglYC43uS1qeK5oxwFf/bXJtJO/5PQ1p3qO75lyur4rFnl0l+5qDVqmcQsVoigUZKL/4rD3XnYmhmKTREeZK2gqwj9KUC1I00CaZB172ogOShIPnyunf+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408656; c=relaxed/simple;
	bh=bcaA/Pc2Bl4W2n85KzYVkWo2isvofaRiZqBKtnrjkuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaqEBdid5qawinywxrOWsNYnXSwNlqVsph5RFzUB9Z8T3uTIZPaIVrMLtCOgoFuaXz/8wBJaq8vp86mii/lAcEPvNtjbMoqQf02HIoQsmSD1AVg5EBePaPdKb3YfI8SwcdT6L6dXbRDDB1mMBNdcCpLMP8rLoS/Ubq8LBEoziGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=FYEj1nqX; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="FYEj1nqX"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674IYKX2385827;
	Tue, 7 Jul 2026 07:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7F8oGO
	RdA+Ou5oSPs/qlUsRsM9mRdOKf5ow4P2fpE2s=; b=FYEj1nqXnW8AtVZAQQrsP5
	G0c5U9Hm+qcab61BCFP1WuMVJNzLBF1uaW6PwLX4Tzh8eEnY9igjDjQ7l59KiaE4
	0oq3N7GSN4dRTMTj5WCr0iASBtyaNFtqNcXAyyZAqVgh/nWrlyJFGSYwr5FtsKoy
	XkYTBk9K7u4xWrF3ByRh/1ZQon6jWbEsAzRLbLdAyVDTiynG4zCGEmJtJXD3qoId
	8z9PZS5D6j6pK6Yt5mqHPO9sYuiv45cJ02q0AKPgVEAUhSa3FGByW6nu30vfWoHB
	OCgOaP4qZd1FaXovuu+MmlqLHL5RoqYh2qtWkzGibtptSAE8y/v9IkDamop0s3rA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sp3nrba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 07:17:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6676njLn023434;
	Tue, 7 Jul 2026 07:17:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgq1pnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 07:17:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6677H5WF50332046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jul 2026 07:17:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6FAC2005A;
	Tue,  7 Jul 2026 07:17:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79AE320040;
	Tue,  7 Jul 2026 07:16:57 +0000 (GMT)
Received: from [9.124.214.176] (unknown [9.124.214.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jul 2026 07:16:57 +0000 (GMT)
Message-ID: <b8218ee1-db8f-4282-a0f8-eeb92747d59d@linux.ibm.com>
Date: Tue, 7 Jul 2026 12:46:56 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 21/23] virt/steal_monitor: Add direction control
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
 <20260701141654.500125-22-sshegde@linux.ibm.com> <akwR38ZsyB7tfNDl@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <akwR38ZsyB7tfNDl@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a4ca7f7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=b52Ekj5tBG3iIJtAnKIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX8kqxFkxnVkWf
 7L+F6eK536LwWd9kddeZGv7/lZzRNYsDCFItg42Zzrn9dReJvTHOZ257JddQhSbPnYzkgZt1p2Z
 acO67KagWvMkAfeK+DEs3LO0uxycL/k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX/b50KKCMtvn7
 +6eLknsxYPDRlEcJcUirxKSdO1ya4RYLIqmKZ6PLkrbgS1rt7lXKzwdt2HuwkDr8pF8IaJRM8IB
 iUKs4PkK6SzsRyXm3/Jyh0f2hqLzEtQYo37sgGtmu6mqF36ykkcD3Kc45mf8DZBJnunnN4Ak0r7
 q9QYGm4YaJlomsTdY75POPQudxJs86wihlnjMTrpNKrAAL+ZNaNZ+bjbwmHU/o3yPkikbdfx7iQ
 hMHCk9BWITLIYyl/YUvYsq95QaOWiTz7U6HIY8Q+AOizUTv9eQKikVpx9oU8sCXFSAIO0Dkvuhg
 vT3uSy8KMFA5bhcSu6ZsYgEfDEfos4vz/euw4BYocDDrjEEt0beXk/zWRmtsewwfIgARcXWj/7l
 Uu7aIJHUVP2nQ478nG9dI1CtHi1kX5iNRvOfVgWjHo8rc/opYAjN/08LR1xxeMtYB1eNHNcYXtA
 jcDGe3yyhbz9P9aKdIg==
X-Proofpoint-ORIG-GUID: nHwfe_7z3UoVyYtp4ZSTjZEkwBZMDF29
X-Proofpoint-GUID: TN8EcUOkXOea8uQRdL7vFR4m4sOWAGHE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064



On 7/7/26 2:06 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:52PM +0530, Shrikanth Hegde wrote:
>> Cache the previous direction on steal time. So two consecutive values of
>> high values or low values are taken for decrease/increase of preferred
>> CPUs. This helps to avoid oscillations.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   drivers/virt/steal_monitor/sm_core.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
>> index 7b7435f79b85..4810bad96818 100644
>> --- a/drivers/virt/steal_monitor/sm_core.c
>> +++ b/drivers/virt/steal_monitor/sm_core.c
>> @@ -20,6 +20,12 @@ struct steal_monitor sm_core_ctx = {
>>   	.low_threshold = 200,	/* 2% */
>>   };
>>   
>> +enum sm_direction {
>> +	SM_DIR_INCREASE = -1,
>> +	SM_DIR_NONE	=  0,
>> +	SM_DIR_DECREASE	=  1,
>> +};
>> +
>>   module_param_named(interval_ms, sm_core_ctx.interval_ms, uint, 0644);
>>   MODULE_PARM_DESC(interval_ms,
>>   		 "Sampling frequency for steal values in milliseconds (default: 1000)");
>> @@ -59,12 +65,22 @@ static void compute_preferred_cpus_work(struct work_struct *work)
>>   
>>   	steal_ratio = div64_u64(delta_steal, delta_ns);
>>   	/* If the steal time values are high, reduce preferred CPUs */
>> -	if (steal_ratio > sm_core_ctx.high_threshold)
>> +	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
>> +	    steal_ratio > sm_core_ctx.high_threshold)
>>   		decrease_preferred_cpus(&sm_core_ctx);
>>   	/* If the steal time values are low, increase preferred CPUs */
>> -	if (steal_ratio <= sm_core_ctx.low_threshold)
>> +	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
>> +	    steal_ratio <= sm_core_ctx.low_threshold)
>>   		increase_preferred_cpus(&sm_core_ctx);
>>   
>> +	/* mark the direction. This helps to avoid ping-pongs */
> 
> Increasing the gap between hi and lo_threshold helps to avoid
> ping-pongs.

Sure.

> 
>> +	if (steal_ratio > sm_core_ctx.high_threshold)
>> +		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
>> +	else if (steal_ratio <= sm_core_ctx.low_threshold)
>> +		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
>> +	else
>> +		sm_core_ctx.prev_direction = SM_DIR_NONE;
>> +
>>   	/* At least one core is kept as preferred */
>>   	WARN_ON(cpumask_empty(cpu_preferred_mask));
>>   
>> -- 
>> 2.47.3

