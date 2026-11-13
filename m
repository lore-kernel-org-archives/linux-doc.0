Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794548670;
	b=aagHFeDk3mEnmhcRtusu7/cPMP98I5ICRwlsWAcAHbjxrLw7luZovxETjJo9dPRW/2Tz
	 WFiLTkfXyWsbB2EiWe5coIp+QnDsxBdmO9oUmpJyk5d3t715rjZpHWkF2pl8W35lhrsOS
	 XMWGe8dl/oS7ndRtcuPj40DZHq7C/H7UxGjo9LU3yp7RUhr34/41QL8Qg+IxQhnloaE5s
	 /ze3A+Sa7T4Td9tut5RczklLxaTK850uwIulr23kPwprDZQvLJ98WGostGLn4xAczB6km
	 Pggy1K7xdYChojiPiWoQnqgnD2AiuO5oOoNzpAa4rgOAN2M0+T3z7gKH5yBl9NtmLCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
	b=1QSaw7wYWIvlIaH+b4Z5DUNBxbv7LCSzZr9V9x28cNmj99KMEedtMdrpiKBasewOOI2M
	 cLutEVp388epV1DY8XYKMgm1cJ9TkDIHUe7LrR2FXVE+BzHWJaM1psXbss4yF7E110v4p
	 6FYLvIRWGsgpThZdaI3vXSfRhXGq1jW3Srf6LlhkuLfo1wBJT4b6tiePR0KUjMP/LSnxg
	 roGpsxqZE8OYTTkj+q7EeTquLJaG74xvJOjKB4Eamm2mF7Axu7s3Aik+SMRKUIv6j7PvE
	 ltVECQah4OjYWyw6GxAt9Pfsmom1B4yi7n5DrZbv2zt0ctkq99Tmw7xQSe7YhPnOznA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlwZfLjy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CFE606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlwZfLjy
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so233513a12.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548668; cv=none;
        d=google.com; s=arc-20260327;
        b=bIppggjWeQrJrwr2hkjE0XPcLS5NTUhYEs5uaM975xR/3fKMEdXeR0aZAiu/oZzWOo
         6zBtJehmaZQZeJtCgwlytiL2+WCIv80XmEVEOff8Q8KQBt6nQna5BxMyylFzBS5VyrxJ
         WepehdHY2GP0Mth5PhEf/PTCb1eqG9OPaFjuwVUSlBHJ031u/PJMNbVqb+/zVMmHcBFz
         IiOEM3jeZ6g5/gRjmlnq/1/ULtY6wAelouz6a55XtjfJ5fw4rxQ0thtOPmBXrVmp2GBT
         N0GyHUPT7OA2viFtShdq75utRjcAVBoVgjNXCYx1PLy4msTedw/0X6iASczSPnieOX6j
         JPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        fh=l6V7GDk68g7iZ9+6k3m0FEOFAZZ8O0qBW5nBRgpVATw=;
        b=gsg9DI/JnMyH6a1fSzfUxpmqipJ1lob3biu2d5vkd6IFvE3x0lS1ttsBv/X7mtW+Qt
         o6/GlfipUSYKZ1pRJnG7/9J+OMeeFGiNiwgbt6VJlil7AqlN2yvLzOZoAbeS6CPBdgPh
         zS0T7bdWcaXVZ1yTodWTsesNx0TIwFW9AqroJ673DaUPeHLcaYpxqENY2i7J4n6GW2qM
         mQs6wlHkERzLY+V95c8ywM4jsOTuKFerrntc+Gr37EBD5CakQbfii9EkKN7o4QjKzEIO
         +dUt2AvvvNJwg5tV7uaWK+3iKU7KBg17jaDZWOcfB/Mq1jVtBcjh/b138qRAvR4bnSmr
         89dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794548668; x=1795153468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        b=YlwZfLjyBPstI07GiXcbgY1PgHaL+X5W1yWOy/eXHR65Fx/h/UCfPh0Yr1zgMQmRs1
         6nZ1jxA0xPOT+RzxfuvQB99/uzu3eIj6nWI1wr59N0wuB77ZtYWgvaa52BphV79zRU/j
         QfteFPa6jhw8RqeQu008yjqsZCt1PsR8lXYCiG0B1RkfoszrAuFbtM2poeYz128vYgMG
         0F5Gu6WwU/Zq0Y91DTakxZVD8AQFazyjvKgStdJwrcpEO5f84X7vog3Tww+C8afVkiIy
         dnqdzIlRv5GFAQz+hTgqvFJc6dRJUFgMtRItZwxxYtjd3c54F4UCBdH0pua4OUMgzeCL
         +35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548668; x=1795153468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        b=npRrOHxzHa2aOGsFZ37xJTeHGgA4udk9Xs6TtOiv++qA9YjwiAwvzncUsM0sajkQdu
         JgqMoH3eBdfo2ry6wY5c3ZSg01wyW9dNo6IthFeOAu9zIJ3pIr4H1ukiZ2xnw6XAC0Ka
         bfmdEQ0/FCCznbs/qQqanJAPwSg6SJrN0d2je9HhhuHxEpJDLBgfeZq5vbzFr6zGJpDn
         gErZQ1bMYUhnvRHuMVWQmH9s4uZEqTcN65XwWqmshIphzE0duH1KG4ZKrFFWd7LSpBfT
         T9Pb+S5GYXbOo+fzNjnrM9tBGs8liwTOdkw/4WjodLNuBSvbyg+134W5h4Cyi1BwJLbt
         zo8w==
X-Forwarded-Encrypted: i=1; AL+hErGD+M3leojeMpwUrXRYK2Fv9y9GW+gCtug5x7Ozj8nG+zrnu5nv6nyta5a3OwaPSTiMh1ixafxV7e8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PifCF09fKQOQCiEon+yJu0wQsp+by2y+n25Oc79cwXkG1mtLW
	47hl566R4h+9gNEl4ti0iPwIgLL6dSyCyUOHwpM4gJbFm5SMDgEpHjflAc/V1ekc+Lvjj28Hxcm
	24ZJjssw827UzlnIlGvoG+SSFjmjEmx75fJamKhA=
X-Gm-Gg: AYBFou3RSRm789Lvnc6/X0ZxFGgD5i/XC49EduLBxJgoap8kV6Hf5dPkCBV+rk4yII0
	rXs7YPitzd41y+3E+0p8e09WsouJKtlsAXkxGyqI9ePRgpai36N6AZ/pkAMv5MB0F2dqkl1lw4M
	DhJ7MMBGad9VWrRAKO3YZLPqNIhEb+Fs1dubDv7Xc2fj1jn2ebU6o529zl9zxuUlN2TFCcTYBb4
	ehgzlLwSm8D9OZyljMaaY5P3Ro19ib8PJYuDt0oxj/R3S5R2FLoPlSkJJCv3WhiSIY+PnT+EyB6
	bVcYxPOgqNrWrMtodLnetaVnVKRv1VU89QuPFfiVUOmniDoJbDIVa0pBjcTMc1Btglo23m6Dsxx
	gnCNTYEu/uFcsUj5booanKcVCjbhifiR+ruQ=
X-Received: by 2002:a17:90a:ec05:b0:3b0:c11a:902d with SMTP id
 98e67ed59e1d1-3b1b09fac26mr938995a91.10.1794548668130; Thu, 12 Nov 2026
 21:44:28 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109030042.2956-1-nashuiliang@gmail.com> <179443085204.2199510.12725312671048285646@kernel.org>
In-Reply-To: <179443085204.2199510.12725312671048285646@kernel.org>
From: chuang <nashuiliang@gmail.com>
Date: Fri, 13 Nov 2026 13:44:17 +0800
X-Gm-Features: AclHuK9F9oQ5Qrk0_Q8z0DxMdLD_AqhLC4iCmwIoVy-nc5xaLnUdD7relDJgbSU
Message-ID: <CACueBy6qrkoTqOi6b5FN7YEFLVzUve3+tbzS=f67ZJO1Px7xiQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12] net: reduce ARFS flow updates by checking
 LLC affinity
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, sdf.kernel@gmail.com, daniel@iogearbox.net, 
	bobbyeshleman@meta.com, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:00=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] set_rps_cpu() (net/core/dev.c:5281-5284) decides whether to
