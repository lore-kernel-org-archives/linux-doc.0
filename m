Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F26C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 18:28:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7FE4610A8
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 18:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239149AbhJFSah (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 14:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239090AbhJFSah (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 14:30:37 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA29C061755
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 11:28:44 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id h2so7455395ybi.13
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0n7XTaYuNuU3GQROpWlHveon37tQGGRs8ekBzlKCoOE=;
        b=J6lI24iVpCdHoWTtNM7a/8ZwFedTCp/QYd7FALh8Tpc0VTNH/H/a/A6zY/gO4qGFL5
         HiApsBuVnVxYyelJMV5w4M+PnZ6pKWEzylR/zFMx7qxiTGvyfr8sdCpE/Hv4O59NCf7J
         PFL/3b+ZlF7hsCL35SoZvUe1X//m/4EWglNIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0n7XTaYuNuU3GQROpWlHveon37tQGGRs8ekBzlKCoOE=;
        b=NR2Ix3clSPdGDaQdIPbGZAkvKGIwA+uD5TZqeLqZTtvRr8BGdlcACss5+6BJpA2zES
         pRBn2lrIyUmFwt7DJRoq6fSQyXy9as2Lv7P1yKzoiKj8X7KuIBZNTaApJbXHJjRTrJ02
         CsLwvJXsKpYEdc6qfdvVRp5h0zLljuJZrw5rsrfYobxvvy74mldHypBbHolbf6fKpAhi
         2iu34B99Hz7EN9h3FNoRrMX5h2Rj1at7nX8ETgUgHcggDWje6qfI9KCFLH9fJbQ+qGN5
         45g8JWAwoSOFhUV6Z/zGEpKarXmVFMULuAMSWp59y9B2fWoS7WyuMNSNBImcEL2SpkPa
         gF8g==
X-Gm-Message-State: AOAM533UCjMC/exnwkpMh3sHgmg3Di4Y1fNq7A/NbC+g7hurWpqz/3JI
        UuiktH7M1ZVlNUVzTSJNsuWM+mhaC6pdDkKeudr4
X-Google-Smtp-Source: ABdhPJy4ghJUXe860sK/73CDH7bq+Ep1/YOkYbT2u0s7Dyc2ylF3jCsuAhbF7KTPSGqFvXAumb8QRRuDBQVZ+tVWJMo=
X-Received: by 2002:a25:d47:: with SMTP id 68mr31232340ybn.204.1633544923738;
 Wed, 06 Oct 2021 11:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210910192757.2309100-1-atish.patra@wdc.com> <20211005121744.728385be@redslave.neermore.group>
In-Reply-To: <20211005121744.728385be@redslave.neermore.group>
From:   Atish Patra <atishp@atishpatra.org>
Date:   Wed, 6 Oct 2021 11:28:32 -0700
Message-ID: <CAOnJCU+0=9FG+cUT0V16TEN_ar7d9F+Me_nkQtK+5mKrFFZOqg@mail.gmail.com>
Subject: Re: [v3 00/10] Improve RISC-V Perf support using SBI PMU and sscofpmf extension
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Atish Patra <atish.patra@wdc.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anup Patel <anup.patel@wdc.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Jiri Olsa <jolsa@redhat.com>,
        John Garry <john.garry@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-perf-users@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Chen <vincent.chen@sifive.com>,
        Anish Khurana <akhurana@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 5, 2021 at 2:18 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Fri, 10 Sep 2021 12:27:47 -0700
> Atish Patra <atish.patra@wdc.com> wrote:
>
> Hello Atish,
>
> > Perf stat:
> > =========
> >
> > [root@fedora-riscv riscv]# perf stat -e r8000000000000005 -e
> > r8000000000000007 -e r8000000000000006 -e r0000000000020002 -e
> > r0000000000020004 -e branch-misses -e cache-misses -e
> > dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -e cycles
> > -e instructions ./hackbench -pipe 15 process Running with 15*40 (==
> > 600) tasks. Time: 6.578
> >
> >  Performance counter stats for './hackbench -pipe 15 process':
> >
> >              6,491      r8000000000000005      (52.59%) -->
> > SBI_PMU_FW_SET_TIMER 20,433      r8000000000000007      (60.74%) -->
> > SBI_PMU_FW_IPI_RECVD 21,271      r8000000000000006      (68.71%) -->
> > SBI_PMU_FW_IPI_SENT 0      r0000000000020002      (76.55%)
> >      <not counted>      r0000000000020004      (0.00%)
> >      <not counted>      branch-misses          (0.00%)
> >      <not counted>      cache-misses           (0.00%)
> >         57,537,853      dTLB-load-misses       (9.49%)
> >          2,821,147      dTLB-store-misses      (18.64%)
> >         52,928,130      iTLB-load-misses       (27.53%)
> >     89,521,791,110      cycles                 (36.08%)
> >     90,678,132,464      instructions #    1.01  insn per cycle
> > (44.44%)
> >
> >        6.975908032 seconds time elapsed
> >
> >        3.130950000 seconds user
> >       24.353310000 seconds sys
> >
>
> Tested your patch series with qemu and got results as expected:
>
> perf stat -e r8000000000000005 -e r8000000000000007 \
> -e r8000000000000006 -e r0000000000020002 -e r0000000000020004 -e
> branch-misses \ -e cache-misses -e dTLB-load-misses -e
> dTLB-store-misses -e iTLB-load-misses \ -e cycles -e instructions
> ./hackbench -pipe 15 process
>
> Running with 15*40 (== 600) tasks.nch -pipe 15 process
> Time: 20.027
>
>  Performance counter stats for './hackbench -pipe 15 process':
>
>               4896      r8000000000000005
>                             (53.34%) 0      r8000000000000007
>                                                 (61.20%) 0
>               r8000000000000006
>                   (68.88%) 0      r0000000000020002
>                                       (76.53%) <not counted>
>               r0000000000020004
>                   (0.00%) <not counted>      branch-misses
>                                                  (0.00%) <not counted>
>                   cache-misses
>                       (0.00%) 48414917      dTLB-load-misses
>                                                 (9.87%) 2427413
>               dTLB-store-misses
>                   (19.43%) 46958092      iTLB-load-misses
>                                              (28.58%) 69245163600
>               cycles
>                   (37.09%) 70334279943      instructions              #
>                  1.02  insn per cycle           (45.24%)
>
>       20.895871900 seconds time elapsed
>
>        2.724942000 seconds user
>       18.126277000 seconds sys
>
> perf top/record also works.
>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>
>

Thanks for the testing.

> Yours,
> Nikita Shubin
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish
