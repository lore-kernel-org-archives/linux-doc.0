Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C455A32B985
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528233; cv=pass; b=WHQTy8leR/4k22yUmVIEkSvckxZue2nicvLJqezS90qWmPYCT9zZK8m6cmytcCQUCvuGcKaVS1c8lnKG9zVYte+6KtcXPdWCxHRqM8phAhkqdLWjWRdsxs+KOo/7vQQLVmMpWYi3QfS9sb6aONRgkQZF/Vf7y5Z3VQpxHDlUbP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528233; c=relaxed/simple;
	bh=Cgl644R0lyUsT2xkwxUSIa/Gdcq1apzky0Z2b8gnznQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqOPgyHWsnV8M+tQOzrOM5oupJJMu30CVVVyJUDTEBIBJWxvpjjLfY7T6sIx3x68SiTDZ8Mr3pvsY+PnFY7CQ8v6QpblLBVXV/Rm9qXQ3XV9tPKQFgVHIpL/gJLPfamVrl4WadhMKLW/YPIXV4OQGNqMVFqzyXOZ1AvcsbemRpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OxoqPCSo; arc=pass smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OxoqPCSo"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb3b3e643dso316830685a.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 00:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772528231; cv=none;
        d=google.com; s=arc-20240605;
        b=KDUC83qeWodD+EoGOFJ5yjXSq0SDKlp1GTq2hrbKg6HQAPHvjeT9GjCI+N8tK9PhIH
         oDvRwJeKETjYwm7HYtU6ehr1evv1XkK5qLP337nDYvMiznJu8hOzFrnDcZh1DYuH7nTH
         R1FkP5XHeeUGxwHsuV6Xoq5ZxL2CQ8FTtGA3AZm1Z2VNHznNJ6aVtrUT0m6k+630qRZO
         WCSAlTk9S3uWbZhGQiFTZ7VE3yWrsD7OSPcs03+wrYBq5nFGDsMTYtEKRxb2mFdXhtNK
         bEA/Wpcd4HcI8fb0SMJE5Fy9XC7XrNTQCGG8piPAZqjcea5wRvDGVq9mh1IMWDZDoKza
         j6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cgl644R0lyUsT2xkwxUSIa/Gdcq1apzky0Z2b8gnznQ=;
        fh=Sx4uXc4ns8nE1shli86YvrzkBurdow8lLQa9MHPGLtU=;
        b=TYZNqa5TYK4OCNWGUGWo4st1i2R2PyGBkm0Kpa2+bVdwgXMMgTfKquEzAnUZZrJB9e
         uJaQ/zBX9Ah4si77E6lXxAy+7BCd+PPpMynccUmEQcci6L1oJQ6ELngYv6SdBLtd4viV
         HAdy4KS7/79t7/KHSvMSFQHI7npPohQNrCmxbvHSoTfla18kQftQOEi5nB9p7L0zaBzs
         mvFZi8w2FpTArE7OUsKTukw8epFLeqK2uuMMLrntWPBqkep7HNvKVspDg6UcswJIHG7Q
         dGv3ZKlO0qmTA9Kit8zTiFjz9Fd1rhkG7BEQR1z1eps5Dw7+DaZEmrcSw2nxDVfWAaNu
         UmNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772528231; x=1773133031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cgl644R0lyUsT2xkwxUSIa/Gdcq1apzky0Z2b8gnznQ=;
        b=OxoqPCSoMBvtHZZJQ1oOwfeNn+dGO4YJUWVT1IWEY48UXZQ9kcTU8TGLxRzids7bkn
         MEMIdBdtyv2R6dGe2C4CjrOkvwEvk20nWKn1dn3p9FXoNdh68rdp4GHMEdIbToUcVnaP
         dPVJqhY1Iie5CV8Y8sDqyjqzwx6d3ScqYXUuu57l41Yf8Bg4ZPwQsLGxn748XUy77PNF
         Gb+XF11I+g0i3TokDudDiiiMbT7HQOi8Fsu7iwdTSLOyTTYIhAufN0KDrQ7KhZsTXkNN
         xOJBVVe0GQqHY4lO7lH396FZ8bRaknVFtx6G0nVZYNdxRTGJXqXVom5wq7hdHHPQCw7v
         eN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528231; x=1773133031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cgl644R0lyUsT2xkwxUSIa/Gdcq1apzky0Z2b8gnznQ=;
        b=IXpbppSoeIMyqxVegDlyUEr6DScaJq+gzKHD5su+7MbUMgLGHth2EyrhQXQeKdQCWa
         ExYg14jPvrw0swkop/QTlv/s5Zt1J7IYW1XYQnS+L2B7BbV+S5igE+t57QH3fLDB6ABO
         YBLsin+0ZQjomuKBjLhFl2qjj5GZgjiwnLTR/E2Pd74Nqs4Og3+GaQE5eGA6x9N3tUCu
         1gOx5KHi5XSKWbQPHJB5YcwSVy0zJ++NGKpTWqHbUJMJszp3OJ2V2kPswKkkUFjs6PJv
         spNwwJ3FPTSI2jM51pbrk9R5mx5hp104ShbzZhyU2cLaGKXuiTV4IlG+UoX2I9SsdtPy
         InoA==
