Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF71C5CBC;
	Fri, 20 Dec 2024 18:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734719034; cv=none; b=LHQ2lz+kp580kN3RroOYoXhP+/iS5Xyht3LQT93cXvkwaVV+zEQ7SLFEkYNoLGZfdREjKpzGxxCjtX2YLV7mNPQ5tONdn3MJY48Pkgklx4mVJiJEtdnx33gu4rru3r+6EBYipZRl4ez3hECB5fuZt5Xjn+TwZxTx4BFjf+CVUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734719034; c=relaxed/simple;
	bh=qYxkof+w/eCIdD7tEA5WM4afNVN/rBB/I7H7AjbjxVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mvr3POSMAV20EuOWqKU0F0fl6woNkMxbB53dG74jDrJkdNsYGbQgJwn5R4Q8y+Uy4NgAW0smcdukQma0ELqCfK3lY0dRtW3Cb4+85rm+KnNdl6vmgV4wTI2vTAgdzTMVN7Y9Z+kEIutGgyuDIKwg9pRTqwRoSTeolWGl0HOHjmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=gpbmqG1v; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="gpbmqG1v"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKHj6DC029984;
	Fri, 20 Dec 2024 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=R7k3a6
	TCZd9zD8hjQ3vXQMK9XZ1C0ymp1+Yz02qSEBo=; b=gpbmqG1v9vJd18Jt7mpttr
	Ik2MLt+kwGNcY753eX9dwfDBU5BBtQcncgi+Y3Sad2+TRtCAsyAM9EmWswainA2h
	f4FnBAmkgG91qR5G4DmmqP5x+FJex9fkQBhpVc1L8NEgGzgnRHt4HTVoBY18LjGX
	uaL5v3uyh10Yh/Hm5gULMfnqZWQI4ptOgXJv/Ilw4RXH85qaMEq0FThzznqa+vfk
	z/+oki2LkpkxckH4ftaOOEE8WC4MHsaGZfnIwTs07hkd9G0ODBES/2LRD5kCnrIX
	QlHOPJCvUvoFyd/4PEYI5hOte7RJgWGkLMDV5YJV2h12RnoszvauQyn0k20/nGEA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43na25976t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 18:23:26 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BKINQfO012866;
	Fri, 20 Dec 2024 18:23:26 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43na25976m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 18:23:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKHa4Qh005491;
	Fri, 20 Dec 2024 18:23:25 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hnbnkdmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 18:23:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BKINNfb49873358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 18:23:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 395DD20043;
	Fri, 20 Dec 2024 18:23:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4568020040;
	Fri, 20 Dec 2024 18:23:19 +0000 (GMT)
Received: from [9.39.22.57] (unknown [9.39.22.57])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Dec 2024 18:23:19 +0000 (GMT)
Message-ID: <56790316-d73c-4201-a2fa-9be3019e2f49@linux.ibm.com>
Date: Fri, 20 Dec 2024 23:53:17 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] sched: Report the different kinds of imbalances in
 /proc/schedstat
To: Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, iamjoonsoo.kim@lge.com,
        qyousef@layalina.io, alexs@kernel.org, lukasz.luba@arm.com,
        gautham.shenoy@amd.com, kprateek.nayak@amd.com, ravi.bangoria@amd.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, corbet@lwn.net
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
 <20241220063224.17767-4-swapnil.sapkal@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241220063224.17767-4-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BNpBasckSHnpGgIu6nxgUNy0P8Un-NYe
X-Proofpoint-ORIG-GUID: r5OlYkgXpTtrvKgosEToRRJw2WoKBj22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=904 impostorscore=0 phishscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200144



On 12/20/24 12:02, Swapnil Sapkal wrote:
> In /proc/schedstat, lb_imbalance reports the sum of imbalances
> discovered in sched domains with each call to sched_balance_rq(), which is
> not very useful because lb_imbalance does not mention whether the imbalance
> is due to load, utilization, nr_tasks or misfit_tasks. Remove this field
> from /proc/schedstat.
> 
> Currently there is no field in /proc/schedstat to report different types
> of imbalances. Introduce new fields in /proc/schedstat to report the
> total imbalances in load, utilization, nr_tasks or misfit_tasks.
> 
> Added fields to /proc/schedstat:
>          - lb_imbalance_load: Total imbalance due to load.
>          - lb_imbalance_util: Total imbalance due to utilization.
>          - lb_imbalance_task: Total imbalance due to number of tasks.
>          - lb_imbalance_misfit: Total imbalance due to misfit tasks.
> 
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>

