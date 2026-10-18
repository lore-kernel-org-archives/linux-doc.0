Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF53BBFBD
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345849; cv=pass; b=Y9j0cdLyjXbs7mZgNT5BP0s6N0KfqIxW7opYn8/JaCPbjh+jX0rmW1ocnNzDreVgybRSebOAFzz8zePQFfwOBzFjKKXgwaa76V0/x0s9KKrMZavJFrrcxxR9z2dhZN6gPq6IJ39FPUhBVG16n388PoWPr8o/429xiLGCyQjth/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345849; c=relaxed/simple;
	bh=WXv6UKA/9yuqwbZcgBBetRCfLJaa7efW2S21doIVN0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eNGtkRz9HLg1D62MTawjTVGvEhIK6P6t31ElFofI9HrKobjiVqn4g+DS4d5tLclAg6YO1XruunQT23+V1CdWcoLSSOla3+Qo3/M5k8FoTMAn5NodTYWsrMEF40WbC314tVCuWJbtx6pkuUIlMV/alB4SM+Yr2aMfL48/7QmQLt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhdeuN19; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhdeuN19"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so2034581a12.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 10:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792345846; cv=none;
        d=google.com; s=arc-20260327;
        b=M1dlUQ0m7IvbZxS6YgBUUkFDNVwvLlL+ihR+G7LODWKrMI2yvGhMmCx6zb8+ilrHQQ
         9fHBH/QvRGKpW6kS7qHJZQ4B9jlkwQzk8cAmatRdrDCom+StJRR8TsPsxYuVZMEj421U
         Ip30fd3rcauSZs2nPFLDwvmHUIE6lVXl79Gr49bMhQc2sytwOpJk9JQz6fQK9E0njvcL
         80r45/corWJW+BGn3GSsO0dplWzplpKtWReLm9oB0MqVySv9ELY3hMgAPXmxKFNa2reW
         pnEzNcFrF6ClTIsvLsI74VPxEoMS+e6ALSPjhse+YqhlAhYbH89CjM8A+UGjU7xQkgde
         UbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        fh=zkTNgLlFtSA9kJjVZXwI2Z00otfWOgwdvmSei+6Xj4M=;
        b=FBUCTWBjeXznUKMHx+qLW4jn9d3YP+c0HsBxI1rCTtT4isO/3TWKDKhro2ZSUKTKNo
         rTosqouuFYwEbA9YJf3tfTV02234IFhEAFQQ1AxoBQw19e3lF3YcL9CaGieIhRRbl6nB
         2nG55EDWgrcqXCjbwBGko56/VdvfQ6N1rB0v54Mk9Fzo9z64zflaNFTMjwNPQ4x9ecEP
         PVc2maAy2RgV1RKTdXeH2PpXf7RUw6fFl7MttTd81Ki6NA4wDeim7oMkCKJhSJCy8rSu
         p0ojbWpkhsW0YCF5s3cNfp/vyOG415vysHImpEivx+ABilx+/4g9eH00xDkttraX0w4d
         BC6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345846; x=1792950646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        b=FhdeuN19hmZwMH6SNxPtLNo3n5D2G+4Yfk8Huc7HsCL/lffihO3nLDtCvzv0oZ2441
         TdntBLL9ZVXG4R8WrRtei/u+WNZ7J2tWzTacUrghbUOGqyhDTG/KVXSd0zg+pDil0R4c
         8WEQ/5gtEJE0TL7e/KKNp+SS+c5FM/evaMNldk3Mjnv95C2vGu8pkEWlXf0cnKsu6P/m
         IafNE5/+Zvx2QunzPM8UxMDNcVJouTGbMkg5D36W0e6eZKEv9yyEik6EeIV2DVqaLA1w
         gQMAuwY1GnCnmKkFi5dckgtqOoxlOgebmqMiGxvpVTO4qvk0eNfe/aoUCwjHaoePOthR
         qh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345846; x=1792950646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQ7W9KldKYkaSyjjE5daJncD2A0RYd8lziVm00Ic5Mo=;
        b=1rNuoF7LMcPC8j0LmgtROefkGAUyMXLeC6M0Y9Cz5Uo1JRbHcg+6qbTBPK/esSXXSP
         Q468greQZ8wilQfzFy52xz3FxpvS09Fv+9sRHUoSrCQ9fbh+kwT/pdfFrQt4c8bEegBz
         5DrB+KmBAz7CcxdyZgV93BEwO3ZRix+2j5WjUX1yLybkvSAEB9NiuuI6PiU+iRrQyEPA
         mGPmmRKEL+4vr8mT9Bysgc6V+Cb+pMF8OEjh7+0sziI/YfnXN59qs1I7Pluz5Dk5Zwti
         7EcVmMFuk/xT2hjNtY1jIyQJWMGtxGGn3mghnG4Fw4U8rvEKBT412upgMWjG3YuvisVz
         yn0A==
X-Forwarded-Encrypted: i=1; AKwUvBzsrmNc+p5NU6KhpE5l0DbzwGCjeMzMFfxK3kvsN1IHfLfM4aumQZw3YgRj1tBOGvPEEkTNIyasiM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIERc18BgtxE6/i+by7lK5aY3sgAHqI3cO5D3H4Kc1YkX0i/ijC
	fmNTJbXwAJka3kWjRiTlMSZBwwnYPriHwNucPh+c0zU11K4xd9cD1UmYqXfWeRhhigYMVbUyu6d
	nOlWV8EhGkiC+STabMjm/ykGZImE1JDMrUcUNv5Y=
