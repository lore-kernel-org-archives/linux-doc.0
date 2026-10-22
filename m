Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695754;
	b=rarlbaDStOKr0IM0yX24eMMpukyUoN3jWO8xjF5z6kWTJ6kuEaID0YU+T0msOhFN8msh
	 nHAcyK9SBPTHqJliw58qCUAQVAKurVWlaJ1tw5ujw9MfBBr6UN4bkzgADnjL9S/gSSaPr
	 QmwrlEmdpZz1mVGJz+a7Glye1Wit/1BKlUFFGT1O09M9Nsvgd5uugPVhQV7Hn755ssjv3
	 HpzsmvDPv3uil3urr6OVYJM8anN010IagRCGsY3bIQl9HPklnpoj8udFBM/A9jw3AvOKr
	 yf8A7K16LRsch9qnDIOOG461CYQONP+IFTu0mTb6s9bTLIa/JhD7ZRGcrQ0wOuoSKiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695754;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AR3kez5fnRcYpN+/byP3CD5s15NltwUsUCBVli/ZHO0=;
	b=FBldAtEMVtUcaOXxb8PEzSfW1X2PtS+qFLnBiee56IFzu1kHz3yqOD9EIgnMmJYPD0NY
	 zWlTvd7W6OkhDx/x8qUyjUS1bJIKHQKVv0i4Zw/dVMMePfWldXLLD+XTMRpdgu7XV/Qse
	 Unc956GEH1LNgKIOAYhNqOkSi33neOvZRNZi8ctMsbp16l8ehmh1HwviT/FbvCR03BEj3
	 0nG7cNDFsLmGWdG2XpPNKWhrfaDmbfwFfczks9KYN0JxjVhhF6dxPg8C0u2oRu8kZRHLN
	 CUIFLa/D2rO1kTQwXmY5EbnDq5j3GJXYLY0QTtXy1AUfYsPhNLHTipjzYyaqO2J3gpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bITk5t4E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64293606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bITk5t4E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0979A1F031E2
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792695754;
	bh=AR3kez5fnRcYpN+/byP3CD5s15NltwUsUCBVli/ZHO0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bITk5t4E9yFcpq0jVJ4g2E70ul661bUgelLIhksn9Of5ionUc5nfqnSTQpZHnBIIi
	 cRO96qWUPWIf51iQfS12/9+XVFeJxSeMxAjjqsfe3sLyfCWsJdR9zFJVu2HVvkIK/J
	 aSdBcIpyQzK45UdTyqL/mtNQ9bBBbGHSE7hwz0ocuXcbSu9LxW1cFrbL3mdmAAgX2i
	 K8zWXeD4W4q4Hp+D4bfM8rUMLbtKEO5xAWQ/bF9X74Q+gDbZw3ohuN39OMrfXcuX9/
	 5eL+SsRkhnSvwoZX4hWaUyFpHdpLhaE2557M0i2aOBn9WtdjsHam8090HHf8wXlKRg
	 VcShPBKYy39Ig==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a75f960be3so196501fa.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 12:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy41JncO2NObxIz+spgcI58ZTP0OvQPS6vKRq/Ir9QM9yBWUCqUSW6TR0xuPeOLgMwEJEinAPFecJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7oon8sOzj42R4Lt3KLURPr6RCERULOJiXxRoTTxouUpy/Qwus
	dNTrQ4Yy8PPd2N/CweLhvXfB5jrkhh+CUrw8tGfdGIZp982EUKVFEWVmd+WZ7yFi/VYLMv0IFMF
	RCOJdBR2bUdF3CUPHlDE6GIK/7mlEuOc=
X-Received: by 2002:a05:6512:690:b0:5bf:a4e4:c329 with SMTP id
 2adb3069b0e04-5bfa4e4c387mr1694066e87.64.1792695752379; Thu, 22 Oct 2026
 12:02:32 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001155118.1750028-1-briannorris@chromium.org>
 <20261001085009.v4.2.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
 <CAJZ5v0hMHutu69acgSR7KsmcLs0McZK+-3OFoiqFrU5GnJzTNQ@mail.gmail.com>
 <as_i5MEz3WfnDQmf@google.com> <CAJZ5v0i+77gt-KmMYdxxzS4uGzxFArrYGpoDnjrfknpPOkAuHg@mail.gmail.com>
 <atE9urIHXAJZXu6k@google.com> <CAJZ5v0g56J9e9qdiR8W+BfmEbbedvpD8hop4+n9=rkFEsDG_Jw@mail.gmail.com>
 <CAJZ5v0gNQqffxcdzWff=z3hi0BXzJBOV6WKgf6RXuOydzQJQMw@mail.gmail.com> <atLCom0YznHV8U6D@google.com>
In-Reply-To: <atLCom0YznHV8U6D@google.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 22 Oct 2026 21:00:12 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iTDPTh3kv2m5CGacTrry_xLwq0bfcvY0-G4Q1NAu=+zw@mail.gmail.com>
X-Gm-Features: AclHuK-CVVgYyLiB08-dnp4UgzpRfSgpwermatB4ehAge9qZKKsOFBzOok-H10c
Message-ID: <CAJZ5v0iTDPTh3kv2m5CGacTrry_xLwq0bfcvY0-G4Q1NAu=+zw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PM: runtime: Add Example Driver Patterns section
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 2:34=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Hi Rafael,
>
> On Fri, Oct 16, 2026 at 08:05:12PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Fri, Oct 16, 2026 at 7:42=E2=80=AFPM Rafael J. Wysocki (Intel)
> > <rafael@kernel.org> wrote:
> > > On Thu, Oct 15, 2026 at 10:55=E2=80=AFPM Brian Norris <briannorris@ch=
romium.org> wrote:
> > > > On Thu, Oct 15, 2026 at 10:11:04PM +0200, Rafael J. Wysocki (Intel)=
 wrote:
> > > > > On Wed, Oct 14, 2026 at 10:15=E2=80=AFPM Brian Norris <briannorri=
s@chromium.org> wrote:
> > > > > > On Wed, Oct 14, 2026 at 09:07:54PM +0200, Rafael J. Wysocki (In=
tel) wrote:
> > > > > > > On Thu, Oct 1, 2026 at 5:51=E2=80=AFPM Brian Norris <briannor=
ris@chromium.org> wrote:
> > > > > > > >
> >
> > [cut]
>
> [ Thanks for the earlier clarification about PM domain. It helps me
>   understand where you're coming from. ]
>
> > > > I kinda think the point of most of this power domain architecture i=
s
> > > > that a typical driver just doesn't have to worry about it at all (i=
n
> > > > probe(), and if you use runtime PM properly), so I'd prefer not
> > > > mentioning it in the Basic example. But sure.
> > >
> > > Well, your basic example needs to be put in a certain context because
> > > it may not be generally applicable everywhere.
> > >
> > > I think that you should make it clear what the driver's expectations
> > > regarding the physical state of the device at the probe time are and
> > > the general rule is that it is better to leave the device in the same
> > > state in which it is expected to be found next time.
>
> Ack, will do to the best of my ability.

So please send a v5 of this one when you are ready.

Thanks!