>   skip ARFS hardware steering by comparing next_cpu with old_cpu.
>
> --
>
> net: reduce ARFS flow updates by checking LLC affinity
>
> This patch makes set_rps_cpu() skip the ARFS ndo_rx_flow_steer() call
> when the CPU recorded for the flow and the new target CPU share an LLC.
> rflow->cpu is still updated. A new sysctl, net.core.arfs_llc_affinity,
> turns this on and off, and it is off by default.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 3b60b15e2175e..0011cec296402 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [ ... ]
>
> > @@ -5273,6 +5277,12 @@ set_rps_cpu(struct net_device *dev, struct sk_bu=
ff *skb,
> >               if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
> >                   !(dev->features & NETIF_F_NTUPLE))
> >                       goto out;
> > +
> > +             if (static_branch_unlikely(&arfs_llc_affinity) &&
> > +                 old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
> > +                 cpus_share_cache(old_cpu, next_cpu))
> > +                     goto out;
> > +
>
> [Severity: Medium]
> Does rflow->cpu reliably show which LLC services the hardware queue the
> flow is arriving on?
>
> get_rps_cpu() takes old_cpu from the hash slot in the arrival queue's
> table:
>
>         tcpu =3D rflow->cpu;
>         ...
>                 rflow =3D set_rps_cpu(dev, skb, rflow, tcpu, next_cpu, ha=
sh);
>
> That value is software bookkeeping, and other flows can share the slot.
> The new check runs before the cpu_rmap_lookup_index() /
> skb_get_rx_queue() comparison. So it can suppress ndo_rx_flow_steer()
> even when the arrival queue's IRQ/NAPI CPU is in a different LLC from
> next_cpu.
>
> The skip path still reaches:
>
>         WRITE_ONCE(rflow->cpu, next_cpu);
>
> sd_llc_id equality is transitive, so every later migration inside that
> LLC would skip again. Could the flow then stay on a far queue
> indefinitely?
>
> Here are some ways rflow->cpu can drift away from the real hardware
> queue:
>
> - After a successful steer from queue A to queue B, packets still in
>   flight on A go through set_rps_cpu() again and hit:
>
>                 if (hash !=3D READ_ONCE(tmp_rflow->hash) ||
>                     next_cpu =3D=3D tmp_cpu)
>                         goto out;
>
>   This records next_cpu (LLC X) in A's slot, but A's IRQ may be in LLC
>   Y. Two later cases then hit the new skip, with the application on
>   another CPU in LLC X. One is a flow whose hash collides with that slot
>   and which RSS delivers on A. The other is the original flow coming
>   back on A after rps_may_expire_flow() let the driver drop its rule.
>   No failure is needed for this to happen.
>
> - The existing goto out paths still record next_cpu without moving the
>   hardware queue. These are ndo_rx_flow_steer() returning rc < 0 (for
>   example -ENOMEM, -EPERM or -EPROTONOSUPPORT from
>   mlx5e_rx_flow_steer()), a target queue with no flow table, and an
>   active colliding filter. Before this patch the next migration retried
>   the steer. With the sysctl on, migrations within the same LLC never
>   retry.
>
> - irqbalance or an admin moves queue A's IRQ to another LLC. cpu_rmap
>   gets updated, but the skip happens before cpu_rmap is consulted.
>
> - A driver drops all of its hardware rules without touching
>   rps_dev_flow, for example mlx5e_arfs_disable()->arfs_del_rules().
>
> In each case NAPI would process the packets on a remote LLC, and they
> would then go through the RPS backlog to the application's CPU with an
> IPI.
>
> This also seems to conflict with the new text in
> Documentation/networking/scaling.rst, and with the similar wording in the
> commit message:
>
>   "since the application's cache locality is preserved either way"
>
> The reported ~99% drop in mlx5e_rx_flow_steer calls cannot tell avoided
> redundant updates apart from steering that is wrongly suppressed.
>
> Would it be more accurate to compare next_cpu with the CPU servicing the
> arrival queue instead of the previously recorded rflow->cpu? For example,
> that could be smp_processor_id() for non-threaded NAPI, or the CPU tied
> to the queue from skb_get_rx_queue(skb).
>
> >               rxq_index =3D cpu_rmap_lookup_index(dev->rx_cpu_rmap, nex=
t_cpu);
> >               if (rxq_index =3D=3D skb_get_rx_queue(skb))
> >                       goto out;

The scenario walkthrough was very helpful, and the issue is real.
I will add a READ_ONCE(rflow->filter) !=3D RPS_NO_FILTER check to
set_rps_cpu() in the next revision:

if (static_branch_unlikely(&arfs_llc_affinity) &&
   old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
   cpus_share_cache(old_cpu, next_cpu) &&
+   READ_ONCE(rflow->filter) !=3D RPS_NO_FILTER)
goto out;

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261109030042.2956-1-nashuiliang%40gmail.com

pw-bot: cr
