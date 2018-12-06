Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8BBDD7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 09:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbeLFJI6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 04:08:58 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:40954 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727575AbeLFJI6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 04:08:58 -0500
Received: by mail-oi1-f178.google.com with SMTP id t204so20058451oie.7;
        Thu, 06 Dec 2018 01:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L45Gy9aQT4S6BI7woTd5M2jbPJpW6O8m94ZPLgwltjs=;
        b=aZYmMNydNThCPb0uppAi7HyDbwY+YMi1jSwHm0/MVlYu7CGADFDPdRAJ+25jyieO7h
         F1dI3fDS+LN90+owRr2b31SdIbVYamglj/brJTkDswpFhAJhSxER9ecAr4GLFZl/LIc+
         xgeYT+KQz+0PqenePNBS8tJ6nxnLFeaxqpLULqDiawlRupkLmQZmnX/Gpz1pSaR5XpwD
         7YwPtonQ6jRFzjSJMEfuOIA29Kg2FwBaOYSsloImvBTGSubDFniQS7RIjHHG6MQDwo4h
         CF4nCNACwA2SksL4yasjirapXgJf1fldoi3dy3HjZDLnoS9v22GI6TF5Tq171NleJVmW
         D0cw==
X-Gm-Message-State: AA+aEWYtZlwzc6jkzf8D9o7At/CKdLTtQ767RG4bxLGH7ly9oo2gD2ax
        MI8M36RNvvLCq3CcANWaPFUmFOlsaFsptrAftZg=
X-Google-Smtp-Source: AFSGD/WlWheJTkSnDDc6Z9IYS7QS3fv7EkH/KtwTPbJAFYe/COFECfOV6WQhAd4D4+GocClPaD1NdOwzu5NS1cHX5yU=
X-Received: by 2002:aca:368a:: with SMTP id d132mr17809253oia.193.1544087336524;
 Thu, 06 Dec 2018 01:08:56 -0800 (PST)
MIME-Version: 1.0
References: <006901d48cef$5bb88a00$13299e00$@net>
In-Reply-To: <006901d48cef$5bb88a00$13299e00$@net>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 6 Dec 2018 10:08:44 +0100
Message-ID: <CAJZ5v0jVJVFExmGexnaP2RZYWXDVLHYDTtK3O3vNGM1F122+7A@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Add 'high' and 'low' idle state metrics
To:     Doug Smythies <dsmythies@telus.net>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Giovanni Gherdovich <ggherdovich@suse.cz>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 6, 2018 at 12:08 AM Doug Smythies <dsmythies@telus.net> wrote:
>
> Hi Rafael,
>
> On 2018.12.03 04:32 Rafael J. Wysocki wrote:
>
> > Add two new metrics for CPU idle states, "high" and "low", to count
> > the number of times the given state had been asked for (or entered
> > from the kernel's perspective), but the observed idle duration turned
> > out to be too high or too low for it (respectively).
>
> I wonder about the "high" "low" terminology here.

I took these names, because they are concise and simple.  I could use
"below" and "above" respectively I guess.  What about these?

> > These mertics help to estimat the quality of the CPU idle governor
> > in use.
>
> Yes, very useful. Thanks.
>
> Here the terms are mixed with "deep" and "shallow"
>
> > +     unsigned long long      high; /* Number of times it's been too deep */
> > +     unsigned long long      low;  /* Number of times it's been too shallow */
>
> > +``high``
> > +     Total number of times this idle state had been asked for, but the
> > +     observed idle duration was too short to match its target residency.
> > +
>
> O.K. To avoid ambiguity, how about naming them "too_short" and "too_long"?

Well, I guess the "too_" prefix may be skipped, so "short" and "long"
could be used, but that's about the state, not about the idle
duration.  The state cannot be "too long" or "too short", arguably.
It might be "too deep" or "too shallow".

> > +``low``
> > +     Total number of times this idle state had been asked for, but a deeper
> > +     idle state would have been a better match for the observed idle duration.
>
> Even though I read the patch, by the time I actually looked at the numbers I had
> forgotten the meaning. I had look at idle state 0 and 4 (the deepest for my computer)
> to figure it out:
>
> doug@s15:~/c$ cat /sys/devices/system/cpu/cpu0/cpuidle/state0/low
> 259871
> doug@s15:~/c$ cat /sys/devices/system/cpu/cpu0/cpuidle/state0/high
> 0
> doug@s15:~/c$ cat /sys/devices/system/cpu/cpu0/cpuidle/state4/low
> 0
> doug@s15:~/c$ cat /sys/devices/system/cpu/cpu0/cpuidle/state4/high
> 5584
>
> Because state 0 can not be too short and state 4 can not be too long.

Where "state" actually means "the target residency of state" I suppose? :-)
