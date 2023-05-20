Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EF9C77B7F
	for <linux-doc@archiver.kernel.org>; Sat, 20 May 2023 02:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjETCPt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 May 2023 22:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjETCPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 May 2023 22:15:48 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCA419F
        for <linux-doc@vger.kernel.org>; Fri, 19 May 2023 19:15:47 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6a984993740so1655838a34.2
        for <linux-doc@vger.kernel.org>; Fri, 19 May 2023 19:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1684548946; x=1687140946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hH5unmO3GFmsUg75pelwY21ojkJR1YNK+0uGubfBKOw=;
        b=IKrEDTDE402UXlcXsvfs641Gzd5bKYLb0KluKsbHQZ1tHN2/2TloIIQ/cjyjbc+rra
         p2nESYtNN8KbBUJd0codjlQwrP7HWYS2nHHx9kBkvD0U54oIK85s1O3h5YiKFFg8aAAe
         JZoeOBbr3/axiR+LX8Rq6W3pv/Bset9Bmvtm4lxm4F8n7Wx1Bt1nA0vrJbdUopER9iFx
         /ylq8Titt3kyTPa8BPdpbKXLvb9ycUoMayRRsf+RKtb6jJNIOwU+4wl7WyVyDRWH0PhG
         dRJlSP7DWxWAF8kbGSDrdzidWrTPXd9cPm4fkSW4ij0Wb5AfMMB0rzP9WIrv6E1CLIVO
         u1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684548946; x=1687140946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hH5unmO3GFmsUg75pelwY21ojkJR1YNK+0uGubfBKOw=;
        b=epMF15UUooogmkGnvhyXv3FheYrmaiIC0/OErEL12EN88K0kxZKnwisOGvhgCKvEqW
         O1kxpmJfWTR4IFR3XDUyV9T4h/avppFtBrEfvNQ+C2XA1y9L4QCOiU2SDmhR8jofBE1k
         wWyEKIIfX2Gbs/9HyuELVjSjgkvKulvuMes5rPgk4cLaOQiSURCLZR6CoM9t11igp+Pv
         LQJS4m918veLi6cr0aHUiU9O7LbLRRHXThlkSCSpUSfqwQKXB0Ugf7KaUJ1gnd6zKukR
         tCmVC72e23Lx6Y6C8HKtwSlVH0AMnhN8bQwa1jZkmL3F3V2wwRxj3c90QJXtlRj5qvTR
         d3Nw==
X-Gm-Message-State: AC+VfDwq/f2IZAnqYw0/7iCrdW05g8e57if31ihHy8Bs850XmmK6jaP/
        Tv+Y/WKwB/B6n+Utuee5wh3Gjbr0h112LB3RSlGa4t3eIz62BwCwSX8=
X-Google-Smtp-Source: ACHHUZ7wQMr6++cyBnh9uZ9I9O0vaxQ/yipAqh+mvSdeWYcUYEE8UJRhZw5u82kgeZdsCkozN/HP2Q8s6WwdZnB3u70=
X-Received: by 2002:a05:6830:1bcc:b0:6a5:f147:5255 with SMTP id
 v12-20020a0568301bcc00b006a5f1475255mr2264359ota.6.1684548946373; Fri, 19 May
 2023 19:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230515025716.316888-1-vineeth@bitbyteword.org>
 <20230515025716.316888-3-vineeth@bitbyteword.org> <f5801f5b-6ee8-6b84-b6bb-46e89b165091@arm.com>
In-Reply-To: <f5801f5b-6ee8-6b84-b6bb-46e89b165091@arm.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Fri, 19 May 2023 22:15:35 -0400
Message-ID: <CAO7JXPhVcFJ2+8dpw8Ns4xVr622G8puqdcbSjy23THpahJTmUA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] sched/deadline: Fix reclaim inaccuracy with SMP
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, youssefesmat@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dietmar,

On Fri, May 19, 2023 at 1:56=E2=80=AFPM Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:

