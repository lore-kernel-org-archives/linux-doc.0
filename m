Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E063C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 20:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiCKUvY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Mar 2022 15:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiCKUvY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Mar 2022 15:51:24 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B23217DBAC
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 12:50:16 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D92D62C3;
        Fri, 11 Mar 2022 20:50:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D92D62C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647031816; bh=fKsTmqnYrgbk41JW5+/Z8ro1q6GpTGzqiVuBPOjoLEU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sKAFrYjl54EZzblm5NNIa+qMkhJLUiQ/QY9qkRuIcntoBblfF6oHt5SeHsA+cjOmh
         7ddE8R4WB46tmiSLWJugDt5U1TbRA2RvWXTGSlrv4BEKNPSSzb7TfBxLmFJGiMgnSo
         ZXv4g56Qlj4eE7iJrUOrgmwLHkLFSz9CcUShdOVoLikFh5Ymv61waIfLVNCaCNKa/m
         ESQxtlQGv6mMf7RwH315qFvJHThdORWOl9Qxw7lUrRWSr/poDib9+dJbj/jEjH3ea/
         cF2fUWoOShxMoo8C65N2ES53Mm5utYKwix/cldEiyDwUue0yFNUXmi2IkkcVvkwWOu
         R3+D67qTERX9w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, peterz@infradead.org,
        mingo@redhat.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        siyanteng@loongson.cn, siyanteng01@gmail.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH] docs: scheduler: Convert schedutil.txt to ReST
In-Reply-To: <20220311030400.32320-1-tangyizhou@huawei.com>
References: <20220311030400.32320-1-tangyizhou@huawei.com>
Date:   Fri, 11 Mar 2022 13:50:15 -0700
Message-ID: <87v8wk2ozc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> All other scheduler documents have been converted to *.rst. Let's do
> the same for schedutil.txt.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  Documentation/scheduler/index.rst             |  1 +
>  .../{schedutil.txt => schedutil.rst}          | 50 ++++++++++---------
>  2 files changed, 28 insertions(+), 23 deletions(-)
>  rename Documentation/scheduler/{schedutil.txt => schedutil.rst} (85%)

I would like to see this change made so that this document can be built
with the rest of the kernel docs.  I will, however, defer to Peter and
will not accept this change over his objections.

That said, there is one other issue...
[...]

> --- a/Documentation/scheduler/schedutil.txt
> +++ b/Documentation/scheduler/schedutil.rst
> @@ -1,11 +1,15 @@
> +=========
> +Schedutil
> +=========
>  
> +.. note::
>  
> -NOTE; all this assumes a linear relation between frequency and work capacity,
> -we know this is flawed, but it is the best workable approximation.
> +   All this assumes a linear relation between frequency and work capacity,
> +   we know this is flawed, but it is the best workable approximation.
>  
>  
>  PELT (Per Entity Load Tracking)
> --------------------------------
> +===============================
>  
>  With PELT we track some metrics across the various scheduler entities, from
>  individual tasks to task-group slices to CPU runqueues. As the basis for this
> @@ -38,8 +42,8 @@ while 'runnable' will increase to reflect the amount of contention.
>  For more detail see: kernel/sched/pelt.c
>  
>  
> -Frequency- / CPU Invariance
> ----------------------------
> +Frequency / CPU Invariance
> +==========================
>  
>  Because consuming the CPU for 50% at 1GHz is not the same as consuming the CPU
>  for 50% at 2GHz, nor is running 50% on a LITTLE CPU the same as running 50% on
> @@ -47,23 +51,23 @@ a big CPU, we allow architectures to scale the time delta with two ratios, one
>  Dynamic Voltage and Frequency Scaling (DVFS) ratio and one microarch ratio.
>  
>  For simple DVFS architectures (where software is in full control) we trivially
> -compute the ratio as:
> +compute the ratio as::
>  
> -	    f_cur
> +            f_cur

You would appear to have done some space-to-tab conversions throughout
the file which muddies up the diff and makes it harder to see what you
have really changed.  Please redo the patch without unneeded white-space
changes.

Thanks,

jon
