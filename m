Return-Path: <SRS0=G6vI=63=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D0DCA90AF
	for <linux-doc@archiver.kernel.org>; Wed, 13 May 2020 13:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F29D223E0
	for <linux-doc@archiver.kernel.org>; Wed, 13 May 2020 13:39:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com header.i=@unikie-com.20150623.gappssmtp.com header.b="BX8FOjSk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388661AbgEMNjP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 May 2020 09:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388550AbgEMNjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 May 2020 09:39:08 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAECC061A0F
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:39:08 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id e2so14203998eje.13
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2020 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqbYeA4KoNOGLDU4w91JLxJmMWvxI9R71hazf6AYiqA=;
        b=BX8FOjSkWi+v7YmCoxcilRdbPXqC8noIYuJCrduGbzn7537ea+xIbgIIp4kaWmk8Fs
         OTtCKMG89H8kgolwqbUez64KldKIG5RfESbd/KBLwEF04/mFeqR5Q/M/J8iRKKbBtBf8
         QujUSjjVo+cCnRhDeoXPCoBzvM8jtZQale0ODZX6wk4CqYNjakmZNjCfXhGRTc1f7u57
         toHx7cR/YJ4wVHPRbfAee+NDufr/UM/bPDeq1jEBmLchIRFN8CL5VAgHtdeQNsnA1mFY
         3PYx71UqIzxvlNEpY90a4aK/ll0JFFZnlPudLKn75GnHLMKSNdftS84UEznv8S60EVGL
         yOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqbYeA4KoNOGLDU4w91JLxJmMWvxI9R71hazf6AYiqA=;
        b=GztZyh/OMkEg9j/vhToEOCaVMJa+AtLv3YR7A0BjsBHvaaiswZ0ycDlVdKRBhwjTrq
         /3wY4rXBEWhqvimp+s4h5/Zhw3o+pdEw6P9YUJXbX64BW+zL/q9BoH2pW6tNGYsV1+6L
         l4CCuY3a4Ixl8THEtlci9FVWTnrdbMCeX3/9c8+S2ov9Bgh9UuID9nbZDaPa2A0rIN2i
         zAa4dPeBlxIC7ZqUw3sQZ3x/ersV54JSzUOlNkt8MXHn7buCKgvyoKDkexgusAwgRR14
         /q7hXNYtF+qgXgY4CLmS5Tj5aCApzguKjDUuKQG7/cIIj8YYsG0DLIpLE0IpC/hbzv/X
         hF6g==
X-Gm-Message-State: AGi0PubD+i+t1CSe2DGvNstMjE58LbqkpZuI+ae8aPFDkCjqrPOv8k/C
        /g2Qqe8bng2OcRom8VxKvZXYX8NOx4qGH3HR/3Y25A==
X-Google-Smtp-Source: APiQypLIJhK5jdQTRXtb2GsY0qald7EfY5psTJrvJi1KrsW4dsSGbEwUlykmB7/sYpaDHqVIlbD6ewQbLhXudrNqGrI=
X-Received: by 2002:a17:907:9d6:: with SMTP id bx22mr20613524ejc.110.1589377147162;
 Wed, 13 May 2020 06:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200507180553.9993-1-john.mathew@unikie.com> <20200507180553.9993-3-john.mathew@unikie.com>
 <jhjh7wrtpjk.mognet@arm.com> <b974b959-7b9a-2874-dca6-674b74ad5b42@arm.com>
In-Reply-To: <b974b959-7b9a-2874-dca6-674b74ad5b42@arm.com>
From:   John Mathew <john.mathew@unikie.com>
Date:   Wed, 13 May 2020 16:38:55 +0300
Message-ID: <CAJz2qXkrcobNC0Oh94p1e5chMdgzm6X1VCU9Es-1_=Zm5V0HMg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] docs: scheduler: Add scheduler overview documentation
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com,
        Vincent Guittot <vincent.guittot@linaro.org>,
        rostedt@goodmis.org, Benjamin Segall <bsegall@google.com>,
        mgorman@suse.de, bristot@redhat.com, tsbogend@alpha.franken.de,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        Mostafa Chamanara <mostafa.chamanara@basemark.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Oleg Tsymbal <oleg.tsymbal@unikie.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 8, 2020 at 1:58 PM Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:
>
> On 07/05/2020 23:15, Valentin Schneider wrote:
> >
> > On 07/05/20 19:05, John Mathew wrote:
>
> [...]
>
> > It would also be an opportunity to have one place to (at least briefly)
> > describe what the different sched classes do wrt capacity asymmetry - CFS
> > does one thing, RT now does one thing (see Qais' work), and DL will
> > hopefully soon follow (see Dietmar's work).
> >
> > I'd be happy to contribute (some of) that, if it can be deemed useful (I
> > personally think it might).
>
> I like the idea.
>
> Essentially all the code which is guarded by the 'if
> (static_branch_unlikely(&sched_asym_cpucapacity)' condition or which
> sets it during bring-up.
>
> * 'Cpu capacity < SCHED_LOAD_SCALE for non-big' CPUs setting during
>    bringup (necessary dt binding, CPUfreq influence)
>
> * CFS capacity awareness:
>
>   * wakeup - select_idle_capacity() (replaced wake_cap() & slow path to
>              cover DynamIQ and classical big.LITTLE)
>
>   * load_balance - misfit handling
>
> * RT & DL capacity awareness
>
> * ... & the relation to EAS (Documentation/scheduler/sched-energy.rst)
>
> This is what we referred to (at least internally) as CAS (Capacity-Aware
> Scheduling).

Added in pathset v4.

Thanks
