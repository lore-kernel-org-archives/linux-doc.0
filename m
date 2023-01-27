Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAD2C38142
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 19:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbjA0TZY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjA0TZW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 14:25:22 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916F87E6E8
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 11:25:21 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h16so5837462wrz.12
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 11:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aL3dXKeQv5sh7/O7A3blz49tOT4E397qNYShcYj0ULE=;
        b=mUXGrwcisz0JSJDQP5oKNlDe9Z1xozgM3DEoPdCRNoZz5i9RXWXPZHQ5aTeMjMqxSM
         WNlHcYOnRKrZZTYF6ToUPXic8V7DKKM4mZqhug4F8QEPIsxKUjozhi4iCXRX/1wLC0jx
         hXNj9llkJQ+Nfec0Diexmp3gHYY0Kltzpe1HLic2lqAwaqgxtVINg/F3LmgNSAaP9mEK
         EG1+W7VzlFwmDBRHpebMCUqIOCZvgn3ZDkZWcROTLhIYcJW1DUMQ2BfQqc5/qkc+hO37
         pesPUsjlXgNpi+25p2vYMs4O+vDeTD58rSCGTLk/1yjsU9MoWlDPvMsbRiQKrB+5KwJB
         KqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aL3dXKeQv5sh7/O7A3blz49tOT4E397qNYShcYj0ULE=;
        b=qUTQfwUW0C1gRcXrc95bDobVV03jXIyH7HuBwvD1J+oVsVDUZQRq3iRyONXKQro7xU
         wgaPZPIhXUIp/PyijWY5eThEEo89ozOt8hW5Y8RajmJwOGtAlKeiXxCFToOpm/9T02YT
         7E+hZMB6TyjeUTb1ygqvMI15ipTl/6G0+qJTV9jCANjywQE8lyY4zaYmP2Rj0MFKR7JK
         vL1ic15u334Cw2uX6FbhcoJSHmuLWbU6kSrFYhBM6lExkSZ6ATwCxtB8bZ2VitFgmYQg
         mmHZOrnQj1HVrBhXEaeMA0akS9CujS9rsz9uWF0tjyaSbFr+govMsqvO0qoxz6h3GNQt
         0yAw==
X-Gm-Message-State: AFqh2kpYLipljVYkqJ2/zCixnwZTDtgiZ2pBK3WlKudq23qp/BQIQaTY
        Yh20D2e7DqoD8X2X5UPDv3ISPFFbI4sKIO2RBNd0aw==
X-Google-Smtp-Source: AMrXdXvc8Mzg4aM7clkWk2sdRsoEX0dU1K/iZkKB/9lxunM/FELPv4/74NRKRpspQBBEhJV1oJVFqOGnb7x6ThkxaBw=
X-Received: by 2002:a05:6000:1004:b0:2bd:e0d5:3da3 with SMTP id
 a4-20020a056000100400b002bde0d53da3mr1871292wrx.132.1674847520033; Fri, 27
 Jan 2023 11:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <Y8HI+42TxxlJxT6D@slm.duckdns.org>
 <CAJkfWY4Az45dNkPu5JpDsiMV-gRLe2VjVuixQd9xNG7zdLb4jA@mail.gmail.com> <Y8iq6gLtmX1c8VSf@slm.duckdns.org>
In-Reply-To: <Y8iq6gLtmX1c8VSf@slm.duckdns.org>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Fri, 27 Jan 2023 11:25:10 -0800
Message-ID: <CAJkfWY490-m6wNubkxiTPsW59sfsQs37Wey279LmiRxKt7aQYg@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Tejun Heo <tj@kernel.org>
Cc:     Sandeep Dhavale <dhavale@google.com>,
        Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 18, 2023 at 6:29 PM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Jan 18, 2023 at 06:01:04PM -0800, Nathan Huckleberry wrote:
> > Do you think something similar should be done for WQ_UNBOUND? In most
> > places where WQ_HIGHPRI is used, WQ_UNBOUND is also used because it
> > boosts performance. However, I suspect that most of these benchmarks
> > were done on x86-64. I've found that WQ_UNBOUND significantly reduces
> > performance on arm64/Android.
>
> One attribute with per-cpu workqueues is that they're concurrency-level
> limited. ie. if you have two per-cpu work items queued, the second one might
> not run until the first one is done. Maybe people were trying to avoid
> possible latency spikes from that?
>
> Even aside from that, UNBOUND tends to give more consistent latency
> behaviors as you aren't necessarily bound to what's happening on that
> particular, so I guess maybe that's also why but I didn't really follow how
> each user is picking and justifying these flags, so my insight is pretty
> limited.
>
> > From the documentation, using WQ_UNBOUND for performance doesn't seem
> > correct. It's only supposed to be used for long-running work. It might
> > make more sense to get rid of WQ_UNBOUND altogether and only move work
> > to unbound worker pools once it has stuck around for long enough.
>
> UNBOUND says: Don't pin this to one cpu or subject it to workqueue's
> concurrency limit. Use workqueue as a generic thread pool.
>
> I don't know what you mean by performance but HIGHPRI | UNBOUND will
> definitely improve some aspects.
>
> > Android will probably need to remove WQ_UNBOUND from all of these
> > performance critical users.
> >
> > If there are performance benefits to using unbinding workqueues from
> > CPUs on x86-64, that should probably be a config flag, not controlled
> > by every user.
>
> It's unlikely that the instruction set is what's making the difference here,
> right? It probably would help if we understand why it's worse on arm.

I did some more digging. For dm-verity I think this is related to the
availability of SHA instructions. If SHA instructions are present,
WQ_UNBOUND is suboptimal because the work finishes very quickly.

That doesn't explain why EROFS is slower with WQ_UNBOUND though.

It might also be related to the heterogeneity of modern arm
processors. Locality may be more important for ARM processors than for
x86-64.

See the table below:

| open-prebuilt-camera | UNBOUND | HIGHPRI | HIGHPRI ONLY | SCHED_FIFO ONLY |
| erofs wait time (us)     | 357805                         | 174205
(-51%)   | 129861 (-63%)          |
| verity wait time (us)    | 11746                            | 119
(-98%)         | 0 (-100%)                  |

The bigger issue seems to be WQ_UNBOUND, so I'm abandoning these
patches for now.

Thanks,
Huck

>
> I don't think ppl have been all that deliberate with these flags, so it's
> also likely that some of the usages can drop UNBOUND completely but I really
> think more data and analyses would help.
>
> Thanks.

>
> --
> tejun
