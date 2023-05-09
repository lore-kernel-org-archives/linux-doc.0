Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA570C77B75
	for <linux-doc@archiver.kernel.org>; Tue,  9 May 2023 19:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjEIT3f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 May 2023 15:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjEIT3e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 15:29:34 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01D6E52
        for <linux-doc@vger.kernel.org>; Tue,  9 May 2023 12:29:32 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-19615d6ef9eso1895192fac.0
        for <linux-doc@vger.kernel.org>; Tue, 09 May 2023 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1683660572; x=1686252572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nshW081Je0Ct1TPDyiEBPFzb8ygIPnS0SW9brrMdekw=;
        b=SYVk9dCiNpWbU5xm3mawedT7+nrWY0hZ4g0Ajqlhu0IY4UOUL8Wv1LFavtxCvkIEY5
         txdWCaBrKHVEdH9jH28dSxzADU7fefFg9W9XSS+zOn/nkOrjKViMhl4Bu46HY4CboTBa
         346FkasT5QERCvME/+vBrUBwYjNAAp4hkM51HLT7fL3mqrJBKuJMKaH8PnaJKuE+/Ik/
         daYZcNcetgbJ2wxVH3QwkE37Q3YI/9S0ns5/6JY6owwi1umOm8UvsVPapCqeXm9l4p4o
         cu9zdbs75tO6oIcnC9XOT0pnYDT7eAmEHXvUvDSuSJZzliuXXJX/y8QF5mOtPuHMpWp3
         xbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683660572; x=1686252572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nshW081Je0Ct1TPDyiEBPFzb8ygIPnS0SW9brrMdekw=;
        b=CB3J/qdas9zPOG2sYdCH/pCawjqLBlcc5k1M8/WAF7CmaF4tVEmQwPe5qKC5YBeW3C
         1lzk1B5ZBRxvgJZkV1tXy5L+HgfOlS6c2zmHK2S3DZpfSy+qN2RbmlSKYHREIIzRJb1v
         rDDBwLkGgy9ntMHBOSq06vMRG/3bqqHjl/ssgTeWQwbMjrTXkYMmb/sjrCdCmLKfLynb
         qAuwHcTiXoo361I9tWO0eaYdB55p5BS674hWk5T0r+VasHx4tvKKYS9psGGsrZaa6raD
         Lq4Nz1k/RECBSDEnV7smCAfCePmjQse2amVsZ50cqeUnwBk6Cw7hUOpsICGsBJixQFyY
         Wu8w==
X-Gm-Message-State: AC+VfDwumlAGJxRFBodcLFO0YixnSt3zvXf4D4638hCULgxlhHwZd3GI
        ilFhfQWvTZIXcAk8miPmtdo96nVNw2BbqCGq/J5bHA==
X-Google-Smtp-Source: ACHHUZ4ttVO3Kjk4VenwZACti+SYmo33rOMANrlfvXvsQMH2mfyKDcS+h8h/fB6FhOlKkjQGCrfo/62tBByoJMT8n+E=
X-Received: by 2002:a05:6870:93d3:b0:183:fc80:7354 with SMTP id
 c19-20020a05687093d300b00183fc807354mr5723936oal.21.1683660572023; Tue, 09
 May 2023 12:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230508160829.2756405-1-vineeth@bitbyteword.org> <20230509132534.09098acc@luca64>
In-Reply-To: <20230509132534.09098acc@luca64>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Tue, 9 May 2023 15:29:21 -0400
Message-ID: <CAO7JXPhrqKWfsp860rRmEenxARi8U2gNMGsOn4m+aKporWwBcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/deadline: accurate reclaim bandwidth for GRUB
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

Hi Luka,

Thanks for reviewing the changes.

On Tue, May 9, 2023 at 7:25=E2=80=AFAM luca abeni <luca.abeni@santannapisa.=
it> wrote:
>
> Hi,
>
> if I understand well, your patch addresses 2 separate issues:
> 1) The current reclaiming code uses an approximation to avoid using
>    div64_u64(), which might introduce too much overhead (at least, as
>    far as I remember :). Your patch changes it to use the exact,
>    non-approximated, equation
> 2) Currently, the reclaimable CPU time is divided as if all the
>    SCHED_DEADLINE tasks (and not only the SCHED_FLAG_RECLAIM tasks)
>    could use it; your patch changes the code to distribute the
>    reclaimable CPU time only to tasks having the SCHED_FLAG_RECLAIM
>    flag set
>
> Is this understanding correct?
Yes, the above two details are correct. In addition to that, I think
the existing equation had a small bug:
GRUB paper says, running time is depreciated as
   "dq =3D -U dt" where U is running_bw.
This is assuming that the whole cpu bandwidth could be reclaimed. But
in our case, we cap at Umax. So the equation should be
   "dq =3D -(U/Umax) dt"

And then we have an upper limit of (1 - Uextra - Uinact). I feel we
should be taking the minimum of these values to make sure that we
don't cross the upper bound. I think the equation should be:
   "dq =3D -min{U/Umax, (1 - Uextra - Uinact)} dt"

But the current implementation is
   "dq =3D -max{u/Umax, (1 - Uextra - Uinact)} dt"
   Where u =3D dl_se->dl_bw.

After fixing the above equation, reclaim logic works well but when only
SCHED_FLAG_RECLAIM tasks are running. When we have a mix of both
normal deadline and SCHED_FLAG_RECLAIM, it breaks the reclaim logic.
As you pointed out, the second part of the fix is for that.

> If using div64_u64() does not introduce too much overhead, then I agree
> with the first change.
In my testing, I did not see a change in the performance of the
grub_reclaim function. Both old and new implementations take 10 to
20 nanoseconds on average. But my observation might not be accurate.

With this change, it is difficult to avoid division as the denominator
is a variable and we would not be able to pre-calculate an inverse. We
could probably calculate inverse during {__add/__sub}_running_bw so as
to reduce the frequency of div64_u64. I shall try this for v2.

> The second change also looks good to me.
>
> I have no comments on the code, but there is one thing in the comments
> that looks misleading to me (or I am misunderstanding the code or the
> comments):
>

> > + * We can calculate Umax_reclaim as:
> > + *   Umax_reclaim:   this_bw + Uinact + Ureclaim
>
> I think this looks like a typo (summing this_bw to Uinact
> looks wrong). Should "this_bw" be Uextra?
>
Thanks a lot for pointing it out. Yes you are right, I messed up in the
comments. It should be Uextra and I shall fix it in v2.

> > + *   dq =3D -(Ureclaim / Umax_reclaim) * dt
> > + *      =3D -(Ureclaim / (Ureclaim + Uextra + Uinact)) * dt
>
> I think this should be the correct equation. BTW, since you are summing
> Uextra and Uinact, mabe you could just use "Umax - running_bw"?
>
Makes sense, it will avoid an extra variable Uinact. I shall modify this
in v2.

Thanks,
Vineeth
