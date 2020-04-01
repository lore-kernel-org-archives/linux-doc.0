Return-Path: <SRS0=yfWO=5R=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAADC43331
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 12:20:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7664720714
	for <linux-doc@archiver.kernel.org>; Wed,  1 Apr 2020 12:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YSiPpdaD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732281AbgDAMUX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Apr 2020 08:20:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:29725 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726804AbgDAMUX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Apr 2020 08:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585743622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WDTPFa8ZURJktfLOzCbfsD4S80g+FQC7hULNIYlAu7Y=;
        b=YSiPpdaD2AFYP/UwgmCUWPKK59g1V9NyzHfu+50zSp2o/CheNx+h8702hRD8hppTBJO9TZ
        4P7pM3DIHEg+aEUPd1euyhysdT7K1lDk2sTrjlPaHLLVY2lm4ThbOas3/I3RHQPLLQ143G
        7Z8tzaCcWp6pT9aTQy0bIPSgd1ASkdQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-pelA7wv0NsS5ccnfjPCMJg-1; Wed, 01 Apr 2020 08:20:18 -0400
X-MC-Unique: pelA7wv0NsS5ccnfjPCMJg-1
Received: by mail-wm1-f71.google.com with SMTP id j18so1743270wmi.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2020 05:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WDTPFa8ZURJktfLOzCbfsD4S80g+FQC7hULNIYlAu7Y=;
        b=XblxRkPGo16XO2JFKcvW2Rfs4T+yMkiC2XkI4WbkJda14c8Wu12/bnB/kXb5gMo5W9
         uz10LMVF3pObbsXZS0ObkjltdmED5OjfsLzJgQVZrG27kuI+wkJvkIWmWm3c88UKr2PV
         kar+VwXoE6O0OdO2n+/R3n4gku9ptOCht8dq0gvgXd2z8tbS7wXecegi4vbehe48ATJi
         o0akuoouNdnzJj4KmSubnPM7R92wgqxygLli/fwOIVzUcEBrrbEiA3M4FSk3PekVrGRK
         FRSvVU8/W3uNzyTHmH0u9S9W5G4Tg5krY9ycGA2Omil/Z0DSSXtgMSled+DrDqbL6dci
         /Jtg==
X-Gm-Message-State: AGi0PuYpVfXZSH6rD1RFUQMcOUA69UW+AqRqzSogEm9wcaR1vjx9IdMm
        kfxvxtSOLXoE/X940sVg2WgJcF3FT8RexkO8f+WNMCXYrbm0k+DZ8+HXZeEbtQSBtKiA8d7DTJi
        S6ntnYQEvR0NfQ+I1VynM
X-Received: by 2002:a1c:7216:: with SMTP id n22mr3957780wmc.41.1585743617454;
        Wed, 01 Apr 2020 05:20:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypJGm9VynkGDD62kpREjFTDmdSlFXsNNAMFtPN11ojKIAP6F3bbB/QcM2CPWq2x/1zd9n90kRw==
X-Received: by 2002:a1c:7216:: with SMTP id n22mr3957763wmc.41.1585743617216;
        Wed, 01 Apr 2020 05:20:17 -0700 (PDT)
Received: from localhost.localdomain ([151.29.194.179])
        by smtp.gmail.com with ESMTPSA id s15sm2646131wrt.16.2020.04.01.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 05:20:16 -0700 (PDT)
Date:   Wed, 1 Apr 2020 14:20:14 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     John Mathew <john.mathew@unikie.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com
Subject: Re: [RFC PATCH 2/3] docs: scheduler: Add scheduler overview
 documentation
Message-ID: <20200401122014.GW14300@localhost.localdomain>
References: <20200401100029.1445-1-john.mathew@unikie.com>
 <20200401100029.1445-3-john.mathew@unikie.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401100029.1445-3-john.mathew@unikie.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 01/04/20 13:00, John Mathew wrote:
> Add documentation for
>  -scheduler overview
>  -scheduler state transtion
>  -CFS overview
>  -CFS data structs
> 
> Add rst for scheduler APIs and modify sched/core.c
> to add kernel-doc comments.
> 
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Co-developed-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: Mostafa Chamanara <mostafa.chamanara@basemark.com>
> Signed-off-by: John Mathew <john.mathew@unikie.com>
> ---

[...]

> +Kernel forwards the tasks to each class based on the scheduling policy assigned
> +to each task. Tasks assigned with SCHED_NORMAL, SCHED_IDLE and SCHED_BATCH
> +go to fair_sched_class and tasks assigned with SCHED_RR and SCHED_FIFO go to
> +rt_sched_class

I think you also need to mention that SCHED_DEADLINE goes to
dl_sched_class.

[...]

> +*poicy:* Value for scheduling policy. The possible values are:
> +
> +* SCHED_NORMAL: Regular tasks use this policy.
> +
> +* SCHED_BATCH:  Tasks which need to run longer  without pre-emption use this
> +  policy. Suitable for batch jobs.
> +* SCHED_IDLE: Policy used by background tasks.
> +
> +* SCHED_FIFO & SCHED_RR: These policies for real time tasks. Handled by real
> +  time scheduler.

Here as well. Maybe add also a pointer to related documentation?

Documentation/scheduler/sched-deadline.txt

Thanks,

Juri

