Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E5C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 15 Nov 2022 20:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbiKOU4H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Nov 2022 15:56:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238678AbiKOUz4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Nov 2022 15:55:56 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BE8317DA
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 12:55:51 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z14so26299614wrn.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Nov 2022 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RyUy3FPoDZHpwS/VbPdG1C0STKM2EnbRqd6JJodHJlc=;
        b=U5nlGcBPMNWp/Xt2hRAghUYFWmN6wwNXCHZjJUj2vxkImjYFZRW4uteWG4V3FeVdRs
         Fl50nI7zXE1jPP6mTri82uh9Kiw5O595Or3TnDVdmMDmNZDO8v4rsHDOxA0wsff3nu+D
         K0eB/lfxN+KIPJBFPg+sTn5mTR8Ngf2MiponBLFpe0EgPXiE3YyJOMxLkC8k02QydLKh
         pW3HOATAsdHn+UFL70hLsORCjfKiO8O005nkb53FwO/Kn6opkDLwRzoceRldAocirxp3
         2+3Qj2w8O1mhnZoCk0U/FdrsfHH90fYv6tEwbfTBfJM0OlnW/AqV1pqM3fQUALBEbozY
         1eBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyUy3FPoDZHpwS/VbPdG1C0STKM2EnbRqd6JJodHJlc=;
        b=yj9taMWXAUSNdj8W8o9aKkWXPTKOT1U3CfoDcaMu48jQh0B34ld70BaRPfEUaf35Bg
         nIOpSAifepi8n2Y/kSL6zHMaivUlx6+tme+vcauABeDz+1cqm/yFERa7BxjL8qCvwo4S
         SEd60ir4sLH5LntAFv62WUZHOzuI3GF3h8sv8wa56cCn2K17a39UYTmDV0Jo7HC6nYTg
         7pHjIQbqlhXHBs5gkrOci4RvmKrXlKkdBUTscSfGFwNhmuwNP5u+Fi+rO/4nS4U1BUOj
         9FU7MZOCHF/fPVpoGPxdEeatzbhAi9dxCJzLI/b/log94WZEJ+b0E8P5uFhDQItkSxx/
         iZ0w==
X-Gm-Message-State: ANoB5pnLXlgIV++stz7UNWFt+lsvjG2Ao6hRwqGAMLG2pCvcPKTMlMWC
        LFIumCZLGkIrrj8o1uHdEk37DQ==
X-Google-Smtp-Source: AA0mqf5dHQcyR/rzPXzBYaHBwalgHriwZ76e2nI9JYRtXBV3qfTZQVRFVYuYzlzUls0ASh5rwX2/sQ==
X-Received: by 2002:a5d:5234:0:b0:236:518d:f2b4 with SMTP id i20-20020a5d5234000000b00236518df2b4mr12379273wra.397.1668545750388;
        Tue, 15 Nov 2022 12:55:50 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d458e000000b0022eafed36ebsm13281766wrq.73.2022.11.15.12.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:55:49 -0800 (PST)
Date:   Tue, 15 Nov 2022 20:55:47 +0000
From:   Qais Yousef <qyousef@layalina.io>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
        Lukasz Luba <lukasz.luba@arm.com>,
        Xuewen Yan <xuewen.yan94@gmail.com>, Wei Wang <wvw@google.com>,
        Jonathan JMChen <Jonathan.JMChen@mediatek.com>,
        Hank <han.lin@mediatek.com>, Paul Bone <pbone@mozilla.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: sched: Add a new sched-util-clamp.rst
Message-ID: <20221115205547.3f4kzig5r44ipv3b@airbuntu>
References: <20221113152629.3wbyeejsj5v33rvu@airbuntu>
 <Y3ICaCPX61EOn/KN@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y3ICaCPX61EOn/KN@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/14/22 15:55, Bagas Sanjaya wrote:
> On Sun, Nov 13, 2022 at 03:26:29PM +0000, Qais Yousef wrote:
> > Thanks! I have the below fixup patch that addresses these. It made me realize
> > my html output could look better. It's cosmetic; so won't post a new version
> > till some feedback is provided first.
> > 
> > 
> > Cheers
> > 
> > --
> > Qais Yousef
> > 
> > 
> > --->8---
> > 
> > diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
> > index b430d856056a..f12d0d06de3a 100644
> > --- a/Documentation/scheduler/index.rst
> > +++ b/Documentation/scheduler/index.rst
> > @@ -15,6 +15,7 @@ Linux Scheduler
> >      sched-capacity
> >      sched-energy
> >      schedutil
> > +    sched-util-clamp
> >      sched-nice-design
> >      sched-rt-group
> >      sched-stats
> > diff --git a/Documentation/scheduler/sched-util-clamp.rst b/Documentation/scheduler/sched-util-clamp.rst
> > index e75b69767afb..728ffa364fc7 100644
> > --- a/Documentation/scheduler/sched-util-clamp.rst
> > +++ b/Documentation/scheduler/sched-util-clamp.rst
> > @@ -169,24 +169,27 @@ could change with implementation details.
> >  2.1  BUCKETS:
> >  -------------
> >  
> > +.. code-block:: c
> > +
> >                             [struct rq]
> >  
> > -(bottom)                                                    (top)
> > +  (bottom)                                                    (top)
> >  
> > -  0                                                          1024
> > -  |                                                           |
> > -  +-----------+-----------+-----------+----   ----+-----------+
> > -  |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > -  +-----------+-----------+-----------+----   ----+-----------+
> > -     :           :                                   :
> > -     +- p0       +- p3                               +- p4
> > -     :                                               :
> > -     +- p1                                           +- p5
> > -     :
> > -     +- p2
> > +    0                                                          1024
> > +    |                                                           |
> > +    +-----------+-----------+-----------+----   ----+-----------+
> > +    |  Bucket 0 |  Bucket 1 |  Bucket 2 |    ...    |  Bucket N |
> > +    +-----------+-----------+-----------+----   ----+-----------+
> > +       :           :                                   :
> > +       +- p0       +- p3                               +- p4
> > +       :                                               :
> > +       +- p1                                           +- p5
> > +       :
> > +       +- p2
> 
> The code block above is diagram, isn't it? Thus specifying language for
> syntax highlighting (in this case ``c``) isn't appropriate.

I could do with a helping hand here actually. I am a text only person but
trying to follow the new rst docs; but I don't have a clue to be honest.

I did try to find the right directive, but I couldn't find it. What should be
specified for this diagram?

> 
> >  
> >  
> > -DISCLAMER:
> > +.. note::
> > +  DISCLAMER:
> >     The diagram above is an illustration rather than a true depiction of the
> >     internal data structure.
> 
> The DISCLAIMER line above isn't needed, since note block should do the
> job.

Okay.

> 
> >  
> > @@ -200,6 +203,8 @@ The rq has a bucket for each uclamp_id: [UCLAMP_MIN, UCLAMP_MAX].
> >  The range of each bucket is 1024/N. For example for the default value of 5 we
> >  will have 5 buckets, each of which will cover the following range:
> >  
> > +.. code-block:: c
> > +
> 
> Again, why ``c`` syntax highlighting?

This is a C code snippet. What would be better to use? I think I was getting
errors if I don't specify something. But again; I was touching my way around in
the dark here trying to figure it out.

> Otherwise no new warnings. Thanks for fixing this up.
> 
> However, in the future, for documentation patches you should always Cc:
> linux-doc list. Adding it to Cc list now.

Indeed. Maybe I went into auto-mode and didn't use get_maintainer proper.
Apologies.


Thanks!

--
Qais Yousef
