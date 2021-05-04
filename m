Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F663C433ED
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 11:09:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44393613B4
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 11:09:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhEDLK3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 07:10:29 -0400
Received: from foss.arm.com ([217.140.110.172]:56936 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229903AbhEDLK2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 May 2021 07:10:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1134AD6E;
        Tue,  4 May 2021 04:09:34 -0700 (PDT)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B33C3F73B;
        Tue,  4 May 2021 04:09:32 -0700 (PDT)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Barry Song <song.bao.hua@hisilicon.com>, peterz@infradead.org,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxarm@huawei.com, Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] Documentation: scheduler: sched_debug_verbose cmdline should be sched_verbose
In-Reply-To: <20210504105344.31344-1-song.bao.hua@hisilicon.com>
References: <20210504105344.31344-1-song.bao.hua@hisilicon.com>
Date:   Tue, 04 May 2021 12:09:24 +0100
Message-ID: <87h7jiycuz.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/05/21 22:53, Barry Song wrote:
> The cmdline should include sched_verbose but not sched_debug_verbose
> as sched_debug_verbose is only the variant name in code.
>
> Fixes: 9406415f46 ("sched/debug: Rename the sched_debug parameter to sched_verbose")
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

> ---
>  Documentation/scheduler/sched-domains.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-domains.rst b/Documentation/scheduler/sched-domains.rst
> index 14ea2f2..84dcdcd 100644
> --- a/Documentation/scheduler/sched-domains.rst
> +++ b/Documentation/scheduler/sched-domains.rst
> @@ -74,7 +74,7 @@ for a given topology level by creating a sched_domain_topology_level array and
>  calling set_sched_topology() with this array as the parameter.
>
>  The sched-domains debugging infrastructure can be enabled by enabling
> -CONFIG_SCHED_DEBUG and adding 'sched_debug_verbose' to your cmdline. If you
> +CONFIG_SCHED_DEBUG and adding 'sched_verbose' to your cmdline. If you
>  forgot to tweak your cmdline, you can also flip the
>  /sys/kernel/debug/sched/verbose knob. This enables an error checking parse of
>  the sched domains which should catch most possible errors (described above). It
> --
> 1.8.3.1
