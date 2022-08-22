Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B4BC28D13
	for <linux-doc@archiver.kernel.org>; Mon, 22 Aug 2022 16:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbiHVQWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Aug 2022 12:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236666AbiHVQWw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 12:22:52 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FEFF3F332
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 09:22:51 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31f445bd486so307650947b3.13
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zBnLNnOuEm5lJhwtbUOYYe47b/c/6C+EcZMDaQGtBP4=;
        b=pyq/6kJ6DsGWQlpt2s0VXNeG1rxbZvr1f8onglt28Gp3w96/d34SrxrZQKd8GAMLm+
         msURTCw8d+HAGTCxXo+r1oPnP78lH3o/XZjrXAJql3eo/TWCz7OLc+KEwApPb0UJ7Hpl
         FNm3OiQC2PTNuqZz8hzOyFowdGYaSR6FkBfiC3dfAhvA5oImQffN/izIYDhbbUtANHEn
         3QyD1kGFtLsm3q0e56fiqMtObmqSmqyVA3koNFPZ1gFzMjjkRg1073VPTHRa79YYJ50A
         L0VFjNfjcflJ6KITQLbLCagavJ31oWZyTuDrDWqMfEggK36BvBoMpUHUXSYo98tozrvY
         IK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zBnLNnOuEm5lJhwtbUOYYe47b/c/6C+EcZMDaQGtBP4=;
        b=Nw2b06xWmufS1OyYqza4RYTzwOy1BrJj0Y3RKyfscKrzzFx4yoc2NZohmQi88ZK5iz
         siA600Gv9SLJOF93tUqBm+icud50wBIsLLxpWwf4j88ahA20BJosVbfS5Mb2c2h3Chhf
         YDSruNQa0WCxUSenT9H9zOOnOApU0YBB9rTqsJBPwS8WC13TQIK9j7SA5ukUbHGKY0W+
         Xd1CpnjN/5BD7AXSQmxdDG5qtLygtyNd7oBYSWCUN4vE/+oOn/PB7WUriXgc/pRFAAa/
         OPTHQrjLvOfXI0oBRTCBYA+PIgQFWr1x1T8hlDILGmCSsHI8rJxGFZWordiKdT9h8+Io
         VSvw==
X-Gm-Message-State: ACgBeo3wH1ADEXjzZmW2X4gUS+Ln8WSEgiG1O4Ek50PN03Juv/+x55Sw
        fuYwfZw0yDtao0AAHiLcOubxrQikkbyuPjWLxuCjJQ==
X-Google-Smtp-Source: AA6agR4U9cjCs7IQEA6wPhRWTBAzKHRxHy5hIjO+FjyWQehv0ldLHYX7kwD9c7qskJP7JL5/agrY+5wWjvdBiM0x1p0=
X-Received: by 2002:a25:5091:0:b0:690:1f61:a7c9 with SMTP id
 e139-20020a255091000000b006901f61a7c9mr20337108ybb.55.1661185370392; Mon, 22
 Aug 2022 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651800598.git.peilin.ye@bytedance.com> <cover.1661158173.git.peilin.ye@bytedance.com>
In-Reply-To: <cover.1661158173.git.peilin.ye@bytedance.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 22 Aug 2022 09:22:39 -0700
Message-ID: <CANn89iJsOHK1qgudpfFW9poC4NRBZiob-ynTOuRBkuJTw6FaJw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 net-next 0/5] net: Qdisc backpressure infrastructure
To:     Peilin Ye <yepeilin.cs@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Peilin Ye <peilin.ye@bytedance.com>,
        netdev <netdev@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Cong Wang <cong.wang@bytedance.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 22, 2022 at 2:10 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> From: Peilin Ye <peilin.ye@bytedance.com>
>
> Hi all,
>
> Currently sockets (especially UDP ones) can drop a lot of packets at TC
> egress when rate limited by shaper Qdiscs like HTB.  This patchset series
> tries to solve this by introducing a Qdisc backpressure mechanism.
>
> RFC v1 [1] used a throttle & unthrottle approach, which introduced several
> issues, including a thundering herd problem and a socket reference count
> issue [2].  This RFC v2 uses a different approach to avoid those issues:
>
>   1. When a shaper Qdisc drops a packet that belongs to a local socket due
>      to TC egress congestion, we make part of the socket's sndbuf
>      temporarily unavailable, so it sends slower.
>
>   2. Later, when TC egress becomes idle again, we gradually recover the
>      socket's sndbuf back to normal.  Patch 2 implements this step using a
>      timer for UDP sockets.
>
> The thundering herd problem is avoided, since we no longer wake up all
> throttled sockets at the same time in qdisc_watchdog().  The socket
> reference count issue is also avoided, since we no longer maintain socket
> list on Qdisc.
>
> Performance is better than RFC v1.  There is one concern about fairness
> between flows for TBF Qdisc, which could be solved by using a SFQ inner
> Qdisc.
>
> Please see the individual patches for details and numbers.  Any comments,
> suggestions would be much appreciated.  Thanks!
>
> [1] https://lore.kernel.org/netdev/cover.1651800598.git.peilin.ye@bytedance.com/
> [2] https://lore.kernel.org/netdev/20220506133111.1d4bebf3@hermes.local/
>
> Peilin Ye (5):
>   net: Introduce Qdisc backpressure infrastructure
>   net/udp: Implement Qdisc backpressure algorithm
>   net/sched: sch_tbf: Use Qdisc backpressure infrastructure
>   net/sched: sch_htb: Use Qdisc backpressure infrastructure
>   net/sched: sch_cbq: Use Qdisc backpressure infrastructure
>

I think the whole idea is wrong.

Packet schedulers can be remote (offloaded, or on another box)

The idea of going back to socket level from a packet scheduler should
really be a last resort.

Issue of having UDP sockets being able to flood a network is tough, I
am not sure the core networking stack
should pretend it can solve the issue.

Note that FQ based packet schedulers can also help already.
