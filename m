Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC13AA4E3
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085917; cv=pass; b=A30G3gZWfHW7sRPnhC1sk+YZdTmDApg2cWRzsbCQg6xybNTRiS6chR7uVQAdd6QFaDY+9X5oQrWfn+aD4FMBDx3X/FRxnRIPhp4Yxr+8KLX70c1yfoT+t1QPQvhh3QK2ARnAdRR0yTSx+IeNjeeXra5kZjN0UGD61lnZtXtSUjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085917; c=relaxed/simple;
	bh=4shjJrvziMCOaEg+cmflj8Sk8Is4R3jYebiTCFnLGKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MWjL0OtHbDBl7Hjp689CNrbeSbiHIgRZLWP9aez+M7DE9Fvfch9kVaWRabb8C+VH8dg+Drrx3fMJlJKkj3GpwF8DLzLaThNcbHB+OAiQTiyUcQd7IQHknUIh9sm9ouAr03umu0sk81G71KYvxbpjmHtsnVFVwB4hZCGEHQUnx+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFrHQiSv; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFrHQiSv"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575171b1ce7so4773055e0c.1
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 13:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780085914; cv=none;
        d=google.com; s=arc-20240605;
        b=MkeR3+NuDBaFk8tGqj7wIeoA/IiPDbnMzvMs52h8vnGTjPwJ0kiGymOVJR9eH4KAjV
         fdcoc6rwgPddvpdH2E+g8hxtvDx3o8sZzW0aJV6+X7OUTmJFmhkrBaHuD0g2BbqsZ3PB
         xwnpg5XnwmTrF4rSEHcYMXLSB40Fp9OFTnS9a+sWx0olopxPvrcZt4nT6ug3Yec5dfy3
         zETHa4+GJBLD74ClaV8kwe5xdD3sNU6nZqJ5vgUwANFojxkXmXa2c1x0IDx2125ekM5h
         /7AcXqvGWrrnpZhENtypMZmfkoSmPjI7+1aThIYHgWHIEjzPqBmYLbRN72/NFfc/B0VR
         zQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        fh=paOoA5c1hv6mJjaXqMWWncLA4/njdBdgMmf7uXs6uTw=;
        b=NtJcPiDGD5lA4vmW1R/MkOdGNpcrR16yC6gkVEDvP2J1tWHlG0G4wWyTg6+ywyk9rX
         WBCQRnsgMSOq1hjFXmO/odfDH1c1os9ZTEEB+TiIZRZe0EPKOfHb5cjyvOV6OgKwFqWA
         hhZNmanHyKcMdUqhFtIx64i/KTv805VEhf82piX2D1csH+RvQenMDAebwN+73TzkPzzd
         I19Gpmsbv1oqi3SzpC34mNnVTcvRMp2kN0kJjEoe3zTy7GdK+DXoEtwgEM+3KVBFb4J5
         2MFDIdco3KdqafTkis1Vls1zmfE40+uAvYigpkMdY4D1+WWkFPsjloaOUCiKKce4aaRe
         Vyhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780085914; x=1780690714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=OFrHQiSvP4YCVyU7zY1Ic7kjQNF0cfp1vBe2m3qj06EVEpAf9XJfyCL97ZEzIdgU+g
         km62NTZJLSskUl5N8TO2CXfilws+ZzPsFwv0y+xNOVm+8az6DqZJeBCc7jATIM9YMMiR
         ASGooCjVU6jzaSewhEvEzfCWSRfnM4+xjdnkmeCe93np3tdxUAMb9UN1Uv99H496gXpP
         bbV7SiHGF2MsJrDBEMGA1gEV3EKTQbqTZGdUmZRWjv1u+iqVi4t187g4uxrG6lN4UXfm
         fZ7g+2lGg8Hwyu0DZFAxRyMOLZECWiwnwk4Ov1FwamsSg6Jj66ugq6UOtbOHEuv5GOzj
         6Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780085914; x=1780690714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=EiJTZHoPYUT85s5LVsGN/nw37nMU0THVHUCffosJpOz5wD39HpyBrcsygT9qlOvHEB
         7qfiJBnx3LvL/jGgsSf+ZnDiceN/NUwkvF0O7gnid5VhBj5tKEZKzRSULJrGyDQe2edm
         ftkitxDsRmV6Lpcy4dhgWIIDZrja/I5KasVUW0aNY62+SD++BHg7zxC9X/e0o1BoifXD
         qwTR1b5oVtg2gKMeA5tQfU7j2vgL7j8yt7OSVERfpZDR/Ot9tk7DMeXT2vPVOZ3UFGoZ
         IdYwo3C1Wp9/mqz2cRcBSQd5wp0FyrrKQb8UVkBv2DsBcOEQox+Rley6eIiLwqAZj0YW
         85FQ==
