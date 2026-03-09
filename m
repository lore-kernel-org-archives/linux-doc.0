Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA8A25487C
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773048881; cv=none; b=B3UehRdZBC8cpIDe62iU/sT6CRdfgFW5bwZeLegAP0/7IWcnRSoo71Q7gjP2Ggl48J7bujVbBrgsNjSkIgCLpaq3Mhr20ZhiIEVqAXOWro67use4bKPFkmlJ25nOT5TIzsgdr0AGCmTPi47iTj/5C9LhI6/bwaeZ3v1OFOjcMA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773048881; c=relaxed/simple;
	bh=aSDtFRn4EaqcL0JtQ1Pica6QwSGSR4ven1YTRVkwbIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPwYlFKJIgD2xdAjNqurrutDbkUzRwpnSToQXXB751Iu7NFbaagwNI4WY9QTXqebgiLLkPKJAqE12ybPD0zloSt6VzgPHGbdLr+tHTkwjX7QLUloPdrgttfJp855m2hIweNmSrItNW4rERJ++Cw2iNK2K5VYbpwylw0KeagyB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGD559HI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGD559HI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AE2C19423
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773048881;
	bh=aSDtFRn4EaqcL0JtQ1Pica6QwSGSR4ven1YTRVkwbIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WGD559HImmMCNzI/WuToummqRVLLDoVlcJwXJWgjNFClFjfGpfTRhZaL5zrFcyyCu
	 lj8MVvLF3N1vZRtPt7wIRNlsNyhX5ZDaeKmM3DvAV7EFysyMlyRZPO6glwmuyOrYAs
	 AC11w4x3uA/2BW+6BWmjYlqHNj8t3pRe2wSNuro6LaTRjCGqfoqyHSbGpbM8VapRyO
	 TQwGDuUNXCX6Ho2I964ul6yPP0jhHTuGUSZlt8oY7L7XdqA2LXJH/z9xdk6a11fK6X
	 8l7UuYgFhZp92IN7t7LYUbrIPvRdwsJ8CUGaiOattPKiaVADI0c/Ktg8xzJGEsro4w
	 4fEOf47KMOHlA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a133502accso4311749e87.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 02:34:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/bmgG4jJwsX5MPm3/S9RScwG4RyXmEmb9zyS9x9k7WRa4ckiMEIqbKk27CRh+z5HePv0YjqN2FiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7oS4pCCIhecpuWnMS1dA54ij6U0JRPunM+0CU819G2e7ib6A
	uS1g/INfA9Z6xfTwzDW9KHIb9ax+CPzf+LWsTtbTgEFEUiFxMY9PoqFtmkb8E/yNWAZIlWB9rZs
	llY/eEyvCFdrNuHSvgIVTftog4tWfYLtq6FEsT6k0Kg==
X-Received: by 2002:a05:6512:1316:b0:5a1:3b7f:450e with SMTP id
 2adb3069b0e04-5a13ccf50b7mr3398140e87.42.1773048879758; Mon, 09 Mar 2026
 02:34:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-reset-core-refactor-v3-0-599349522876@oss.qualcomm.com> <8dc9221ea83c9adeba3183cc370a6a4874562376.camel@pengutronix.de>
In-Reply-To: <8dc9221ea83c9adeba3183cc370a6a4874562376.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 10:34:28 +0100
X-Gmail-Original-Message-ID: <CAMRc=McOuT00zo=sN3OqgRJEXemk=f7ORb1B7KQprn==EaTERQ@mail.gmail.com>
X-Gm-Features: AaiRm53Ijyx8Y34_Uq4hR47hwN2bkV0LzbkWqINCodIgieEUXN41GQBW3NxxoVU
Message-ID: <CAMRc=McOuT00zo=sN3OqgRJEXemk=f7ORb1B7KQprn==EaTERQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] reset: major reset core refactoring
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 10:25=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Fr, 2026-03-06 at 18:22 +0100, Bartosz Golaszewski wrote:
> > Here is the promised refactoring of the reset core. The main goal of th=
e
> > series is to make the reset subsystem fwnode-agnostic - meaning it can
> > work with all kinds of firmware nodes instead of being OF-centric - but
> > there are some other related changes in here as well. I'm sending it al=
l
> > out for review to give Phillipp a better picture of the end result but
> > individual pieces can be picked up earlier if accepted.
> [...]
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Applied to reset/next, thanks!
>

Thanks for the careful reviews and spotting all the corner-cases!

Bartosz
