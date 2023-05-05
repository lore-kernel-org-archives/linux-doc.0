Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0BCC77B7F
	for <linux-doc@archiver.kernel.org>; Fri,  5 May 2023 12:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbjEEMKl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 May 2023 08:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231968AbjEEMKj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 May 2023 08:10:39 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3CB1AEF4
        for <linux-doc@vger.kernel.org>; Fri,  5 May 2023 05:10:38 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-33164ec77ccso552895ab.0
        for <linux-doc@vger.kernel.org>; Fri, 05 May 2023 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683288638; x=1685880638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tidKINGncTA+p8ufXsH97B8VbplL15U4SOqjeLKOv9Y=;
        b=Qa1lnDP3l0k8Xxa+71SWmPWHhAK4xR5nm2JTccTw0ouSLk777GR+fKH3/I/fWY4wCH
         4+5wSsRkFXN8UPLVVNxvBZmDxKMDebkojJbgjT5eeZCZnZ0ChXWwfaC52b7hBuk/63z6
         H+t5gTucE9URBCD0dHYHCOZbIn82h3iPFZWCv3UZqdwBFxEy1NslnVGpd3wFdU2cjsS+
         ZpDBzZmBRPKr6yNgP3bJrLaj+cLxgkqWJiwRRg8uSa8r9np9JKl36uf6vMFAhuhGc+/S
         XM2hCGTp5Zpc9yv025hX/+dEpUNOV6IWCl+df2WLbr11O/ZLp0hMjeGjbMfNAOma6R7S
         4Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683288638; x=1685880638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tidKINGncTA+p8ufXsH97B8VbplL15U4SOqjeLKOv9Y=;
        b=k4td35tFyJPPqaiDeQxRX22ADmmeFAkFjRCa5EZRcoY8U3tlOv5XLeUegxRn/8YpVF
         28NiUiFzt5ZGDci2yWuMROJsertor7gCP/oh2a9VXHMQ/0Z7wclUm0fbOut2dx9CeEyn
         w/KyXt/cYIUSHC1L+Hp8rnuqHrCEy8rSTF7ohxu7uLEpW9rYjh63xqQCG4E3gymP/S+Z
         oRxOznamYYirLuAS2pJ6iwT4stKX1JARZ9wCEBqFbsjymaWKfYbV7c4vSx92YbXCH9+S
         zEX/v+Ak/UQW9POcb+cogoIlowSHBwdxbg9L6natImg/Nd/zPlv3Qe6wbm8JGc1OXaIj
         lnoA==
X-Gm-Message-State: AC+VfDw4tckvYAqAw7A8uRH/Kb9ux7ICJi9WQKKUpM+Y6DHEwbfYvXJZ
        x2VRCIcoY571IMMAt7GwIdBKzXTcBqWjk7OognYFPA==
X-Google-Smtp-Source: ACHHUZ6+Sz9wXGNsJ54naDmeqrAHxiUZczPWVTomwvEYzipZXiygcBekORjvmD8FIQXG1o8L2hCtcBkjM4L0mNtEMX4=
X-Received: by 2002:a05:6e02:1609:b0:329:3f69:539e with SMTP id
 t9-20020a056e02160900b003293f69539emr158778ilu.2.1683288637752; Fri, 05 May
 2023 05:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230505113315.3307723-1-liujian56@huawei.com> <20230505113315.3307723-5-liujian56@huawei.com>
In-Reply-To: <20230505113315.3307723-5-liujian56@huawei.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 5 May 2023 14:10:26 +0200
Message-ID: <CANn89iJL3ywLwig8U6JKG6itL7Fr=ab_dv7Pz1YDiDvCiR-Fog@mail.gmail.com>
Subject: Re: [PATCH 4/9] softirq: Allow early break
To:     Liu Jian <liujian56@huawei.com>
Cc:     corbet@lwn.net, paulmck@kernel.org, frederic@kernel.org,
        quic_neeraju@quicinc.com, joel@joelfernandes.org,
        josh@joshtriplett.org, boqun.feng@gmail.com, rostedt@goodmis.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        qiang1.zhang@intel.com, jstultz@google.com, tglx@linutronix.de,
        sboyd@kernel.org, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, peterz@infradead.org, frankwoo@google.com,
        Rhinewuwu@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 5, 2023 at 1:24=E2=80=AFPM Liu Jian <liujian56@huawei.com> wrot=
e:
>
> From: Peter Zijlstra <peterz@infradead.org>
>
> Allow terminating the softirq processing loop without finishing the
> vectors.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Liu Jian <liujian56@huawei.com>
> ---
>  kernel/softirq.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/kernel/softirq.c b/kernel/softirq.c
> index 48a81d8ae49a..e2cad5d108c8 100644
> --- a/kernel/softirq.c
> +++ b/kernel/softirq.c
> @@ -582,6 +582,9 @@ asmlinkage __visible void __softirq_entry __do_softir=
q(void)
>                                prev_count, preempt_count());
>                         preempt_count_set(prev_count);
>                 }
> +
> +               if (pending && __softirq_needs_break(start))
> +                       break;

This means that some softirq may starve, because

for_each_set_bit(vec_nr, &pending, NR_SOFTIRQS)

Always iterate using the same order (of bits)




>         }
>
>         if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
> @@ -590,13 +593,14 @@ asmlinkage __visible void __softirq_entry __do_soft=
irq(void)
>
>         local_irq_disable();
>
> -       pending =3D local_softirq_pending();
> -       if (pending) {
> -               if (!__softirq_needs_break(start) && --max_restart)
> -                       goto restart;
> +       if (pending)
> +               or_softirq_pending(pending);
> +       else if ((pending =3D local_softirq_pending()) &&
> +                !__softirq_needs_break(start) &&
> +                --max_restart)
> +               goto restart;
>
> -               wakeup_softirqd();
> -       }
> +       wakeup_softirqd();
>
>         account_softirq_exit(current);
>         lockdep_softirq_end(in_hardirq);
> --
> 2.34.1
>
