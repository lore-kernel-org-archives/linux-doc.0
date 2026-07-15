Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FD4480329
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128519; cv=pass; b=bZ2XN9ms5hE+HnBASFJwaqx1JUW4MA3Yu4cZzprnDD9sobFefbqNwHuYQ2ZhWbl9/vXu4hKyRTuuyxfdLzOs5RA74+8OOs74gYDj3F/i041gTyxKDXGmdUkTzxdSE++68Jyvo4tqlHEY1kzqxI8bLnexSHnBeQXRHA5JXnbuAIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128519; c=relaxed/simple;
	bh=OUTXSX+lSXgQC+RbyMDytvpC02+WTYqj19H6q2tMUYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFB+f85k2aJy7KZB+Ue65tChasT5ESO8fjNLH9CA9uBG9f8jKabqWMuT7EG9HnB2fhBmBHRJU9ZdypyGHUoBGEhRRV8Z2B06FrC+LDeeHOCsYpZ8FP1iFbNOFRGJ7vfzU+/yzcJxxCS9hP/pAqRYhiAZDyUKWOpIZ9NM6395gX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rZ6SKty3; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rZ6SKty3"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c2c8f43aaso50817161cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 08:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784128516; cv=none;
        d=google.com; s=arc-20260327;
        b=mRevnJ63sXnJg9dTGgCWhmYxMIAGRf5TRJGFLzzli7pWYOzAanOVpRLd0TPZOnHBz6
         agNmp+aN8xGfwEbUYQqQyI76oxrWedAbVIBaIjwq7dq6yWcEXzgKg0Acl4kt64ISy6Jy
         pCcG/6WvV7/i+CgBlp5j7/MgxwbFA0WQn2dzYKIu+Vjym2H8tlQjdaTHnKZkmY54UD50
         vtOPRAHjI5QX0tVuzWRt6Ew9ja9Gyd5mCkwKsJaxrgM974yhxe9wouswGL1Gnzv5cbVb
         rbe4smjzWgokZqILnbELLL5M48L5ReC/qU+9sNFIEHfOMjmLz+Kbs9WKnUVT2gQnIx0w
         dN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fDyrrSxcj7rtIejRVGuAd2Roq1d58oTNUDBS9G80Q1g=;
        fh=+PyiXbACsqbhBKQyVJU1lHS7jD+0E+euxgPwIeypZe0=;
        b=nkvh+s6LgrlCR8nW0Jy564O3uGHpL4eQfSezPJgzTHs+EICTNIXlGcbJ8sVQ39xC9D
         5WuJ0caMED6FNQPO7JXpMzR+hhisfC5MRYxb1R0ESi3i0Al4YvSClBYks1+450iDMocE
         98dsNLvBDajWBVNQbJZVZ6FdG0PO9HhCDXpd9X8A5YbasbMryIyYizx7KlEQyy6FGLRZ
         jXSwY7Z4FuRMHhKfLb0yfzdAzZ8m0hioGpFJLVB0beDkzITIH4eMV7qUtEXzOKNKp7uD
         rRnytqINiDC7qFYZum3I/j6/cWMI2zPyRAk8Nlr4G3uvQZMN8bFM/AvWKdgJ//xsB325
         qB/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784128516; x=1784733316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fDyrrSxcj7rtIejRVGuAd2Roq1d58oTNUDBS9G80Q1g=;
        b=rZ6SKty3MOx/KXZbp5gDwCKztwqEPcTPCKFaT47wOpyGoGxM5MF+TGfSENC+E04vmC
         MJW+OKwvtniOkujPcpv4bRyyrX5dEiesfctEhZYJ921XvnCVgEhU4ha1aYeQpDOZp1Dq
         FV3X8Cp/5V553apsWHlwtPut7rbHVVSaBYYVpDEw9J8//ZFsnEbzkANUKtX+gtRhB1th
         16IGzjrNoi75Qt7ApHNV6OWdt7yxKONdmYxYYmMBYRQof6iz4mHGMpM62st2098FlIHG
         TuCLwVFn4nQXVzWL6i4gSSlT19UtsSCBf2YSfW8D7Mwe6Ji56TbCPGhuNA3NStyWe8o/
         CEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128516; x=1784733316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDyrrSxcj7rtIejRVGuAd2Roq1d58oTNUDBS9G80Q1g=;
        b=rnsZQCM3MQhOg3aSMgRBfhiH5z2dUEUH1+jktll0ruU3LTRfcPdM3zqFNjDwA3s9NQ
         uheOLODsIbp3nwy1B/AfuTQ79qg/91d9wz5oRu/6x/OqBSqoqnP8kXfpZxHBuKa/94CM
         p6vUbKCTGZffQOdLk1aen6CDSf4irZIfHWnHM1j5nlSzL+Nv5Q07n8zkoDQEJuFSIlkx
         XsSljyZ0uQmxqNS1dRzwno9BbOFDjKdu6TSmKhnuarimU+E9ZQSx1bb7ZdIHDvIfxWqI
         4//TPpeDYXrbb8WrpSEXKx1eEmtqF7iqw7lpEWp3C6mF7DpO2Cmh4sqoZ8vEDglJrUCr
         2Lzw==
