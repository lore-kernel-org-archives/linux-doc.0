Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E677C7EE29
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jun 2023 01:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjFEB6Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 21:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbjFEB6P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 21:58:15 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411C4DA
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 18:58:11 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b0d38ce700so3306297a34.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685930290; x=1688522290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=woMTl6Q2e+ae4QSNZueTlUS9px8Mf5/8HDEl7sylqqA=;
        b=fi2o5gntsaBJAHQDwvQ+cq5NmWknXOJ0ZzfxOoiZ5NRTNsBUnXJ+6Mzby7EnagFEgU
         HX19Tj6rL36obcujXAlPNEL/PEviF6OeLJ6wNrdrCorMjyAY9EvMZsI+qVwvUUKpkZmF
         onnY9bkl0B7hZpcpiYx4fn3KWB5wagX5ODtqHsYtmJwFbg+wff1mtd+dqhBG4372c1cC
         g03A9wbloml6vsG2Y2UEIIoGtXiAQKbcy+mQASNe89TUCeWRnzPAZvWVgbojj+g55ctq
         kbHZBBw7UAA9w2Evmgt2csg+Mp1u6Aih764vh8ge9i7a02Jo8xAaMO9uBA4rSklx1M3N
         wiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685930290; x=1688522290;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=woMTl6Q2e+ae4QSNZueTlUS9px8Mf5/8HDEl7sylqqA=;
        b=LQ56v0qsISnv+r2S/Gb+VP9+xtdZCdM315j1PvMmy7LDwol/Zd62GOidqsHWzOortE
         BhzLaMQY1KZ6T0s87M2MUYlXS3UQanjrZkpzd27RGH+QI+uP2P8A+QliqPrjZYYGsxBd
         l2aMLSE1J0VdoPUbQX4KOewcFMM9ktnegd5jIJ0hoc7RCSgJ+mAaAMObnVDt3J1WBuPY
         QolwJp9NyvPmJ08BQEziLs7XuFGsiDjvf5UQ6sqztSBoMWYZsjWJArLA/qOylzCEnXZ8
         kr37e1cFwSBSuHcQ9qH9GO9kZ1K/7UuLsR7G9p8bx7m8GklmkMT98MP05yyqHcCSopsm
         gC9w==
X-Gm-Message-State: AC+VfDxGUfnykq0GdXa2wYHJjvYebp6DCTiUPSPcsZUS+CUTnHSYx3DK
        T+MpIn0rYvhpQ2vhyLhYSKmFf3g2Z3tb4q5LdbuzeQ==
X-Google-Smtp-Source: ACHHUZ7dMG6VFUeLVAxlOKiRl5/BMcAoH6Asz7b9Gt7hBrlFBXiX3P6gzRB0npQfBUThKsynv0nkc3EHpRNMlOG1Vqg=
X-Received: by 2002:a05:6830:39d9:b0:6b0:c632:ff59 with SMTP id
 bt25-20020a05683039d900b006b0c632ff59mr8886151otb.19.1685930290555; Sun, 04
 Jun 2023 18:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530135526.2385378-1-vineeth@bitbyteword.org> <6ba5e4bc-dfb9-dccf-d075-f7bde831acf6@arm.com>
In-Reply-To: <6ba5e4bc-dfb9-dccf-d075-f7bde831acf6@arm.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Sun, 4 Jun 2023 21:57:59 -0400
Message-ID: <CAO7JXPgV4p3-c-ZB=Ab0rNphdg4+gb7p2KKYwV3CgnMJiYKvPQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] sched/deadline: Fix bandwidth reclaim equation in GRUB
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Dietmar,

Sorry for my late response..

> > + * Since rq->dl.bw_ratio contains 1 / Umax multiplied by 2^RATIO_SHIFT, dl_bw
> > + * is multiped by rq->dl.bw_ratio and shifted right by RATIO_SHIFT.
>
> nit-pick:
>
> s/multiped/multiplied
>
Sorry I missed this. I am working on couple more GRUB fixes and will fix
this along with those changes.

> Not related to this patch directly but I still can't see how `GRUB-PA`
> with schedutil CPUfreq governor should work together with GRUB reclaiming.
>
> CPU frequency is influenced by Uact (rq->dl.running_bw):
>
> sugov_get_util() -> effective_cpu_util() -> cpu_bw_dl() ->
>
>       return rq->dl.running_bw * SCHED_CAPACITY_SCALE) >> BW_SHIFT
>
> But the extra GRUB reclaim runtime is calculated based on rq->dl.max_bw
> and AFAICS, Uact is not adjusted by scaled_delta_exec?
>
I haven't had a chance to look at GRUB-PA till now and after reading
your mail, I had a quick read of GRUB-PA paper[1] :-). From what I
understood, the dea of GRUB-PA is not to reclaim to the maximum
allowable bandwidth, but to scale down the frequency to the required
utilization(running_bw). This way the tasks run longer(similar to
reclaiming) but using less power.

GRUB reclaim is calculated indirectly based on running_bw as well as
"Uinact = this_bw - running_bw". We factor in reserved and running bw
into the equation and then scale it down to max_bw. So if my
understanding is correct, GRUB-PA doesn't technically reclaim extra
processing capacity, but just allows the task to run longer at lower
frequency so as to save power. I might be wrong and not an expert
here. Luca, please correct me if I am wrong.

Thanks,
Vineeth

[1] C. Scordino, G. Lipari, A Resource Reservation Algorithm for Power-Aware
    Scheduling of Periodic and Aperiodic Real-Time Tasks, IEEE Transactions
    on Computers, December 2006.