I think its better to merge patch 3 and patch 6.

> ---
>   include/linux/sched/topology.h |  5 ++++-
>   kernel/sched/fair.c            | 24 +++++++++++++++++++++++-
>   kernel/sched/stats.c           |  7 +++++--
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 4237daa5ac7a..76a662e1ec24 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -114,7 +114,10 @@ struct sched_domain {
>   	unsigned int lb_count[CPU_MAX_IDLE_TYPES];
>   	unsigned int lb_failed[CPU_MAX_IDLE_TYPES];
>   	unsigned int lb_balanced[CPU_MAX_IDLE_TYPES];
> -	unsigned int lb_imbalance[CPU_MAX_IDLE_TYPES];
> +	unsigned int lb_imbalance_load[CPU_MAX_IDLE_TYPES];
> +	unsigned int lb_imbalance_util[CPU_MAX_IDLE_TYPES];
> +	unsigned int lb_imbalance_task[CPU_MAX_IDLE_TYPES];
> +	unsigned int lb_imbalance_misfit[CPU_MAX_IDLE_TYPES];
>   	unsigned int lb_gained[CPU_MAX_IDLE_TYPES];
>   	unsigned int lb_hot_gained[CPU_MAX_IDLE_TYPES];
>   	unsigned int lb_nobusyg[CPU_MAX_IDLE_TYPES];
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 2ca3f098552c..5e7e4fe81648 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -11699,6 +11699,28 @@ static int should_we_balance(struct lb_env *env)
>   	return group_balance_cpu(sg) == env->dst_cpu;
>   }
>   
> +static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd,
> +				     enum cpu_idle_type idle)
> +{
> +	if (!schedstat_enabled())
> +		return;
> +
> +	switch (env->migration_type) {
> +	case migrate_load:
> +		__schedstat_add(sd->lb_imbalance_load[idle], env->imbalance);
> +		break;
> +	case migrate_util:
> +		__schedstat_add(sd->lb_imbalance_util[idle], env->imbalance);
> +		break;
> +	case migrate_task:
> +		__schedstat_add(sd->lb_imbalance_task[idle], env->imbalance);
> +		break;
> +	case migrate_misfit:
> +		__schedstat_add(sd->lb_imbalance_misfit[idle], env->imbalance);
> +		break;
> +	}
> +}
> +
>   /*
>    * Check this_cpu to ensure it is balanced within domain. Attempt to move
>    * tasks if there is an imbalance.
> @@ -11749,7 +11771,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>   
>   	WARN_ON_ONCE(busiest == env.dst_rq);
>   
> -	schedstat_add(sd->lb_imbalance[idle], env.imbalance);
> +	update_lb_imbalance_stat(&env, sd, idle);
>   
>   	env.src_cpu = busiest->cpu;
>   	env.src_rq = busiest;
> diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
> index eb0cdcd4d921..802bd9398a2e 100644
> --- a/kernel/sched/stats.c
> +++ b/kernel/sched/stats.c
> @@ -141,11 +141,14 @@ static int show_schedstat(struct seq_file *seq, void *v)
>   			seq_printf(seq, "domain%d %*pb", dcount++,
>   				   cpumask_pr_args(sched_domain_span(sd)));
>   			for (itype = 0; itype < CPU_MAX_IDLE_TYPES; itype++) {
> -				seq_printf(seq, " %u %u %u %u %u %u %u %u",
> +				seq_printf(seq, " %u %u %u %u %u %u %u %u %u %u %u",
>   				    sd->lb_count[itype],
>   				    sd->lb_balanced[itype],
>   				    sd->lb_failed[itype],
> -				    sd->lb_imbalance[itype],
> +				    sd->lb_imbalance_load[itype],
> +				    sd->lb_imbalance_util[itype],
> +				    sd->lb_imbalance_task[itype],
> +				    sd->lb_imbalance_misfit[itype],
>   				    sd->lb_gained[itype],
>   				    sd->lb_hot_gained[itype],
>   				    sd->lb_nobusyq[itype],

While you are adding this, please update the 
Documentation/scheduler/sched-stats.rst as well.