X-Forwarded-Encrypted: i=1; AFNElJ+A8DSPGhiE7injAPSf2wg/oRjCdrtTJcDFBws99/acQ3j9ub+1wBc8wcLQqJffX656hgjALrto7Lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPrf3k86MFJJPNXGDFzQDXg3hjXGdgIeqyK7O5IUsqnBrHsAc
	vLQB8QTfwdaL8vsGzUztmo7NgbRFpVo68v+W6qeTuyUrM2bxYYvczwoh8q1v4gd2lG1s+cL6Kk0
	bTQyEidHM9DDHO6AKmMVHxsyl5iGY80JqTtbXKRg=
X-Gm-Gg: Acq92OEveAGjgGAdjRVc97+BXUY1GCMWxBIeM93U+nwEYhuMOstAOqa5bVm+AH8Uum7
	9amiI4ZGVvDmq3nx7d6udcxJ/FFhlee0LYuEkjqTGfC/01k1dSJgCPoaLvg22mf19EN+VfTVjp4
	M0DoUzBJgD6v5SyqT4uhyQOH2nZNkm5gqZq/pBdt5qekwHDxwJCWrsD7UCBaRzp0ApEgwMEocmd
	6REIv9Iuun/QCKlOaRp0p6C/pc/WF0HzwnijSo7K4x58tVKLyCkLZAKyyJLokWRjWJ+jTh1iKem
	2JTmqOnd81v6wMl6Bnz6HbOM05OmcLNoQltarEiXCo4vOEJPhVl0Q8YijFQ=
X-Received: by 2002:a05:6122:4d8b:b0:59b:1012:3f26 with SMTP id
 71dfb90a1353d-59be9d567a3mr540327e0c.0.1780085913427; Fri, 29 May 2026
 13:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 29 May 2026 13:18:16 -0700
X-Gm-Features: AVHnY4Jk3Oh6mj1Uh1YuwCnLVI-rIUfHv3S_D4s-m3C-uGvZSHpg8R8WgON19Qs
Message-ID: <CAGG=3QUcorKStoM+cYZ3tWGtCxrTxVz7b9HycKBMk=zmgm+V5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.
>

I have the fire, I have the force
I have the power to make my evil take its course

-bw

> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  .mailmap                                                               |=
 1 -
>  Documentation/process/embargoed-hardware-issues.rst                    |=
 2 +-
>  Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst |=
 2 +-
>  MAINTAINERS                                                            |=
 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index a009f73d7ea5..f863781b0102 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.d=
k>
>  Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
>  Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
>  Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
> -Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.=
com>
>  Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
>  Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
>  Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Docume=
ntation/process/embargoed-hardware-issues.rst
> index 34e00848e0da..d07f16c3c7b8 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors =
list:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  If you want your organization to be added to the ambassadors list, pleas=
e
> diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-=
issues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-is=
sues.rst
> index 9d444b9c46d3..7d4d694967c7 100644
> --- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> +++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> @@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuale=
s:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Si quiere que su organizaci=C3=B3n se a=C3=B1ada a la lista de embajador=
es, por
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..2f06cc2e463c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6259,7 +6259,7 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Bill Wendling <morbo@google.com>
>  R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>
> ---
> base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
> change-id: 20260528-im_back_baby-1ade32dc049e
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>
