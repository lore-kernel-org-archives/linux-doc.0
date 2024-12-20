Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB7A220680;
	Fri, 20 Dec 2024 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722314; cv=none; b=OahD7mF+5RZORQRqoxtjZ0BGKUWt5zFmaQGaV5SQuS9Y35h7DLZ7qLE9lxmfF/+58S4+ukkYlCL0vGBdYwadDH1fzsiGKsdZK1KfXzhk8GQmFCfUgL/egl1e38E+mAT2Do8OhVwXb18Gz3ZleOlYCZhtgFz1LzAPCrj1e9zyCSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722314; c=relaxed/simple;
	bh=SNvDNSU6jq4Nm8x9euf97YSi70GsyzYBvzqSi6rDCB0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Liu8UJoc1rpBgCfESL4zZUrKxXIXIo8kcGvGqP0mevJaTNMtg2RnINV95PEmAUvVqGDhjhZpRo+oBYoaD6l3zSPU1KgBB8NrU426wOEdWntey4+EkZmS5o2bBV4gH0tclyxc5YmFNTKUUgBQ8IRzAZhmo+upc9CPJRun+UUhJqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=HGVmMX3Z; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="HGVmMX3Z"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKHj2js017754;
	Fri, 20 Dec 2024 19:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VFBbu9
	rRFJWqGttx88HeuuVgjG71qytLoalCMpH2uFU=; b=HGVmMX3ZyoLku/cZvdTkiz
	7/epTn+FIdYsj49s+Hdr5icQBUjRr4jx7JBw5hc5vxt9eg1w9s/kLkyoIMcZxd/L
	i8xChhzLzR+/7SYaW78OZk+fy9uKWH2+UR3sMWRwNj2G6Skdg8Vcg01v24/VFTYu
	yPwijBcz8tx/pyve5LK5T5lUYYnLY6cTbHItFZQ+FNFT/wAE1kdhi9ZauQrniCPx
	JPoWPHeHpzGIDTjdYwx5Qox1rWy1iiv5LtNJqWLAupOsALtte9uxvTrnlMcGQJSF
	2c14JpVbH8TXgvKiiLxFiGNtOBg2LLwZuI7d/8+2YPcXkyP2+jlGM3FGsVS4R12w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43n12bv1p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:18:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BKJFnG6020481;
	Fri, 20 Dec 2024 19:18:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43n12bv1nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:18:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKFr9bV014383;
	Fri, 20 Dec 2024 19:18:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hq2238b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 19:18:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BKJIBak20709668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Dec 2024 19:18:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20EA920043;
	Fri, 20 Dec 2024 19:18:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 126C720040;
	Fri, 20 Dec 2024 19:18:07 +0000 (GMT)
Received: from [9.39.23.142] (unknown [9.39.23.142])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Dec 2024 19:18:06 +0000 (GMT)
Message-ID: <5faddecb-af6b-4ac7-9385-8ba6539b8398@linux.ibm.com>
Date: Sat, 21 Dec 2024 00:48:06 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] sched: Report the different kinds of imbalances in
 /proc/schedstat
From: Shrikanth Hegde <sshegde@linux.ibm.com>
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
 <56790316-d73c-4201-a2fa-9be3019e2f49@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <56790316-d73c-4201-a2fa-9be3019e2f49@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yaQXKMJwODUOJjkqVG1oQIDpvfVQ6bxw
X-Proofpoint-ORIG-GUID: cRsvygJxWwhoTyqcteI_7TSAygHX8zA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200153



On 12/20/24 23:53, Shrikanth Hegde wrote:
> 
> 
> On 12/20/24 12:02, Swapnil Sapkal wrote:
>> In /proc/schedstat, lb_imbalance reports the sum of imbalances
>> discovered in sched domains with each call to sched_balance_rq(), 
>> which is
>> not very useful because lb_imbalance does not mention whether the 
>> imbalance
>> is due to load, utilization, nr_tasks or misfit_tasks. Remove this field
>> from /proc/schedstat.
>>
>> Currently there is no field in /proc/schedstat to report different types
>> of imbalances. Introduce new fields in /proc/schedstat to report the
>> total imbalances in load, utilization, nr_tasks or misfit_tasks.
>>
>> Added fields to /proc/schedstat:
>>          - lb_imbalance_load: Total imbalance due to load.
>>          - lb_imbalance_util: Total imbalance due to utilization.
>>          - lb_imbalance_task: Total imbalance due to number of tasks.
>>          - lb_imbalance_misfit: Total imbalance due to misfit tasks.
>>
>> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
> 
> I think its better to merge patch 3 and patch 6.

