Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A33DE427
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383233; cv=pass; b=gjoJwmk8+NC3IkLWv8EGllXSyIj4iXQTwVAdqjE2cL3k28nNz7SP4YUrh8EXoyHbT6o8A27T2BOT6Uo8u/+DQxgRHPyQjmPVpkH+w7noq6AKUnyz3jzLkAkA+9GsUKWM9Zm95/2WFMruSoheZ5AQ1tdP39XWjOXLN3CdyKHiFU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383233; c=relaxed/simple;
	bh=iyw2OvHaE44EsEirv1R93eDAOwzBi/bXe3bUJaCaq0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqGfQMsA4wDXMWVz4IcQFz3PVSing1p5eXvglLzrxXD9MIsEtOs55S67Sozy9zTrXhkOca0TplIKEn8Kwpdro110tabubnFPbq1U1wUjMhpAfVWXXMqd1g8XW4TXNvx14W1OeANqxfELbKd4Y2K8ypqt5OfBsyrqu5txSiFVzgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfI6Pujd; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfI6Pujd"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a40502e63bso10224258e87.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 06:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777383231; cv=none;
        d=google.com; s=arc-20240605;
        b=WeJLSmDz1GtYXdVei+qZNDa35DPOk/rECZYxTIpXr6+dVW5b9kCAeajhS9Fmxh0FM/
         noatkUBFknrSinoVwd/jZQj8gs3qM4p7BF4IthqyBrJzNrKafKJL00NaUUOJOmUBtQor
         hIpEJvxwfubC7gtrcMyLdx2Ig3Ayk3he7as83M4VPFOFA5/xsF+KW44ayrnCIEHEM6Z+
         iWHH0+dxhDbIlYaH7QFK7UHCqXotXgRCqv8Veuk68ed6dXxn63uFjXSikB8PhW6DHT+j
         eWp+p9j3x8hbGFxiTQbWNenaqw7qs4425UTxLdqWk+PUfKQ1hnK5hqt4ZqH1GQIW57Us
         gtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qaYcdo3ed06YZvAe5aYUx+DMO8JI/SLGK3mubbkMqBo=;
        fh=Yk68ONT1iUw6SiQMRCDXhK+eU4udpppTgtnn9U+wcgc=;
        b=BAslkdNc/GAL1m+DOqtHcmsFl410j1hi7YLwDv1F5QfBBMq2hEjgS6JotdoiHdhRvq
         gcIHQoQk19Xxg+riBG1r5nP+R13IGQ/uxoPXSwb6YGkhzFI1rCkxIUM0kG4kfUt/24+m
         s+Ov+ydAAbkLh93QPZDdvCeJRgnzfK2gR/80JIj4xzNHXD8djaVvRyHoRyh6D3HcBpog
         aC9c4zhEjJuGP7qogDDCarEhDIRjmVLoRcf3CkarP0Ig7NyVE+Qd3POT9dye9BWPOx8U
         JqtqP1vtlW6juTwjG30fFsTl4AyvtcelSlz+mZ/HKf0FHYiloVnGNGMvhH+2GEEyP2G3
         pGqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777383231; x=1777988031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaYcdo3ed06YZvAe5aYUx+DMO8JI/SLGK3mubbkMqBo=;
        b=NfI6PujdmVa1idizUJa3gDcd+6+xQT/yTuAYF9rGjL+Tb75LsNzrrq0aamE2XIUZBP
         JwznoiYTuq4yItr49t11At7na5gDR4PuGUgZTzMziqqWTg3vYRGp5k7JKlZAcsO46tlW
         ++RFjzXMjcsBnXD3haJJ/Uz+8/GZaHfr5/h/6oU5gRLoQ4yNFZQCe1vGB/nxL+5VnND2
         EMzTiD0FwyK/8rgYyZKjlttEKNicIWPuCN9e/vCBTUl3j31uppGygB7vp8w90ANPf9op
         AhZpcwG79n/De8ammksd17DBDWvSCyUJhLRvNkt4A4acZx6Qh63dhO7UJ54fGqSWYuc6
         USpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383231; x=1777988031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qaYcdo3ed06YZvAe5aYUx+DMO8JI/SLGK3mubbkMqBo=;
        b=BMcFmWpZwB0dt8SG5jfYpaKybrkSPy/dHuINsvHz6sFE7QwTrC1QCkWUMyJdEmsE3D
         T5RG1yrewQQJa25gRjKzkaCPvCJkZWBqD44Do0bMKlkPvefC5dZJ+C6b9ZodaWYHBpqc
         2qKmo8IA8796uROwduuvqbMX68a4GYfl7bgQWfHMBj5NkwxrK7COd1/KW1Y5oc5SVlPT
         vaiHDtUaXeGkgpAAafyHZvAFjRkv4US2dU9WLz4pshktd08gPgafcaCjrMlvWiBy5CRN
         JWLY8MHXSIpHJmygJvdWN13dIz6YQS0pGFg/V6SuLCtdkMqeoxTJnEdwjvEg8/7jWyK7
         XR2Q==
