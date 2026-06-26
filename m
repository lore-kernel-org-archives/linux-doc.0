Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766F719DF6A;
	Fri, 26 Jun 2026 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782448288; cv=none; b=mPgxlKLybtgw7MOOHA3vjt24+3gc0LHMo5cmhFR32/PG4qM1+386IxgYqTbjsaxOL8/ADZMrWpOYUUGMUWZcpQtXmT0mBsRKjrGPXthdO2MiGLB8YgXgbApNqYPWmURKPaiykQrkcb2cfQqaj57kqIx8pZ0/WMqvEhc31FbH/1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782448288; c=relaxed/simple;
	bh=SmlWq5wpRg+uxz+gNCi+fzAwZ/NxzgW61Rb55Rj/5pA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfzQHHpOBQ5O8tYxRRQJFt5MD16eVd06IpPI+U+j71ouPs+0mCIvQVuOpgz0HLtNmbUW93bEEHwu/fjnUV8A8h+Ntd5h6mR//2SXGXb8J1HNXH3BngV/fXqp95124uyG31KXqMDAY5Iu+UM4UZQPu5LpK1dFB7TrFkSlrs/QfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=skMMwFF3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="skMMwFF3"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2nNic1796347;
	Fri, 26 Jun 2026 04:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hVh9ZU
	h/RSiAucmCH68s2Z35kORR3Qv9i46K6zCjqp4=; b=skMMwFF3SktU+Gsonk9TEX
	XvBCATsAI/XzYUkco1yLuH07msHIJtxN8BJMa5CPVa6E7P5Mynr08IhXMIuQ3NNT
	9LuTkOpPVQDllHYo6BHHglnNRXBPxYzYhrZ+y3BuAqU89FfkLxVBaFfR6RUSnSAu
	MQQOJ9Yz4sNCIMYEtN8gmgq1SNJzcpsAYgNvhvWeV05STrhAF3bf9r9eMwwCcFzt
	7YGred4gZy0YZ/UFNcZBM57k7n+nT6pghzunLCItVE/DShTQCr30Ht45UvJQ4SF5
	vbP2NwtJ6RFRZBe/H+ibcMwPGbclqBi7sV33sjtnqrXL45M6gorao7nIsfzCZjlQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjk4w7q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 04:31:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65Q4JdbU013259;
	Fri, 26 Jun 2026 04:31:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ex56qsnks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 04:31:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65Q4V3gx47841642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Jun 2026 04:31:03 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C81ED20043;
	Fri, 26 Jun 2026 04:31:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DF8120040;
	Fri, 26 Jun 2026 04:30:56 +0000 (GMT)
Received: from [9.39.23.118] (unknown [9.39.23.118])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Jun 2026 04:30:56 +0000 (GMT)
Message-ID: <b8d43d27-8f22-4874-aa87-e2508d6e42b4@linux.ibm.com>
Date: Fri, 26 Jun 2026 10:00:55 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/24] virt/steal_monitor: Add documentation
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, yury.norov@gmail.com,
        kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net
Cc: tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
        srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
        vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
        pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
        tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
        kernellwp@gmail.com, linux-doc@vger.kernel.org
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-14-sshegde@linux.ibm.com>
 <0e033f0b-f2b8-4127-b067-b960793bfba3@infradead.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <0e033f0b-f2b8-4127-b067-b960793bfba3@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzMSBTYWx0ZWRfX5Qdr8dEYArl5
 kZ4JTws+hFoa7j4ZOCbF2eRkQZG/I3+FcP/2SSVFldobgRPl8LVQGFB/gU+oz4SbeEpoUe5RgtG
 btjuonAqz//X3w8IzFHxVRCd2BZlGfg=
X-Proofpoint-ORIG-GUID: Y6oDm-vkopewX7Y8h-Yo1_plSeH0QLqg
X-Authority-Analysis: v=2.4 cv=Oph/DS/t c=1 sm=1 tr=0 ts=6a3e008d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=hRRnnueQzgMOHSUj8WsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzMSBTYWx0ZWRfX57JN/dmTtraf
 C0nkoHv2LupV1/iGY4dHtnsxix6tpUVWM62hk8/zfBeAXMSg7+ypHKr5jHf0AWRO04rIEpwGv+Y
 GsQRPpCaVweT/iEEDAdwdPevUIKZBporQ/TcRu8f256c6nzQ5tIMIICb6ljHIlOdk7ASo9GKorK
 FYQbGnEjeKRTQqzoY8kZaliXzrcJnKQ8dPWoNn2S/SOee7IImE8DHwRUc60J+BFeW0VL3mnCfLi
 pLIUwXsbklq7WlsJbfMgXhRLg0Syz1cMs4+vVSRI5Z6j2RGVnayZxjNEksvpmSXQLOfQR6ep43d
 8EG6U13cgwvxiT5oZhP1r0fEDcKlL0gvwficFP6S+upq2ZEanV3R0LpbjWjIdElwV59i3CVANMt
 QESStwj728Clnz8qkw7MHUoWmgcEGhRmR24O4hpY/S/BlSWX1PnddcCs1BXWk1uAiw22eoAqxyd
 YDKdyjQiUS6T8PMKa7w==
X-Proofpoint-GUID: viBiWbao28nV_5ibV1LShur5yQK2wKQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260031

Hi Randy, Thanks for checking the patches.

On 6/25/26 10:30 PM, Randy Dunlap wrote:
> Hi,
> 
> On 6/25/26 5:46 AM, Shrikanth Hegde wrote:
>> Document this module named steal_monitor and its parameters.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> v4-v5:
>> - new patch
>>
>> Please let me know if the placing is not right.
>>
>>   Documentation/driver-api/index.rst         |  1 +
>>   Documentation/driver-api/steal-monitor.rst | 93 ++++++++++++++++++++++
>>   2 files changed, 94 insertions(+)
>>   create mode 100644 Documentation/driver-api/steal-monitor.rst
> 
> 
>> diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
>> new file mode 100644
>> index 000000000000..997a22d0812c
>> --- /dev/null
>> +++ b/Documentation/driver-api/steal-monitor.rst
>> @@ -0,0 +1,93 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +=============
>> +Steal Monitor
>> +=============
>> +
>> +:Author: Shrikanth Hegde
>> +
>> +Introduction:
>> +=============
> 
> Nit:
> Kernel heading adornment style does not include an ending ':' character
> (4 places).
> 

Ok. I will fix it next version.

>> +
>> +Steal monitor is a driver aimed at solving the Noisy Neighbour problem
>> +in virtualized environments. I.e performance of workload
>> +running in one VM gets affected significantly due to other VMs and
>> +combined they make slower forward progress.
> 
> 

