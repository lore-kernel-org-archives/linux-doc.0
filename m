Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340B28E3F;
	Mon, 23 Dec 2024 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734939398; cv=none; b=GDyMS1D+fP2G2r6KadHAP2dNtDyPS3XbNoULrZJuE7RFN/2ZFD3kcODuMa4Sud7UKaeDkt3wVMnn+HcsOeBPgq4vluRktZyx+SIb+OGPHjubYMXRNlTUkONvSm92qp8jCbwBhDP79oMrP0/yYChXqCRtj5sjgP9R0VSIrZSSwGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734939398; c=relaxed/simple;
	bh=NtsDX2mz2qrgEamjO0r81wLM3HroZmfH7657IG/b+Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YG2d/BNqIRBf3u68gv5M9GMgh0hWDqp93hFbqr4IOvU6B5u2FO8/NewG7xaNWmaWZRqZmMN4td17KHYhs0dIwhaGCnX8z2Q/MmuWSqFVbml4DLNTeN03OxQzCx4IaQFFQZOc9fzX1pViS6jr5S/9xsUrJBgoW7NgpZDLE8NDaXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=N/xaE1xK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="N/xaE1xK"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMNbJ3Y017387;
	Mon, 23 Dec 2024 07:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0ebZJR
	pBjz5u2QJR2/T3aQaWbmL6ZmHAz2Ay92S3aQs=; b=N/xaE1xK6fYTR7lRA4G4gb
	N8ap/s4thpikTWYLSqMGbxxY871pO2/R9a0E7InVLEnWdPSWrcYlL70FelONI2tg
	x+m/0EUHdOaZouMxdhnqSjR1shQWoSC7dn1z7w9Q1jHJHUHobvvZXzvcat7tcbLh
	gC2WxbN+sgeijCT6jzHlOVFtIQNfiLPFkGp03TCRVe5TjwDyw+p/GbOcp9H5HoCU
	sMAC3e/HYwO2Wz/WY3aiXY/p/WX6YZfTh/ICb6R0q6099lR9kwaNnr96Gf1rPXJE
	KrJsHRNzEmhLhBabawIW3QW2lfDBj3mHLrkjTg500lYGw4XSpNUpJHSnac3o6dWw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43pvka9csn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 07:36:02 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BN7Rcdt027567;
	Mon, 23 Dec 2024 07:36:02 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43pvka9csh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 07:36:02 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN74k5g002068;
	Mon, 23 Dec 2024 07:36:01 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43pa7jmfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 07:36:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BN7ZxN420578650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Dec 2024 07:35:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF7E20043;
	Mon, 23 Dec 2024 07:35:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB0462004B;
	Mon, 23 Dec 2024 07:35:54 +0000 (GMT)
Received: from [9.124.216.211] (unknown [9.124.216.211])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Dec 2024 07:35:54 +0000 (GMT)
Message-ID: <1914488d-6c37-4a3d-8008-13c64a6fccf0@linux.ibm.com>
Date: Mon, 23 Dec 2024 13:05:53 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] docs: Update Schedstat version to 17
To: Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, iamjoonsoo.kim@lge.com,
        qyousef@layalina.io, alexs@kernel.org, lukasz.luba@arm.com,
        gautham.shenoy@amd.com, kprateek.nayak@amd.com, ravi.bangoria@amd.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Adam Li <adamli@os.amperecomputing.com>, peterz@infradead.org,
        mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
        corbet@lwn.net
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
 <20241220063224.17767-7-swapnil.sapkal@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241220063224.17767-7-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O3LKKpNe6jqnHpY94AVIbUWYefhKSJVM
X-Proofpoint-ORIG-GUID: fwrU5uHqWNz3AZ2fzNzwMxJ2ZsH0oGkp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230066



On 12/20/24 12:02, Swapnil Sapkal wrote:
> Update the Schedstat version to 17 as more fields are added to report
> different kinds of imbalances in the sched domain. Also domain field
> started printing corresponding domain name.
> 
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>

+Adam who had posted a patch to correct the doc for flip of idle, busy.

https://lore.kernel.org/all/20241209035428.898293-1-adamli@os.amperecomputing.com/