X-Forwarded-Encrypted: i=1; AFNElJ84vAvpo6eAzBMKpZSWdxPCCTbm65JOyDw7nzoTossFUWbZXtVXflPVrC3yxZSZwq5F+YIep/MBE48=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2SuVa42pG3o6RhYSCedy8olFlmB7qPC4gdw2p5Q+RTxUv7ab
	jQAi2u/rusfT3wXb9ZehPUN547SpMHllm6FRDd1lkVk0FNUVS9VS1TbcqUuM0R6bo/mDsf/b+MY
	0Icw83woh6NCasjxrMOjKkNp/1pUULiI=
X-Gm-Gg: AeBDieuCjNgQKwca+SvYtFzZWdZFWKrw4+cLap7CPm0Vyy0iHuFjv9l2wzOOWxdon9r
	hjuii96S9WhHScdtCDDWJ0/tEQPEC5WIJLTS3OLYiBxrE6+kkcI5TdVIfREpFfQ/DGQcq8bNtkT
	DfQRKJQL1yc9kAEmb9qVF0i4eV9XQ/v0bzv7FFoUrmbjhB3/FjDyKvMuxAfwTorl+68UhLXTqIA
	15XTvosnOSvIKh3w1HlGXj2ip/vD04YrhFtG6p4RF6dANgQD3bxmp9Q5OLH8sTNuJNQmxuS45xF
	Ba9zF2hHV2ktu3/U7FGFkdj5pr3rjcMnIfbbLo6iQ8IvMxM=
X-Received: by 2002:a05:6512:b86:b0:5a3:e5e9:3793 with SMTP id
 2adb3069b0e04-5a74661140emr1107925e87.37.1777383230272; Tue, 28 Apr 2026
 06:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428124555.102039-1-levinilai972@gmail.com>
 <871pfzmedp.fsf@trenco.lwn.net> <86wlxrz04x.wl-maz@kernel.org>
In-Reply-To: <86wlxrz04x.wl-maz@kernel.org>
From: Ilai Levin <levinilai972@gmail.com>
Date: Tue, 28 Apr 2026 14:33:38 +0100
X-Gm-Features: AVHnY4Jx6OC7A-W9mrSjIshmtcjNM07qrDriUwl7FS0ysZNvizNIAMv2t_8sUbM
Message-ID: <CADjj9EMZgsVKbfUvfXjerbkXYgj6WPvzd_bMpP517_o3WdcvXQ@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: eisa: add SPDX license identifier
To: Marc Zyngier <maz@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marc,

Thanks for confirming.

Jon, should I send a v2 adding Marc=E2=80=99s Acked-by, or is this sufficie=
nt?

Thanks,
Ilai


On Tue, 28 Apr 2026 at 14:26, Marc Zyngier <maz@kernel.org> wrote:
>
> Thanks for looping me in Jon.
>
> On Tue, 28 Apr 2026 13:57:22 +0100,
> Jonathan Corbet <corbet@lwn.net> wrote:
> >
> > Ilai Levin <levinilai972@gmail.com> writes:
> >
> > > Add the missing SPDX-License-Identifier tag to the eisa.rst
> > > documentation file.
> > >
> > > Signed-off-by: Ilai Levin <levinilai972@gmail.com>
> > > ---
> > >  Documentation/driver-api/eisa.rst | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver=
-api/eisa.rst
> > > index 3563e5f7e..e98b21b60 100644
> > > --- a/Documentation/driver-api/eisa.rst
> > > +++ b/Documentation/driver-api/eisa.rst
> > > @@ -1,3 +1,5 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> >
> > This is probably just fine, but it's worth asking the original author
> > (copied) whether that was the intent; we can't just slap an arbitrary
> > license onto the work of others.
>
> I'm perfectly happy with GPL-2.0. So FWIW:
>
> Acked-by: Marc Zyngier <maz@kernel.org>
>
> > (One could also ask whether we need this document at all in 2026, but
> > that is a separate question...:)
>
> I'd be even happier with a bulk removal of anything related to the
> EISA bus. I haven't touched it in about 20 years, the only machine I
> have left (an Alpha Jensen) has been disconnect for that long, and
> support removed from the tree 2.5 years ago...
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
