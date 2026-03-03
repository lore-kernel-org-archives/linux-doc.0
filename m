Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E62F12AF
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772510119; cv=pass; b=TRPET1yInYjFT0m3KfPYINSUiEjsAEX0F7oKfs8Vmsu7qf8nEDatvOSvCBukl2r8+v3z72Q4K9M4dsSL6rSxwD1IOksFfcnD/9X1UNuXgEIjeTfzZoHycsInmOWM/fIYvEyO/DxQyywoHJS2KuA4Mf2XaPJ2xp9fYmfvVd8nDc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772510119; c=relaxed/simple;
	bh=ejc1Nj9JSexTn5t/j4wyckbSfdpkEdCAy4NmiTGXn2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mia9Soa5Hha+2qi/hUnfC0S3gS0e2XNjxbPfXLEeumtdh9KpHFm0IGFIvzBzE49WwxN8hx8zJpwJ1vomgT30qHf/vBPGL5h4dQAyitJASAUhfrTJTrA3USEmy4wGEDlLQshmXRWg35JXjhbD8zOzRv9JqRrW9JOjPff5aGhmxFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ioJT4qp+; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ioJT4qp+"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-899e87b04d8so42596736d6.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 19:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772510117; cv=none;
        d=google.com; s=arc-20240605;
        b=G0OFDFWGLpY6A344+TpXQ3XaQJdwNYQJc4i0zTvETRhJVqjMJ6UkG5E6RaCfM5U0ui
         YUqXC7huBjqhA98WNYbPKbALOuUbgDwJX5JFjRj4sBdNFym6xnIxmOPKYBcuTbFloX5g
         /Ggmt6w43YwFvQTJamP1Pt3OBS5us/qSBAw8TZU6DecvqxyQTnih25g5kHmYGxYa3v49
         h00om4s2kYtw6CGEajyinZAAH5CUz3n6cIlP2uYkANp4wOL3jP9Oyj39QjYg6mTET8u/
         9+Fx9qxuQ9p1nkW4tUrGg74llprLRQPQEckbt7PZt2X6NMdburAkhsQUDN3GsLVRrgu7
         qpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejc1Nj9JSexTn5t/j4wyckbSfdpkEdCAy4NmiTGXn2w=;
        fh=awPGVP6YgDb5gAKY4Si9Nvh/3kIIxAPbosXF0PImKOI=;
        b=Pc9eeglJk1fy0kINsvx3dTvlR7q/0rL+Ojx8dh1GyXj4Vj9HvmY7jmdQued5767tLH
         z/7SyW5Lu2oH+81aQt8mymkGexcCVvf8qzW9udwis5i4lQoT606StKiKg3KXvotdcSYe
         IYfRDrbwqGiX6MpynfdM4MxHn+FpuT9BQSdwOCI5UOhNzJgJ8iPBqv/Iao7qUOLFS1Qs
         S10yYpb7otrhPV4afJ0blkbkjjtqSGkH1aurmmn7U7+7ow29Kem9k+DPnmwkBhT++VID
         7H2npito/GxgKnUlK2DJwmm2D2GlopffFptk57L9ggaup0jMMkS6vEoslcW2eqL3WxP4
         syRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772510117; x=1773114917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejc1Nj9JSexTn5t/j4wyckbSfdpkEdCAy4NmiTGXn2w=;
        b=ioJT4qp+Bka9DieWPGsi5DF+PSUYMp6RyPtNiLaQwT6cD+gmfR78uj7C5RL9+GQMwJ
         bRQSWOcXnJ1zQ6R211Q6VSTYpm/dtJay8rSUJ1Hq34+cy0Zreoac427VoRZ+ev9VCP5q
         /UurnMLpbHiuoxzWIPe8bS8pDmNIl/CJ1CWtBArIJnHyHEWrLgB35eWa1eDX282X4rf7
         IktbzZ6KCGkYMp4R4dfvsaSISFFj2WnqBYYiX/iC6+Nv6S7le2IPR9IvqSoE2GxOf9ng
         p8nVMSIufWOnzwlIxnMK9rW0rfllaEq0oEOfD2dTGVdhjuls+Tq8wvLmDWgZpYXZXVAc
         5OxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772510117; x=1773114917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejc1Nj9JSexTn5t/j4wyckbSfdpkEdCAy4NmiTGXn2w=;
        b=JytK76+4AJdVhJCo+2YnEBT3BAo2z20JgY9GZsqju9R92rxIi9b0nvJbHOHcGAly9w
         BCoWZtdMXP/1YfOz/LkebiH6lui/PXxWmHMzGpJBtCFRXJZkDqi0sHTQAYKOuaqsRWZs
         5xpj3VmsRAXRFeO7Fx7GBxAOsfr2qKK7J8ioyuS5ZsgEunmZDLR0pvgKPgn6NLDp5HIG
         7wusNkpGotkfAU+/4p8BDf6cFK4yyIJXDLAhGnkxTouEUsLDTZbXpY7N3pokMU4DFWbw
         ViQ7AjM0xx7I4Q4O48hqeSSjfVyDrA7ONre3XFchEG9sDHCQTMAPMwPxrVaj3Mse8E9B
         1SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCViclPXTiPoyFKkWbD5R4jkGo3D61CfOVrX6Q7NodcSLQYJt8ZB5ostDxLYQgbCpcK0MJbEGugHbEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9vWisEZvYd1+LvwRAo2YtVGyZ8eq4FcekpLmQVX+0if+q55F
	Metf7eRPlzxQdeVYTDy4qZEIh7uVyMoODNgp2ERaZRHD/HuIzL5KltIunZ9DN5rpZranyfeOlsE
	J+9W6uvM0sCvg6FbvZtIjOcUlk/+tTF6JMBmv0a50
