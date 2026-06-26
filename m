Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC28A95E;
	Fri, 26 Jun 2026 13:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479441; cv=none; b=Iq36a/UsbAOmXPWZNyf0jUQF22LQBbYkZUBo0CM9Jsy3gF5/3xhU3MLv9tqgxdw8ZRgK68Nmo1FLTgArxWfWnZL+gIjdFM64PDg6i4tW1u1aHhqgxKPYGL4HD5H3yg1fKbyoaKgTQKPruIHiy6H4L75W2HEM15Vc3ix8MXdYtu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479441; c=relaxed/simple;
	bh=q+obYqRiAJX/0YajtYDiDQVaBTLa3oq3mfIgINVTZ4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GzRTe6xSCP6RE9N4i1BlQtF1gDoObDLvXcm0BMQ6KM+0eUSCCMuzsOdrd+qHx3gFf/fXUJ8FETGjbVhQhYSi0jY0ky+T6TFYF7N+XdV8MH6b941m7FHLWpcGgcNJPoKtiYPH9Wvn5wEcrAtr+10ay45QG+iFkiX/MUKh9hwi2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=MtuATMWh; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="MtuATMWh"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAIaBQ2761357;
	Fri, 26 Jun 2026 13:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=exO/Fk
	P8KKDUhM/0iqCqbU0PW7U3ChfsPYVLdKk4NIs=; b=MtuATMWhqUgNbyGC+ZXUPW
	FsazRETO16woWIHxSPjVJ1OnrdaTNGM5c3YbUqIsAuqrG+yGGj2bM6twWq+GzSWy
	SOS7FH40q9nj8DsDE9ZH6PFqG6loK1TLYNp6nu2cz/LBQV9xI1VSe6Etwtvf2537
	u6NIMIOEYibmep0iQZL9X7c123CvRljxw4sTmnOoD1rNA6iS1IM7IaUJuo1h1/f3
	kh2X/nX+116Tm+L4L316Fc48au5u578urc03u+yDb3L3H6tYituVGtl0/ADtzuCQ
	54WiqeU1PqmAjZq4ljhhkJcGcP8buNPXJcDNZktpDm/nC3e4n6vNVS/hotlxyqtA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3y81j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:10:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65QD4kap004194;
	Fri, 26 Jun 2026 13:10:01 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex5jwub8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 13:10:01 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65QD9vWY44302678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 13:09:57 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F62520043;
	Fri, 26 Jun 2026 13:09:57 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80A2C2004E;
	Fri, 26 Jun 2026 13:09:49 +0000 (GMT)
Received: from [9.39.23.71] (unknown [9.39.23.71])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 13:09:49 +0000 (GMT)
Message-ID: <79e85557-719c-4fc8-98ad-7bdcc6add753@linux.ibm.com>
Date: Fri, 26 Jun 2026 18:39:48 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
To: Peter Zijlstra <peterz@infradead.org>, yury.norov@gmail.com
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
 <20260626094153.GD2568396@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260626094153.GD2568396@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3e7a2b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=w78-qoUIv0W2J9eXPIAA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfX5qa4vVAfs9tB
 2W916mMeS+9XzudiGtxzScDR5yc4s946qkSp22PCGGVRc8vcjj5zeNqmFY6j1g3bHjaiz4eB8+e
 QMlGNMFNB3RWutT7mIrnsWd11GkZtFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEwNSBTYWx0ZWRfX7pwbXp6WrlMy
 40VsJ6GWGBAVrVX0vfDW9/GLiCXhKcVea+jJtxqGRNRTqkZBWHewzHAY9IBQoZsKoQr6llhgiLp
 8W3Hll2ntdosGLHl1P29LtIsyIW+0HFQ52CCbxHxaB8xMLQBzsMWUdAS03TqqI79oDBdRt5/pcZ
 1bzUYLLc6N1guEo5TvEyO2lGW34c84iG/L9/aD4k1r3GeSdeFhrERrr76Dw2kEi1hVeao98UmB/
 4jFa7Pzpn0xGWuQVl1X67AoNgBhbezC2UfUwcLz72RyvzSXGhA3Ol05orMwn9yd0lqOHwvp0k3o
 Wp8pQrXFpXjJOoA9cMOLVI+CtqAPNqMTWra3ZerHP+sV1e1xEO1hLXnzspZgIPHDw12lVBSRSq4
 bS+NMGDIM3HXJtb7RgndPaEl/IflZ25oRuR/ymOVplz4ZTylmrAfz/vY55KLbf1i4b4Ttc7XfqT
 wbczirgZP3/rNagUNSw==
X-Proofpoint-ORIG-GUID: _gFaDTiztzFPGUkycC_fBPEC5q5dmyPD
X-Proofpoint-GUID: 9EFQYMyaoQAhrwhMhgb7nQYwofXFJIZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260105

Hi Peter, Yury.

On 6/26/26 3:11 PM, Peter Zijlstra wrote:
> On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
>> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
>>
>>> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
>>> index 80211900f373..5a643d608ea6 100644
>>> --- a/include/linux/cpumask.h
>>> +++ b/include/linux/cpumask.h
>>> @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
>>>   extern struct cpumask __cpu_present_mask;
>>>   extern struct cpumask __cpu_active_mask;
>>>   extern struct cpumask __cpu_dying_mask;
>>> +
>>> +#ifdef CONFIG_PREFERRED_CPU
>>> +extern struct cpumask __cpu_preferred_mask;
>>> +#else
>>> +#define __cpu_preferred_mask __cpu_active_mask
>>> +#endif
>>
>> This is cure, but does it not result in set_cpu_preferred() changing
> s/cure/cute/
>> active mask, and it that not somewhat unexpected behaviour?
> s/it/is/
> 

Yes. I thought about this, but i didn't see anything bad happening apart from
setting it twice. But I do agree, it is an eyesore when CONFIG_PREFERRED_CPU=n.

> Typing hard, clearly. Also hitting 30C before noon :-(
> 

Take care. Even we should have had monsoon by now.
But its bright sunshine :(

> 

For this reason, i had it as a function instead of macro in v4.
Do you think we can still fallback to it?

only caveat is it won't be a macro. But since it is still compile
time optimized due to IS_ENABLED, it should be relatively ok right?

+void set_cpu_preferred(unsigned int cpu, bool preferred)
+{
+	if (!IS_ENABLED(CONFIG_PREFERRED_CPU))
+		return;
+
+	assign_cpu((cpu), &__cpu_preferred_mask, (preferred));
+}