Please ignore this comment. Since there is change in patch 5 which 
affects the docs, it is better patch 6 stays separate. Sorry for the noise.
> 
>> ---
>>   include/linux/sched/topology.h |  5 ++++-
>>   kernel/sched/fair.c            | 24 +++++++++++++++++++++++-
>>   kernel/sched/stats.c           |  7 +++++--
>>   3 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/linux/sched/topology.h b/include/linux/sched/ 
>> topology.h
>> index 4237daa5ac7a..76a662e1ec24 100644
>> --- a/include/linux/sched/topology.h
>> +++ b/include/linux/sched/topology.h
>> @@ -114,7 +114,10 @@ struct sched_domain {
>>       unsigned int lb_count[CPU_MAX_IDLE_TYPES];
>>       unsigned int lb_failed[CPU_MAX_IDLE_TYPES];
>>       unsigned int lb_balanced[CPU_MAX_IDLE_TYPES];
>> -    unsigned int lb_imbalance[CPU_MAX_IDLE_TYPES];
>> +    unsigned int lb_imbalance_load[CPU_MAX_IDLE_TYPES];
>> +    unsigned int lb_imbalance_util[CPU_MAX_IDLE_TYPES];
>> +    unsigned int lb_imbalance_task[CPU_MAX_IDLE_TYPES];
>> +    unsigned int lb_imbalance_misfit[CPU_MAX_IDLE_TYPES];
>>       unsigned int lb_gained[CPU_MAX_IDLE_TYPES];
>>       unsigned int lb_hot_gained[CPU_MAX_IDLE_TYPES];
>>       unsigned int lb_nobusyg[CPU_MAX_IDLE_TYPES];
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 2ca3f098552c..5e7e4fe81648 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -11699,6 +11699,28 @@ static int should_we_balance(struct lb_env *env)
>>       return group_balance_cpu(sg) == env->dst_cpu;
>>   }
>> +static void update_lb_imbalance_stat(struct lb_env *env, struct 
>> sched_domain *sd,
>> +                     enum cpu_idle_type idle)
>> +{
>> +    if (!schedstat_enabled())
>> +        return;
>> +
>> +    switch (env->migration_type) {
>> +    case migrate_load:
>> +        __schedstat_add(sd->lb_imbalance_load[idle], env->imbalance);
>> +        break;
>> +    case migrate_util:
>> +        __schedstat_add(sd->lb_imbalance_util[idle], env->imbalance);
>> +        break;
>> +    case migrate_task:
>> +        __schedstat_add(sd->lb_imbalance_task[idle], env->imbalance);
>> +        break;
>> +    case migrate_misfit:
>> +        __schedstat_add(sd->lb_imbalance_misfit[idle], env->imbalance);
>> +        break;
>> +    }
>> +}
>> +
>>   /*
>>    * Check this_cpu to ensure it is balanced within domain. Attempt to 
>> move
>>    * tasks if there is an imbalance.
>> @@ -11749,7 +11771,7 @@ static int sched_balance_rq(int this_cpu, 
>> struct rq *this_rq,
>>       WARN_ON_ONCE(busiest == env.dst_rq);
>> -    schedstat_add(sd->lb_imbalance[idle], env.imbalance);
>> +    update_lb_imbalance_stat(&env, sd, idle);
>>       env.src_cpu = busiest->cpu;
>>       env.src_rq = busiest;
>> diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
>> index eb0cdcd4d921..802bd9398a2e 100644
>> --- a/kernel/sched/stats.c
>> +++ b/kernel/sched/stats.c
>> @@ -141,11 +141,14 @@ static int show_schedstat(struct seq_file *seq, 
>> void *v)
>>               seq_printf(seq, "domain%d %*pb", dcount++,
>>                      cpumask_pr_args(sched_domain_span(sd)));
>>               for (itype = 0; itype < CPU_MAX_IDLE_TYPES; itype++) {
>> -                seq_printf(seq, " %u %u %u %u %u %u %u %u",
>> +                seq_printf(seq, " %u %u %u %u %u %u %u %u %u %u %u",
>>                       sd->lb_count[itype],
>>                       sd->lb_balanced[itype],
>>                       sd->lb_failed[itype],
>> -                    sd->lb_imbalance[itype],
>> +                    sd->lb_imbalance_load[itype],
>> +                    sd->lb_imbalance_util[itype],
>> +                    sd->lb_imbalance_task[itype],
>> +                    sd->lb_imbalance_misfit[itype],
>>                       sd->lb_gained[itype],
>>                       sd->lb_hot_gained[itype],
>>                       sd->lb_nobusyq[itype],
> 
> While you are adding this, please update the Documentation/scheduler/ 
> sched-stats.rst as well.

Please ignore this comment.

