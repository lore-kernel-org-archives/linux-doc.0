Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DBCC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 12 Oct 2022 10:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJLK1Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Oct 2022 06:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbiJLK1O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Oct 2022 06:27:14 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340AEA98E6
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 03:27:11 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d14so8524668ilf.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Oct 2022 03:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shTcUn+n1p0185zAEEXZOoSragvF0HFP50MphSo5i4k=;
        b=ZK9hn3Qb7RasSELRDq4Yja3nVTmKVO+GukyreCnt9jTt7rP8o+BYSTE1hFW3IAdcFp
         jyTpTHfOZhN7H59OuG6UtdVXDbFCJENT8ZC0o/NdVsRayb3GuCvhAjAuTpmVSasvrFlz
         K4wI5mKCN8ZeBTK6vHXrB4SvXwx9pB5EWW276TBAFAZnQtCR/qYEiwumBxCxKRcUuhFX
         aqA8BebXPbA2GBETHGnkeq8ispyshxwPpMdlyHHus8x7591ekroZ2VjBYOybq90pbDoT
         X3AMXKPXwGrXuAOM4YyoMCwRM/H07Y/wcLb6QhU8jD5+/dnSs30Y/BGKRs2UVWN4HF8b
         PehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shTcUn+n1p0185zAEEXZOoSragvF0HFP50MphSo5i4k=;
        b=0ptYTjAPTnmh4Tcc8GwxNLd3bVrMN9367L3/m6gYQPTqzQwvCMMJ7zmt9XVQwKwlse
         3dTiX/C6+zas/uPJmH7Q1y3aQlAfjxwDCMZ6sEA6BG3Vg3Ttksre6PsjPElyVEgYd8jt
         VL6E0s/f4ms9uc/G+gHnXOgagToc6VEcAxS+JPE/NsXBIxHhV7HKUkQDW/bohy51xj5Q
         y2oPtq2Zt/t+MlRLcWFYnvqdEIK+JIgkt6fp5Ee8tF+es2tQNHiIaIxTMvGHvFXFrup2
         YUUSmYJPw7dUR5O3nK8aM8yBtbgIeSoJyDx80YKoAPw8APcm/0ScdihCX7/5RaP8YKDM
         PZ8g==
X-Gm-Message-State: ACrzQf1JhlgJ2UaxWrPc9x1gpyiFiH4bc5OPRrZJcZm2z/u28ghqVSNA
        ygX6jljaBROAq6OKyYR3VcXzXynPH42zhxfLukj9rA==
X-Google-Smtp-Source: AMsMyM7BwPBD6hdK6B9XcK+ymTF35t0F2yQhLBU426HoY0Bx0P53nbsRE2YauMdphAHZ/GaEVJaoQX0qhQaCKiqnd6g=
X-Received: by 2002:a05:6e02:1aaa:b0:2fa:542c:7538 with SMTP id
 l10-20020a056e021aaa00b002fa542c7538mr14463522ilv.260.1665570430616; Wed, 12
 Oct 2022 03:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220902101217.1419-1-cuiyunhui@bytedance.com> <a16957b9-9247-55f6-eb5e-f9f1c2de7580@iogearbox.net>
In-Reply-To: <a16957b9-9247-55f6-eb5e-f9f1c2de7580@iogearbox.net>
From:   =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date:   Wed, 12 Oct 2022 18:26:59 +0800
Message-ID: <CAEEQ3wmJuaK2jw3cCKr2qoXb2Kj9qBC3=YhqEBrk0o7nx1kJKg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] bpf: added the account of BPF running time
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     corbet@lwn.net, ast@kernel.org, andrii@kernel.org,
        martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
        haoluo@google.com, jolsa@kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, david@redhat.com,
        mail@christoph.anton.mitterer.name, ccross@google.com,
        vincent.whitchurch@axis.com, paul.gortmaker@windriver.com,
        peterz@infradead.org, edumazet@google.com, joshdon@google.com,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Daniel Borkmann <daniel@iogearbox.net> =E4=BA=8E2022=E5=B9=B49=E6=9C=882=E6=
=97=A5=E5=91=A8=E4=BA=94 23:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On 9/2/22 12:12 PM, Yunhui Cui wrote:
> [...]
> > index a5f21dc3c432..9cb072f9e32b 100644
> > --- a/include/linux/filter.h
> > +++ b/include/linux/filter.h
> > @@ -565,6 +565,12 @@ struct sk_filter {
> >       struct bpf_prog *prog;
> >   };
> >

> >               ret =3D dfunc(ctx, prog->insnsi, prog->bpf_func);
> >               stats =3D this_cpu_ptr(prog->stats);
> > @@ -593,6 +601,11 @@ static __always_inline u32 __bpf_prog_run(const st=
ruct bpf_prog *prog,
> >       } else {
> >               ret =3D dfunc(ctx, prog->insnsi, prog->bpf_func);
> >       }
> > +     bact =3D this_cpu_ptr(&bpftime);
> > +     flags =3D u64_stats_update_begin_irqsave(&bact->syncp);
> > +     u64_stats_add(&bact->nsecs, sched_clock() - start);
> > +     u64_stats_update_end_irqrestore(&bact->syncp, flags);
> > +
> >       return ret;
>
> The overhead this adds unconditionally is no-go. Have you tried using/imp=
roving:

The commit 47c09d6a9f6794caface4ad50930460b82d7c670 can not meet
the requirement of being able to visually see the cumulative running
time of progs on each cpu.

About the overhead, how about moving the above code to
if(static_branch_unlikely(&bpf_stats_enabled_key)) {}
branch, like prog->stats processing ?

Yunhui
