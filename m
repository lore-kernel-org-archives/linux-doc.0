Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94916481FAC
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129457; cv=pass; b=EfV3FJu/dmAr3d4tJTD3cR8z9w24MV2dM753tR2krUQyP4XU/OSsLq4Rde/cQaM851JnaUVPx5Ab1Yf6wmH71FB0pBgRbzzGPimTZQv2JNn1lLiDoIis9VVMJqLEsHHTNg7c4rKfroxT4nr55lRNFkylxQ+YngfobiFUabFxlNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129457; c=relaxed/simple;
	bh=a5mdkI2L/Dbv1+W+Y3MrrreSzCjtlRhjsUjoxEMa4d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIAH0yksvZ4ncjhNlcFW5D46nUthcKG59M7GxLLcScU34QJnXVhVpYxc3nad+/KnZf410VJkYoFetjMx1FObI+Sp7+abU0rXAMg8F+iU25yaNJMb5wPpTIdaR9ZlvfOUKyYN5Bl4NxWgnuvtiYchdFu6p8INzvMFH4lvFZFNmYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GjUE6tbg; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GjUE6tbg"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c4436d02cso12488061cf.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 08:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784129455; cv=none;
        d=google.com; s=arc-20260327;
        b=SWrOgvok9DEaxPrsvnyiO13Sgvjjl/VpyBZOrDULWjWFHYBWDsAuAU+O0ix9QTAylf
         9QI0dWLTyJMP8tajYp5XbVSdLMM/x2lvcoSqbqkwE86nN92THPlB8iwHMp6/d8eTd5CM
         PClIP2mysafOUzKIUBWFWjRNPqVAIXob+owXQO/CiXrcB5bLlUVyZNN7xqCUUO5zPGqM
         4RgYvglnwj39+e1cbJiStp+Gv2A4YKBFPRiwT7kabkcfvviUzGdHw+RvuUei031w7MvY
         dVsxSiS2FnhPFGIsVwhq0aqJLdn/u/JSX6o2B7vWii+D8377WKSJDIJFal3aDqHjj7j2
         jYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        fh=fbx5Dd5jF+jbfOhs9DqUZv7/3RCQ/XhgGPln/+9d8MU=;
        b=EPvIEZwhS9zvzQQHo+mSkQq5m1CM1zGBWDfEvE+RJ4CD/Bl9LwOOYtEF+CvjQw+V/g
         Wyb7ctjFo4ZhLkNju/ows/7t1LCJqLqbWrX7twr+nmHrpPf7NfoM/XlTqwglxlfSpr6u
         xiox4DEWYTtoHPbUCyUqZAPpQ26uFYN4VZZ0QN7wnPgFPjl0MxH6tbEJ45XZ39AcLB0x
         yTY3euLBZNB5Xvj9G4EUbf3fpMbhulNWTaLzVaH6CUzd+ZPXLdN+MdOKB/d4MmpIRz3Y
         3LJm4mLsgEubDYiLvqJ8slXfw8nLOHsD2bIniFB4sN8lmnI/bgWPBs5KIkulVG9MSRZk
         fNmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784129455; x=1784734255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        b=GjUE6tbgbT2Hkcfw0dBf/5UofFGepCe42xgmVkId76Zr+MznRP9n1bBXQdmvCIBwIr
         FljnRbA7+BQ3CVvbTMNLm3wCGxMr2WwIAPbWBVJD6GL4/7P2ww2LEVBJ6DVAbIcAJ2di
         9u10bdgzTvWxYVf+eoUn/GvEhaAmm8wcXUCbmyFrggyZZWam7tO/0dkIJ+PSgX+sEzpg
         IhoyFz0Uno7BjwcPiBl0FbDlZ9vOIjd6QvU5EqR6ulE3PZnODmBY9bRkgfqIjDmzc3Nq
         qWahVUZF645pnPXnYMSoV1wvs22y6cDJY9jyBn2BbJDGZm6Y5Pi7vUmykEsOZMVeD0IJ
         bAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784129455; x=1784734255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVV2ZbfQNvN6Fg6uxe70CkyOoUGkDw0WBSeQAqc4p6s=;
        b=lss925zFy+bo8MTaIEiGX56HpHyqSaLX0JEUHZ2s6iASwwwzoqfW5ElNtjv5CKC2Qr
         QopswVoatdn+/ilNmIoOaF9LEoKdW/ydvu2RH7P99j2+5Zc9NPrGvBxQGumn302CUj0k
         dHljwDrpo9GlxiFYmX7zxeQyPR4PGw5pwUG0pi5L0H+gWYdMrqajH9NZyduDAnTci+XQ
         vW8mPLpi1efpad28qML2hQvduhl96vWlxeAogFcPoq1XFjfiuat2EZSQQeKDBqY8UiaB
         43AhJnNHwVg7/BgxmQNz7LN+33EVJNPde1ICSucJS+75plV4oUm6rUAsJTf0mUGYeqzh
         b+rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPheN9lGFxUqH6Ah+dnG/ILhYeORgO/ig/Xo1KLtXrX8qZmU+yHuYu84UgyfqMi5xF06ScZuGE0Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vSzTgCPc1k7wHloRK4AbPSiJd2ETI3tNlCe1DL8MMiwjcz5k
	1Bpeh3EvfteUrZP1VG+GO/gagXomn44CnUf3Vb+8D4NXUovpQuElNeSG6AiDtyn++4AFi9raydc
	239VAqCTPMVDdXaILXHd8ICEVB5GKydSGkWRejppy
