Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA24D356771
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 15:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463701; cv=none; b=bI29O/dR7cm1sFG8RjVlPmq8GomV0SL1cTmh1Tbp8nIhsqymzmp1ltSiwu2F18RsdqLFq2Q50E0Jezs/5pGe1N84fQW6dZtpzRKDuqGe5kpgLCGbabOtzLbLwXX6t8USq4FU3RD0Z6HJAmL3utE1ojmWXet4vCDT8NxbR9ZED3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463701; c=relaxed/simple;
	bh=N3vQcOwek+Tq06UaRQHlHhxUo/IIPqSOgaDKQhRyMe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GJJwmjtwsKRUohoRFApHYm3yJkn4VLzXNnmAqFGuOqKD4hs91taaJBvv1hrDv2jV9zy6mE6hE796K162sHpaHcnyqRivRwkzxX3VFTSZ95zgvPhuk5G+v+ivH0n1gS6IbFK8iE7f0JMdSqRo/SmsSKH9/YTXBXS1PVlsMlej26E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uk7lh0Da; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uk7lh0Da"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18D31F00ADE
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779463700;
	bh=DAT0Pn6btsy80tf5FRFYMIb1+4BzppbLEqYpwea85DU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Uk7lh0DaG1JUaUyv93YEOz2am21NANln8HnXRnko/e7DWVU8Wq4ha8OC4rlLY51Fc
	 frTgf8ggkl0l09vbGkfBnmeEP7w6//0kbvKrw9RRgfDYFcZksvsUKL3RAvOSCxJ8yY
	 20BgAwnyvVmjEAb5vNok9JbDdgiwNQSuTIsTJQfpGdD9+g5mkXA5vHvPF1axFQHBSP
	 JFwHIrSpNJzKp7UXEn5gTR76Yj8Jr3MpCquFUnAoTsxSoJOxpmGp1L921gZuf3PkDe
	 qHLEWYI3q7Lx5j96rXmkEBF/PPC9TZ+jjrdl4h4P/JSqxHm2DQ43q7bfpGjboqayP4
	 uqaS7xtPIoavg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so9838469e87.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 08:28:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8/akgvReSWNM3bHO6LTlrHUY7k9tLMxuaCb9R0/NpH+4KFZPSc1KN/zph0BJG3Dz0YiSEyBb6pnzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUIhdrHdlcd1CazOgkxuLFd8LbTwF+mxCqdUND4LAvyc+24Iv
	NA9DANQ7K4qVtK5jb85ukiL+2v1xQKhR3QxBNUdvwb+m2SrOGBc8bfLqTlJPeQ70U9fHgHP1vjj
	a0gBW+h/SzrFXsCFesEkWp7yt233hdsg=
X-Received: by 2002:a05:6512:3e16:b0:5a8:e367:4ddf with SMTP id
 2adb3069b0e04-5aa323b34f1mr1604641e87.16.1779463699191; Fri, 22 May 2026
 08:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507090107.10113-1-sean@mess.org> <nms5cy6tgpcteav34jdtjf5mbmidf6rwc2uuxxef456xzegsyv@54rbblkdjybt>
In-Reply-To: <nms5cy6tgpcteav34jdtjf5mbmidf6rwc2uuxxef456xzegsyv@54rbblkdjybt>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 May 2026 17:28:07 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j3ENHZw2YWCXSBoJ0H+wT-Nxsd6S_Vgcz2qnRi27d2Rg@mail.gmail.com>
X-Gm-Features: AVHnY4KmkSfvnztTl3DuLQC3aNsUj_A5mK3oEQJDbbt1PDWa-JWdhQiQcoeeUEo
Message-ID: <CAJZ5v0j3ENHZw2YWCXSBoJ0H+wT-Nxsd6S_Vgcz2qnRi27d2Rg@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: elanfreq: Drop support for AMD Elan SC4*
To: Viresh Kumar <viresh.kumar@linaro.org>, Sean Young <sean@mess.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 7:48=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> On 07-05-26, 10:01, Sean Young wrote:
> > Since commit 8b793a92d862 ("x86/cpu: Remove M486/M486SX/ELAN support"),
> > the AMD Elan SC4* is no longer supported, so the cpu frequency
> > driver is no longer needed.
> >
> > Signed-off-by: Sean Young <sean@mess.org>
> > ---
> > Changes since v1:
> >  - Also removes elanfreq=3D entry from kernel-parameters.txt
> >
> >  .../admin-guide/kernel-parameters.txt         |   4 -
> >  drivers/cpufreq/Kconfig.x86                   |  15 --
> >  drivers/cpufreq/Makefile                      |   1 -
> >  drivers/cpufreq/elanfreq.c                    | 226 ------------------
> >  4 files changed, 246 deletions(-)
> >  delete mode 100644 drivers/cpufreq/elanfreq.c
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 7.2 material, thanks!
