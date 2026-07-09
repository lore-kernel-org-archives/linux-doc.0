Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F5538E8C6;
	Thu,  9 Jul 2026 05:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574704; cv=none; b=JgOq3bWfqcSQhZ1XEBtAUwpVOox50Ph3ludJwcS88HVmdSLzaV2iG+jf+fjOnJ+R2rQfalyqssRwXiL0li+452I9/502QxTvLcpT0D936tQgH1B/4pTU5VGWxmIBkI3Wbm3co9sUOP1J9umG+rT//OD7CApHXDuBGFnkEodpCBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574704; c=relaxed/simple;
	bh=1MnpdUa781dB7PO/wNtbqeEDanfuBixk02ZJRXLCBuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPJYebw8Xi3uYjuSzkDEAMrzhhLg9F8wURqyAyriTEb/uMvGEguoHKbq6dlogLU3ltX9733JOxMYEXttZK0gG/JWhqsWDF8f0k5jxG4yQSt0+Kzm7pquvvfJRsKAV++jeF3lbwC5HJObz18fAq0P9CcuySJTXTI9ig2UzvXAEpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qutpoRuK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qutpoRuK"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668NIOwF4075892;
	Thu, 9 Jul 2026 05:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Lxg0Ge
	13psQSFZTi1RndBh38NeDBpQzsBMMLBX3TShc=; b=qutpoRuK3BgdflFt+ioIsB
	C1OarPAPBfjg3w3MTUGLTrEmTyNwdu8Rb4R5ItpWaC/oUWt1008DwyRxzPElrURF
	Be0T8rM4IqZW4Ti9zESvy3GIMHBeOS8wXjGJIsX/xnxLNHRtps68361F79tKWfPY
	03CzdECDfwjnzCkwikPlyvSCar1M/PeUoNN8FBCRI/Z06RNHZdjJ7Ou04b0rz8ve
	rVx6aeoPoO4KyUOrpQ33HNFBq89DLq+sTbj8q3mIKqvDjw68geaEqIUA4ReuCrGo
	f6KS9fAcIrchVvIk8pEU/l1d9n9iTPkC7FlM6diUO7F/xyvM+vwyDczRHK8yQ2RQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6rke0hcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 05:24:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6695Jcgi013725;
	Thu, 9 Jul 2026 05:24:43 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7cgqbwhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 05:24:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6695Odto49611040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jul 2026 05:24:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ADA120043;
	Thu,  9 Jul 2026 05:24:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A604720040;
	Thu,  9 Jul 2026 05:24:31 +0000 (GMT)
Received: from [9.124.216.180] (unknown [9.124.216.180])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jul 2026 05:24:31 +0000 (GMT)
Message-ID: <8fd16b5b-1e50-41c2-b113-76119d6e1f8c@linux.ibm.com>
Date: Thu, 9 Jul 2026 10:54:30 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/23] sched: Introduce cpu_preferred_mask and
 steal-driven vCPU backoff
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
 <ak8r-xZ_xxLI8ach@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ak8r-xZ_xxLI8ach@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a4f309d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=pGLkceISAAAA:8
 a=Mwd-jCOiFSQ9i4ra2sIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA0NyBTYWx0ZWRfX0JT00gWL/lI9
 uPKh99HgkmCvBSswOwmqqqoFuHZHLwUJy3b8q3gPUlGo0BTYPmH3FnZVPeI3tc1JLPV1AzA3WAP
 T/XeZLJo6C9gN8lXktDj+GZRh3bhvzn7ud7PRPCTQE07U7hhjkKorx7t+KQ/2FmsghyPuvpLvKv
 kL81T0d1zf0sd32qd4Si2DSTCI963+UPyuY/LrQa6y6XilFbpwG2G54/qC+uHlhV/Ez+++5rUnX
 8GVj9FyfHQ1pPECJgpgqwts3zVcsCWGnXu41igeXBpelnf/+ujbCiXt1YFeQ8kJXpDFG354rdul
 z61Ajhw6m4DmA+nDmroViYLJD4xkshFYM0ByAKNSxoTVQMJkPUIhdvY2IcOWdOJAxgETe/tce2r
 XrxIRMCff986SCRiH2NcyU/akhXxUWo38EycWhj7fesUYcyOJeRAjnEkk/dibyfqU2DZbdWmMb0
 PCl7fOUZzjrGDjKCR/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA0NyBTYWx0ZWRfX+NCWBIOBvEwF
 /Y9Hg5TGnK7I5tbwgq1BcbZhjIBe3LU1b973hBzfevq9AjRYOHiATinJ7xHKgXPxNOv3yVmcGMB
 NkxlplEjrdyJwhAMNUbSINvrhG98UR4=
X-Proofpoint-GUID: LALBTdozJtl9OMY17Giyy5TOnyOJbP85
X-Proofpoint-ORIG-GUID: V-HkaplNhVsmZWm2W3tcJPT8rtlxnk-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090047



On 7/9/26 10:34 AM, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:31PM +0530, Shrikanth Hegde wrote:
>> As mentioned in previous v5[3]'s cover-letter, I am looking for guidance
>> on the below concern that will arise.
>> I think there should be a MAINTAINERS file entry for new
>> driver. I don't see a drivers/virt/* entry.
>> Either as a new entry for driver or a few file in SCHEDULER entry.
>> Let me know if/what I should add it.
> 
> There should be no new unmaintained files in the kernel. For the new
> driver, create a new entry making yourself a maintainer, and relevant
> people - the reviewers.
> 

Alright. Thanks on that guidance.

> If you decide to add me, please use the
> 
> Yury Norov <yury.norov@gmail.com>

Sure. You have helped this series evolve into much better shape.
Will add your entry as maintainer as well.

Thank you very much for reviewing the series and your comments.
I will plan to send out v7 later in the day or tomorrow.