X-Forwarded-Encrypted: i=1; AHgh+RruQdLcjXj6mwZeyaAek+DMHM7PGpX41GbukGLN2sbU7720bQPHlZEUY+kbYNoBAvvFrGBKbGTv1S8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1IHC9xmXjqS5w+buDaGQI2dnHPpR2dj9IbkultXSJp3y1GXLL
	sSiMeKONGrPvtWETIXz43688rPy9dw9bXn2qWcdFSu3o6Tvzmiet7T9bm9Q2pK54LGCs2lah/aS
	YKEe0JrGy62cWe1lhHnrCR0LNp0RLRs+PR++Z65Hk
X-Gm-Gg: AfdE7clbKnu0QXiZ6WeFlWiP86rnR2hzc6qX3Se1D/7UAwNDY6a9iufauz2PmGA8nzt
	mzv7GJQiNfmvz91uxJ/5h8kgpVoTP+YfBDhWZiE14CiQBGjA2006UDQg0g3qn1gCpAoPj1ZdEl8
	zdbl8J8PwEZkweY4GEwxH6we6M2shONiI15puU5GsB2XuWBJp2ZZNJOh012yGiKLnD33NDmaPs+
	vwx4q7FjVKQ20AHCngZWrcS45mYJul4qHhLygRDTMzc/oHYC+8tJh2twuzQUMutel6Kyawcutxx
	a+zzn7qUej/uMFj93J0TRvjici9YAXyWt0aGN/ZKICbi3Ezzff0GvkamQoGaPbEWkq75n/zoFhO
	Ck1/Vb5DbvrM=
X-Received: by 2002:a05:622a:2514:b0:51c:7b12:6003 with SMTP id
 d75a77b69052e-51e4f22ecdfmr34206701cf.79.1784128515013; Wed, 15 Jul 2026
 08:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715145328.54597-1-leon.hwang@linux.dev> <20260715145328.54597-2-leon.hwang@linux.dev>
In-Reply-To: <20260715145328.54597-2-leon.hwang@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 15 Jul 2026 17:15:02 +0200
X-Gm-Features: AUfX_mxxB7Djp0wPxeKZ-ZG0_30XGdwJZp5Wpwm5blIXaGk4QCOzAfglh01pNkU
Message-ID: <CANn89iLyeAPNV2VHTM3w0-zpzjZNFy3aJDsVUERYyniLN4ub7A@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v2 1/2] tcp: Add net.ipv4.tcp_purge_receive_queue
 sysctl
