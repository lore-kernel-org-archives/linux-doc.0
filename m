Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5E3A0B1D;
	Tue,  7 Jul 2026 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407392; cv=none; b=l+75I4AX8L7UpLCjchi9URYeJ7VEEwr7+zqH+mSVNfZmZfEUSt9SFw3MOZCneBy7efcwWWNK0I8McVDh2m3CIiMg9zsG2jA5weyTmz6yUOH8h1O5PLo802d80H0mZIq3sD/R5IUuhgEz00pNpVtISlAS3/cvNmuGsi6OEbFQZws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407392; c=relaxed/simple;
	bh=W4hCFa4chPtM93XO+t51Gpt1iV2uZ22TQlKBMBCMdfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KhgJWKpbAokAgD6cfFsDxepHfInucHOp9R9xL7pXIJUKEPfx1AMr4U4DZKxp2tHb5rCXqAjS97i/E6R5jFTviW2NF+R8kpcGey4gPgCYCXw7XvsONVAtycwpomEmxNgVVC0BF2K0J9Rkz/LfNfgayPL9JK5a6NOe1OqMV/dcbPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rLveP2Qo; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rLveP2Qo"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674ISRU2385676;
	Tue, 7 Jul 2026 06:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GXBCX6
	+1HDv/7hPX2ypIq1K1JBll4AZCnUZhfrwnP/o=; b=rLveP2QoMXDwMejX31aC0E
	0g8eS9Flj5DAsMSnwu48NiK+7LxRG1PI2ddkxNZBkgE5BSMz/EHBSE+RDDb3a1Kq
	n5p2ws3mjd+VuKw3NhJPXwzXKrZlaL59hbieKdLJoU52lqN6dehqlYKWdJQGOP6G
	fc15rl5SqvokS/dbxs+8q1EZGbEt5/SiG2udUzhZWZ8SRInAqO2oWN0jlWR+qxfU
	Ym88SzpdhCnKNIBOL2sxPeV9GxMNwpZANBmgNkTNFSJE9QVTkNRt6iCzspdJIHKS
	uMG/+RdQ9J0z8Lz5GMw87UNpskj9nbXjW/qFdcN3JljbSMNP9vqqYuXVmwgHm/iA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6sp3nn0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:56:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6676ndO9007415;
	Tue, 7 Jul 2026 06:56:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7cvw1hy8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:56:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6676tu9949873402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jul 2026 06:55:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3329720040;
	Tue,  7 Jul 2026 06:55:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F71E20043;
	Tue,  7 Jul 2026 06:55:46 +0000 (GMT)
Received: from [9.124.214.176] (unknown [9.124.214.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jul 2026 06:55:46 +0000 (GMT)
Message-ID: <2efb17e0-3b1f-4275-b5a4-58849ee56034@linux.ibm.com>
Date: Tue, 7 Jul 2026 12:25:45 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/23] virt/steal_monitor: Provide default method to
 get num of CPUs for steal ratio
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
 <20260701141654.500125-20-sshegde@linux.ibm.com> <akwBa4aXjsFkrMOh@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akwBa4aXjsFkrMOh@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=KsJ9H2WN c=1 sm=1 tr=0 ts=6a4ca303 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=YVLwSRtI9ssZgaGdXnAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX5cMZvEUHENCM
 qUg3kcPWX5++wG7lmaLHb2eWyiWeeJwHenEiKx05gDGkOSFZPdpy0PeLFT3G2S+ar4VV2ms/Nxb
 oXQDioa+dMuP9JMSnd/p9Oga4VivljI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfXw+uG+7wtkHi/
 OBpncpmbgTlkV9FaBaGHOuNcVU5RhzYYo3LzEVJAeSp+VyBTrNgn3Uz91riLgtZl+VRglgc11NT
 pZPsUuNcGznL0ZwQDis9xmAssBkCZdbKQzBQCOHJSIVnuGG3iZCp7FOU/sp8TsgYIGr8+hqUx0i
 2EOFJAqhZIOi88dmgOoaIwEm7vR52Kjv+9LSJaYuVZ0Ns6++CBVn6hu2V/QG28/uamQQlD1lX+f
 YI/ZlD/so2Q5eqLK7StImWmtA5rkuq6+Mo2O8pkpP0ddrApQdUSt3zkA4aIgLLsRpDgIo1z2HL1
 B39hGhppYVrxblxZ7InCa/a+B2BesMdUqCqXCpu6QegZVgHWuh1m/m2fKC68kcSyEQk1YiGc6LU
 +jRBalPd/kuSAdpvIAmhUdiKunmx95JYaQmjBk4Y48rCw8oVMD6pRv4CkomhoRQAAaaT1i1qsov
 pY8W/59/pHKZMtj+fyA==
X-Proofpoint-ORIG-GUID: VFY5i8XSNdNAhLbIBWdYHDs1a1bJnWz-
X-Proofpoint-GUID: Tt1IiWpMdcB_89ITNmuotV-lRRtBbShK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064



On 7/7/26 12:56 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:50PM +0530, Shrikanth Hegde wrote:
>> This method informs the steal_monitor core, how many CPUs it needs to
>> consider for steal ratio calculations.
>> steal_ratio = (delta_steal * 100 * 100) / (delta_ns * number_of_cpus);
>>
>> Default method returns number of Active CPUs since it calculates steal
>> time across active CPUs.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v5->v6:
>> - Add cpus_read_lock() for hotplug safety.
>>
>>   drivers/virt/steal_monitor/defaults.c | 11 +++++++++++
>>   drivers/virt/steal_monitor/sm_core.h  |  1 +
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
>> index 4e2e5b233948..70dcfb1ce4cb 100644
>> --- a/drivers/virt/steal_monitor/defaults.c
>> +++ b/drivers/virt/steal_monitor/defaults.c
>> @@ -27,6 +27,17 @@ u64 __weak get_system_steal_time(void)
>>   	return total_steal;
>>   }
>>   
>> +/*
>> + * Return number of CPUs to consider for steal ratio calculation
>> + *
>> + * Default returns number of active CPUs.
>> + */
>> +unsigned int __weak get_num_cpus_steal_ratio(void)
>> +{
>> +	guard(cpus_read_lock)();
>> +	return num_active_cpus();
>> +}
> 
> How is this lock supposed to work? When you exit the scope, you can be
> interrupted and your caller will get outdated information.
> 

> The other callers of num_active_cpus() don't bother taking the lock.
> 

I am thinking i will switch to possible CPUs for steal ratio calculations.

That way cumulative steal_values are monotonically increasing and safe against
hotplug. That leaves the necessary for locks too.

For the SUT it is okay since possible==active. In any systems where it is not,
they have edit their default values a bit. Nothing else changes.


>> +
>>   /*
>>    * Default implementation of decrementing the preferred CPUs based on steal
>>    * time. This is simple logic and decrease the preferred CPUs by 1 core.
>> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
>> index 030f6236c38e..794d3be04248 100644
>> --- a/drivers/virt/steal_monitor/sm_core.h
>> +++ b/drivers/virt/steal_monitor/sm_core.h
>> @@ -26,6 +26,7 @@ struct steal_monitor {
>>   extern struct steal_monitor sm_core_ctx;
>>   
>>   u64 get_system_steal_time(void);
>> +unsigned int get_num_cpus_steal_ratio(void);
>>   void increase_preferred_cpus(struct steal_monitor *ctx);
>>   void decrease_preferred_cpus(struct steal_monitor *ctx);
>>   
>> -- 
>> 2.47.3