> ---
>   Documentation/scheduler/sched-stats.rst | 126 ++++++++++++++----------
>   kernel/sched/stats.c                    |   2 +-
>   2 files changed, 76 insertions(+), 52 deletions(-)
> 
> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
> index 7c2b16c4729d..caea83d91c67 100644
> --- a/Documentation/scheduler/sched-stats.rst
> +++ b/Documentation/scheduler/sched-stats.rst
> @@ -2,6 +2,12 @@
>   Scheduler Statistics
>   ====================
>   
> +Version 17 of schedstats removed 'lb_imbalance' field as it has no
> +significance anymore and instead added more relevant fields namely
> +'lb_imbalance_load', 'lb_imbalance_util', 'lb_imbalance_task' and
> +'lb_imbalance_misfit'. The domain field prints the name of the
> +corresponding sched domain from this version onwards.
> +
>   Version 16 of schedstats changed the order of definitions within
>   'enum cpu_idle_type', which changed the order of [CPU_MAX_IDLE_TYPES]
>   columns in show_schedstat(). In particular the position of CPU_IDLE
> @@ -9,7 +15,9 @@ and __CPU_NOT_IDLE changed places. The size of the array is unchanged.
>   
>   Version 15 of schedstats dropped counters for some sched_yield:
>   yld_exp_empty, yld_act_empty and yld_both_empty. Otherwise, it is
> -identical to version 14.
> +identical to version 14. Details are available at
> +
> +	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/scheduler/sched-stats.txt?id=1e1dbb259c79b
>   
>   Version 14 of schedstats includes support for sched_domains, which hit the
>   mainline kernel in 2.6.20 although it is identical to the stats from version
> @@ -26,7 +34,14 @@ cpus on the machine, while domain0 is the most tightly focused domain,
>   sometimes balancing only between pairs of cpus.  At this time, there
>   are no architectures which need more than three domain levels. The first
>   field in the domain stats is a bit map indicating which cpus are affected
> -by that domain.
> +by that domain. Details are available at
> +
> +	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sched-stats.txt?id=b762f3ffb797c
> +
> +The schedstat documentation is maintained version 10 onwards and is not
> +updated for version 11 and 12. The details for version 10 are available at
> +
> +	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sched-stats.txt?id=1da177e4c3f4
>   
>   These fields are counters, and only increment.  Programs which make use
>   of these will need to start with a baseline observation and then calculate
> @@ -71,88 +86,97 @@ Domain statistics
>   -----------------
>   One of these is produced per domain for each cpu described. (Note that if
>   CONFIG_SMP is not defined, *no* domains are utilized and these lines
> -will not appear in the output.)
> +will not appear in the output. <name> is an extension to the domain field
> +that prints the name of the corresponding sched domain. It can appear in
> +schedstat version 17 and above, and requires CONFIG_SCHED_DEBUG.)
>   
> -domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
> +domain<N> <name> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
>   
>   The first field is a bit mask indicating what cpus this domain operates over.
>   
> -The next 24 are a variety of sched_balance_rq() statistics in grouped into types
> -of idleness (idle, busy, and newly idle):
> +The next 33 are a variety of sched_balance_rq() statistics in grouped into types
> +of idleness (busy, idle and newly idle):
>   
>       1)  # of times in this domain sched_balance_rq() was called when the
> +        cpu was busy
> +    2)  # of times in this domain sched_balance_rq() checked but found the
> +        load did not require balancing when busy
> +    3)  # of times in this domain sched_balance_rq() tried to move one or
> +        more tasks and failed, when the cpu was busy
> +    4)  Total imbalance in load when the cpu was busy
> +    5)  Total imbalance in utilization when the cpu was busy
> +    6)  Total imbalance in number of tasks when the cpu was busy
> +    7)  Total imbalance due to misfit tasks when the cpu was busy
> +    8)  # of times in this domain pull_task() was called when busy
> +    9)  # of times in this domain pull_task() was called even though the
> +        target task was cache-hot when busy

pull_task has been replaced by detach_task AFAIU. So it makes sense to 
change this to detach_task?

> +    10) # of times in this domain sched_balance_rq() was called but did not
> +        find a busier queue while the cpu was busy
> +    11) # of times in this domain a busier queue was found while the cpu
> +        was busy but no busier group was found
> +
> +    12) # of times in this domain sched_balance_rq() was called when the
>           cpu was idle
> -    2)  # of times in this domain sched_balance_rq() checked but found
> +    13) # of times in this domain sched_balance_rq() checked but found
>           the load did not require balancing when the cpu was idle
> -    3)  # of times in this domain sched_balance_rq() tried to move one or
> +    14) # of times in this domain sched_balance_rq() tried to move one or
>           more tasks and failed, when the cpu was idle
> -    4)  sum of imbalances discovered (if any) with each call to
> -        sched_balance_rq() in this domain when the cpu was idle
> -    5)  # of times in this domain pull_task() was called when the cpu
> +    15) Total imbalance in load when the cpu was idle
> +    16) Total imbalance in utilization when the cpu was idle
> +    17) Total imbalance in number of tasks when the cpu was idle
> +    18) Total imbalance due to misfit tasks when the cpu was idle
> +    19) # of times in this domain pull_task() was called when the cpu
>           was idle
> -    6)  # of times in this domain pull_task() was called even though
> +    20) # of times in this domain pull_task() was called even though

same comment for pull_task.

