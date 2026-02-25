Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426E2701BB
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772008326; cv=pass; b=sSRQ7S3SOkBNllh6FEdlm1B5YXN+qWuVP4MWCvVn5wLkabSkg8NFDZWs5my5lB31yxcwtxBZ6DqW88OA9bru54YNZMeJoenH3cbPVFKZ4Q9gZPTjZvspkx3Wu6wloBNKvHebC4E9DEKS6B4gJIYjkAWpTFRCywPlvv34KSBqg/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772008326; c=relaxed/simple;
	bh=H7uGJhCUP5kAxxAKcldXorPp/nEFUtCx4oLDvpDZZNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tBIRYIq5JCm0pCD6GLhcoZH7iIVds3Q4FCG18hXpHsmOR4ZeQT1Xv3jvn1jdPGceB6sopK9zW+EHx78NgES/FnM4BGNEe/Zy3h++9mBMdrjNwUUYpyaW7VujORuMNpscDYMGMpHyncPBp4L7ClwC5aD+4z0M8me8vHhBNqn0gDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SRdCuvmr; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SRdCuvmr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-897023602b1so74710376d6.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 00:32:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772008324; cv=none;
        d=google.com; s=arc-20240605;
        b=U7cmWWNW7WKNpSizVeAdZi27fE3OYfsmnomLnfcUpFM4qQR5GbNkrwyRIl3bxuKOKX
         QntQqF9VMudC21Wu0PjiYPw1qoLSpplDa8xsWfIJG8fwxT2XQ4PqwBONc9B2LaWuDnKC
         7n3P32292LWKKP4/Uw/I5IwmZUIwa3CD7PGmf8P1c8vIn6Bk3e5Pup7OKXCT9ggX0B5t
         n0PQaq7o+EFxtifJI2XFsxfp96dJLicrbaz/CZTzaaWVoyoK75KRMeWLgF3Dx1dsFQRl
         PLK4eTJ91ThjQdpLnpxhKLs9wj0YHLcFJDC3O1QGBysPU/xx8j2qVu9e87dqi4S4PQOf
         OQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7siYQD1xuhDtkoxAw0gYhYQmKcVAnP64qM/iLy57RI=;
        fh=BfjWYzLy0lCux2t0pq9T+VqfZ8w484wQdo5F8TzIhPc=;
        b=LQYlMrkLAx1TnReYPg+tWypGwDYXmMddzUICE/J3PkfHuZlyz8Bn+gpsgkNwB1jJQq
         QTbcY3etClZ8G8sxokS8xg2Crzqc4fahy6r4cjYOjjU+CWRql2MwFubDXyPjdMBkrsNn
         FORrGgAKu1jVHqnysNvy6xo6Y+N/khdeSopercHOuxkjHIHDtWXsu1YIU/I2gEz930Q+
         ta9+co8hjIJdX2SV0jGveYkDgoPadIzQ/m4ru/6VCmZxBZlOK7F6JbLvNCiTfsaFU45s
         ttcWCdEKUsYnCj7Ia3JjGJWsbs77shngqGgz3F0WQEtSsnwLX1p8x6019Fw3sepZsOsk
         khHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772008324; x=1772613124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7siYQD1xuhDtkoxAw0gYhYQmKcVAnP64qM/iLy57RI=;
        b=SRdCuvmrEl9DIJZDZMHtNq42EJgXfeU0dqOYgy+GDevT2AbOlZn0u3n42kK8f5EgEH
         +8KOm6A7umVJRH4LEdfEh987Ngggq+IhdYJQUkPPNa0mUpSJ/wAZDwD3O/oWp5qfkZEw
         iSRzIlVWGGm7L55tOeZPe3U38J9PVMMHTuIeOFm61kxMCUAISGWy9Tv2gZqwlV8Xz9Z2
         YtPV+416FFz5JxoCrvExqEdWGLQ6/pDFKEZdel6nB1tCjuLjy7qdzBLV+2IRhh5xcxKc
         lHWDmGN8z+tMDE1egbLral70BBTxO2WMr9/TbSk9MhrjM62ItdRX0Bd6Iz8nEvmF773E
         SIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772008324; x=1772613124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D7siYQD1xuhDtkoxAw0gYhYQmKcVAnP64qM/iLy57RI=;
        b=k9YG8dYwUiYTQ1dtYS48bPOL8G1CENH0CGXnMCSfMH53fhb93hMBF8fHOWyIfWpcuX
         p8jeAuvPpUxzeSWKQqMmRYy3Hw1b+IVb30BIz+vWfN+KUsYQEAOSmP+N6l1IAcLLFlX9
         AAzB7zgyNRXeGhWH2r5RTT5tp4oNCar9HW/FaB4xkQkmT8F4UlAgLfRSK0STcZAMoMtG
         WoXDTlwri6t+A489YehjANpln0Ow3p2EjFoRwiL13w/l9njmuuihAGKWcE2QFO4PRbNW
         sf+kBaZMv95/uUKf+0W9qGW448mlrlLrGNJIL7H3TbYrJ+aaj/6542Uw5ViiyiWBtqiL
         gwEg==