X-Gm-Gg: ATEYQzzVkhFzEJIebwGw49B/CYTHROMdKtBDKZcF+swUozjNulSIAlsnl7BSgpWE7lz
	3N628EIgTn89d7H9ILA2w108T3kUSIHvIg2H5pc0r1eqRRfNTVlpOKm9NjbOzDV30aeF/Og1sK/
	+rFJEzRIQFNGl2oAZRErQEkOsNz4jHgG2Mn9RUuXVpGOZlsrZJVpA7KBllbf37qoYA7zTIj5nUZ
	3I/G+i8IiQ4vSKo6jmm902oquCsPOcdesQOYwymQxObwK4u8OIfoTTzoSjNMMSvRUaU3p6fUP+i
	doQ96w==
X-Received: by 2002:a05:622a:1808:b0:4ff:9737:dd15 with SMTP id
 d75a77b69052e-507528e0544mr204798791cf.60.1772510116881; Mon, 02 Mar 2026
 19:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225074633.149590-1-leon.huangfu@shopee.com>
 <20260225174354.5a698ddb@kernel.org> <f611be70-8280-44c8-86af-5866c0b302be@linux.dev>
 <20260302162251.733b520e@kernel.org> <3a623176-fc5f-4dd4-bbfc-64d211f53645@linux.dev>
In-Reply-To: <3a623176-fc5f-4dd4-bbfc-64d211f53645@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 3 Mar 2026 04:55:05 +0100
X-Gm-Features: AaiRm52DDhLLpoDehAr1KJ6oYz7Y6Nl096pl0WNYjHph9qwo9g7s3_ZXePnqW6c
Message-ID: <CANn89iJ0=Tx0i+1UXEdcoFuk1F_MfP41-L-kgGDTN+RcLTRcFA@mail.gmail.com>
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

On Tue, Mar 3, 2026 at 3:12=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> wr=
ote:
>
>
>
> On 3/3/26 08:22, Jakub Kicinski wrote:
> > On Mon, 2 Mar 2026 17:55:59 +0800 Leon Hwang wrote:
> >> On 26/2/26 09:43, Jakub Kicinski wrote:
> >>> On Wed, 25 Feb 2026 15:46:33 +0800 Leon Hwang wrote:
> >>>> Issue:
> >>>> When a TCP socket in the CLOSE_WAIT state receives a RST packet, the
> >>>> current implementation does not clear the socket's receive queue. Th=
is
> >>>> causes SKBs in the queue to remain allocated until the socket is
> >>>> explicitly closed by the application. As a consequence:
> >>>>
> >>>> 1. The page pool pages held by these SKBs are not released.
> >>>
> >>> On what kernel version and driver are you observing this?
> >>
> >> # uname -r
> >> 6.19.0-061900-generic
> >>
> >> # ethtool -i eth0
> >> driver: mlx5_core
> >> version: 6.19.0-061900-generic
> >> firmware-version: 26.43.2566 (MT_0000000531)
> >
> > Okay... this kernel + driver should just patiently wait for the page
> > pool to go away.
> >
> > What is the actual, end user problem that you're trying to solve?
> > A few kB of data waiting to be freed is not a huge problem..
>
> Yes, it is not a huge problem.
>
> The actual end-user issue was discussed in
> "page_pool: Add page_pool_release_stalled tracepoint" [1].
>
> I think it would be useful to provide a way for SREs to purge the
> receive queue when CLOSE_WAIT TCP sockets receive RST packets. If the
> NIC, e.g., Mellanox, flaps, the underlying page pool and pages can be
> released at the same time.
>
> Links:
> [1]
> https://lore.kernel.org/netdev/b676baa0-2044-4a74-900d-f471620f2896@linux=
.dev/

Perhaps SRE could use this in an emergency?

ss -t -a state close-wait -K