> > TID[730]: RECLAIM=3D1, (r=3D8ms, d=3D10ms, p=3D10ms), Util: 95.05
> > TID[731]: RECLAIM=3D1, (r=3D1ms, d=3D10ms, p=3D10ms), Util: 31.34
> > TID[732]: RECLAIM=3D1, (r=3D1ms, d=3D100ms, p=3D100ms), Util: 3.16
>
> What does this 'Util: X' value stand for? I assume it's the utilization
> of the task? How do you obtain it?
>
Yes, it is the utilization of the task. I calculate it by dividing the
cputime with elapsed time(using clock_gettime(2)).

> I see that e.g. TID[731] should run 1ms each 10ms w/o grub and with grub
> the runtime could be potentially longer since 'scaled_delta_exec < delta'=
.
>
Yes correct. GRUB(Greedy Reclamation of Unused Bandwidth) algorithm
is used here for deadline tasks that needs to run longer than their
runtime when needed. sched_setattr allows a flag SCHED_FLAG_RECLAIM
to indicate that the task would like to reclaim unused bandwidth of a
cpu if available. For those tasks, 'runtime' is depreciated using the
GRUB formula and it allows it to run for longer and reclaim the free
bandwidth of the cpu. The GRUB implementation in linux allows a task
to reclaim upto RT capacity(95%) and depends on the free bandwidth
of the cpu. So TID[731] theoretically should run for 95ms as it is
the only task in the cpu, but it doesn't get to run that long.

> I don't get this comment in update_curr_dl():
>
> 1325    /*
> 1326     * For tasks that participate in GRUB, we implement GRUB-PA: the
> 1327     * spare reclaimed bandwidth is used to clock down frequency.
> 1328     *
>
> It looks like dl_se->runtime is affected and with 'scaled_delta_exec <
> delta' the task runs longer than dl_se->dl_runtime?
>
Yes. As mentioned above, GRUB allows the task to run longer by slowing
down the depreciation of "dl_se->dl_runtime". scaled_delta_exec is
calculated by the GRUB formula explained in the paper [1] & [2].

> I did the test discussed later in this thread with:
>
> 3 [3/100] tasks (dl_se->dl_bw =3D (3 << 20)/100 =3D 31457) on 3 CPUs
>
> factor =3D scaled_delta_exec/delta
>
> - existing grub
>
> rq->dl.bw_ratio =3D ( 100 << 8 ) / 95 =3D 269
> rq->dl.extra_bw =3D ( 95 << 20 ) / 100 =3D 996147
>
> cpu=3D2 curr->[thread0-2 1715] delta=3D2140100 this_bw=3D31457
> running_bw=3D31457 extra_bw=3D894788 u_inact=3D0 u_act_min=3D33054 u_act=
=3D153788
> scaled_delta_exec=3D313874 factor=3D0.14
>
> - your solution patch [1-2]
>
> cpu=3D2 curr->[thread0-0 1676] delta=3D157020 running_bw=3D31457 max_bw=
=3D996147
> res=3D4958 factor=3D0.03
>
> You say that GRUB calculation is inaccurate and that this inaccuracy
> gets larger as the bandwidth of tasks becomes smaller.
>
> Could you explain this inaccuracy on this example?
>
According to GRUB, we should be able to reclaim the unused bandwidth
for the running task upto RT limits(95%). In this example we have a
task with 3ms runtime and 100ms runtime on a cpu. So it is supposed
to run for 95ms before it is throttled.
Existing implementation's factor =3D 0.14 and 3ms is depreciated by
this factor. So it gets to run for "3 / 0.14 ~=3D 22ms". This is the
inaccuracy that the patch is trying to solve. With the patch, the
factor is .03166 and runtime =3D "3 / 0.03166 ~=3D 95ms"

Hope this clarifies.

Thanks,
Vineeth

[1]: Abeni, Luca & Lipari, Giuseppe & Parri, Andrea & Sun, Youcheng.
     (2015). Parallel and sequential reclaiming in multicore
     real-time global scheduling.

[2]: G. Lipari and S. Baruah, "Greedy reclamation of unused bandwidth
     in constant-bandwidth servers," Proceedings 12th Euromicro
     Conference on Real-Time Systems. Euromicro RTS 2000, Stockholm,
     Sweden, 2000, pp. 193-200, doi: 10.1109/EMRTS.2000.854007.
