Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9369BC77B6D
	for <linux-doc@archiver.kernel.org>; Fri, 31 Mar 2023 00:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbjCaAfG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 20:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjCaAfD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 20:35:03 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E6BEF89
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 17:35:02 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id bt19so13773828pfb.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 17:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680222901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH3dmPhc4+moh1k942OUVlyMUe+0ay7bXGCHlOkXk5M=;
        b=mcRHDdbzbUBalM4xQm/dV4O4CAnvmP60HNvjCNMdG0V0+RzDyWZ0twOaW7gPPckYmh
         l6ySSh+J6l2SUwYdNua4gOFnU3dU90B7eresyjvGu1Qr4U+Pj8rikdAKAjnIu+opqWv5
         kF8AfcEWyaQh/MZC+lFbK1FD6OKf0kXA4qCNugDXVGm6Li5IDFcUxzJYSiqmEFri/Wq9
         t8nQvJtUyXtfhLC44XDz0jH5RX8uokYwNCWedoV/wim5XdiwnilST7RPGaceM+Y7QDnQ
         zkdOcCS/92CcMiU3awafEkmrvo3Te/s2SVlcm5b8vtLZ7p1qPLy6FW0w6x3rV75P7/v+
         G+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680222901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH3dmPhc4+moh1k942OUVlyMUe+0ay7bXGCHlOkXk5M=;
        b=UeHHUMAqnkUHImW1sRIXUl4ySm4ln0WIUs/EADQIZpyHp4qxW+Pw8fNdHRhhgfQF/A
         CUXZrFBNf4kFEXDz/zByDUoNzB0BGeOjXwq78QBFOjAUNqYfuYlwGE/N4EhhLWNrh7Mo
         Ns2i/9fALOKkpctBDBodAtERQNr1U3xy1wY6yV0OLGShKEa+93ULu6rzzMYot/Tm6hSO
         FTxCKu9NXSA9WoL+uAUdoqWbJHVHZ3hB5gRRwg6ozqa0yAkF9k7nITie7jLcaHQ9k4dN
         O+q8rwPA3WEZIKNWVZQRfxvK70txhCAtqiZC53bz4r7F+Y2aPvyaOVME8redULbaCLvp
         624Q==
X-Gm-Message-State: AAQBX9d/xj1ml62c0EcWu+bxttdHMywDWVPS4Cd4f046M36sOieGZeRC
        /etm1bSGmPWNjciA5Qvg/sblx6gHQdA/9Ye4xkG9qQ==
X-Google-Smtp-Source: AKy350a4DeFNtiT0puMpHPQRz//ZqQ7b+CicsE7u8pb1b0QPYo1NzBe7x2L2DYaneQRuVTtUr1bNCZzzLBDtrXjhewY=
X-Received: by 2002:a05:6a00:2da5:b0:624:c7cc:3d0e with SMTP id
 fb37-20020a056a002da500b00624c7cc3d0emr12953815pfb.6.1680222901270; Thu, 30
 Mar 2023 17:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230330224348.1006691-1-davidai@google.com> <ZCYZRIbPh+f3v26v@linux.dev>
 <CAGETcx_P27-=wkAkCETTR2Q0edA01M5jArS_t-zZFn61YM9Muw@mail.gmail.com> <ZCYd7kH2f/Ku8b0D@linux.dev>
In-Reply-To: <ZCYd7kH2f/Ku8b0D@linux.dev>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Mar 2023 17:34:24 -0700
Message-ID: <CAGETcx9CHZCpUsAaEdJGmBFuwJzdp+Mr81=4JQdG0zVy42AZDw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Improve VM DVFS and task placement behavior
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     David Dai <davidai@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        kernel-team@android.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 30, 2023 at 4:40=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Thu, Mar 30, 2023 at 04:36:52PM -0700, Saravana Kannan wrote:
> > On Thu, Mar 30, 2023 at 4:20=E2=80=AFPM Oliver Upton <oliver.upton@linu=
x.dev> wrote:
> > >
> > > On Thu, Mar 30, 2023 at 03:43:35PM -0700, David Dai wrote:
> > >
> > > [...]
> > >
> > > > David Dai (6):
> > > >   sched/fair: Add util_guest for tasks
> > > >   kvm: arm64: Add support for get_cur_cpufreq service
> > > >   kvm: arm64: Add support for util_hint service
> > > >   kvm: arm64: Add support for get_freqtbl service
> > > >   dt-bindings: cpufreq: add bindings for virtual kvm cpufreq
> > > >   cpufreq: add kvm-cpufreq driver
> > >
> > > I only received patches 2-4 in my inbox (same goes for the mailing li=
sts
> > > AFAICT). Mind sending the rest? :)
> >
> > Oliver,
> >
> > Sorry about that. Actually even I'm not cc'ed in the cover letter :)
> >
> > Is it okay if we fix this when we send the next version? Mainly to
> > avoid some people responding to this vs other responding to a new
> > series (where the patches are the same).
>
> Fine by me, as long as the full series arrived somewhere.
>
> > We used a script for --to-cmd and --cc-cmd but looks like it needs
> > some more fixes.
> >
> > Here is the full series to anyone who's wondering where the rest of
> > the patches are:
> > https://lore.kernel.org/lkml/20230330224348.1006691-1-davidai@google.co=
m/T/#t
>
> Gah, a bit of noodling would've dug up the full series. Thanks for the
> link.

Actually, we'll send out a new RFC v2 series with the To's and Cc's
fixed with some minor cover letter fixes. So everyone can ignore this
series and just wait for the RFC v2 series later today.


-Saravana