X-Gm-Gg: AfdE7cnbOurkWKNyfAyD/5NUKS3ZG1rOcSpj0hyB59Q1S7psxDiV1gMNKvnjQSyc1vS
	MCTXA853r8z784F1aMWaVWWbmHOSJId9rCljA+AJvshkH6DEYLR6Bi0FKxsGKhYJThLIraeNbFq
	f2eWJ18a98s3S2wyT7oJ+2m2x34iIZ/O5UFQ/zONLpj8n56vmF9j4LS2+zboTqWJMlb/sfFeM5c
	HVnK3HGrkKbVw5OYorOc00XYi5g4UDd2tbKC6bD7TOvVXmN4sBogDjzPEDriEId2P9vjfehlwuq
	0vuU53wjnidAkg57sU4N/59lHRIjL73n+KB/2pZJyg8V7OF2xN4/dL2spFKgKmNDnKWirQU7+CQ
	F0e0V2mIoTCNvUEbnx523UA==
X-Received: by 2002:a05:622a:55:b0:51c:17cd:1fe8 with SMTP id
 d75a77b69052e-51cbf0e6241mr163158791cf.33.1784129447058; Wed, 15 Jul 2026
 08:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715145328.54597-1-leon.hwang@linux.dev> <20260715145328.54597-2-leon.hwang@linux.dev>
 <CANn89iLyeAPNV2VHTM3w0-zpzjZNFy3aJDsVUERYyniLN4ub7A@mail.gmail.com> <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
In-Reply-To: <2dc3d52b-ce4a-411d-9c30-934318ee98b0@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 15 Jul 2026 17:30:35 +0200
X-Gm-Features: AUfX_mzy7J4tzxjjlmG1HjDmg9aSDxMDxT9_M1uN2gCzgz8_R9SHMTPEMeYAqpY
Message-ID: <CANn89iLV9pyCKU4vyNMzW5FFv4=Xcq_pgvZaFhzJHAAbCK0h7w@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 5:26=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> On 2026/7/15 23:15, Eric Dumazet wrote:
> > On Wed, Jul 15, 2026 at 4:54=E2=80=AFPM Leon Hwang <leon.hwang@linux.de=
v> wrote:
>
> [...]
>
> >> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> >> index 61045a8886e4..4f1027173e95 100644
> >> --- a/net/ipv4/tcp_input.c
> >> +++ b/net/ipv4/tcp_input.c
> >> @@ -4853,6 +4853,7 @@ void tcp_done_with_error(struct sock *sk, int er=
r)
> >>  /* When we get a reset we do this. */
> >>  void tcp_reset(struct sock *sk, struct sk_buff *skb)
> >>  {
> >> +       const struct net *net =3D sock_net(sk);
> >>         int err;
> >>
> >>         trace_tcp_receive_reset(sk);
> >> @@ -4869,6 +4870,27 @@ void tcp_reset(struct sock *sk, struct sk_buff =
*skb)
> >>                 err =3D ECONNREFUSED;
> >>                 break;
> >>         case TCP_CLOSE_WAIT:
> >> +               /* RFC9293 3.10.7.4. Other States
> >> +                *   Second, check the RST bit:
> >> +                *     CLOSE-WAIT STATE
> >> +                *
> >> +                * If the RST bit is set, then any outstanding RECEIVE=
s and
> >> +                * SEND should receive "reset" responses.  All segment=
 queues
> >> +                * should be flushed.  Users should also receive an un=
solicited
> >> +                * general "connection reset" signal.  Enter the CLOSE=
D state,
> >> +                * delete the TCB, and return.
> >> +                *
> >> +                * If net.ipv4.tcp_purge_receive_queue is enabled,
> >> +                * sk_receive_queue will be flushed too.
> >> +                */
> >> +               if (unlikely(READ_ONCE(net->ipv4.sysctl_tcp_purge_rece=
ive_queue))) {
> >> +                       struct tcp_sock *tp =3D tcp_sk(sk);
> >> +
> >> +                       skb_queue_purge(&sk->sk_receive_queue);
> >> +                       WRITE_ONCE(tp->copied_seq, tp->rcv_nxt);
> >> +                       WRITE_ONCE(tp->urg_data, 0);
> >> +                       sk_set_peek_off(sk, -1);
> >> +               }
> >>                 err =3D EPIPE;
> >>                 break;
> >>         case TCP_CLOSE:
> >> --
> >> 2.55.0
> >>
> >
> > My thoughts are:
> >
> > out_of_order_queue has been forgotten. skbs could be there and still
> > 'block devmem'
> >
> > WRITE_ONCE(tp->copied_seq, tp->rcv_nxt) is certainly wrong, because
> > read() will return 0, instead of -1 (errno =3D EPIPE or ECONNRESET)
> > So the application will not know a RST was received :/
> >
> > I think that BSD and linux implementations have historically retained
> > acknowledged,
> > buffered receive data upon RST to allow applications to drain data
> > already ACKed prior to the reset.
> >
> > Adding a narrow sysctl specifically for CLOSE_WAIT creates
> > inconsistent behavior across TCP states.
>
>
> Got it. I won't pursue this sysctl approach in the future. Thanks for
> the review.

My intention was not to kill your proposal, only to start a conversation...
