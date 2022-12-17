Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA37C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 17 Dec 2022 22:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiLQWBu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Dec 2022 17:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiLQWBo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Dec 2022 17:01:44 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FA512778
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 14:01:36 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso4071449wmb.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Dec 2022 14:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOSkvzS5rw9RqReI9DDRUaJAR+FURiQ8Kin2htoeGpw=;
        b=NNR2VsX7aR4bcPxEa4k1u9Clg3hy+/LnwwxOFJ2Z4F6ZO9LNftOkW9gHnWEfHhVilB
         NIng3eJ5DCU7l9c5VkOdEguqWz60y2g6S2kEqLTVje4M2uTR6aDaepL973vTvpsMPEsQ
         7TpRM9T2HD71mIqkruO1vmfE2JMAJ1fNve6nJ8kYZuxhlWexEuuxRksJquPNLn2e2SrW
         VGaquzXROZiNfKnBn9qnwR9tPIe7BPkuq4/mFgw9GBICO1PznyVrJPUG0swlGfhODZUD
         zp8iB41Nvv8LMLJtbLJj3iHNupJD+MlgWKObZQjGf8a054QB5EZrP6Y8Sk2BPM6C3NO6
         5iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOSkvzS5rw9RqReI9DDRUaJAR+FURiQ8Kin2htoeGpw=;
        b=NqixeaWWDem4Us1kb3r+hs+rcYgpDxmVR3kNgYWNwWbT2e463a2xcum9YLODBcSxzO
         AIzQaeVj5JiS0oy3elPj9m/BM4Ir0HHHDzvcSENok/FEy/CEQ2FUwfCv3I1Jc/wLPJO+
         3VF3AdXfPXaRmlGzIo6Jaiq4xAs00ux0oXptpE4cD8vBDoBAHd9K2nJ1rI/9UMEogBWG
         /LnaBgvPSrQv10EWkGcig4eeHcVv474eTsqUdruDKkft8kDoxMhD4flysHapveMDNS7V
         URoTkJ4v1BwqkGgJWWgXcE49BMKMJwitRsaR2c0R+dPEqn6pyBBioXVuwa6RwW1kQPEm
         VLtw==
X-Gm-Message-State: ANoB5pnfm8QbAf2M0sQywSOOPHRuRqVQNHL4Z1dCE4SE4xshdQdlx9L5
        MYkczA7h/KI2IV9xRTmxjRc9Wg==
X-Google-Smtp-Source: AA0mqf5A3p2VTGjx8f3Y09Xd8A9AhGsa3AUBDhVMfoM707A+zXdIeQZ+CFn9Unh7HzIGid2zUwW8Ew==
X-Received: by 2002:a05:600c:a0f:b0:3d0:8a0e:3910 with SMTP id z15-20020a05600c0a0f00b003d08a0e3910mr28797701wmp.34.1671314495353;
        Sat, 17 Dec 2022 14:01:35 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id q9-20020a7bce89000000b003d1e34bcbb2sm6826036wmj.13.2022.12.17.14.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 14:01:34 -0800 (PST)
Date:   Sat, 17 Dec 2022 22:01:33 +0000
From:   Qais Yousef <qyousef@layalina.io>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Xuewen Yan <xuewen.yan94@gmail.com>, Wei Wang <wvw@google.com>,
        Jonathan JMChen <Jonathan.JMChen@mediatek.com>,
        Hank <han.lin@mediatek.com>, Paul Bone <pbone@mozilla.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v3] Documentation: sched: Document util clamp feature
Message-ID: <20221217220133.p5wh7drpvkmkups2@airbuntu>
References: <20221216235716.201923-1-qyousef@layalina.io>
 <Y52Ri28ThsM4iU8X@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y52Ri28ThsM4iU8X@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/17/22 16:53, Bagas Sanjaya wrote:
> On Fri, Dec 16, 2022 at 11:57:16PM +0000, Qais Yousef wrote:
> > +Another example is in Android where tasks are classified as background,
> > +foreground, top-app, etc. Util clamp can be used to constrain how much
> > +resources background tasks are consuming by capping the performance point they
> > +can run at. This constraint helps reserve resources for important tasks, like
> > +the ones belonging to the currently active app (top-app group). Beside this
> > +helps in limiting how much power they consume. This can be more obvious in
> > +heterogeneous systems (e.g. Arm big.LITTLE); the constraint will help bias the
> > +background tasks to stay on the little cores which will ensure that:
> > +
> > +        1. The big cores are free to run top-app tasks immediately. top-app
> > +           tasks are the tasks the user is currently interacting with, hence
> > +           the most important tasks in the system.
> > +        2. They don't run on a power hungry core and drain battery even if they
> > +           are CPU intensive tasks.
> > +
> > +.. note::
> > +  **little cores**:
> > +    CPUs with capacity < 1024
> > +
> > +  **big cores**:
> > +    CPUs with capacity = 1024
> 
> Processing capacity (CPU frequency) in MHz? This is the first time I

This is a scheduler abstraction value from 0-1024. Biggest CPU always has
a capacity of 1024. On SMP all cpus appear as 1024 CPUs.

> hear Arm big.LITTLE architecture. CC'ing several Arm folks and
> linux-arm-kernel list for I'm unsure on this.

This has my Arm SoB :-)

This was added based on Lukasz comments. Both Lukasz and Dietmar were my
colleagues at Arm and are on CC.

I don't think it was necessary to expand the recipients list. But probably more
is better though all the scheduler people are covered. This has nothing to do
with Arm but it's the prime example of heterogeneous systems.

> 
> > +
> > +By making these uclamp performance requests, or rather hints, user space can
> > +ensure system resources are used optimally to deliver the best possible user
> > +experience.
> > +
> > +Another use case is to help with **overcoming the ramp up latency inherit in
> > +how scheduler utilization signal is calculated**.
> 
> IMO the bold text isn't needed (why did you highlight the phrase above)?
> 
> > +When task @p is running, **the scheduler should try its best to ensure it
> > +starts at 40% performance level**. If the task runs for a long enough time so
> > +that its actual utilization goes above 80%, the utilization, or performance
> > +level, will be capped.
> 
> Same here.
> 
> > +**Generally it is advised to perceive the input as performance level or point
> > +which will imply both task placement and frequency selection**.
> 
> Same here too.

All of these were added based on Lukasz review comments. He thought they're
important pieces and should be highlighted, I opted to do that by making them
bold text.


Thanks!

--
Qais Yousef
