Return-Path: <SRS0=SGxC=AF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EC4C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 08:45:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76EC620836
	for <linux-doc@archiver.kernel.org>; Wed, 24 Jun 2020 08:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BaMR/TH7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbgFXIpQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Jun 2020 04:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbgFXIpP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jun 2020 04:45:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40407C061755
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 01:45:15 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id x18so1698151lji.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2020 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BqaLUtl/X7a4g0u53ohS9LpEPRGxCSpsENOwnH2o2ws=;
        b=BaMR/TH7PhsFO1Q34q1x2qClsI7LOGwkyGbEQspz9ojX212XoSbqRRFRth4Meo/ssf
         2uSK2GFHyed2vxpCFS8nAdnPkaKfIeDec0YV9QxJi/0DZp4NUqctsee+ogS3Fl1BjDdr
         a660g7JU0oHL6NyFbXA5+GIkWejIuD89yS0M8Tc8lB+t0JgR/JNVCSHJf9uU9wrnuIDa
         47xkwZFkFxCVyhO1vbBzMyIe1gFadRmPD50scOKKWKTaSZrjIBowcWgIjP9XbV8XY1GP
         3JSamKeGQOntN1He/c6PG2bUnQGEpAvzaZq9ATvao350qg1CFz7ECK/Ha/Dx5Jbn102c
         XDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BqaLUtl/X7a4g0u53ohS9LpEPRGxCSpsENOwnH2o2ws=;
        b=Vmna+kALLNRkMSzDxj43F1kQlSuNI/VmB/0Bq42zX0Dj3DbxzRJLYQrHtZLVUD6vGK
         YkszJm3fGAZ6B0cLD7r8QKsWIu2wresHxhJgRgoOgWgAd1VTdlfXYEk4APun5nIuBx4+
         51Qh/kiC2Pr/IT3JMWHIw8zu0ZXO8sLUXLMKfvSSuK1uOiBOs8gka/dWgIueK35Y38p5
         RyvTumvRUJ01+a5CTS7M5nHxYCJcmRPju9Hnk8AOG2qI8SR8R0JauYSv5a0610l4P0iH
         g7/iCvof/9xFY5AFDrEulzgWBovDHZQ/QgZJVcRGSTHo816MK9HCtUr4aullmV/usTgY
         q6rQ==
X-Gm-Message-State: AOAM5324DN/uxv9GRekC3njY9ZNnnU6m3m2N3SSHZRV93IHSJ32Gw0xJ
        6tZTK1KkpzcBJ09O+mkLelX4HiyR92nwFA3H2KomYg==
X-Google-Smtp-Source: ABdhPJxliTcfapcUjxrmriw5iNjCcnVllOZAHYWf8QkB0iGUvYcf1ODkhqeeAxo4eRsnXoHPY0AN5BRFBvz+CFJpz5M=
X-Received: by 2002:a2e:7f10:: with SMTP id a16mr13972228ljd.69.1592988313570;
 Wed, 24 Jun 2020 01:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <edd80c0d-b7c8-4314-74da-08590170e6f5@arm.com> <87v9k84knx.derkling@matbug.net>
 <20200603101022.GG3070@suse.de> <CAKfTPtAvMvPk5Ea2kaxXE8GzQ+Nc_PS+EKB1jAa03iJwQORSqA@mail.gmail.com>
 <20200603165200.v2ypeagziht7kxdw@e107158-lin.cambridge.arm.com>
 <CAKfTPtC6TvUL83VdWuGfbKm0CkXB85YQ5qkagK9aiDB8Hqrn_Q@mail.gmail.com>
 <20200608123102.6sdhdhit7lac5cfl@e107158-lin.cambridge.arm.com>
 <CAKfTPtCKS-2RoaMHhKGigjzc7dhXhx0z3dYNQLD3Q9aRC_tCnw@mail.gmail.com>
 <20200611102407.vhy3zjexrhorx753@e107158-lin.cambridge.arm.com>
 <CAKfTPtDnWuBOJxJP7ahX4Kzu+8jvPjAcE6XErMtG1SCJMdZZ-w@mail.gmail.com> <20200623154402.jfv5yhhrsbx7toes@e107158-lin.cambridge.arm.com>
In-Reply-To: <20200623154402.jfv5yhhrsbx7toes@e107158-lin.cambridge.arm.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Wed, 24 Jun 2020 10:45:01 +0200
Message-ID: <CAKfTPtBfFkmBRP+6vZaX9sEK+4ABpJrp2qZj18LKzu2t+Q=gGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/uclamp: Add a new sysctl to control RT default
 boost value
To:     Qais Yousef <qais.yousef@arm.com>
Cc:     Mel Gorman <mgorman@suse.de>,
        Patrick Bellasi <patrick.bellasi@matbug.net>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Quentin Perret <qperret@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Pavan Kondeti <pkondeti@codeaurora.org>,
        linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fs <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Qais,

On Tue, 23 Jun 2020 at 17:44, Qais Yousef <qais.yousef@arm.com> wrote:
>
> Hi Vincent
>
> On 06/11/20 14:01, Vincent Guittot wrote:
> > On Thu, 11 Jun 2020 at 12:24, Qais Yousef <qais.yousef@arm.com> wrote:
>
> [...]
>
> > > > Strange because I have been able to trace them.
> > >
> > > On your arm platform? I can certainly see them on x86.
> >
> > yes on my arm platform
>
> Sorry for not getting back to you earlier but I have tried several things and
> shared my results, which you were CCed into all of them.
>
> I have posted a patch that protects uclamp with a static key, mind trying it on
> your platform to see if it helps you too?

I have run some tests with your latest patchset and will reply to the
email thread below

>
> https://lore.kernel.org/lkml/20200619172011.5810-1-qais.yousef@arm.com/
>
> Thanks
>
> --
> Qais Yousef
