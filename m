Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0941BC388F7
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 12:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9B2E22240
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 12:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgKMMDq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 07:03:46 -0500
Received: from foss.arm.com ([217.140.110.172]:36772 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbgKMLnG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Nov 2020 06:43:06 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B10F51042;
        Fri, 13 Nov 2020 03:34:28 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.194.46])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756513F6CF;
        Fri, 13 Nov 2020 03:34:27 -0800 (PST)
References: <20201112223129.26580-1-song.bao.hua@hisilicon.com> <20201112223129.26580-2-song.bao.hua@hisilicon.com>
User-agent: mu4e 0.9.17; emacs 26.3
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxarm@huawei.com,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Adrian Freund <adrian@freund.io>
Subject: Re: [PATCH v2 2/2] Documentation: scheduler: ask users to set sched_debug cmdline
Message-ID: <jhj5z69xzi7.mognet@arm.com>
In-reply-to: <20201112223129.26580-2-song.bao.hua@hisilicon.com>
Date:   Fri, 13 Nov 2020 11:34:21 +0000
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 12/11/20 22:31, Barry Song wrote:
> From: Valentin Schneider <valentin.schneider@arm.com>
>
> To print the schedule debug information, users need to set sched_debug
> cmdline or enable it by sysfs entry.
>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Adrian Freund <adrian@freund.io>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>

FYI, forging SoB, or any 'tag' other than Suggested-by / Reported-by is
frowned up. Now I do appreciate your effort to give me credit, but in this
case you should've used Suggested-by.

Moreso, this really is a trivial change and doesn't deserve a separate
patch, so I would say just squash that into patch 1, and add

Reviewed-by: Valentin Schneider <valentin.schneider@arm.com>

to it :)

> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/scheduler/sched-domains.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/scheduler/sched-domains.rst b/Documentation/scheduler/sched-domains.rst
> index 55983b7e1098..8582fa5e9170 100644
> --- a/Documentation/scheduler/sched-domains.rst
> +++ b/Documentation/scheduler/sched-domains.rst
> @@ -74,6 +74,8 @@ for a given topology level by creating a sched_domain_topology_level array and
>  calling set_sched_topology() with this array as the parameter.
>  
>  The sched-domains debugging infrastructure can be enabled by enabling
> -CONFIG_SCHED_DEBUG. This enables an error checking parse of the sched domains
> -which should catch most possible errors (described above). It also prints out
> -the domain structure in a visual format.
> +CONFIG_SCHED_DEBUG and adding 'sched_debug' to your cmdline. If you forgot to
> +tweak your cmdline, you can also flip the /sys/kernel/debug/sched_debug
> +knob. This enables an error checking parse of the sched domains which should
> +catch most possible errors (described above). It also prints out the domain
> +structure in a visual format.