To: Leon Hwang <leon.hwang@linux.dev>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Yung Chih Su <yuuchihsu@gmail.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Lance Yang <lance.yang@linux.dev>, Jiayuan Chen <jiayuan.chen@linux.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 4:54=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Introduce a new sysctl knob, net.ipv4.tcp_purge_receive_queue, to
> address an unreleased SKBs issue related to TCP sockets.
>
> Issue:
> When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
> current implementation does not clear the socket's receive queue. This
> causes SKBs in the queue to remain allocated until the socket is
> explicitly closed by the application. As a consequence:
>
> 1. The page pool pages held by these SKBs are not released.
> 2. The associated page pool cannot be freed.
>
> RFC 9293 Section 3.10.7.4 specifies that when a RST is received in
> CLOSE_WAIT state, "all segment queues should be flushed." However, the
> current implementation does not flush the receive queue.
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
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  Documentation/networking/ip-sysctl.rst        | 18 +++++++++++++++
>  .../net_cachelines/netns_ipv4_sysctl.rst      |  1 +
>  include/net/netns/ipv4.h                      |  1 +
>  net/ipv4/sysctl_net_ipv4.c                    |  9 ++++++++
>  net/ipv4/tcp_input.c                          | 22 +++++++++++++++++++
>  5 files changed, 51 insertions(+)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index 208f46967ee5..abbee0326f15 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -1448,6 +1448,24 @@ tcp_rto_max_ms - INTEGER
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
> index 3dc03bff739e..2945de40ad78 100644
> --- a/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> +++ b/Documentation/networking/net_cachelines/netns_ipv4_sysctl.rst
> @@ -126,6 +126,7 @@ unsigned_long                   sysctl_tcp_comp_sack_=
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
> index cb7f8bf15671..ab9b92807d9f 100644
> --- a/include/net/netns/ipv4.h
> +++ b/include/net/netns/ipv4.h
> @@ -222,6 +222,7 @@ struct netns_ipv4 {
>         u8 sysctl_tcp_nometrics_save;
>         u8 sysctl_tcp_no_ssthresh_metrics_save;
>         u8 sysctl_tcp_workaround_signed_windows;
> +       u8 sysctl_tcp_purge_receive_queue;
>         int sysctl_tcp_challenge_ack_limit;
>         u8 sysctl_tcp_min_tso_segs;
>         u8 sysctl_tcp_reflect_tos;
> diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> index ca1180dba1de..82412fd98e0e 100644
> --- a/net/ipv4/sysctl_net_ipv4.c
> +++ b/net/ipv4/sysctl_net_ipv4.c
> @@ -1652,6 +1652,15 @@ static struct ctl_table ipv4_net_table[] =3D {
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
> index 61045a8886e4..4f1027173e95 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int err)
>  /* When we get a reset we do this. */
>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
>  {
> +       const struct net *net =3D sock_net(sk);
>         int err;
>
>         trace_tcp_receive_reset(sk);
> @@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff *sk=
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
> +               if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_receive=
_queue))) {
> +                       struct tcp_sock *tp =3D tcp_sk(sk);
> +
> +                       skb_queue_purge(&sk->sk_receive_queue);
> +                       WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
> +                       WRITE_ONCE(tp->urg_data, 0);
> +                       sk_set_peek_off(sk, -1);
> +               }
>                 err =3D EPIPE;
>                 break;
>         case TCP_CLOSE:
> --
> 2.55.0
>

My thoughts are:

out_of_order_queue has been forgotten. skbs could be there and still
'block devmem'

WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
read() will return 0, instead of -1 (errno =3D EPIPE or ECONNRESET)
So the application will not know a RST was received :/

I think that BSD and linux implementations have historically retained
acknowledged,
buffered receive data upon RST to allow applications to drain data
already ACKed prior to the reset.

Adding a narrow sysctl specifically for CLOSE_WAIT creates
inconsistent behavior across TCP states.

Thanks.
