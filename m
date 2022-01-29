Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA753C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 29 Jan 2022 08:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352487AbiA2Iwd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Jan 2022 03:52:33 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:31255 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbiA2Iwc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jan 2022 03:52:32 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Jm7NT2wVBzbk1h;
        Sat, 29 Jan 2022 16:51:37 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 16:52:30 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 29 Jan 2022 16:52:29 +0800
Subject: Re: [PATCH] docs: scheduler: Fix outdated parameter of
 rebalance_domains
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <zhengbin13@huawei.com>,
        <tangyeechou@gmail.com>, <tangyizhou@huawei.com>
References: <20211221031818.23186-1-tangyizhou@huawei.com>
 <d48506d2-91bb-7d40-12c1-5c16ad89916a@huawei.com>
Message-ID: <d786d0ef-0137-7a9e-00f2-860c09bbbfb8@huawei.com>
Date:   Sat, 29 Jan 2022 16:51:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <d48506d2-91bb-7d40-12c1-5c16ad89916a@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,jon. It seems that the maintainers of process scheduler are not interested in
reviewing document patches. Could you please review this?

Thanks,
Tang

On 2022/1/10 20:38, Tang Yizhou wrote:
> Friendly ping.
> Any feedback?
> 
> On 2021/12/21 11:18, Tang Yizhou wrote:
>> According to the function prototype of rebalance_domains(), its first
>> parameter is *rq* and the document need to be updated.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  Documentation/scheduler/sched-domains.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/scheduler/sched-domains.rst b/Documentation/scheduler/sched-domains.rst
>> index 84dcdcd2911c..e57ad28301bd 100644
>> --- a/Documentation/scheduler/sched-domains.rst
>> +++ b/Documentation/scheduler/sched-domains.rst
>> @@ -37,10 +37,10 @@ rebalancing event for the current runqueue has arrived. The actual load
>>  balancing workhorse, run_rebalance_domains()->rebalance_domains(), is then run
>>  in softirq context (SCHED_SOFTIRQ).
>>  
>> -The latter function takes two arguments: the current CPU and whether it was idle
>> -at the time the scheduler_tick() happened and iterates over all sched domains
>> -our CPU is on, starting from its base domain and going up the ->parent chain.
>> -While doing that, it checks to see if the current domain has exhausted its
>> +The latter function takes two arguments: the runqueue of current CPU and whether
>> +the CPU was idle at the time the scheduler_tick() happened and iterates over all
>> +sched domains our CPU is on, starting from its base domain and going up the ->parent
>> +chain. While doing that, it checks to see if the current domain has exhausted its
>>  rebalance interval. If so, it runs load_balance() on that domain. It then checks
>>  the parent sched_domain (if it exists), and the parent of the parent and so
>>  forth.
>>
