Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECC3F4DD6;
	Fri, 26 Jun 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782482769; cv=none; b=KsxCwszf9TL4gmomIE6DVI6UL8fRY1MIydIMrjWUelkdDOZOM5aVUYPZyUM5il82wh6WHW+0g7i3nLbIgUGeaox2Gx0KzsuHjq3ZmOJ0j6rcdicGG4emcMXxoYDXH4f3QZLZHwsvxSheiEIgWkMA8imUPX2e6dp78Zqo460mEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782482769; c=relaxed/simple;
	bh=ARWYHZu58ai2xJMKxJ5hSVfAxIUPJUnxV0Y+WYSZq+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZBwjiX0KuNTJQmLkbTWRXFp32S9QLWJMyB4yMxLDTscqCry0Qrc81/NKAjz02EAP1injYoyUwq2E7CilD8W2je8tLO1zG6jMJJNFaLGl1/JOEzIE6rLuGG3ztRX4FEQeE+y/pYlqbdyg9Qjwt9zf3o5JtURuf2g4P3ybqXxaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mSxW+zDR; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mSxW+zDR"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIHfV2760968;
	Fri, 26 Jun 2026 14:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=068hJl
	XV1KZY8eTgRRLWYiEc2o/gVL21UOxKKqkyhyc=; b=mSxW+zDRGIO5lJCYAgY1cn
	6ZI0ghQtTS6mHb2rQYPKfMlRiAAEN1kv5xJdPUeHOPhZRi+edAvyfBbcnXTHqbkZ
	ipkKLQZtloalB9/YgVCjIED1U3GbpLBa5IBKI/typuaXuJxIPCZeY6z0QhPcezJv
	WVP5OCXUxDCyBl6Vb4hL6PdxRLjvkgZzSGzzKxE6rZxeRrEz/j2lauJS1CvkID61
	YzNbIFxTJHsu2S8ahn0xHWyYCtd2DlZHgPDhjLT1g0vgxMHYlJgEwkTo8SeYhEor
	xDkDGaaiyhDAjeeKM/R+FGSLJywrxezbvzd4xj414kc3zVtdfXewzFvIsmy8GVyw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3yfmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 14:05:47 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QE52P2030266;
	Fri, 26 Jun 2026 14:05:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex7dgk59b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 14:05:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QE5ga116515562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 14:05:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46C2820043;
	Fri, 26 Jun 2026 14:05:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F47D2004E;
	Fri, 26 Jun 2026 14:05:35 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 14:05:34 +0000 (GMT)
Message-ID: <e65fbded-66d6-4816-b75c-0b38e835e4f8@linux.ibm.com>
Date: Fri, 26 Jun 2026 19:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/24] virt/steal_monitor: Add documentation
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, yury.norov@gmail.com,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
        tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-14-sshegde@linux.ibm.com>
 <20260626092806.GL1181229@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626092806.GL1181229@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3e873b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=kp7LsBxPi20PxSI2dAUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDExMyBTYWx0ZWRfX4DYGvv9FYdiK
 bq0W/JjyMTUMx7zx+4CD4ta6xKrhbQYBU4x+vMXv0b5HCvryt3ztvdF+0ICf0PY1P9h/cx1CyAT
 S+mOM/9jU8B4zZ5ZwtVlPHkLMg5pDc8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDExMyBTYWx0ZWRfX69j2gKGOtNly
 BM6oLEB+yU1fGVXykjs327N062EZddNRU32VchGVtKYNo3IM9LOmFI7U2P0v0vp6DJZAA3UiAPe
 jKXQFGINF9WEZC6E2Y9FKNBNzQDrKwTBKuuLDn0sJxEVMcscMtN6KrmLymU+eRPo4/xd4HdzeDX
 PDfIwM1tr9wed5rxTGMuAkLldqnDpLtgDeomrWHIA/9ly0twXgioQW9gAalV6102dOafgMgCipD
 GJ9XG5hWmw0cumvdHHdXsk5undlw4aMwNHywY+FB2+94F1Dzgj1t9rD92e8y47E5QJxE1vnb1ti
 G/pp5mQOpTQgXXZdXN3N7AJ4RtvTFtTza/wIVImUBqlHYkGywzA1sDAvXmHGhd/F/2KalhUkozr
 mno5AJ0uV5hy4dZS9d/gxIBpgybiODeaKYpDxCia3/bmfOQfhPqLHXwZ+EJA2Rusfu/R01lY+28
 x4ve5sHwPgYWiU3NWOw==
X-Proofpoint-ORIG-GUID: 8vx6qp7TkkSuJYG5kM4I7EaHYbxGCJmy
X-Proofpoint-GUID: 7p_i8Jj-EI8C1xV5poxOF6E-0w3V8fgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260113



On 6/26/26 2:58 PM, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:37PM +0530, Shrikanth Hegde wrote:
> 
>> +Core idea:
>> +==========
>> +steal time is an indication available today in Guest which shows contention
>> +for underlying physical CPU. Use it as a hint in the guest to fold the
>> +workload to a reduced set of vCPUs. When there is contention, steal time
>> +will show up in all the guests. When each guest honors the hint and folds
>> +the workload to a smaller set of vCPUs(Preferred CPUs), it reduces the
>> +contention and thereby reduces vCPU preemption.
>> +This is achieved without any cross-guest communication.
>> +
>> +Steal monitor driver effectively does:
>> +
>> +1. Periodically computes steal time across the system.
>> +
>> +2. If steal time is greater than high threshold, reduce the number of
>> +   preferred CPUs by 1 core. Ensure at least one core is left always.
>> +   This avoids running into extreme cases.
>> +
>> +3. If steal time is lower or equal to low threshold, increase the
>> +   number of preferred CPUs by 1 core. If preferred is same as active,
>> +   nothing to be done.
>> +
>> +4. Ensure preferred CPUs is always subset of active CPUs.
>> +   On feature disable it is same as active CPUs.
> 
> 
> So this is very much a co-operative scheme. Perhaps add a few words to
> describe the effect of a non cooperative guest. IIRC the result is not
> worse than the status quo. That is, if one (or more) guests refuse to
> co-operate it will not make things worse, it will just not result in
> improvements, right?

Yes, for the benefits all the guests should enable the feature. If not,
one guest may use more. but if we see overall combined performance,
it should be better than status quo.

I will add a paragraph about it.

