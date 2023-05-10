Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D0BC7EE22
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 03:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235959AbjEJDyo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 May 2023 23:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235642AbjEJDyD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 23:54:03 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D1D65AA
        for <linux-doc@vger.kernel.org>; Tue,  9 May 2023 20:53:39 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6ab2efc79aeso249119a34.1
        for <linux-doc@vger.kernel.org>; Tue, 09 May 2023 20:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1683690819; x=1686282819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcfrOIdvUuFGebqMil2KCc3m77DT7hwnQo4PHUmoYnA=;
        b=jFMdyxIusCKNc6XWfdeSgaLqvkxv2kvRPs2db08EZcfhOxW3F/j7Q9zV+1XAIPsPz3
         dISVfe6zZVNDexzFXCyc2vGJyY0FLfjdMvK6q57o5qNJQfQTDmqlUTGr2jUmCtCRlhUu
         lpHRlPIZDG4FexVxH/OCJpPLxrY4JHZjPTnx0fG0ZtaROkKRbEfJZeRw4JLo3s9gnjgQ
         VePs6PfxwBKeFtI6+9HlCqCWjLiIt8WgPNe9Yo7XnFwRqsLqphihMh/ApY3RhCC7z3/T
         Zw5HnbQBPPO+iwhFtm3LR7S3fu+S+nERxywFGAJRBZvuQrQ8CSJNWCvcT8Y7MTMRBILO
         i7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683690819; x=1686282819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcfrOIdvUuFGebqMil2KCc3m77DT7hwnQo4PHUmoYnA=;
        b=KAee+liXH4dRNmGU+M4Y3lHO2MarqGFcYcHOmSXfiIgJedwV+x4mipi2AkKde21P8f
         cHJ/xhlSgvyHve2+9w5ULnMry6iXdlwDPcX53W12jt+uuSuFGR5RCNAekQAGAjeGlx/n
         5uAjq2jA0Lf+dc4tFEAfYOI1rBafr1h1qfREopgh4iErFvEbxEKw1kWj3LAj7z+QS++Z
         bs3+U/E00cLleSsXqHIzKE440e38+u9kDgweh+MpZVtrESTu/Pu0Eq0b0flNfTCi2Bwr
         CqT1JGvjp+yLe+PHTlo6P0mXcNakTCkY+HHx3v0RGQcV4PO/Kxgonq8H94zhQI2rH0p5
         mhag==
X-Gm-Message-State: AC+VfDzJ9ave286EXAZg0sqWriLhmAAqy4e7+XDxIcU+6l/j1o70r047
        mqY1xJG8C/zRZmBmbgVm/oxVfOxRr06SlB4yB97oKOmohfjCeWLKY+1ueg==
X-Google-Smtp-Source: ACHHUZ4uUJmP8iooUjOb4xntN3XMSOB6rCYr4hiLzlcFMaZqEEoolUlgGwQv8knC3XQj/DlXR7ceyWpLjtvQ191Go7Y=
X-Received: by 2002:a9d:75ca:0:b0:6a6:2a83:84f8 with SMTP id
 c10-20020a9d75ca000000b006a62a8384f8mr2056335otl.38.1683690818928; Tue, 09
 May 2023 20:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230508160829.2756405-1-vineeth@bitbyteword.org>
 <20230509132534.09098acc@luca64> <CAO7JXPhrqKWfsp860rRmEenxARi8U2gNMGsOn4m+aKporWwBcg@mail.gmail.com>
 <20230509224829.2fb547fd@nowhere> <20230509225417.61d36733@nowhere>
In-Reply-To: <20230509225417.61d36733@nowhere>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Tue, 9 May 2023 23:53:28 -0400
Message-ID: <CAO7JXPhk5qbz9kmiu9WuXS+gXCt9+X8pP2c37hd9ChByLmXYjA@mail.gmail.com>
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

On Tue, May 9, 2023 at 4:54=E2=80=AFPM luca abeni <luca.abeni@santannapisa.=
it> wrote:

> > Yes, this is the approximation I was mentioning... Instead of using a
> > division, I approximated it with a different equation using a sum.
>
> Sorry, ignore this comment (and the following); I misinterpreted the
> code (and my old notes).
>
> I do not understand why the "max{}" doe not work well, I need to double
> think about it.
>
I was thinking more about this and was doing some more digging into
this. I was also wrong about min{}. Giving it some more thought, I think
(U/Umax) is indeed the only equation we need and it will take care
of caping the reclaiming at Umax. The reason why it was not working
is because of the loss of precision when we did the inverse. I tried
replacing (delta * running_bw * bw_ratio) by
div64_u64(delta * running_bw, Umax) and it worked as expected and
reclaimed only till Umax with only SCHED_FLAG_RECLAIM tasks. As an
example a task with reservation (1, 100) and RT capacity 95%, and
delta =3D 4ms, we get scaled_delta as
delta * running_bw * bw_ratio ~=3D .040000 (roughly)
div64_u64(delta * running_bw, Umax) ~=3D .04210526 (roughly)

This caused the inverse logic to consume ~99% bw, while the other
one consumed ~95% as expected.

I still could not figure out why min{} works. As you mentioned in
the previous thread, its the loss of precision thats the culprit and
I think we only need U/Umax if we have enough precision. This along
with accounting for both type of tasks will be the solution.

I will look deeper into any performance issues with using div64_u64
over multiplication and shall let you know soon.

Thanks,
Vineeth