X-Forwarded-Encrypted: i=1; AJvYcCVLxCN4zjM0e1qMzM2AHUic467Aq26hotYdxayxw7kx2LBIyUJoaStLxNcWCaiIYINQ/OvkejpVCfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyy6+ITzr5aPtQMbQpK03kkvNpuoW1PQgLSe34wVZQ5pol4GKO
	HUtvgVkYOMgAs7I+QVhCSAy/kbf8C+AFhN3ZsHFwJO95/FqdkmI8Zw52taHLNs1X68t5MY/B3Ou
	9VFg0+aQ/rGxtcdFdUE6x0aqLmSc8Bget4Kk3navE
X-Gm-Gg: ATEYQzwyv99aOjTOIcOc2jyLE7Hb3DFhTL/wyzJCorNp2CGa7B2nC8rxH1HLkav0Mgq
	1FM7IlYAEOgwyCosgMaYs181nPy+RfosOcM7ZQdc/iAqD9BG7yRo9D3MfdbK0u7xltsBJHoLZsR
	rsbURZufgf04MthV9ebnPrKkoZBvDgXgKsSAmAZQTpDVJbCbpmeg0qPmuaPMM/qUcG8ZpJ+ggZp
	b/FyXQ+l0x/nO2kNmo2hyfDCha1LXlI0g0REmwY1Jit14/Va6B+6Hsvq6QHKwF2IacTRmjxYi6x
	zaaJ/oQ7UhzjejHLAXUkb52GjnUmOS8ooNec0qfARgT6GwSTKlF4
X-Received: by 2002:ac8:5a50:0:b0:4f4:de66:5901 with SMTP id
 d75a77b69052e-5070bba49demr211968151cf.5.1772008323553; Wed, 25 Feb 2026
 00:32:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225074633.149590-1-leon.huangfu@shopee.com>
In-Reply-To: <20260225074633.149590-1-leon.huangfu@shopee.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 25 Feb 2026 09:31:53 +0100
X-Gm-Features: AaiRm507EGOddch-kDNSzMHFchJtTr1oj0fZFTjVzjHQ2BHh-bU1RsoVageww8g
Message-ID: <CANn89i+RZtN0wcyBUxKf83pkcbH4=nN_Cpc62tNwwS8T-LQR2A@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
To: Leon Hwang <leon.huangfu@shopee.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, kerneljasonxing@gmail.com, lance.yang@linux.dev, 
	jiayuan.chen@linux.dev, Leon Hwang <leon.hwang@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 8:46=E2=80=AFAM Leon Hwang <leon.huangfu@shopee.com=
> wrote:
>
> Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
> address a memory leak scenario related to TCP sockets.

We use the term "memory leak" for a persistent loss of memory (until reboot=
)

Lets not abuse it and confuse various AI/human agents which will
declare emergency situations
caused by an inexistent fatal error.

>
> Issue:
> When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
> current implementation does not clear the socket's receive queue. This
> causes SKBs in the queue to remain allocated until the socket is
> explicitly closed by the application. As a consequence:
>
> 1. The page pool pages held by these SKBs are not released.

This situation also applies for normal TCP_ESTABLISHED sockets, when
applications
do not drain the receive queue.

As long the application has not called close(), kernel should not
assume the application
will _not_ read the data that was received.


> 2. The associated page pool cannot be freed.
>
> RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
> CLOSE_WAIT state, "all segment queues should be flushed." However, the
> current implementation does not flush the receive queue.

Some buggy stacks send RST anyway after FIN. I think that forcingly
purging good data
received before the RST would add many surprises.

