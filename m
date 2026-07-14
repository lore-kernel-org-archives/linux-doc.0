Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF133612DB;
	Tue, 14 Jul 2026 13:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034582; cv=none; b=EUWTUBVWr5a8pSZoSBNQw0FuQRgS6OSc9gcoTdQrxr5wIMQJg1OZQWGzpdE5WEqEfPcIlLtFmPxLAWx6JGaCLHZPwBvHBclVUa8wD8Q7KJloWLBNUH+ohmQND7+8jiYEAl2cw5rupL8dr1hzc+Yivue44yc9kZGuZvGK0lOnN/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034582; c=relaxed/simple;
	bh=8w7Sfos4q/904A1DtDrr7QDWU14dgSNV5c0tPRd9u1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=or3HMQajYqpA5DdWIajTUQO11JWAyupdsPTXAHWw7OVkcfEY9Boziq7nKMdr3jtB+TqCR7YDqdm9k6Jij2XvL1xSXSPstlLLNuMyeY4Fd+WIoISUC5ddFr1zslC7MFmM5XIZEUNiPWUhK9UP3cRiMDiN00GWHX//cLBcj3oPPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Z9TaKktz; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Z9TaKktz"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBfZVs3511627;
	Tue, 14 Jul 2026 13:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4dlIaT
	jPOUBup3xHtT1Ibk82juwraOujf9KtG1BRPy0=; b=Z9TaKktz86Zmw6NFj8lif6
	xMC/PtMd0slmiDhVxVyRbkKHQ+3HM/I5d62VuE6aMhPACRV1zO3G+ddSgnQyTvQf
	vKvdU1bQySnuxHlpnWJBzn2UQxdY13FEL4cXNxTVk6cK9El3J0c2qALwCnoN85Ee
	bW1qZEezvt1tE8tcXrRMUbl5o5BjeIkiqNeW++osH7dhFuVBW5KON/SnYBbN5Vr5
	en/iBhSydr8UKZgAZap7telj/glhC28Hbx9Xv46xST/YySIxkUlqli0quitzF8CQ
	jsUDDmQN73WptB82Na1PjiKbYeVD80FRcD3eIG1iFBt/+hR5TTO4JahVjfYkDLvA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fcv336t2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 13:09:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66ED4g9L029015;
	Tue, 14 Jul 2026 13:09:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fc2cgapff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 13:09:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66ED8v9G30933406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jul 2026 13:08:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F06F2004E;
	Tue, 14 Jul 2026 13:08:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09B292004F;
	Tue, 14 Jul 2026 13:08:50 +0000 (GMT)
Received: from [9.124.218.91] (unknown [9.124.218.91])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Jul 2026 13:08:49 +0000 (GMT)
Message-ID: <39fc9f4b-b93e-4c53-b1d4-4c868c18ac62@linux.ibm.com>
Date: Tue, 14 Jul 2026 18:38:49 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/12] virt/steal_monitor: Act on steal time
 periodically and decide on preferred CPUs
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
 <20260709215648.1246821-12-sshegde@linux.ibm.com> <alFX75dzgkMnDXAD@yury>
 <9da4fd45-0a0f-495d-8207-816ee88c5937@linux.ibm.com> <alYsGQhAyknF4X5b@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <alYsGQhAyknF4X5b@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMiBTYWx0ZWRfX/JmcsyqC6q+r
 VPaiDsp1AqaDo6UYDTw8Sylfzzzeh1rpRqXT1+Ofdx+tOI5UWCXm38YiAM338UXUu41uwkkDDFr
 CJCHinv9RBEKFhV9sCy3g2c6MPBqFF0=
X-Authority-Analysis: v=2.4 cv=Mp1iLWae c=1 sm=1 tr=0 ts=6a5634ee cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=3PJ_pY2KotYQqXn6dpYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Bf-fc0mQ7Qc0C-W4QUItlV-xXxnF28dK
X-Proofpoint-ORIG-GUID: _dbRl5ysoEfH4FezUuHubov7NIv64A0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMiBTYWx0ZWRfXz3j65nZhYlFZ
 7O5iYnRycDqN0WstymVfhT/ZCglOYgW0h05iuNKWLyZ0uLjACzKZ9aZIFS5VamxXazwwY2q+UV6
 P3Fdod2LXRKLHXtX2vI991pifLaoF3SKvhJ4QeNXJCjt7NXgVTX0GMcpV1grT2LIlObSpUNsEcP
 W+y77U1V12Gc31DAx/iVHtgrTXmYy/PVEFQqvbxyCRS+hdvbxZFyGuuqhfQNQi8LZysuTdDL/Dh
 UoaAmMoxZCjSDe0B4aqbCXCsZ4AAD4IVDo8amIFu3nGxNMxx47C/gvHx7FWgEGle/pFWBm2B6wS
 K2xW1Ot6jJwbKdxszmr6SS+vyKiQs6jY5jRbRAXciKGFiTrprjjB9xVS5uB+eQo0bS9Du4MDB8e
 oz9FkJHSymY1zJksksLWKU+EnYZ9IaefxZVoxwxu1NEmEjG96cewK00eSLWCYZpWNPoYIF78Ogo
 rmuW5ag+YSJEpO8bGJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140132

Hi Yury.

On 7/14/26 6:01 PM, Yury Norov wrote:
> On Mon, Jul 13, 2026 at 11:18:59AM +0530, Shrikanth Hegde wrote:
> 
> ...
> 
>>>> +requeue_work:
>>>> +	/* maintain design constructs always */
>>>> +	WARN_ON_ONCE(cpumask_empty(cpu_preferred_mask));
>>>> +	WARN_ON_ONCE(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));
>>>
>>> cpu_read_lock here? And again, you should do something to restore
>>> integrity. WARN_ON is not enough. The simplest and safest thing you
>>> can do is to unload the driver. You definitely shouldn't schedule a
>>> new work against the broken cpu_preferred_mask.
>>
>> How about not requeue the work if it broken. Add a pr_err and return.
>> That makes driver pretty much nop until rmmod.
>>
>>          /* maintain design constructs always */
>>          if (cpumask_empty(cpu_preferred_mask)) {
>>                  pr_err("empty cpu_preferred_mask, stop steal_monitor work");
>>                  return;
>>          }
>>
>>          if (!cpumask_subset(cpu_preferred_mask, cpu_active_mask)) {
>>                  pr_err("preferred: %*pbl is not a subset of active: %*pbl, stop steal_monitor work\n",
>>                         pr_cpuamsk_args(cpu_preferred_mask), pr_cpuamsk_args(cpu_active_mask));
>> 		return;
>> 	}
>   
> That would keep broken preferred cpumask working in the kernel.
> 
> Imagine, it becomes empty on Friday night. That severely hurts
> the scheduling on the VMs. So, your approach requires the VM
> admin to come and manually rmmod the driver. This is not how
> he wanted to spend the evening, I guess. :)
> 
> So, ether unload the driver, or actively recover the invariant.

yes, i will restore it to the active mask and not requeue the work
and add a pr_err.

> 

Can we unload the driver after init completes?

This is happening in work function after module is loaded.
This invariant maybe broken after a few days driver was loaded.

> Thanks,
> Yury

