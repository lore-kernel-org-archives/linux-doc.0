Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807FD27280A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451496; cv=pass; b=RezjiT2ywKYoysbb50/rJG5TtWw0MmX3W0cNwVQcYAX9vo8Gw+O4PTjAaypuk+JY1hScS20XRaQ/UTk73AJgikRiKQyZsMMA/LrT252cn7qYKDm47m67ln6lhu032BpqleZ01Rwm8B/MTiKna4ewG6V9vzCKSaBNukWktmcMRJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451496; c=relaxed/simple;
	bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/lqFDhOiNBkF2DDZ2D8hIFA59XGsvLylcmhBj1lk6GBcTHnFJle45C64XJrQ9MklPYrJCPAJWJwYzaSaAMUx1V1luPTejuMJ86yU2K/6DeeReFXSH7QqV92xT8WdljSpATbeJadC2BlmKYZ1gOROXbPc848r5WDsVrCwm06cSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaB6ddVb; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaB6ddVb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d30c22b1eeso1194635ad.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 05:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451494; cv=none;
        d=google.com; s=arc-20260327;
        b=FBjzAWdlYjkF2jxs0I1yTRRaTmYzL0iT1LmWHvF77gM7GSkL3OIIGP/xX8wWKk8A8L
         tOK4yofuIG0HImi7/6SnsyZ+L+SpKLDfrwjDOp2EtBcTCZQKWpiJZ87vN4YmsXw0FgdL
         virqYWyqMICnvgINAnRldDS4kJbYTI3IHEYaC29UChb6Ig9JHydfb7v77iW9hEbft3KT
         Atd2XVsbbKb6HTAgnMiZBrCmBN7JkHOJTk15u9ojFmANy7NRSSMSyVK+2IpaTofHdizt
         gFicZMxpYT6H0ZYeeazjAFm5FVW9bBHv3xb18/mfZYbp+dnDqb+AW8+VaFzRGbmhSOta
         sGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        fh=M/CqKtcQzTgWiHbD4h3j9NeTdMDsihCuNuRDWzxXbZs=;
        b=hJ7s1GR7TicFxel2k777MO7bjI7ELZo5bZ/moBgMC+Xh0tDh4wZkUay2sV5+iEJZdi
         tmydvYh65j+7UwO7MzDWCQ1DYsn3eLW2uf0nPZtO/+7ILr+UTtcvVZw3rrckxX2JzOQK
         BJTss4JI1moiJ9t9yFygIX0u3fgSFWr4mOLlZpTm1nkpGMVLzUAXPc2J0E2vEDISYQdD
         AA8SQaSg6wqutF7Y1uNFsEsjV/ATnvA2XcV8G+jE7SDKC/6IWBLmwi1ILK9z/ol0F2Xb
         Dje0+BK1v0j7WFuujSpnlNHBQ55XejofSBlzyLsKoLiNmzv8gaxWpcBUQuIiTuSeMHbl
         B8dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451494; x=1787056294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=DaB6ddVbPxmNZvOvFFMDGxAzAIFNkEMhzZ8OpSxsAWJ4Ldi5FNW6VO4hdpuhBDpYEv
         C5gPowOMEF5kiaE9WY3Pfu7PFqiR3QlyXlGoaakLsqFSRl7rRVuDuKnsGo3FN3oK50O/
         KTjenuKcpUzhSbEHvNm0BJoIofplXBjQ0aD4rg4zoMK6d7cJhLqDn/ENSdYko3tryKig
         UZ3hdfbJuzoptl+632PFWt8S4cQDP4xq+sqaxueUmoXPJQbMw48qSTDyk7RAWDoFWg5r
         8VOG3b+q3vOaylGpGQrkjpyjYmOB4r0y5WW2zSece9tfFx8INjil2QaKu+LVl+QFNMEr
         +zMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451494; x=1787056294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=TOCD8fVniAzqcZ207kxamWu50lo0i1pYcYOWnZBPG/fJMAi4ruP4YxEPHM3BgcVbtK
         bAvGuB7aTjhPn4sI4HNfDRS4ezoXiQZBltNe3iPsw2U3ovEAhJb/fZW7KCBzJsvYnaP4
         u9PYEnCH7xDnEkhpvpI7ZFQmhUKemfn+TOuIpelVwvzvVNQLO95zc6fvsO0lr6siuXc7
         LpLaCXhB9TrNVlCF7nOQdgnRxxDHe/MZuyCxjNbFl1NzwvSaMvd3V/40E4XWoYH+9ZYm
         GYerQJhUo/PFI6VoZoWUDy8b54ljLPFg2G2SF+nsLypWCWhtqkfx7DkvE4tntoT8hgzf
         TLug==
X-Forwarded-Encrypted: i=1; AHgh+RqSMfIScRbjKhkymM9dGhyVrflz8TQsxmuYesEAlCKPFFoPhdcfueH7iI3gHp5X1SrLW4rHjN9gQqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXv3ak9CKXXG/Ev2WX5IUMUmxwJCOiKh+jhQDuVb2BQ9SY2xKA
	1MI819qywJlMBDq30z1wtf1+02hH/yHiTYzSNLIfMqAGP3C5G8w7I1DZAfTo1P8+o9olCBym07I
	Zfhq4Z+67HYSRS9NyoCaxmPo013m6aT0=
X-Gm-Gg: AR+sD12g1q4Aj3pV1PlOWqDdji3V/f5kz8NNheZ26ajC59Eu9QeGh8f/z1yNTalBx37
	f8PZ4/ubdrVOsxJGTvVBVGzAb/DAjG1ogNE7TeilDDLRKc7RBspWO6itNoXtGm1YGJWMT19sWZp
	dSJf7nJBS2M38DdfPiVsregMMJKnVe730tsbPlA+luJy9Mn303O1h0LA7kKAfV6Tk0wxTNaCyPc
	giGRAQxDUkIZGNj7cTw+zJ38UssWPFlhXEjGulWOVOhoNL3s4BrOehiZbJb9EYLOOSZd42CZJyq
	vlOT+c/prChgRfy9YPhp+UrMsVpQXuPzbR9X6UOES1O2vZkHwUHkgO0jnokfOE1M9FV7eH81Bcz
	f9HCfE6ojbJxSumMMQEiJRHE7VTifQAmhHcb50OVBdbTtLbPsckR3a8gawgfAXVlihiHx0ni8
X-Received: by 2002:a17:902:e806:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d317966388mr23897155ad.4.1786451494065; Tue, 11 Aug 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com> <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
In-Reply-To: <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:21 +0200
X-Gm-Features: AUfX_mz05pylmKA9x8ysF8Rltnon1TiS8QMQm-gLy33uo5KYaSzY0l5rcB4vQvc
Message-ID: <CANiq72n_DLiGKpAq+a=a165AjN9zcYJFR8q1eFb9AbBaYKToyQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 12:26=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I think it would make sense to route them through the Rust tree this cycl=
e.

Yeah, I asked Alex in v1.

Cheers,
Miguel
