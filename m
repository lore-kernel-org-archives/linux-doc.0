Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD383B1022;
	Tue,  7 Jul 2026 06:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407046; cv=none; b=ky6quOsEcLfjXHHH7EKkIri1Ik6NREOwRMMYM/o7T6J1+vfK+8x5SxYBm9Ah8f0KXTwteN3Q6KeVw0qzah85Trq+ti5Y2k8YH/GZ2Ym/EQ/eXc85A5YDrlwMzE3XRMjCP9tKELgHRXo4pMRFsLXDwTmJzCcylzn3YhOkuM3Z6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407046; c=relaxed/simple;
	bh=kTb0TX9bsC5BbfSENAaM66NKvWylS4yA1Y+fZCtVBak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB4FhFXvdT0Xsalq10kGeyNsxwBENxLg3i5FNALkKZ1i2vo4hRRmwnrzTe3Ve8rfl0kuItp30Rt/bq+bcgWs0G+TvtT6AG/4U0zfJlIx/SOhu6gEYMlWqklfUaHRkfW2H6B1Kl2VQ3o4ywfptePvzQnM4VdqMaCWnErCYNvqaf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=kOIYGzXA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="kOIYGzXA"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674IlRa2520119;
	Tue, 7 Jul 2026 06:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vXMk/U
	jf8AkORHWqpXWcXzu92DQaBwdc8poSsdU1RLk=; b=kOIYGzXAu9ESa9hgpc+/5Z
	ud/1uoOikXSmG/a5K+lPJHjCxlW9VxHlRnMiFih6Td4QkCYnO/rCgOZMpCyjHyKY
	BLnJK5xO0ZrFAcnP7Gmqdre2VwQ0BuuQVs6XFW61Zzv7v3jJrCCc7TLZoC3NQv06
	KZbWAuNjy30fOFfy316Na9Jwis2aMnJNKUpEKyMT7mBHhIuactocrhfg7lzarNCb
	pXd+uxq00Z7tKmyv+lMzLhNmfRX71WsgN2HD7/5JWKBJN6EFqWfZET1bZ6XHqER3
	aasJOgFtiqsxFXin9P3OpBTB19nqyUl7zUE3pJJ4rqvqIkKsBgN6CnFrlifGwX4A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qkndg1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:50:22 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6676ni5t029869;
	Tue, 7 Jul 2026 06:50:21 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6y11xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 06:50:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6676oHEu50856278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jul 2026 06:50:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EC222004B;
	Tue,  7 Jul 2026 06:50:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D615020040;
	Tue,  7 Jul 2026 06:50:08 +0000 (GMT)
