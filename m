Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC73BB69A;
	Fri, 26 Jun 2026 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480509; cv=none; b=lxcNH4OqYYe+2b3lz8ekSKbovFr3ziL9nGK/ANN7wsIioOprCtrV8DW+O+wr/gyFk/FL1hWBNbbXFr72SsLn6CWS0naJ29W4TaOjwes8cerXveVsNdQt7G0Hz89itcHhSYy4zRgNu6/9cSagi4v/EKJHom4RoOT1HeZZXWLxKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480509; c=relaxed/simple;
	bh=BZb4iukxJymfv4/Hv7AbHi4/Ca59+PxjkeMkW8rxajs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYKWbCu4z2xHnhloqAkhK+457MiChP3vtNg4B/7u1RRtouOAG4MW97IoKGMY1qJl4YtIgl+F41+PJVbf1bcrQFLTaIJdfHhpzME+a41L1YaYiMdFfFhKEQr9nK1luT9gUYbn0LDmKktAM9P7yn1EL31BO5HH5NsjGqQZ6T8j258=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=LgrqONNS; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="LgrqONNS"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIWRU2660160;
	Fri, 26 Jun 2026 13:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=T9q5gu
	CXvQjYT1mFolckMXY3LEZaYkkeE3WtKT4aRzQ=; b=LgrqONNSYQKsVDN5LQMPwk
	erdn2Sp5DMN8vxjltQNUFNaBfKGSWhtBFxlzzhPly2pfvEcB1XtN8AatIzMOkkOt
	B9If5tdSpN1mnhonz1qZGFaP7iRBBTQfiD40TNFiOTMm8UgfV8ycIBs4WefCDXFi
	pKPznzZvC2HCF/8MQUzwj2UU3pjnpOVQgmRL0WXdm//aB9H93JnckEorsIACw+8V
	DWSXUYjb7TfYpkpFZ1q/oSgqWRKEThCl6Fys4FnCCsBhk9IJJ181Hc6HizH7sB4C
	ZrSqK+CpWSBQjZTpRacolDgwaiFnc00Qcz0BJu5AnvLxYed+te6jBO4XqL1fforg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gxt8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:28:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QDJk4S019827;
	Fri, 26 Jun 2026 13:28:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwucyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:28:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QDRu1t27328972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:27:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0D9A2004B;
	Fri, 26 Jun 2026 13:27:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C9A20040;
	Fri, 26 Jun 2026 13:27:48 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:27:47 +0000 (GMT)
Message-ID: <19527132-eefd-42b2-8dbc-258d6c598a34@linux.ibm.com>
Date: Fri, 26 Jun 2026 18:57:47 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
To: Yury Norov <yury.norov@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
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
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
 <20260626094153.GD2568396@noisy.programming.kicks-ass.net>
 <79e85557-719c-4fc8-98ad-7bdcc6add753@linux.ibm.com> <aj58DG3BLf3YWPyg@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aj58DG3BLf3YWPyg@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: m3HXjw3sKUFQ52aaTskLpymDsGp-hCBj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX3rVOGr/UlSH4
 c+XFbiLV5B971kuJEOAF0CbLnHd0gUE8lLtlf46wDOpjnUlHfR/b51dqpp5ufSmAvbERe6BtnD5
 94BMOTYqiP0nzaQAmooeHx0sbcBtuXo=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3e7e61 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=OpyquhL-vbyOqvzoqVEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwOSBTYWx0ZWRfX6+xWCgvUn7mZ
 Mg271/iUHeKnDMANts4GCiSp26HwUHo9/Vse/lLB1qy3ARBkTdO1OlNBrHkTkX8sCVZv/GZFvXd
 0RobyLcxlN68xfO+PJWxxt2kzHyEWch1qgRL0MqzT2Tj+cav5WhDVIAFGu+cICYIGqX9FN9u9y5
 qb8ugmUInKTmx+QS5xe1oegFJI8RTYgQ6LAvGVCw6FRdZK1Z+IhQJFV9LlY66XTj5BR26T/oUUo
 5h/yq7+aXEzzUKsRlK/MNt5P0oAZfU0nCJE61ItFXIXU2q9vCwkd+Hyfb8V5q1RUlxPrd1zzB9S
 WXZsZLcvtZMqCpFcxufJJsV0fgyiJmkcKaLc+UYBetlr9rA+XHlIatO9i0AXHGqFuUdITHGqm51
 g0NAL87vLzwS5gyv+0MogtKt4on9A3aLlX1QIxnXAKok1gpIKEWORrjA0YlBECEIQxAercQYr8Y
 4M2wLl2jyyTF3SRB23w==
X-Proofpoint-ORIG-GUID: dK-1zJqJDAbgy45Md4fMiyxbGB87vV25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260109



On 6/26/26 6:48 PM, Yury Norov wrote:
> On Fri, Jun 26, 2026 at 06:39:48PM +0530, Shrikanth Hegde wrote:
>> Hi Peter, Yury.
>>
>> On 6/26/26 3:11 PM, Peter Zijlstra wrote:
>>> On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
>>>> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
>>>>
>>>>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>>>>> index 80211900f373..5a643d608ea6 100644
>>>>> --- a/include/linux/cpumask.h
>>>>> +++ b/include/linux/cpumask.h
>>>>> @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
>>>>>    extern struct cpumask __cpu_present_mask;
>>>>>    extern struct cpumask __cpu_active_mask;
>>>>>    extern struct cpumask __cpu_dying_mask;
>>>>> +
>>>>> +#ifdef CONFIG_PREFERRED_CPU
>>>>> +extern struct cpumask __cpu_preferred_mask;
>>>>> +#else
>>>>> +#define __cpu_preferred_mask __cpu_active_mask
>>>>> +#endif
>>>>
>>>> This is cure, but does it not result in set_cpu_preferred() changing
>>> s/cure/cute/
>>>> active mask, and it that not somewhat unexpected behaviour?
>>> s/it/is/
>>>
>>
>> Yes. I thought about this, but i didn't see anything bad happening apart from
>> setting it twice. But I do agree, it is an eyesore when CONFIG_PREFERRED_CPU=n.
>>
>>> Typing hard, clearly. Also hitting 30C before noon :-(
>>>
>>
>> Take care. Even we should have had monsoon by now.
>> But its bright sunshine :(
>>
>>>
>>
>> For this reason, i had it as a function instead of macro in v4.
>> Do you think we can still fallback to it?
>>
>> only caveat is it won't be a macro. But since it is still compile
>> time optimized due to IS_ENABLED, it should be relatively ok right?
>>
>> +void set_cpu_preferred(unsigned int cpu, bool preferred)
>> +{
>> +	if (!IS_ENABLED(CONFIG_PREFERRED_CPU))
>> +		return;
>> +
>> +	assign_cpu((cpu), &__cpu_preferred_mask, (preferred));
>> +}
> 
>   #ifdef CONFIG_PREFERRED_CPU
>   #define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
>   #else
>   #define set_cpu_preferred(cpu, preferred) {}
>   #endif
> 

Ah! thanks.
