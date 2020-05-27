Return-Path: <SRS0=njH7=7J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAEEC433E1
	for <linux-doc@archiver.kernel.org>; Wed, 27 May 2020 08:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 503B7215A4
	for <linux-doc@archiver.kernel.org>; Wed, 27 May 2020 08:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com header.i=@unikie-com.20150623.gappssmtp.com header.b="JMBYzYs7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387762AbgE0IRW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 May 2020 04:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387733AbgE0IRV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 May 2020 04:17:21 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E208CC061A0F
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:17:20 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l21so26957293eji.4
        for <linux-doc@vger.kernel.org>; Wed, 27 May 2020 01:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zktQjkPIq8F7/eqX0nZqeVIC495NLQMSfws8aVeqIPI=;
        b=JMBYzYs7GwNK/iQLl5zExv/dNJWSk8eC2CrzKLirhInzMYf5arbF0isOJqOaeueLUd
         WQjDXa1B8f9+HVHrLVufIHu+dElkGQ6p/ZTQ5a6nnQaiYzLGerknQoq+LMBze2hak29v
         IC/8KnaI+0R8PCj/M8ZJShEMJ6IMcCDL1LBhPNU4NJUAO7nflaGRb+5cJ6iQaMFHuWHb
         jvEG3hDzDFaG4RT86/EQVkvpEc+WGGQz7Zhe/vlFVjGQ//0Oh2UtsYkAtNn7tP+cYqtD
         mki4CXaDVkKqpAXapVMRQdz2D7MIpAehE7a5p/rnQLOdB5vMX4Rfz84w5bCX0LLLw7v6
         ZEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zktQjkPIq8F7/eqX0nZqeVIC495NLQMSfws8aVeqIPI=;
        b=NfknutGCl3gfTUwwmTtc7RofJHgJZOr2fPs3THvvkGhAkeo92c0NYzLPqDWFNFyRT8
         dODlF7SmbNzTV632hqK5G7R4fixQ07W2hLj15f9Ek+h36uqICLaNFQEQLKY8YN/CCLkP
         WlDgRAdCrQ3noiG5kLEVE3hjJx3230PygqOH06iM2a+GFMGgkehNXtOT6sOzpUQFWF6+
         t14mr0rgRxRP9gx3b+Ijuk2DVgk6eNaNJJmy+pGDqbD4G3n9v6mnOtuQQpDaOj3YfzFX
         sYa098odAuCJ+5wzpcYF7ORRwUATPM0W+xHIIgEgyeg5tGnt4Gr68T7LY1fkhxVXGFDa
         iOcA==
X-Gm-Message-State: AOAM531t3YLNHsPImaVLfUhqUxSU3yiJnXAxUvdfi5zh7MOXnfaJtflH
        GdmdeArOOuA245FWeuzrS3182J5cRwMRa1CeN1enpg==
X-Google-Smtp-Source: ABdhPJyypWT4wmLNImCUYVUo8q4iBua9cgcZASUIqvWuf+52iRtwtH7oA+kdgksGEuWM4FVNwJ240DmuP6FMbjSSJYU=
X-Received: by 2002:a17:906:34c4:: with SMTP id h4mr5179696ejb.167.1590567439597;
 Wed, 27 May 2020 01:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200514092637.15684-1-John.Mathew@unikie.com>
 <20200514092637.15684-4-John.Mathew@unikie.com> <20200526102511.GA5681@linux.vnet.ibm.com>
In-Reply-To: <20200526102511.GA5681@linux.vnet.ibm.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Wed, 27 May 2020 11:17:08 +0300
Message-ID: <CAJz2qXm4FKoqMMeM7n=dVpXm6Tko9edun49b=VVsN3j=xQCagQ@mail.gmail.com>
Subject: Re: [RFC PATCH v5 3/3] docs: scheduler: Add introduction to scheduler context-switch
To:     Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        rostedt@goodmis.org, Benjamin Segall <bsegall@google.com>,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, willy@infradead.org,
        Valentin Schneider <valentin.schneider@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 26, 2020 at 1:26 PM Srikar Dronamraju
<srikar@linux.vnet.ibm.com> wrote:
>
> * john mathew <john.mathew@unikie.com> [2020-05-14 12:26:37]:
>
> > +
> > +Context Switching
> > +-----------------
> > +
> > +Context switching, the switching from a running task to another,
> > +is done by the context_switch() function defined in kernel/sched.c.
>
> context_switch is defined in kernel/sched/core.c
Fixed in v6.
>
> > +It is called by __schedule() when a new process has been selected to run.
> > +The execution flow is as follows:
> > +
> > +
> > +  For a kernel task switching to a user task, switch_mm_irqs_off()
> > +  replaces the address space of prev kernel task with the next from the user
> > +  task. Same as for exiting process in this case, the context_switch()
>
> Did you mean existing instead of exiting?
I reworded the description in v6.
>
> > +  function saves the pointer to the memory descriptor used by prev in the
> > +  runqueue???s prev_mm field and resets prev task active address space.
Yes, hopefully better described in the v6.
Please review and ack.
> > +
> --
> Thanks and Regards
> Srikar Dronamraju