Received: from [9.124.214.176] (unknown [9.124.214.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jul 2026 06:50:08 +0000 (GMT)
Message-ID: <efec9ac9-6301-40fc-a466-73e4a595766d@linux.ibm.com>
Date: Tue, 7 Jul 2026 12:20:07 +0530
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
 <8efa7a72-18c1-44b8-aaaf-80006a7c8fff@linux.ibm.com> <akv8UNpSfrrkH2aU@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <akv8UNpSfrrkH2aU@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a4ca1ae cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=31w_dGClEHoRUF-FxQoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: slDuxLYG8riQO-kSpKuNF-yJXFqqStxL
X-Proofpoint-ORIG-GUID: Ev5pf9nlbRQPQLjTGGk7c6zinYlgfaLw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX8ZJ132PlGlGH
 gBVzIYvaFJ2P4MTpI7pu24mstTqhqHW/ApCx6tSqGA6+Q9fpgaZOEM3hvLsFkqQ6Dux1nGEDRVD
 dNASvoxKg3dXHVdvf9ipy+wRh6uYOfI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NCBTYWx0ZWRfX+zglNhfT9JY/
 ZfXhqm+qEBjR1bUlCEoLo6t4GPoGaRhDAHOMF9Ajde0t8xLqnuxcrG83Mi50M5m0QU7K2N4L8ux
 iUqtQDlNYrn8TF2KZQrCVNzU2Dm1xUoTN9eGjC2yuGcrqu/iYWg5K94FffXFpIIqDnNCiKqJMCu
 VGxIoVEwUv+InnLsc2z3y8Du/muoRQrUGCnqC3uN3uG1cCz2tRuL0Q7Mkz7J07gJjpW5axREuI4
 3TCAyHEWrarwG8M3qdAwqNcYtq1+GYxrSdPWCqkT5JvLYxeL5p9vn1nuNj1h3PCM+jnYb1buarq
 Odd/zJHJARblmRNCTYB5JvoP4t8z9499Ya8YfjFW2wMffTlXiqXgzYkO5lc70URfmbXy1BeFCL/
 O9xN4kKuJpPtUJy99tkppnMlpLcw6xyHHGV8DG5rMzlgb7P2J3DqmJlbajhauKwtmFZdtxPqpDs
 8zdKC37Ec3742usehYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070064



On 7/7/26 12:34 AM, Yury Norov wrote:
> On Mon, Jul 06, 2026 at 02:17:15PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 7/4/26 12:46 AM, Yury Norov wrote:
>>> On Wed, Jul 01, 2026 at 07:46:48PM +0530, Shrikanth Hegde wrote:
>>>> steal monitor takes global view of steal time instead of individual
>>>> vCPU. For this collect overall steal values across all the vCPUs or
>>>> vCPUs of interest.
>>>>
>>>> Default implementation chooses steal time across all active CPUs.
>>>>
>>>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>>>> ---
>>>> v5->v6:
>>>> - Add cpus_read_lock() for hotplug safety
>>>>
>>>>    drivers/virt/steal_monitor/Makefile   |  2 +-
>>>>    drivers/virt/steal_monitor/defaults.c | 28 +++++++++++++++++++++++++++
>>>>    drivers/virt/steal_monitor/sm_core.h  |  3 +++
>>>>    3 files changed, 32 insertions(+), 1 deletion(-)
>>>>    create mode 100644 drivers/virt/steal_monitor/defaults.c
>>>>
>>>> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
>>>> index 24cee55342ce..7c16f8cf9583 100644
>>>> --- a/drivers/virt/steal_monitor/Makefile
>>>> +++ b/drivers/virt/steal_monitor/Makefile
>>>> @@ -11,4 +11,4 @@
>>>>    #
>>>>    obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
>>>> -steal_monitor-y := sm_core.o
>>>> +steal_monitor-y := sm_core.o defaults.o
>>>> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
>>>> new file mode 100644
>>>> index 000000000000..6681f9938f6a
>>>> --- /dev/null
>>>> +++ b/drivers/virt/steal_monitor/defaults.c
>>>> @@ -0,0 +1,28 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Base file contains the default implementations.
>>>> + * These are defined as __weak so that arch may define
>>>> + * strong symbols to override.
>>>
>>> But there's no arch doing that, right? It looks like overcomplication
>>> with no benefit.
>>>
>>> There's just ~50 drivers defining weak symbols, so this is not a
>>> common practice. I think it would be much simpler for the arch people
>>> to simply write their own driver controlling cpu_preferred_mask,
>>> rather than tweaking your code.
>>>
>>
>> s390 folks asked for explicit hooks since they have some of the info
>> coming from HW w.r.t to vertical high/vertical low etc. So i have designed it that way.
>> (I know code is not there yet)
>>
>> If each arch writes its own driver, wouldn't that lead to
>> - code duplication as each arch more or less may have to do same.
>> - each arch has to catch up any improvements that happens to default monitor.
>> - each arch has to honor design construct and not violate it.
>> - kconfig puzzles, to choose generic or arch specific ones etc.
>   
> That sounds reasonable and logically correct. But wait...
> 
> Why only 50 drivers play nasty __weak games? How all others handle
> that? Maybe callbacks? Maybe hooks or function tables? Something else?
> 
> You started this as a small demonstration, now it more reminds
> a framework enterprise solution. Which it isn't
>   
>> If it makes sense,
>> - I can make it as strong symbols for now.
>> - when the arch specific implementations arrive, can make it as
>>    __weak to accommodate that.
> 
> Please make the symbols all strong unless you actually have arch
> implementation. If you think that weak functions is the best approach
> for s390, feel free to provide such a patch as the very last in the
> series, mentioning it's for those s390 people reference, not for
> immediate imclusion.
> 

Yes, Let me keep them strong symbols for now. When the patches arrive for arch hooks,
then we can decide on the best interface.

Let me put some of these bits in changelog for future reference.

> Thanks,
> Yury

Thanks.

