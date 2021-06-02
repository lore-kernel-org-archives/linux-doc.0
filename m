Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C664C4708F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 19:10:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E590B613EE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 19:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhFBTLw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Jun 2021 15:11:52 -0400
Received: from foss.arm.com ([217.140.110.172]:52458 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhFBTLw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Jun 2021 15:11:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CCC11063;
        Wed,  2 Jun 2021 12:10:08 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9D973F774;
        Wed,  2 Jun 2021 12:10:06 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Rework CPU capacity asymmetry detection
To:     Beata Michalska <beata.michalska@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, valentin.schneider@arm.com,
        corbet@lwn.net, rdunlap@infradead.org, linux-doc@vger.kernel.org
References: <20210527153842.17567-1-beata.michalska@arm.com>
From:   Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <0e0f8202-4acc-5092-33c1-82d268b3fd5b@arm.com>
Date:   Wed, 2 Jun 2021 21:10:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527153842.17567-1-beata.michalska@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/05/2021 17:38, Beata Michalska wrote:

[...]

> Beata Michalska (3):
>   sched/core: Introduce SD_ASYM_CPUCAPACITY_FULL sched_domain flag
>   sched/topology: Rework CPU capacity asymmetry detection
>   sched/doc: Update the CPU capacity asymmetry bits
> 
>  Documentation/scheduler/sched-capacity.rst |   6 +-
>  Documentation/scheduler/sched-energy.rst   |   2 +-
>  include/linux/sched/sd_flags.h             |  10 ++
>  kernel/sched/topology.c                    | 194 +++++++++++++--------
>  4 files changed, 133 insertions(+), 79 deletions(-)

Looks good to me, even though I would like to see a more compact version
of asym_cpu_capacity_classify(). Details in my response to [PATCH v6 2/3].

Did some level of testing myself and wasn't able to break it.

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