X-Forwarded-Encrypted: i=1; AJvYcCVa1On11Ef1NevJR2gPVSoXMF+coqcDPCXejcVpwMicwiUi6qWXNzkke9nrPe+DDOhmaqzCNyGQDcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHobtbBEasSk2Nzs+oNVRr8tDkS+9yyJvM2NYRMjtO8prKCA0
	ZnUagikgrTku+vXu/eFTw04dZLhWlsdbKjmfVTnT8blgBO3CH467asRZgcylVx9dxihVE3nqdOJ
	+juOiov6/OIro8LD8gP9Vzm0Ej6SKaiTw9/diNGVD
X-Gm-Gg: ATEYQzyJ4FM1gcyg1xCeAaWgX1tqpS7OQ1705znMSzFilnVvnCG9aWOp3p4ztv7g+mp
	HWMi5eEP0oaRUKi/9NnkI+9Ed8wuLx011GiV5FIv65olhRVMPCfMPjlKz7ynfZy2HwlGcrQdMPe
	+TnwAu2X6TjxqvlnL8rU9coiPhS+GWFTbnQV+ucFJOdxfkzqnIqUSbKwpM8QBU5vcLiVq61dugg
	reYnCS8SqGdGqLBZ89CPZUT3shZBXkgxn7Ipu0QLmwZrA1AEFnKFkrj9aVWVOAPRyaljjSwafRU
	bhKL6r4=
X-Received: by 2002:a05:620a:1a86:b0:8cb:4ba9:ccec with SMTP id
 af79cd13be357-8cbc8f52f48mr1953805185a.72.1772528230249; Tue, 03 Mar 2026
 00:57:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225074633.149590-1-leon.huangfu@shopee.com>
 <20260225174354.5a698ddb@kernel.org> <f611be70-8280-44c8-86af-5866c0b302be@linux.dev>
 <20260302162251.733b520e@kernel.org> <3a623176-fc5f-4dd4-bbfc-64d211f53645@linux.dev>
 <CANn89iJ0=Tx0i+1UXEdcoFuk1F_MfP41-L-kgGDTN+RcLTRcFA@mail.gmail.com>
 <d7f3dabd-e6da-496d-927e-590a41dee009@linux.dev> <c582ab1c-8a2d-4c0f-ad7b-7d44fe4296f6@linux.dev>
 <CANn89i+Bt_AZK=16nekvs846P7fPWxkRrNaNNBOrH0sB7xS1uQ@mail.gmail.com> <03144918-eaa8-461e-915d-232e29a52557@linux.dev>
In-Reply-To: <03144918-eaa8-461e-915d-232e29a52557@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 3 Mar 2026 09:56:59 +0100
X-Gm-Features: AaiRm51Y_i_lwcywSBhhMNnPjIXa9H0tNh811NIPvyqXw9flZSlMBnQHPcMSBzc
Message-ID: <CANn89iKt+1Abi_tUWhWGx1n8ywh4-Senq83APjR0qB_E7Py=vg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] tcp: Add net.ipv4.tcp_purge_receive_queue sysctl
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Jakub Kicinski <kuba@kernel.org>, Leon Hwang <leon.huangfu@shopee.com>, netdev@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ij@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, kerneljasonxing@gmail.com, lance.yang@linux.dev, 
	jiayuan.chen@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 9:54=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
