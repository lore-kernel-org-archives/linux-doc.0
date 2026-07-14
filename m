Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D58F196C7C;
	Tue, 14 Jul 2026 13:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034970; cv=none; b=uK6sFk2U6+lorPNWuKDan26+aCxuH08isf7P1Pt3jz2FYAFap+SLBOuvcpIyTCrFcDfW+YGvkgjAYyB7JFv53sdcgKj/NW2ShTBTiumzbb9We2sWv1YRLfjNRORo9KDe3qIsigTOhxhkR88rS1nbShiUE1wRUfFqrpXwo2Tl99Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034970; c=relaxed/simple;
	bh=n3Ehot5SWY2HrPh/FyXLUCFgDyAYmrzgZ0VW/zW1F5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrzD0SpGwhcGa+gQ/hFk2EFecdeyh3DacjRuy1pGUg3UbndDDdSBtIThce/ONUcLQ7FfZjZHUAEo6IQMHUBt/Ay4zn93mAYHK52vG2ZZctt0+1zpLmWJeXuiZoxd1xAhYwkJk/x15kl3hADy1RyNRRUTt8v5tcT/yp7Mpxtb7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YeXbLWc3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YeXbLWc3"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBg3wR1129452;
	Tue, 14 Jul 2026 13:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jCq37T
	kL28U9G+N7fkSwvoQgEojd2HLJ/d6ek/xPrls=; b=YeXbLWc32yK1AHdWVbLLp0
	qaPTqFoPDksJAjoVISj37bbuHXyhzgofvMWKX2Bs+mkxK0bdcvTgdbqyKSCkc2nh
	zSxBZ1yZxwMmhqDpJhKyt4RSrUGma9yIgHxvVMB4WJkOIen+lqKZGyTIOwK/1mx1
	A7Wc0DGby9upSmFZKalflPoJEGO2aIx4PsP3rRMKtY2araMwbCaC4seePI2DfGV7
	x/yxTITGjnOwClFsI6xqoPhB4VTqle3hyzxMudZcu6BQQHqa6UMd4cQkWww36oZt
	fyGHRfq8Xl3xby8noINqFAuyZIwYj0JZbbn0yDLU77Xq/ouQElEdiikf9lJatWRA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fbexwns5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 13:15:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66ED4dt2009155;
	Tue, 14 Jul 2026 13:15:48 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2uy2maq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 13:15:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66EDFiS750987474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jul 2026 13:15:45 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D40FC20043;
	Tue, 14 Jul 2026 13:15:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FBEE2004E;
	Tue, 14 Jul 2026 13:15:37 +0000 (GMT)