>
> Solution:
> Add a per-namespace sysctl (net.ipv4.tcp_purge_receive_queue) that,
> when enabled, causes the kernel to purge the receive queue when a RST
> packet is received in CLOSE_WAIT state. This allows immediate release
> of SKBs and their associated memory resources.
>
> The feature is disabled by default to maintain backward compatibility
> with existing behavior.
>
> Signed-off-by: Leon Hwang <leon.huangfu@shopee.com>
> ---
>  Documentation/networking/ip-sysctl.rst         | 18 ++++++++++++++++++
>  .../net_cachelines/netns_ipv4_sysctl.rst       |  1 +
>  include/net/netns/ipv4.h                       |  1 +
>  net/ipv4/sysctl_net_ipv4.c                     |  9 +++++++++
>  net/ipv4/tcp_input.c                           | 16 ++++++++++++++++
>  5 files changed, 45 insertions(+)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index d1eeb5323af0..71a529462baa 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -1441,6 +1441,24 @@ tcp_rto_max_ms - INTEGER
>
>         Default: 120,000
>
> +tcp_purge_receive_queue - BOOLEAN
> +       When a socket in the TCP_CLOSE_WAIT state receives a RST packet, =
the
> +       default behavior is to not clear its receive queue.  As a result,
> +       any SKBs in the queue are not freed until the socket is closed.
> +       Consequently, the pages held by these SKBs are not released, whic=
h
> +       can also prevent the associated page pool from being freed.
> +
> +       If enabled, the receive queue is purged upon receiving the RST,
> +       allowing the SKBs and their associated memory to be released
> +       promptly.
> +
> +       Possible values:
> +
> +       - 0 (disabled)
> +       - 1 (enabled)
> +
> +       Default: 0 (disabled)
> +
>  UDP variables
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rs=
t b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> index beaf1880a19b..f2c42e7d84a9 100644
> --- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> +++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> @@ -123,6 +123,7 @@ unsigned_long                   sysctl_tcp_comp_sack_=
delay_ns
>  unsigned_long                   sysctl_tcp_comp_sack_slack_ns           =
                                             __tcp_ack_snd_check
>  int                             sysctl_max_syn_backlog
>  int                             sysctl_tcp_fastopen
> +u8                              sysctl_tcp_purge_receive_queue
>  struct_tcp_congestion_ops       tcp_congestion_control                  =
                                             init_cc
>  struct_tcp_fastopen_context     tcp_fastopen_ctx
>  unsigned_int                    sysctl_tcp_fastopen_blackhole_timeout
> diff --git a/include/net/netns/ipv4.h b/include/net/netns/ipv4.h
> index 8e971c7bf164..ab973f30f502 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -220,6 +220,7 @@ struct netns_ipv4 {
>         u8 sysctl_tcp_nometrics_save;
>         u8 sysctl_tcp_no_ssthresh_metrics_save;
>         u8 sysctl_tcp_workaround_signed_windows;
> +       u8 sysctl_tcp_purge_receive_queue;
>         int sysctl_tcp_challenge_ack_limit;
>         u8 sysctl_tcp_min_tso_segs;
>         u8 sysctl_tcp_reflect_tos;
> diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> index 643763bc2142..da30970bb5d5 100644
> --- a/net/ipv4/sysctl_net_ipv4.c
> +++ b/net/ipv4/sysctl_net_ipv4.c
> @@ -1641,6 +1641,15 @@ static struct ctl_table ipv4_net_table[] =3D {
>                 .extra1         =3D SYSCTL_ONE_THOUSAND,
>                 .extra2         =3D &tcp_rto_max_max,
>         },
> +       {
> +               .procname       =3D "tcp_purge_receive_queue",
> +               .data           =3D &init_net.ipv4.sysctl_tcp_purge_recei=
ve_queue,
> +               .maxlen         =3D sizeof(u8),
> +               .mode           =3D 0644,
> +               .proc_handler   =3D proc_dou8vec_minmax,
> +               .extra1         =3D SYSCTL_ZERO,
> +               .extra2         =3D SYSCTL_ONE,
> +       },
>  };
>
>  static __net_init int ipv4_sysctl_init_net(struct net *net)
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 6c3f1d031444..43f32fb5831d 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4895,6 +4895,7 @@ EXPORT_IPV6_MOD(tcp_done_with_error);
>  /* When we get a reset we do this. */
>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
>  {
> +       const struct net *net =3D sock_net(sk);
>         int err;
>
>         trace_tcp_receive_reset(sk);
> @@ -4911,6 +4912,21 @@ void tcp_reset(struct sock *sk, struct sk_buff *sk=
b)
>                 err =3D ECONNREFUSED;
>                 break;
>         case TCP_CLOSE_WAIT:
> +               /* RFC9293 3.10.7.4. Other States
> +                *   Second, check the RST bit:
> +                *     CLOSE-WAIT STATE
> +                *
> +                * If the RST bit is set, then any outstanding RECEIVEs a=
nd
> +                * SEND should receive "reset" responses.  All segment qu=
eues
> +                * should be flushed.  Users should also receive an unsol=
icited
> +                * general "connection reset" signal.  Enter the CLOSED s=
tate,
> +                * delete the TCB, and return.
> +                *
> +                * If net.ipv4.tcp_purge_receive_queue is enabled,
> +                * sk_receive_queue will be flushed too.
> +                */
> +               if (unlikely(net->ipv4.sysctl_tcp_purge_receive_queue))
> +                       skb_queue_purge(&sk->sk_receive_queue);
>                 err =3D EPIPE;
>                 break;
>         case TCP_CLOSE:
> --
> 2.52.0
>

Please prepare a packetdrill test.