>
>
> On 3/3/26 16:17, Eric Dumazet wrote:
> > On Tue, Mar 3, 2026 at 8:55=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev=
> wrote:
> >>
> >>
> >>
> >> On 3/3/26 14:26, Leon Hwang wrote:
> >>>
> >>>
> >>> On 3/3/26 11:55, Eric Dumazet wrote:
> >>>> On Tue, Mar 3, 2026 at 3:12=E2=80=AFAM Leon Hwang <leon.hwang@linux.=
dev> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/3/26 08:22, Jakub Kicinski wrote:
> >>>>>> On Mon, 2 Mar 2026 17:55:59 +0800 Leon Hwang wrote:
> >>>>>>> On 26/2/26 09:43, Jakub Kicinski wrote:
> >>>>>>>> On Wed, 25 Feb 2026 15:46:33 +0800 Leon Hwang wrote:
> >>>>>>>>> Issue:
> >>>>>>>>> When a TCP socket in the CLOSE_WAIT state receives a RST packet=
, the
> >>>>>>>>> current implementation does not clear the socket's receive queu=
e. This
> >>>>>>>>> causes SKBs in the queue to remain allocated until the socket i=
s
> >>>>>>>>> explicitly closed by the application. As a consequence:
> >>>>>>>>>
> >>>>>>>>> 1. The page pool pages held by these SKBs are not released.
> >>>>>>>>
> >>>>>>>> On what kernel version and driver are you observing this?
> >>>>>>>
> >>>>>>> # uname -r
> >>>>>>> 6.19.0-061900-generic
> >>>>>>>
> >>>>>>> # ethtool -i eth0
> >>>>>>> driver: mlx5_core
> >>>>>>> version: 6.19.0-061900-generic
> >>>>>>> firmware-version: 26.43.2566 (MT_0000000531)
> >>>>>>
> >>>>>> Okay... this kernel + driver should just patiently wait for the pa=
ge
> >>>>>> pool to go away.
> >>>>>>
> >>>>>> What is the actual, end user problem that you're trying to solve?
> >>>>>> A few kB of data waiting to be freed is not a huge problem..
> >>>>>
> >>>>> Yes, it is not a huge problem.
> >>>>>
> >>>>> The actual end-user issue was discussed in
> >>>>> "page_pool: Add page_pool_release_stalled tracepoint" [1].
> >>>>>
> >>>>> I think it would be useful to provide a way for SREs to purge the
> >>>>> receive queue when CLOSE_WAIT TCP sockets receive RST packets. If t=
he
> >>>>> NIC, e.g., Mellanox, flaps, the underlying page pool and pages can =
be
> >>>>> released at the same time.
> >>>>>
> >>>>> Links:
> >>>>> [1]
> >>>>> https://lore.kernel.org/netdev/b676baa0-2044-4a74-900d-f471620f2896=
@linux.dev/
> >>>>
> >>>> Perhaps SRE could use this in an emergency?
> >>>>
> >>>> ss -t -a state close-wait -K
> >>>
> >>> This ss command is acceptable in an emergency.
> >>>
> >>
> >> However, once a CLOSE_WAIT TCP socket receives an RST packet, it
> >> transitions to the CLOSE state. A socket in the CLOSE state cannot be
> >> killed using the ss approach.
> >>
> >> The SKBs remain in the receive queue of the CLOSE socket until it is
> >> closed by the user-space application.
> >
> > Why user-space application does not drain the receive queue ?
> >
> > Is there a missing EPOLLIN or something ?
>
> The user-space application uses a TCP connection pool. It establishes
> several TCP connections at startup and keeps them in the pool.
>
> However, the application does not always drain their receive queues.
> Instead, it selects one connection from the pool using a hash algorithm
> for communication with the TCP server. When it attempts to write data
> through a socket in the CLOSE state, it receives -EPIPE and then closes
> it. As a result, TCP connections whose underlying socket state is CLOSE
> may retain an SKB in their receive queues if they are not selected for
> communication.
>
> I proposed a solution to address this issue: close the TCP connection if
> the underlying sk_err is non-zero.

Okay, makes sense to fix the root cause. Applications can be fixed in
a matter of hours,
while kernels can stick to hosts for years.
