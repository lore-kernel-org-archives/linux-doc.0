Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D74386577
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 08:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772525878; cv=pass; b=TrTaXdpV56rLsQ7D7aX63e8pLS6ZGeUi8xva9UgtjuOWnUFdBIFw0fo4Q9+9zPNZro8P1KRGkN6rl/W29dradGzdcx3lB6/9Dpd/WDHRlj4OOUlfWq7Eg6IuQtFh5ITGc67yzU1nTVOOpMeTgTzS+kzy0KvSpGOjmEKPq3svf4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772525878; c=relaxed/simple;
	bh=BKP3hrTs/yJMOn+88yvtuxbyUogWcwezmgwIQCpgsU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aswNBD3ts4LMFxBLMbpqb+kDBu2bD5n6wN43OVd1m8y2l5Zzy36GTD/kXVMzF0C8O7GxXUazlq8PUE177WOUCenECCOWm4p/nVc2agITzWj+5tPy6dyjH8Q4uz3zsZJwykJqsCXssnj9TT/3d4zmYyFsv+WCCO/NBQ0syKF7zFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l8h5isQC; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l8h5isQC"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-503347dea84so60590811cf.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 00:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772525867; cv=none;
        d=google.com; s=arc-20240605;
        b=gIAltVuF8RP0frL9LsHM1q3kfPbNJFRWgPCJFFQhua3aV2OKzyZtOYcULeX03LLygx
         x+yEIOrsC8csXgMRtrxEM+pB6j54+suZW/wAzW8o6Kulibc54Qr4r4AXu5RVH18nUS4Q
         K3Os0/vSpSpdjPht0N3bhOexGtAwLXMgSqlF5Yb/ya3W3hdxORrSQQl+WHSzzoT2Oas+
         GtWQgONmxBnzu2GmWeavCSstoN63cxj/mcJJblXmuEXtKMj7FU85cC0Su6EqAuq4WTwo
         Z1qdTP7DS7b/nVh5bSGJhP8AfRaoioshkGeqEwpc9o7FdIOji21EiVO5rVWKAk/V2LkU
         iW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BKP3hrTs/yJMOn+88yvtuxbyUogWcwezmgwIQCpgsU0=;
        fh=ccp+wwOgSQsq0bjdXLMx73AIaMKwy7BvhPAbx4zC/qM=;
        b=Sw6yG7voM8EGoJlhztWr83fozcu3d8Cj4zQ+yrf7UjuIRrCwYuYHvAUD/CwaqekdtZ
         Kci+5UnSqZUP3psWBg0JYSPaK26ZOjcgeQRn8Z5ZSndO4YuUqTjrJzdh/ZT7b865xJCe
         JvvEGfVtlI/U6Mwaz3ReLYWv4HIF5Tt6VOY5JaIui8ldNrnH3PTMurwKmWGtc1/S/ctx
         flZixYuAzknwAGEffE9ShCyY9IDNpXG6tHJ+ZqOHpTAAqIuc4b10y2FKtMpsAds5Z3dX
         EYJymAH/2ADArBQagBPWIulho2TtpPA/n8TGi0Wjorm2fQV5QLRowPjM4viLj2+/lcH/
         l9xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772525867; x=1773130667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKP3hrTs/yJMOn+88yvtuxbyUogWcwezmgwIQCpgsU0=;
        b=l8h5isQC2svVpHaYNHyrVSIJm51TmLPoMS7cXoqojeij0fTIaHljOqfwBiD2TC0lpm
         z4AGvXSCY4sxl30WmLM9r2G10hCPnCp4Eb4YKTH3AV+xJ7iVwJ2wRoaIF7zpqr9CgGeZ
         j6EuGh8VvZ/RcqtwdDKV+bRf+whaSEKfV16+xEiwLkKR46fyJ65aZ9NZyu/zfiaf/VvN
         AiuyAzypWsVXeULOp1aKGJz6ijfgIB3/XbpfOx4Nm/WHKkVjcB5UYtl7nUOMhQqbELHE
         0e79zOL1+1JJNmXO1dpG4IrENLyc/tnpGeihuyJr0FKakAXU/ktV0JCy3jr+ngfrhPrb
         N1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772525867; x=1773130667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKP3hrTs/yJMOn+88yvtuxbyUogWcwezmgwIQCpgsU0=;
        b=ODBzUQajU8+hYtbj2CeSZeZABib8SDIrNEC6hq3Fh6JMWnTS967rIvESapC754QPKH
         L9u+uWd1szgNf6ZNSi5e+gK6NVv55KZFXq0Si3eRWPRYSCiw+YvsPPnYvh9h06f+lZkR
         fDYaTVTHUcBrllV6okLzFVQr5ZSyGYOhnel/YtGm5AJP8dsDLyelKx1pEvg6bJkRt+oG
         hpdcdVJtuKX2d6kmrRir8/wPRPePbCIpHv0vFRsMDGj75b9Ddr9hV9cLYk7vSsxou3r3
         oRiqVkamDBvjBA/DEM9vAYoMrgMp8kcgWSffhfOOvbEVPjfoXmfGhnktZkgC3yg9eqVl
         s8eg==
