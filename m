Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9C4182B4;
	Fri, 20 Dec 2024 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695355; cv=none; b=pbsPC5Cz5URjuBnLUd+1mhaEydO3yf2gx2EGmZX2nLAb18wmMAfzaowpWyqg6IZ9Ec3HrwfRyu0YMpkNXnekfzxcHHqYRdNiKwqNpe/ZvHzyht0d2tGephWEXVNa2NHt9JP5APEbBKmUG92ZRo7ruMM2yfVauLng6MNWGyZvst4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695355; c=relaxed/simple;
	bh=NpIl9rMOMesl1p5VoULkavpAbHtYlFTklALmzVcVPzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjLllQX4hryuaq3r/9azSwB/E9H2cn87vI4Rar19UxmRY5Auv9Dlqkqef3ZK0YSNrl9CNhAWG5fZGFI8FpmZkEFhCHvTznYgRRq907A9PU8Vq5g2xcbXTfLMgIo04Z01tYEGujBvtGZ+kMOoFyzNjGHtwlW9C5ZD44kJ1Xb+smo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=A1l/3Pov; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="A1l/3Pov"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJNwHFJ002618;
	Fri, 20 Dec 2024 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Bh8iYu
	soxD3PtpyjVo8Apf6PwClBxV2A6mFccUV6I/M=; b=A1l/3Povy1ELAjNrnBNAPd
	5t6ggwGQGsvm2gRwltQCtAUctzsGdz7IuAbIKv4tLWjT3Phh6Jw73lL+UOqUMTxu
	9mSJGS2KZ/bFBZaNF15hh0E359ejda0BW8/s43YDmEpe4Pom+7HHI7IZmvdwkNxS
	eRDZNePOiaqbWyZXgsic3rkOFOKbJ92InigN2DwdtfU12Aa2jw++mIqGRI87SRqU
	9lyt5qra18sE3twImYVCrT5sAqPyUqxb72hlKwQre+qhsuulyML3+9vZ0wTQj9Nh
	d1rD46s03YGIfyXbVJdDW8lcrdk9k+cH3fstEZuhbOQzHRKMIJAsf94KCYWHRnrg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43mwmhjkk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:49:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKAC8Nn024044;
	Fri, 20 Dec 2024 11:49:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnuksvcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:49:06 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BKBn4ek35914126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 11:49:04 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63FC420043;
	Fri, 20 Dec 2024 11:49:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0944E20040;
	Fri, 20 Dec 2024 11:49:03 +0000 (GMT)
Received: from [9.124.219.176] (unknown [9.124.219.176])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Dec 2024 11:49:02 +0000 (GMT)
Message-ID: <0f2948fd-a34f-4da0-8f38-e2afe1dd5364@linux.ibm.com>
Date: Fri, 20 Dec 2024 17:19:01 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/scheduler: Fix busy and idle type ordering
To: Adam Li <adamli@os.amperecomputing.com>, corbet@lwn.net, mingo@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@amperecomputing.com
References: <20241209035428.898293-1-adamli@os.amperecomputing.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241209035428.898293-1-adamli@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u02T2EwR2y_GSjxzrwD736LHfpGfCEKP
X-Proofpoint-GUID: u02T2EwR2y_GSjxzrwD736LHfpGfCEKP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200095



On 12/9/24 09:24, Adam Li wrote:
> Commit 11b0bfa5d463 ("sched/debug: Increase SCHEDSTAT_VERSION to 16")
> documented change of CPU_IDLE and __CPU_NOT_IDLE ordering in
> 'enum cpu_idle_type'.
> 
> Fix the domain statistics description due to the ordering change.
> 
> Signed-off-by: Adam Li <adamli@os.amperecomputing.com>

Looks fine to me.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> ---
>   Documentation/scheduler/sched-stats.rst | 34 ++++++++++++-------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
> index 7c2b16c4729d..ab6f5392910d 100644
> --- a/Documentation/scheduler/sched-stats.rst
> +++ b/Documentation/scheduler/sched-stats.rst
> @@ -78,39 +78,39 @@ domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
>   The first field is a bit mask indicating what cpus this domain operates over.
>   
>   The next 24 are a variety of sched_balance_rq() statistics in grouped into types
> -of idleness (idle, busy, and newly idle):
> +of idleness (busy, idle, and newly idle):
>   
>       1)  # of times in this domain sched_balance_rq() was called when the
> -        cpu was idle
> +        cpu was busy
>       2)  # of times in this domain sched_balance_rq() checked but found
> -        the load did not require balancing when the cpu was idle
> +        the load did not require balancing when the cpu was busy
>       3)  # of times in this domain sched_balance_rq() tried to move one or
> -        more tasks and failed, when the cpu was idle
> +        more tasks and failed, when the cpu was busy
>       4)  sum of imbalances discovered (if any) with each call to
> -        sched_balance_rq() in this domain when the cpu was idle
> +        sched_balance_rq() in this domain when the cpu was busy
>       5)  # of times in this domain pull_task() was called when the cpu
> -        was idle
> +        was busy
>       6)  # of times in this domain pull_task() was called even though
> -        the target task was cache-hot when idle
> +        the target task was cache-hot when busy
>       7)  # of times in this domain sched_balance_rq() was called but did
> -        not find a busier queue while the cpu was idle
> +        not find a busier queue while the cpu was busy
>       8)  # of times in this domain a busier queue was found while the
> -        cpu was idle but no busier group was found
> +        cpu was busy but no busier group was found
>       9)  # of times in this domain sched_balance_rq() was called when the
> -        cpu was busy
> +        cpu was idle
>       10) # of times in this domain sched_balance_rq() checked but found the
> -        load did not require balancing when busy
> +        load did not require balancing when idle
>       11) # of times in this domain sched_balance_rq() tried to move one or
> -        more tasks and failed, when the cpu was busy
> +        more tasks and failed, when the cpu was idle
>       12) sum of imbalances discovered (if any) with each call to
> -        sched_balance_rq() in this domain when the cpu was busy
> -    13) # of times in this domain pull_task() was called when busy
> +        sched_balance_rq() in this domain when the cpu was idle
> +    13) # of times in this domain pull_task() was called when idle
>       14) # of times in this domain pull_task() was called even though the
> -        target task was cache-hot when busy
> +        target task was cache-hot when idle
>       15) # of times in this domain sched_balance_rq() was called but did not
> -        find a busier queue while the cpu was busy
> +        find a busier queue while the cpu was idle
>       16) # of times in this domain a busier queue was found while the cpu
> -        was busy but no busier group was found
> +        was idle but no busier group was found
>   
>       17) # of times in this domain sched_balance_rq() was called when the
>           cpu was just becoming idle

