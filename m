Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B082206A7;
	Fri, 20 Dec 2024 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734721242; cv=none; b=ekg4lbFtnOvMNgJWnUMDmYMBXpDfIzE+P+aF+szbK76kJk3ByIEWT4e1H2YULX1XkUe+uWmXO+QtDjBrecTMGMIfx4eOtTEtF5rD6eQabg3SxJA7oiY3YjiTlR8kNe9ilQmtebq+t1aJ8x8B/2kxZJeertN9W7yi8VDxeQCfYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734721242; c=relaxed/simple;
	bh=pkUXyiszkVCs0tu2/4/gu2UmdseGKixqu+Uf84VGQGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdZI1z9RYhTqbUvN0mO2zteNkomoi3k0VGCf07aK/zdRY6chkiZTvMv1vFhObFI52nDXjQ+lF7Six/1Ru/xy8wnhN2PMvCKRxu67UAEezjC0i2SEKalGOZ53ahpJcONonwV6IPLaqGEiveUIcb5YMNwQf7wgIsUsQWxHeCeoPTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=ix7UNIvv; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="ix7UNIvv"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKHj8aC030086;
	Fri, 20 Dec 2024 19:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FenUAV
	WT/2Kur2hfTZW6nOYtsZCgd93CqDPREgk3FFA=; b=ix7UNIvv3rJVLpKoCuWrgi
	a4EK1Xk8NROLVFZn4jW+NtQoFNHEGUpzaGczfKdLR0T3FcLn4TYPZvtQMpfa4ZoB
	A4aND6EKe9JD4PUm24YKuuuN40KQRoIOMLi2sTOzIjrUtE98xzltOpXntLIF0r/T
	iAARl1uAvMIEkXO3FQvBfAyMjl61cwDEB+hEMt0K/whBMah58l0KAGo1u1wYiYKd
	WeHyvdIkygYcwvrni2BHfRfHCKDTdo8njZExq9jcpyd7hPGjed0R428F3mq8fHZu
	n7VBf/aaf8usJanXqTA2lJ3XQHEZxQBbYjkcSHJHV6xSkdsmlA8aRNdhQeT1/sRg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43na259crm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:00:07 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BKJ06Ij025782;
	Fri, 20 Dec 2024 19:00:06 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43na259crh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:00:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKIlhqF011256;
	Fri, 20 Dec 2024 19:00:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjkk9x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:00:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BKJ04HR52625716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 19:00:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0815D2005A;
	Fri, 20 Dec 2024 19:00:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B567020040;
	Fri, 20 Dec 2024 18:59:59 +0000 (GMT)
Received: from [9.39.22.57] (unknown [9.39.22.57])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Dec 2024 18:59:59 +0000 (GMT)
Message-ID: <f1f58a96-ea2b-4635-a139-acdefc20b69c@linux.ibm.com>
Date: Sat, 21 Dec 2024 00:29:58 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] sched: Move sched domain name out of
 CONFIG_SCHED_DEBUG
To: Swapnil Sapkal <swapnil.sapkal@amd.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, iamjoonsoo.kim@lge.com,
        qyousef@layalina.io, alexs@kernel.org, lukasz.luba@arm.com,
        gautham.shenoy@amd.com, kprateek.nayak@amd.com, ravi.bangoria@amd.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, corbet@lwn.net
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
 <20241220063224.17767-5-swapnil.sapkal@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241220063224.17767-5-swapnil.sapkal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iGXEjR3RLQ8sY7BWRuU2sO4yX6pjk1u4
X-Proofpoint-ORIG-GUID: msoF4OTplDIn-SZPdh_K7JMOok-GpUmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200153



On 12/20/24 12:02, Swapnil Sapkal wrote:
> /proc/schedstat file shows cpu and sched domain level scheduler
> statistics. It does not show domain name instead shows domain level.
> It will be very useful for tools like `perf sched stats`[1] to
> aggragate domain level stats if domain names are shown in /proc/schedstat.
> But sched domain name is guarded by CONFIG_SCHED_DEBUG. As per the
> discussion[2], move sched domain name out of CONFIG_SCHED_DEBUG.
> 
> [1] https://lore.kernel.org/lkml/20241122084452.1064968-1-swapnil.sapkal@amd.com/
> [2] https://lore.kernel.org/lkml/fcefeb4d-3acb-462d-9c9b-3df8d927e522@amd.com/
> 
> Suggested-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>

Similarly i think patch 4 and 5 can be merged into one. and similar 
comment about updating the stats doc file.

> ---
>   include/linux/sched/topology.h | 8 --------
>   kernel/sched/topology.c        | 4 ----
>   2 files changed, 12 deletions(-)
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 76a662e1ec24..7f3dbafe1817 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -143,9 +143,7 @@ struct sched_domain {
>   	unsigned int ttwu_move_affine;
>   	unsigned int ttwu_move_balance;
>   #endif
> -#ifdef CONFIG_SCHED_DEBUG
>   	char *name;
> -#endif
>   	union {
>   		void *private;		/* used during construction */
>   		struct rcu_head rcu;	/* used during destruction */
> @@ -201,18 +199,12 @@ struct sched_domain_topology_level {
>   	int		    flags;
>   	int		    numa_level;
>   	struct sd_data      data;
> -#ifdef CONFIG_SCHED_DEBUG
>   	char                *name;
> -#endif
>   };
>   
>   extern void __init set_sched_topology(struct sched_domain_topology_level *tl);
>   
> -#ifdef CONFIG_SCHED_DEBUG
>   # define SD_INIT_NAME(type)		.name = #type
> -#else
> -# define SD_INIT_NAME(type)
> -#endif
>   
>   #else /* CONFIG_SMP */
>   
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 9c405f0e7b26..da33ec9e94ab 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1635,9 +1635,7 @@ sd_init(struct sched_domain_topology_level *tl,
>   		.max_newidle_lb_cost	= 0,
>   		.last_decay_max_lb_cost	= jiffies,
>   		.child			= child,
> -#ifdef CONFIG_SCHED_DEBUG
>   		.name			= tl->name,
> -#endif
>   	};
>   
>   	sd_span = sched_domain_span(sd);
> @@ -2338,10 +2336,8 @@ static struct sched_domain *build_sched_domain(struct sched_domain_topology_leve
>   		if (!cpumask_subset(sched_domain_span(child),
>   				    sched_domain_span(sd))) {
>   			pr_err("BUG: arch topology borken\n");
> -#ifdef CONFIG_SCHED_DEBUG
>   			pr_err("     the %s domain not a subset of the %s domain\n",
>   					child->name, sd->name);
> -#endif
>   			/* Fixup, ensure @sd has at least @child CPUs. */
>   			cpumask_or(sched_domain_span(sd),
>   				   sched_domain_span(sd),