X-Forwarded-Encrypted: i=1; AJvYcCWOhNh49T6kJxJ8p7FveSXJ4DPRuEXf7ECZb+/plXdQfMUflv4HX6c6j5CsoC3Bsmwjc1/JDHeeRrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w6JF+4tP5uw2Biiwbbt4VJxaoRktMBpGrWd4bJU9mVCNE/9I
	wmG8unn76t8P/B3UCtAgbar4BZwQbXCM+9+HmcNNxDXOc2M5uuRaYlq+5zEySpJq+z5iGUS7Cjg
	IwIWkTrDi0vS85j8Y1ZH4gGtGverGNYKWunx9wUlx
X-Gm-Gg: ATEYQzw1EXYIGm0KqpIHlHd5PjT85mQREL37NC0WztxozSW7K8+0+kMpN8aHkbz7drB
	UGtGoo8JftbQmAELGHLGDfkD3zlODMh1O9YzVy0aBJM1bL+zS9BQpFlTDddomRXRhsli9yVhRWv
	xOgsdFb41MdhY0+CiA3wVcfDYdE0OuYwqcsmhmf0SgUQVdKmrjBokFJ3M14BZzDpOKaCNs9vyDy
	6GgAp5MSvV0wYVOis/3AnHbQ/iVSd+ZI8WbhtzSgA3UHT52o3voKQZ528UZ56obXy/01DmJDuAj
	tBdizg==
X-Received: by 2002:a05:622a:178d:b0:501:4e87:70b7 with SMTP id
 d75a77b69052e-50752726318mr194022051cf.1.1772525866886; Tue, 03 Mar 2026
 00:17:46 -0800 (PST)
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
In-Reply-To: <c582ab1c-8a2d-4c0f-ad7b-7d44fe4296f6@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 3 Mar 2026 09:17:35 +0100
X-Gm-Features: AaiRm51_I2l9ysvKbWyHiFJhEEte-0RPshulRKBNv6aB9EQb1ph-WXKtSAhZ4nE
Message-ID: <CANn89i+Bt_AZK=16nekvs846P7fPWxkRrNaNNBOrH0sB7xS1uQ@mail.gmail.com>
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

On Tue, Mar 3, 2026 at 8:55=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
>
>
> On 3/3/26 14:26, Leon Hwang wrote:
> >
> >
> > On 3/3/26 11:55, Eric Dumazet wrote:
> >> On Tue, Mar 3, 2026 at 3:12=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>>
> >>>
> >>>
> >>> On 3/3/26 08:22, Jakub Kicinski wrote:
> >>>> On Mon, 2 Mar 2026 17:55:59 +0800 Leon Hwang wrote:
> >>>>> On 26/2/26 09:43, Jakub Kicinski wrote:
> >>>>>> On Wed, 25 Feb 2026 15:46:33 +0800 Leon Hwang wrote:
> >>>>>>> Issue:
> >>>>>>> When a TCP socket in the CLOSE_WAIT state receives a RST packet, =
the
> >>>>>>> current implementation does not clear the socket's receive queue.=
 This
> >>>>>>> causes SKBs in the queue to remain allocated until the socket is
> >>>>>>> explicitly closed by the application. As a consequence:
> >>>>>>>
> >>>>>>> 1. The page pool pages held by these SKBs are not released.
> >>>>>>
> >>>>>> On what kernel version and driver are you observing this?
> >>>>>
> >>>>> # uname -r
> >>>>> 6.19.0-061900-generic
> >>>>>
> >>>>> # ethtool -i eth0
> >>>>> driver: mlx5_core
> >>>>> version: 6.19.0-061900-generic
> >>>>> firmware-version: 26.43.2566 (MT_0000000531)
> >>>>
> >>>> Okay... this kernel + driver should just patiently wait for the page
> >>>> pool to go away.
> >>>>
> >>>> What is the actual, end user problem that you're trying to solve?
> >>>> A few kB of data waiting to be freed is not a huge problem..
> >>>
> >>> Yes, it is not a huge problem.
> >>>
> >>> The actual end-user issue was discussed in
> >>> "page_pool: Add page_pool_release_stalled tracepoint" [1].
> >>>
> >>> I think it would be useful to provide a way for SREs to purge the
> >>> receive queue when CLOSE_WAIT TCP sockets receive RST packets. If the
> >>> NIC, e.g., Mellanox, flaps, the underlying page pool and pages can be
> >>> released at the same time.
> >>>
> >>> Links:
> >>> [1]
> >>> https://lore.kernel.org/netdev/b676baa0-2044-4a74-900d-f471620f2896@l=
inux.dev/
> >>
> >> Perhaps SRE could use this in an emergency?
> >>
> >> ss -t -a state close-wait -K
> >
> > This ss command is acceptable in an emergency.
> >
>
> However, once a CLOSE_WAIT TCP socket receives an RST packet, it
> transitions to the CLOSE state. A socket in the CLOSE state cannot be
> killed using the ss approach.
>
> The SKBs remain in the receive queue of the CLOSE socket until it is
> closed by the user-space application.

Why user-space application does not drain the receive queue ?

Is there a missing EPOLLIN or something ?
