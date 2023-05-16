Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDDBC7EE22
	for <linux-doc@archiver.kernel.org>; Tue, 16 May 2023 01:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjEPBrS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 May 2023 21:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjEPBrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 21:47:16 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56A6269D
        for <linux-doc@vger.kernel.org>; Mon, 15 May 2023 18:47:14 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-39462726590so2981352b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 15 May 2023 18:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1684201634; x=1686793634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vQMONc5SJDyCvN7VZRBXzuqqiXsyACiKWFthRnNjkI=;
        b=MJ1jp2jKeZlhrFpiyXssgMah5dc3o5krDLHVOiR0AZia+Lqn9dfT8qtVIhmqCho2vT
         T9iDlq+DyxbBb1aq+P3T6wmlnrWFRFWOpOjwZp1Y7YeUYij0dg75hbzXn3CO1JkcVB5q
         7fdN24YuXgRYmhULBdSi259hdYNiLt1vMbNOoP6AEl9aALNw4Enu7jKfFON70Ho/NBrP
         sJkWBFC9JsM4h6jA9Q000f74LWzz6PuMElq1uuaitTsoyM6xkweI+nsgeU4OnzW0nOk0
         v3p9WGCmpuBNSTbwuk6Z0PceQtzR0fFkr7RvqdGEGclm2H+BKrBAWcKhpeA16UUVSoiJ
         Yp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684201634; x=1686793634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vQMONc5SJDyCvN7VZRBXzuqqiXsyACiKWFthRnNjkI=;
        b=PL8lfoeciwPJOdlzOEzdV7R5+152yrWsFu7CU0pXG5nlIOIyhMib/Ba4XDF4iWOdll
         LHpvz1xnh+HZROQeoCiKopNyPu4fnuVkpQqb46QlIT6H5oaaZ7nAee3N/jRUt06GxPRU
         jMHq0hmmxj8mHvN0TgE+chQuHOjnokKi1rldyhyG5qNZD6GpKBySY67ipqFBD3KktJsN
         cvOsNB0/ZBUVuU4FZC4GLqI9nBSZjmXp/XmeYDRgQTiT/BBeTgbU8hV2EKRqVmqHOEax
         P1D6KEk+FHFsojODIl0cBlwSXegWFkMCkpYC2Iefjh23fCnifjiF7wnpedIS4bVDTldf
         gwVw==
X-Gm-Message-State: AC+VfDw3mwSWgQf+M5c/FFttirY9flqOr8IzzvF67g475VRojdYnRcuk
        bNKY6BHvrL24cVrAYM9g0JUGE7MJiaNKTA+ZTQtn7w==
X-Google-Smtp-Source: ACHHUZ7niwSe+XVzisHsadeHDBRjQ1d1V4QqTLQeyQjsBlq+b+NyhnKZFwY3Q8zeutdPuzTiykiwl74B2MiAm0eSRD8=
X-Received: by 2002:a05:6808:1a04:b0:395:df63:63af with SMTP id
 bk4-20020a0568081a0400b00395df6363afmr5860001oib.54.1684201634118; Mon, 15
 May 2023 18:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230515025716.316888-1-vineeth@bitbyteword.org>
 <20230515025716.316888-3-vineeth@bitbyteword.org> <20230515100616.33ba5dd9@luca64>
In-Reply-To: <20230515100616.33ba5dd9@luca64>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Mon, 15 May 2023 21:47:03 -0400
Message-ID: <CAO7JXPgq8V5yHM6F2+iXf4XJ9cyT30Hn4ot5b2k7srjsaPc3JQ@mail.gmail.com>
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

On Mon, May 15, 2023 at 4:06=E2=80=AFAM luca abeni <luca.abeni@santannapisa=
.it> wrote:

>
> this patch is giving me some headaches:
>
Sorry about that.. I was also stressing out on how to get the
reclaiming done right for the past couple of days ;-)

> Vineeth Pillai <vineeth@bitbyteword.org> wrote:
> [...]
> >   *   Uextra:         Extra bandwidth not reserved:
> > - *                   =3D Umax - \Sum(u_i / #cpus in the root domain)
> > + *                   =3D Umax - this_bw
>
> While I agree that this setting should be OK, it ends up with
>         dq =3D -Uact / Umax * dt
> which I remember I originally tried, and gave some issues
> (I do not remember the details, but I think if you try N
> identical reclaiming tasks, with N > M, the reclaimed time
> is not distributed equally among them?)
>
I have noticed this behaviour where the reclaimed time is not equally
distributed when we have more tasks than available processors. But it
depended on where the task was scheduled. Within the same cpu, the
distribution seemed to be proportional. But the tasks migrated often
and then depending on whether the task got a whole cpu for its
runtime or not, the reclaimed bandwidth differed. I thought that
should be okay as it depended upon where the task landed.

One other problem I saw was cpu usage spiking above max_bw leading to
system hang sometimes. I thought stopping reclaiming when running_bw
gets larger than max_bw(in 4th patch) fixed this, but when I ran the
tests long enough, I did see this hang.

> I need to think a little bit more about this...
>
Thanks for looking into this.. I have a basic idea why tasks with less
bandwidth reclaim less in SMP when number of tasks is less than number
of cpus, but do not yet have a verifiable fix for it.

If patches 1 and 4 looks good to you, we shall drop 2 and 3 and fix the
SMP issue with varying bandwidth separately.. Patch 4 would differ a
bit when I remove 2 and 3 so as to use the formula:
 "dq =3D -(max{u, (Umax_reclaim - Uinact - Uextra)} / Umax_reclaim) dt"

Thanks for your patience with all these brainstorming:-)

Thanks,
Vineeth