Received: from [9.124.218.91] (unknown [9.124.218.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jul 2026 13:15:37 +0000 (GMT)
Message-ID: <70e1eac3-c0e6-41f9-9e61-083bc6e39bce@linux.ibm.com>
Date: Tue, 14 Jul 2026 18:45:36 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/12] virt/steal_monitor: Provide functions for
 managing steal values
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
 <20260709215648.1246821-11-sshegde@linux.ibm.com> <alFPb9lUKCGTN8Ky@yury>
 <b4b7591c-8edd-4f45-9e03-37d7353ae5cf@linux.ibm.com> <alYv7QGbsdLaMPH3@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alYv7QGbsdLaMPH3@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 36nQN3m9eCtOGStksdgmaqD3miqp3F1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNyBTYWx0ZWRfX1EWs2TdryaDJ
 cN0IpOf9IXo2yRokRlj5uDodLJ8o5Jgun9hwthY8O7XUfgDn4esc37MgTdnFeNQd5iqPsbbpIiR
 Pht9UzgAP3+TPg1yMp8FPhkN9C+Zn1z+dieVPMK5HX9MNVrC0JjDRwhoEVxeyVPU94vpLsYUe5b
 Kk3YNjKYwLWsehGa2Wt8cH+Nz12l04o5bx+r0x444pAEYwt4XfRXqCyYvbSh+GMpaUKNmXX4dRX
 x2uq6B7HpZ8GN0LvRTQXGwnxOutcMZkEa0MU2kbSutFqtHTX0CqYCWvQ59DwLGfQS6cbUa33V0s
 FbU2BOyefWyF3b+/VKJBwvlPJszm6r4uFA8Zs87gO3DbbQj36Tt6dThOw6vSkd/li/i50uRS+98
 qEMHBaNNPNjd1pfjftQ4wRJsLySoin66qM/utEewBUr62o2lfe1TXnYTfl879l62DnI7YV3x4CB
 Bx4HAfknda5MIX0RfPw==
X-Authority-Analysis: v=2.4 cv=XJoAjwhE c=1 sm=1 tr=0 ts=6a563686 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=kluOzof9-ue10X2vOBMA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: bIEr6mnVSX_744BbgYiP1h_lZGYC2Jsb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNyBTYWx0ZWRfX844l89ZO2mMb
 qxy4nRvaDx/+1n6C0u7imDHolcQD6nBwE9ZjMipeLt1l92QBxHZWmK6YqasLwyDpducB3/cUwP2
 2McWghScqeJv24PGgX8c4/ss7/9+9hw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140137

Hi Yury.

On 7/14/26 6:17 PM, Yury Norov wrote:
> On Mon, Jul 13, 2026 at 10:43:15AM +0530, Shrikanth Hegde wrote:
>> Hi Yury,
>>
>> On 7/11/26 1:30 AM, Yury Norov wrote:
> 
> ...
> 
>>> I think it should return status: if the function can't disable CPUs
>>> now, it would be a good hint for the caller that it would be useless
>>> to call it again.
>>>
>>> You may keep status in struct steal_monitor like:
>>>
>>>           if (steal_ratio > sm_core_ctx.high_threshold)  {
>>>                   if (sm_core_ctx->status | CANT_DECREASE) {
>>>                           pr_something();
>>>                   else
>>>                           sm_core_ctx->status = decrease();
>>>
>>> It would be a good hint to user that he has the driver misconfigured,
>>> and save the driver extra work. Same for increase().
>>>
>>
>> I thought about the extra work in function, but doesn't happen too often IMO.
> 
> 10ms is the shortest possible interval, 100 times in a second.

Even 10ms is too short i think. I am thinking to keep it 100ms. So
some meaningful number in terms of steal time accumulates.

10ms means only 1 tick on HZ=100 (which is a valid config even today).
100ms means at least 10 ticks.

That also reduces overhead concerns a bit as well.

> 
>> Also, it is specially not a misconfiguration for increase.
>> So i have kept it stateless for the below reason.
>>
>> - Under typical operation of this driver, user will enable it once.
>> - Once enabled, user will use their VM as usual.
>> - Majority of the time the steal time will be less.
>> - workload are bursty in nature.
> 
> Not necessarily.
> 
>> - Occasionally many VM will have high utilization and there will be steal time.
>>    This lasts for sometime.
>> - After workload completes, steal time goes low again.
>> - Cycle could repeat after extended low steal time duration.
>>
>> So when the steal time is low, though driver is enabled, doesn't mean it
>> is mis-configured. Just that there is contention and driver has nothing to
>> do. So, adding print there could easily consume the console.
>>
>> Similarly, there could situations, where decrease cannot happen though there is
>> high steal time, Though they are corner cases.
> 
> OK, that makes sense. If one needs to fine-tune the driver's
> thresholds, he'd monitor the preferred cpumasks statistics.
> 
>> For example,
>> - one small/few VMs have not enabled the driver. steal time could be high, but this
>>    VM has already down to one core. It can't decrease any further.
>> - Though all VMs have enabled the feature, but task running is not FAIR class. Though
>>    steal time shows high.
>>
>> Hitting only one core or all cores isn't necessarily a misconfiguration.
>> It is a possible behavior during severe contention or complete idle system.
>>
>> we need to continuously monitor steal time so that it can expand/contract the
>> based on current situation. If we stop calling the functions, natural expand/contract
>> will not happen. There is no interrupt which arrives due to high/low steal time where
>> we can kick start the driver again. Also it is a difficult ask for user to keep enabling
>> or disabling the driver.
>>
>> Since this can be called at minimal once in 10ms, I guess we can incur the additional
>> overheads to keep the logic simple and stateless. What do you think?
> 
> OK, it's your design.
> 

Ok.

I will keep it stateless for now.
If the need arises, we can bring in more towards that.

>> PS: I will remove that additional SM_DIR as you suggested in other reply. That keeps
>> it all stateless.

