Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE653ECAAD2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 16:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbiH2Qx7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 12:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiH2Qx6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 12:53:58 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AE889CD4
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 09:53:56 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3378303138bso210881587b3.9
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 09:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=9MtsKETAQYOSHqFu76VaqNu9/OI/sudex9QgrJ+4kBc=;
        b=GkigFTjyHH7is6HjX0lTNqflphvgUtePF1XkUbJ96E6tMjfmSRYp9GOrgI3MdlbNUo
         QYZMp/AJjX8zb0DFpUP54KXklFUXSYyiPnQ+BdDPTuaVrnC+76pjnqSwWb2IShm+3vg9
         qYyMFQonnPOUNhlaPQ6vo/y/78MMn/2z7Su6JqZ8m0il46X0xHmcCfcPX1ANvneijpz+
         7x7HQhve0w11lcy3wQguKjS21Aw9iu2kT14R25/YV6nkbSEcpB9yOy8aGppE28AOGLOA
         Ecr2pOqoJDmImu9wRyxaIrqFwyebiYoFdK3nI/XhhHGEf34fCazy8PBXbCHBzPSeauOv
         4wJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9MtsKETAQYOSHqFu76VaqNu9/OI/sudex9QgrJ+4kBc=;
        b=vR4s3RlLoSjnCUjoD51Val3e085eztwzZBBaT5wHY9bmWQIk4jkjAdpUdMXMEN23Ic
         AVEZS1lxAUTDPXIGCRCNywsf3m0YH/g3xVprccxxUtPiQwIE5dffYhcIwOWdAVn9X4df
         47fw6jpB+7803xDNcONDPrKix7onq35ZlQMBsUwFal5H6tw5XUF6XHluFlETGXtl/kwO
         n7KZUblA3VEyeR7Btn8l3dDwuSOMSdNGA7WDV+YhAMD4Of3rItFiqfX/0kRJBwR/Uib9
         y19g5wRFh431GDndq/2hj+SpQzBQDKvXAL1Sz/SrY9zkbdrsQMiuG2XugPjD4gW4rriJ
         ntyQ==
X-Gm-Message-State: ACgBeo2Ez5FFtDmmY1L1d19f/zmR5Eib98vUCpEEzFEfymNnK0rDiBM9
        igej35hAx4r6apsJ03W95f7mrbY+w2hJW7WZ7f2Rxg==
X-Google-Smtp-Source: AA6agR6vYRcCWI4aLx5ChcGNh/P9ALo35RiZdOMZ6Ksu8rOYk58+KuX1X4i0lMY4WQ9LWVWY5CZkfJ57W1WfOgDHwDI=
X-Received: by 2002:a25:b78a:0:b0:695:900e:e211 with SMTP id
 n10-20020a25b78a000000b00695900ee211mr8421162ybh.427.1661792034737; Mon, 29
 Aug 2022 09:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651800598.git.peilin.ye@bytedance.com> <cover.1661158173.git.peilin.ye@bytedance.com>
 <CANn89iJsOHK1qgudpfFW9poC4NRBZiob-ynTOuRBkuJTw6FaJw@mail.gmail.com> <YwzthDleRuvyEsXC@pop-os.localdomain>
In-Reply-To: <YwzthDleRuvyEsXC@pop-os.localdomain>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 29 Aug 2022 09:53:43 -0700
Message-ID: <CANn89iJMBQ8--_hUihCcBEVawsZQLqL9x9V1=5pzrxTy+w8Z4A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 net-next 0/5] net: Qdisc backpressure infrastructure
To:     Cong Wang <xiyou.wangcong@gmail.com>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>,
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

On Mon, Aug 29, 2022 at 9:47 AM Cong Wang <xiyou.wangcong@gmail.com> wrote:
>
> On Mon, Aug 22, 2022 at 09:22:39AM -0700, Eric Dumazet wrote:
> > On Mon, Aug 22, 2022 at 2:10 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > From: Peilin Ye <peilin.ye@bytedance.com>
> > >
> > > Hi all,
> > >
> > > Currently sockets (especially UDP ones) can drop a lot of packets at TC
> > > egress when rate limited by shaper Qdiscs like HTB.  This patchset series
> > > tries to solve this by introducing a Qdisc backpressure mechanism.
> > >
> > > RFC v1 [1] used a throttle & unthrottle approach, which introduced several
> > > issues, including a thundering herd problem and a socket reference count
> > > issue [2].  This RFC v2 uses a different approach to avoid those issues:
> > >
> > >   1. When a shaper Qdisc drops a packet that belongs to a local socket due
> > >      to TC egress congestion, we make part of the socket's sndbuf
> > >      temporarily unavailable, so it sends slower.
> > >
> > >   2. Later, when TC egress becomes idle again, we gradually recover the
> > >      socket's sndbuf back to normal.  Patch 2 implements this step using a
> > >      timer for UDP sockets.
> > >
> > > The thundering herd problem is avoided, since we no longer wake up all
> > > throttled sockets at the same time in qdisc_watchdog().  The socket
> > > reference count issue is also avoided, since we no longer maintain socket
> > > list on Qdisc.
> > >
> > > Performance is better than RFC v1.  There is one concern about fairness
> > > between flows for TBF Qdisc, which could be solved by using a SFQ inner
> > > Qdisc.
> > >
> > > Please see the individual patches for details and numbers.  Any comments,
> > > suggestions would be much appreciated.  Thanks!
> > >
> > > [1] https://lore.kernel.org/netdev/cover.1651800598.git.peilin.ye@bytedance.com/
> > > [2] https://lore.kernel.org/netdev/20220506133111.1d4bebf3@hermes.local/
> > >
> > > Peilin Ye (5):
> > >   net: Introduce Qdisc backpressure infrastructure
> > >   net/udp: Implement Qdisc backpressure algorithm
> > >   net/sched: sch_tbf: Use Qdisc backpressure infrastructure
> > >   net/sched: sch_htb: Use Qdisc backpressure infrastructure
> > >   net/sched: sch_cbq: Use Qdisc backpressure infrastructure
> > >
> >
> > I think the whole idea is wrong.
> >
>
> Be more specific?
>
> > Packet schedulers can be remote (offloaded, or on another box)
>
> This is not the case we are dealing with (yet).
>
> >
> > The idea of going back to socket level from a packet scheduler should
> > really be a last resort.
>
> I think it should be the first resort, as we should backpressure to the
> source, rather than anything in the middle.
>
> >
> > Issue of having UDP sockets being able to flood a network is tough, I
> > am not sure the core networking stack
> > should pretend it can solve the issue.
>
> It seems you misunderstand it here, we are not dealing with UDP on the
> network, just on an end host. The backpressure we are dealing with is
> from Qdisc to socket on _TX side_ and on one single host.
>
> >
> > Note that FQ based packet schedulers can also help already.
>
> It only helps TCP pacing.

FQ : Fair Queue.

It definitely helps without the pacing part...

>
> Thanks.