X-Gm-Gg: AYBFou14jrRo6KLkxvBNXYmGptvbFpoxUoxkZxL88an4ERd4R13vY7pidIfkMT+1l1z
	f/5H0S67/gR7TedvjcOe/1EWPV8MnScIOnHMnODaENlvRItas04wP6WNS2Ro+AqC2b0iJF9lWq3
	9sp1SAlO7w4EaEQhMSh/134Tz/4uN5r8mfOGSHjFbbYclNxsOw+RDcr+UmLjOSoF5HrQOMkseX8
	6h13XCo/SkDosLICj0QenQ6yBphqPqldJ2M4o13qvjxfChzExSCl+F0aKWtqtZsdQ3MAalgO528
	PhR+KrF3ofzYWC5cNK9yop3DE4WHBVRSX+G9iCDcA0EtQO0rDTeA+b88SM9FPvWNcSu3vnKLAJv
	77902PlOMFnnbdHFm+Naj4lK4NNK4cAYMdqt+v1lvZg==
X-Received: by 2002:a05:6402:4487:b0:6ac:a1e1:3f88 with SMTP id
 4fb4d7f45d1cf-6b3a814b026mr3327488a12.14.1792345846166; Sun, 18 Oct 2026
 10:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com> <20261018-alpha-perf-regs-v3-v3-5-52be85332c57@gmail.com>
In-Reply-To: <20261018-alpha-perf-regs-v3-v3-5-52be85332c57@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 18 Oct 2026 19:50:34 +0200
X-Gm-Features: AclHuK-yU7tSzanPsDFTqgaSJETZpGEAojUlwTccllHoXkgRUI3VKv_elNnpC4I
Message-ID: <CA+=Fv5SFFGtWj_Y8Y1Qe_W1ooDom97VHMiBhfF7b17+FYHL=3Q@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] alpha: fill in pc for software event samples
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 18, 2026 at 4:22=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Context switch and tracepoint events have no trap frame, so perf builds
> one with perf_fetch_caller_regs(). Alpha does not define
> perf_arch_fetch_caller_regs(), which leaves that pt_regs zeroed, and
> these samples report pc as 0.
>
> Record the caller's address as pc. The zero ps already marks the frame
> as kernel mode, and pt_regs has nowhere to keep sp, so pc is all that
> can be filled in.
>
> perf_fetch_caller_regs() gets that address from CALLER_ADDR0, which
> alpha defines as 0 when CONFIG_FRAME_POINTER is disabled. Finding the
> level zero return address does not need a frame pointer, so make
> alpha_ftrace_return_address0() available in both configurations. Only
> ftrace_return_address(n) still depends on frame pointers.
>
> Reported-by: Magnus Lindholm <linmag7@gmail.com>
> Suggested-by: Magnus Lindholm <linmag7@gmail.com>
> Closes: https://lore.kernel.org/all/CA%2B%3DFv5S8-Zk8-LUpZnWiBfTGSQXthepm=
Rc_-a9O%2BpEPmVW0mRA@mail.gmail.com/
> Assisted-by: Claude:claude-opus-5-5
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> Acked-by: Ian Rogers <irogers@google.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ftrace.h     | 5 ++---
>  arch/alpha/include/asm/perf_event.h | 7 +++++++
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/alpha/include/asm/ftrace.h b/arch/alpha/include/asm/ftr=
ace.h
> index 7ec44134c804..5b75a294a7c9 100644
> --- a/arch/alpha/include/asm/ftrace.h
> +++ b/arch/alpha/include/asm/ftrace.h
> @@ -2,8 +2,6 @@
>  #ifndef _ASM_ALPHA_FTRACE_H
>  #define _ASM_ALPHA_FTRACE_H
>
> -#ifdef CONFIG_FRAME_POINTER
> -
>  static void *alpha_ftrace_return_address0(void)
>         noinline notrace;
>  static void *alpha_ftrace_return_address0(void)
> @@ -13,6 +11,8 @@ static void *alpha_ftrace_return_address0(void)
>
>  #define ftrace_return_address0 alpha_ftrace_return_address0()
>
> +#ifdef CONFIG_FRAME_POINTER
> +
>  /*
>   * __builtin_return_address() requires a constant integer argument.
>   * Keep this as a macro so the value is seen at the callsite.
> @@ -21,7 +21,6 @@ static void *alpha_ftrace_return_address0(void)
>
>  #else  /* !CONFIG_FRAME_POINTER */
>
> -#define ftrace_return_address0 0UL
>  #define ftrace_return_address(n) ((void)(n), 0UL)
>
>  #endif /* CONFIG_FRAME_POINTER */
> diff --git a/arch/alpha/include/asm/perf_event.h b/arch/alpha/include/asm=
/perf_event.h
> index 5996e7a6757e..72536566014a 100644
> --- a/arch/alpha/include/asm/perf_event.h
> +++ b/arch/alpha/include/asm/perf_event.h
> @@ -1,4 +1,11 @@
>  #ifndef __ASM_ALPHA_PERF_EVENT_H
>  #define __ASM_ALPHA_PERF_EVENT_H
>
> +/*
> + * Software events have no trap frame, so perf_fetch_caller_regs() fills
> + * in a zeroed pt_regs. A zero ps already means kernel mode; only pc is
> + * missing.
> + */
> +#define perf_arch_fetch_caller_regs(regs, __ip)        ((regs)->pc =3D (=
__ip))
> +
>  #endif /* __ASM_ALPHA_PERF_EVENT_H */
>
> --
> 2.55.0
>

Tested on my AlphaServer ES40 with CONFIG_FRAME_POINTER disabled.
Context-switch and sched_switch samples report valid PCs, with
synthetic SP correctly remaining zero.

Tested-by: Magnus Lindholm <linmag7@gmail.com>

Thanks,
Magnus
