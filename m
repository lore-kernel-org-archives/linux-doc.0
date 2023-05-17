Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70D3C77B7A
	for <linux-doc@archiver.kernel.org>; Wed, 17 May 2023 02:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbjEQCRZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 May 2023 22:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbjEQCRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 May 2023 22:17:24 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6815CE4E
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 19:17:23 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ab174bb726so159542a34.1
        for <linux-doc@vger.kernel.org>; Tue, 16 May 2023 19:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1684289842; x=1686881842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg/iSy/nvkPTXRIMKkgFpn6nfdytrQLA5s0+0oJiqtQ=;
        b=WQmO1erorAqp4OY2y0UFSiIyYYMezfvLzuwU09QHo0/wfSmJpxk+apgEhA++kvH1Oe
         V21nfQ3pKpx8nnbkI4HoxD+erL79wFfSCu7NjZZnmKo65pKeYzfP3hEfK+CGvzRhHESR
         0GYZ+hSZxwtoJL3XykptS+f3MGx50RtejAo81v8DzZVNUPk72xOZLY5++sdd0RIr9TXb
         kNzZpPIaQqlATc4/+k/XjKq88bpLW7F/09t4Rmpxblrd/r1n3Pld/5v/SiDXMgWmXWF8
         mv2UIECsP9NI6WzaLWnjCozbQaAbbE2BixLWGLq2BnKZiEz0plWFRTs3iGx3CJbpVTMp
         GsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684289842; x=1686881842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jg/iSy/nvkPTXRIMKkgFpn6nfdytrQLA5s0+0oJiqtQ=;
        b=Lfos8V5BOwZRV43kykJn3UY97Uafa6V2Zf253ELITMMlS2yY6TKsHI0dKGssic7YXG
         WnNPDQilf6tnotvHDxeHikv372mFPdoGG9NgYzeMyDamTYnqhcFinJ8eRQH2gYFffyEA
         zcCP/WrNoWJ6w32UUxrynp+ImdxE2b2z9rzZBiq9Pahx39z3Idc1eiKmwdxNU7hI/qZ2
         B5FOy1WqAJqtHuMpNRx9lI+GAuMtEekWZOYXobCxIZvJ8qSzebq0Qp9foTj2mc5Lvu5v
         BqtXxbmfVfdK1USZdQ3kPCDqvLUunBvHNfFZJq6R1zrn/WtEypISqG2QPyupcadjPBpR
         UUKQ==
X-Gm-Message-State: AC+VfDxUgeDmOJd2mrDhi9MSnjmBQYtLKw1r9fNRccYAc4tlrazEtmUD
        /6Tz4flvxMA9llko6AjsBx9bH5TikpOboHK9+3+7Mw==
X-Google-Smtp-Source: ACHHUZ6V+DuFmwFCSct6No1tadnX2CtFjc1H/zPrUuXhC8QzRTOLP/3lSU66HnRHFtS2mWvjITr0obl2eoA4yRKALy4=
X-Received: by 2002:a05:6830:1654:b0:6ad:da5d:5357 with SMTP id
 h20-20020a056830165400b006adda5d5357mr3708589otr.38.1684289842664; Tue, 16
 May 2023 19:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230515025716.316888-1-vineeth@bitbyteword.org>
 <20230515025716.316888-3-vineeth@bitbyteword.org> <20230515100616.33ba5dd9@luca64>
 <CAO7JXPgq8V5yHM6F2+iXf4XJ9cyT30Hn4ot5b2k7srjsaPc3JQ@mail.gmail.com>
 <20230516093729.0771938c@luca64> <CAO7JXPh5uLV4QjAEi6bJXfAGSsZ=XsnCyzrvKS8m35BGbRPYJw@mail.gmail.com>
 <20230516181928.1991acbd@nowhere>
In-Reply-To: <20230516181928.1991acbd@nowhere>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Tue, 16 May 2023 22:17:11 -0400
Message-ID: <CAO7JXPhHFdgjHsvh0VJNNcV+ax60_3-h=5kVKi2W1TRMvxu+2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] sched/deadline: Fix reclaim inaccuracy with SMP
To:     luca abeni <luca.abeni@santannapisa.it>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Luca,

On Tue, May 16, 2023 at 12:19=E2=80=AFPM luca abeni <luca.abeni@santannapis=
a.it> wrote:
>
> > I was thinking it should probably
> > be okay for tasks to reclaim differently based on what free bw is
> > left on the cpu it is running. For eg: if cpu 1 has two tasks of bw
> > .3 each, each task can reclaim "(.95 - .6) / 2" and another cpu with
> > only one task(.3 bandwidth) reclaims (.95 - .3). So both cpus
> > utilization is .95 and tasks reclaim what is available on the cpu.
>
> I suspect (but I am not sure) this only works if tasks do not migrate.
>
From what I am seeing, if the reserved bandwidth of all tasks on a cpu
is less than Umax, then this works. Even with migration, if the task
lands on another cpu where the new running_bw < Umax, then it runs and
reclaims the free bandwidth. But this breaks if running_bw > Umax and
it can happen if total_bw is within limits, but a cpu is overloaded.
For eg: four tasks with reservation (7, 10) on a three cpu system.
Here two cpus will have running_bw =3D .7 but third cpu will be 1.4
even though total_bw =3D 2.80 which is less than the limit of 2.85.

>
> > With "1 - Uinact", where Uinact accounts for a portion of global free
> > bandwidth, tasks reclaim proportionately to the global free bandwidth
> > and this causes tasks with lesser bandwidth to reclaim lesser when
> > compared to higher bandwidth tasks even if they don't share the cpu.
> > This is what I was seeing in practice.
>
> Just to be sure: is this with the "original" Uextra setting, or with
> your new "Uextra =3D Umax - this_bw" setting?
> (I am not sure, but I suspect that "1 - Uinact - Uextra" with your new
> definition of Uextra should work well...)
>
I am seeing this with original Uextra setting where the global bandwidth
is accounted. With "Uextra =3D Umax - this_bw", reclaiming seems to be
correct and I think it is because it considers local bandwidth only.

> > With dq =3D -(max{u_i, (Umax - Uinact - Uextra)} / Umax) * dt (1)
> > TID[636]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 95.08
> > TID[635]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 95.07
> > TID[637]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 95.06
> >
> > With dq =3D -(max{u_i, (1 - Uinact - Uextra)} / Umax) * dt (2)
> > TID[601]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 35.65
> > TID[600]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 35.65
> > TID[602]: RECLAIM=3D1, (r=3D3ms, d=3D100ms, p=3D100ms), Util: 35.65
>
> Maybe I am missing something and I am misunderstanding the situation,
> but my impression was that this is the effect of setting
>         Umax - \Sum(u_i / #cpus in the root domain)
> I was hoping that with your new Umax setting this problem could be
> fixed... I am going to double-check my reasoning.
>
Even with the Umax_reclaim changes, equation (1) is the one which
reclaims upto 95% when number of tasks is less than the number of
cpus. With more tasks than cpus, eq (1) still reclaims more than
eq (2) and cpu utilization caps at 95%. I also need to dig more to
understand the reason behind this.

Thanks for looking into this, I will also study more on this and
keep you posted..

Thanks,
Vineeth
