Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B0DC47096
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 09:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D996E613AD
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 09:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFCJLh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Jun 2021 05:11:37 -0400
Received: from foss.arm.com ([217.140.110.172]:36104 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhFCJLg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jun 2021 05:11:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55E1113A1;
        Thu,  3 Jun 2021 02:09:52 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51EEA3F774;
        Thu,  3 Jun 2021 02:09:50 -0700 (PDT)
Subject: Re: [PATCH v5 2/3] sched/topology: Rework CPU capacity asymmetry
 detection
To:     Beata Michalska <beata.michalska@arm.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, corbet@lwn.net, rdunlap@infradead.org,
        linux-doc@vger.kernel.org
References: <87a6oj6sxo.mognet@arm.com>
 <20210525102945.GA24210@e120325.cambridge.arm.com>
 <98ad8837-b9b8-ff50-5a91-8d5951ee757c@arm.com>
 <20210526121546.GA13262@e120325.cambridge.arm.com>
 <20210526125133.GB13262@e120325.cambridge.arm.com>
 <d4dc6630-041f-bf61-898a-6f402b993fbc@arm.com>
 <20210526214004.GA1712@e120325.cambridge.arm.com>
 <14593ba7-eed9-f035-724c-5cadbb859adc@arm.com>
 <20210527170729.GA20994@e120325.cambridge.arm.com>
 <4f43a9a8-b64e-bb47-b3c1-f51165f40249@arm.com>
 <20210602194805.GA18136@e120325.cambridge.arm.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <32ffee58-5ea9-1e01-c134-9fb90d1b1771@arm.com>
Date:   Thu, 3 Jun 2021 11:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602194805.GA18136@e120325.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/06/2021 21:48, Beata Michalska wrote:
> On Wed, Jun 02, 2021 at 07:17:12PM +0200, Dietmar Eggemann wrote:
>> On 27/05/2021 19:07, Beata Michalska wrote:
>>> On Thu, May 27, 2021 at 05:08:42PM +0200, Dietmar Eggemann wrote:
>>>> On 26/05/2021 23:40, Beata Michalska wrote:
>>>>> On Wed, May 26, 2021 at 08:17:41PM +0200, Dietmar Eggemann wrote:
>>>>>> On 26/05/2021 14:51, Beata Michalska wrote:
>>>>>>> On Wed, May 26, 2021 at 01:15:46PM +0100, Beata Michalska wrote:
>>>>>>>> On Wed, May 26, 2021 at 11:52:25AM +0200, Dietmar Eggemann wrote:
>>>>>>>>> On 25/05/2021 12:29, Beata Michalska wrote:
>>>>>>>>>> On Tue, May 25, 2021 at 10:53:07AM +0100, Valentin Schneider wrote:
>>>>>>>>>>> On 24/05/21 23:55, Beata Michalska wrote:
>>>>>>>>>>>> On Mon, May 24, 2021 at 07:01:04PM +0100, Valentin Schneider wrote:
>>>>>>>>>>>>> On 24/05/21 11:16, Beata Michalska wrote:

[...]

> So what I have done is :
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 77e6f79235ad..ec4ae225687e 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1324,6 +1324,7 @@ asym_cpu_capacity_classify(struct sched_domain *sd,
>         if (!asym_cap_miss)
>                 sd_asym_flags |= SD_ASYM_CPUCAPACITY_FULL;
>  
> +       WARN_ONCE(cpu_smt_flags() & sd->flags, "Detected CPU capacity asymmetry on SMT level");
>  leave:
>         return sd_asym_flags;
>  }
> 
> Comment can be adjusted.
> This would sit in the classify function to nicely wrap asymmetry bits in one
> place. What do you think ?

... and you would need to pass in the sched domain pointer ;-)

Still prefer to check it in sd_init() since there is where we set the flags.

But you can't do 'cpu_smt_flags() & sd->flags'. MC level would hit too,
since it has SD_SHARE_PKG_RESOURCES as well.