>           the target task was cache-hot when idle
> -    7)  # of times in this domain sched_balance_rq() was called but did
> +    21) # of times in this domain sched_balance_rq() was called but did
>           not find a busier queue while the cpu was idle
> -    8)  # of times in this domain a busier queue was found while the
> +    22) # of times in this domain a busier queue was found while the
>           cpu was idle but no busier group was found
> -    9)  # of times in this domain sched_balance_rq() was called when the
> -        cpu was busy
> -    10) # of times in this domain sched_balance_rq() checked but found the
> -        load did not require balancing when busy
> -    11) # of times in this domain sched_balance_rq() tried to move one or
> -        more tasks and failed, when the cpu was busy
> -    12) sum of imbalances discovered (if any) with each call to
> -        sched_balance_rq() in this domain when the cpu was busy
> -    13) # of times in this domain pull_task() was called when busy
> -    14) # of times in this domain pull_task() was called even though the
> -        target task was cache-hot when busy
> -    15) # of times in this domain sched_balance_rq() was called but did not
> -        find a busier queue while the cpu was busy
> -    16) # of times in this domain a busier queue was found while the cpu
> -        was busy but no busier group was found
>   
> -    17) # of times in this domain sched_balance_rq() was called when the
> -        cpu was just becoming idle
> -    18) # of times in this domain sched_balance_rq() checked but found the
> +    23) # of times in this domain sched_balance_rq() was called when the
> +        was just becoming idle
> +    24) # of times in this domain sched_balance_rq() checked but found the
>           load did not require balancing when the cpu was just becoming idle
> -    19) # of times in this domain sched_balance_rq() tried to move one or more
> +    25) # of times in this domain sched_balance_rq() tried to move one or more
>           tasks and failed, when the cpu was just becoming idle
> -    20) sum of imbalances discovered (if any) with each call to
> -        sched_balance_rq() in this domain when the cpu was just becoming idle
> -    21) # of times in this domain pull_task() was called when newly idle
> -    22) # of times in this domain pull_task() was called even though the
> +    26) Total imbalance in load when the cpu was just becoming idle
> +    27) Total imbalance in utilization when the cpu was just becoming idle
> +    28) Total imbalance in number of tasks when the cpu was just becoming idle
> +    29) Total imbalance due to misfit tasks when the cpu was just becoming idle
> +    30) # of times in this domain pull_task() was called when newly idle
> +    31) # of times in this domain pull_task() was called even though the
>           target task was cache-hot when just becoming idle

same comment for pull_task.

> -    23) # of times in this domain sched_balance_rq() was called but did not
> +    32) # of times in this domain sched_balance_rq() was called but did not
>           find a busier queue while the cpu was just becoming idle
> -    24) # of times in this domain a busier queue was found while the cpu
> +    33) # of times in this domain a busier queue was found while the cpu
>           was just becoming idle but no busier group was found
>   
>      Next three are active_load_balance() statistics:
>   
> -    25) # of times active_load_balance() was called
> -    26) # of times active_load_balance() tried to move a task and failed
> -    27) # of times active_load_balance() successfully moved a task
> +    34) # of times active_load_balance() was called
> +    35) # of times active_load_balance() tried to move a task and failed
> +    36) # of times active_load_balance() successfully moved a task
>   
>      Next three are sched_balance_exec() statistics:
>   
> -    28) sbe_cnt is not used
> -    29) sbe_balanced is not used
> -    30) sbe_pushed is not used
> +    37) sbe_cnt is not used
> +    38) sbe_balanced is not used
> +    39) sbe_pushed is not used
>   
>      Next three are sched_balance_fork() statistics:
>   
> -    31) sbf_cnt is not used
> -    32) sbf_balanced is not used
> -    33) sbf_pushed is not used
> +    40) sbf_cnt is not used
> +    41) sbf_balanced is not used
> +    42) sbf_pushed is not used
>   
>      Next three are try_to_wake_up() statistics:
>   
> -    34) # of times in this domain try_to_wake_up() awoke a task that
> +    43) # of times in this domain try_to_wake_up() awoke a task that
>           last ran on a different cpu in this domain
> -    35) # of times in this domain try_to_wake_up() moved a task to the
> +    44) # of times in this domain try_to_wake_up() moved a task to the
>           waking cpu because it was cache-cold on its own cpu anyway
> -    36) # of times in this domain try_to_wake_up() started passive balancing
> +    45) # of times in this domain try_to_wake_up() started passive balancing
>   
>   /proc/<pid>/schedstat
>   ---------------------
> diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
> index 5f563965976c..4346fd81c31f 100644
> --- a/kernel/sched/stats.c
> +++ b/kernel/sched/stats.c
> @@ -103,7 +103,7 @@ void __update_stats_enqueue_sleeper(struct rq *rq, struct task_struct *p,
>    * Bump this up when changing the output format or the meaning of an existing
>    * format, so that tools can adapt (or abort)
>    */
> -#define SCHEDSTAT_VERSION 16
> +#define SCHEDSTAT_VERSION 17
>   
>   static int show_schedstat(struct seq_file *seq, void *v)
>   {

