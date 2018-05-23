Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 159C87DF8D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 20:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934862AbeEWUS7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 16:18:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42094 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S934873AbeEWUS5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 16:18:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4569F4023112;
        Wed, 23 May 2018 20:18:56 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-182.bos.redhat.com [10.18.17.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 96E1D2166BB2;
        Wed, 23 May 2018 20:18:53 +0000 (UTC)
Subject: Re: [PATCH v8 4/6] cpuset: Make generate_sched_domains() recognize
 isolated_cpus
To:     Patrick Bellasi <patrick.bellasi@arm.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-5-git-send-email-longman@redhat.com>
 <20180523173453.GY30654@e110439-lin>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <bf4cb72b-9ff3-eb8b-ca2c-f6c4fee5c123@redhat.com>
Date:   Wed, 23 May 2018 16:18:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180523173453.GY30654@e110439-lin>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 23 May 2018 20:18:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 23 May 2018 20:18:56 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/23/2018 01:34 PM, Patrick Bellasi wrote:
> Hi Waiman,
>
> On 17-May 16:55, Waiman Long wrote:
>
> [...]
>
>> @@ -672,13 +672,14 @@ static int generate_sched_domains(cpumask_var_t **domains,
>>  	int ndoms = 0;		/* number of sched domains in result */
>>  	int nslot;		/* next empty doms[] struct cpumask slot */
>>  	struct cgroup_subsys_state *pos_css;
>> +	bool root_load_balance = is_sched_load_balance(&top_cpuset);
>>  
>>  	doms = NULL;
>>  	dattr = NULL;
>>  	csa = NULL;
>>  
>>  	/* Special case for the 99% of systems with one, full, sched domain */
>> -	if (is_sched_load_balance(&top_cpuset)) {
>> +	if (root_load_balance && !top_cpuset.isolation_count) {
> Perhaps I'm missing something but, it seems to me that, when the two
> conditions above are true, then we are going to destroy and rebuild
> the exact same scheduling domains.
>
> IOW, on 99% of systems where:
>
>    is_sched_load_balance(&top_cpuset)
>    top_cpuset.isolation_count = 0
>
> since boot time and forever, then every time we update a value for
> cpuset.cpus we keep rebuilding the same SDs.
>
> It's not strictly related to this patch, the same already happens in
> mainline based just on the first condition, but since you are extending
> that optimization, perhaps you can tell me where I'm possibly wrong or
> which cases I'm not considering.
>
> I'm interested mainly because on Android systems those conditions
> are always true and we see SDs rebuilds every time we write
> something in cpuset.cpus, which ultimately accounts for almost all the
> 6-7[ms] time required for the write to return, depending on the CPU
> frequency.
>
> Cheers Patrick
>
Yes, that is true. I will look into how to further optimize this. Thanks
for the suggestion.

-Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
