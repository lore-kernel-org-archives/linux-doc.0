Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461DA314A6F
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976970; cv=pass; b=diZCfYXF6vCi5TpwGEY+hXWVJdfPH+HAtXG8rm9EDScyIH6c96ydtxbnBwm1/MOhsfshv9KKMJ5N7QksWNt8IbHvJCOxhKf+wGqCtbabtNN5+tHHp9IKLYhivgAfFPzHXsZ65Om3Cu8A+Rio4qH4ztw72iz5EFb0WNRik5pjJvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976970; c=relaxed/simple;
	bh=WTRVHRp3YZnZVbE+0ZoSdIPjJ/az35/laG/IbVwaY3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtaBYMyZAxAclWY/cGN1f40+82OUbUXwLwNcJoBAyS45txLbaEUJKl9TG0DVnyKUb1jIfZWK6s5WHhQqGzw0DiOs5jFQmCYTEPxLDrNcRllLPhKeFQkXbxvqcmL1v3SdQPSvYv6XwEV1At8SJT2u63CxPkhUbQDUDuc3/JojK/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPEFYjmW; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPEFYjmW"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124b07e5fe4so253597c88.3
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976966; cv=none;
        d=google.com; s=arc-20240605;
        b=OoScQuNAih670UOo4AuK/nF1EfXQgfS2Q7Z2WBV/4j0p0daO3rVFhF5OJdJpvNndkA
         VGMPlsaWcCftMGi7FVfQbY8u5FLq7zl7WoKtEWZuZnD8lU87RocAeyK3WTg4Fb+K6Ka3
         6KkoJ2DjuVNeOMhmiK8Nq4qmX0RdAnYDRIWt1dS2G4791YMxJ5s3Ol89PaNKf1Y6tnN2
         wcosxYBFLhlmHNTKJPS6HC7fqH4O6/pcr7byZ1szvH8pQ4J9DrK0ARWbDojyNgRX1ptq
         VDqE3zM2Iz1V9Ux1Z73wSNCgSiGIpXNIADZTKwuDCZjqM9NYN3HsKj60WOPmCS8fSAgP
         1AFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        fh=kywyMPeYWI4eFcKG3CLkkxuUSUebELayx569Z4uSO5A=;
        b=UiXqUmRi6faktOW1HC1WxjpAn6JJn5v4WcC3vF66KU+hVYNXtNq4eMWOOWzh+CPjkR
         b54UF9c8dSEl6J+oWwu5WyiYSUauaQkIuf4f8uYTOcB2vopAMYNOCjbw0P9mu5yKm7Oq
         6Qj1ksCAp/WYNfw7vqa2LfMT1jVdYBG9Y5xjxYPvW/gJPFag3jf5NWYPlOEro7clEBc7
         RtKBJ/4QCg5FhDlVvjWhet5e4+tXoqaHi3Whk5WHY52iwrLHUtvR4FXPZ6ikQdu4+VI/
         8oWRxUaJ0NCrcWMAYnKIVN74Fcl6rrq2EGCdGwGsfTbOuIEfQu1oWBTt4hxAcqblZrtf
         qk2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774976966; x=1775581766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=RPEFYjmWEKeAgqRxKPdWHE2heLDNY/RoMjWk2+Cgudw8yFsUUJLHt56vK1TCUfOfXx
         tEMx3hVh4CkkWaTve+bHJ//V7V0cgBHevePROUWh4mdx+Y7qeZ7YCUT3ymyOpvEpLTuA
         m5wjm6ukdM6cj6LxdC+6PtFDK3jalNQUybs80JcJ+brnn8x/sFBqTCn9cos7AG7ySBl3
         C8GCoy+gi/gqXOoFEnxZnDAglw2QRQECL9wX0mlkD9ZTFLpX3/Z/Pqk1++rxDV8EYXKm
         mkFoS3hoWd4csJAvMh6ZH0vGmso3l6npcKPddYk/A4DOnsOMq78m/Up2RWzQFTV3h663
         bx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976966; x=1775581766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmCH9wEuQvIKAkIe3dk/Nd8jQ97KUjGLE+pTGY9wyZI=;
        b=L38ch9bEk0XiAYpvJ+oHw9YrdE7YZADBQtBvVG4my2+1dkOXXBvbdglyHnShfNEDIV
         bcrGi6a4aTFrwmEkTDcEVUvikMGhKRApA1GtRGcBaJQNsEPJmH/tV4yIksRunmcyL4G/
         Q2MR9RGD07wK7k8YyulMbuHjcQvWjIMQlzHqkJYNDeCUBPrteeJWU/TatFwCtcCeeCnV
         Oz3yk4ZbP/IbSbNPd+yO8HYeM13BVP4jTrtqMFegzUNKnXKnOOgq4QM+596HNsAInDMr
         iAprLYZB65MKmgYunDhu3ckffMXRXjbAaonfRXFZ09TC8YRpdPOj8JQFNw3rjKmPxB65
         HVcA==
X-Forwarded-Encrypted: i=1; AJvYcCX9NZWy6AWt4dqdnTdKbRK9WtJTWl9G27uYA/rD8OgWxu5NZTMOfgdxSIq338WzLXSZ4t6NFED5zqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBSCuzHu/0/N9ECe8SUkQncZz92M5SYREx3n5e5b7+wE5k7aU
	jEWDA+wo9C2punBziaNqduasKj8dPyllhlbkgHI9oorj1aaMi42Tf05GZwHThBGcQR0gZiY2Le1
	IPOHKdL7SMNSzUL1JwLQ/1HBM74r4zOU=
X-Gm-Gg: ATEYQzx6EQL1q2CqqsywtV+6ndop+XGMU0JWNARohziXxpoUuf5tg5jvgp9UaDtr+Ww
	fm4oOULAONjdaAWHy5mktcRngurY0SeDxQHjB17FQgPpc3F2BznFzskKE6kU6Sky97KOQS4re3h
	wwc5zfFT25q6XGsYxNCd13wER6lwXlXI3cokoA8vmY5t5d7DcWkjnoygFYG0RcN/YyHZ2J1Gbnm
	WtGwzmObqabA4uRzvD2AlygfbiiQkECRvriTDvSeodjqBrdg3Oi7DMY7u7W145jRFu0VueRIA0I
	FEv45DagHmQvClXSwRXwptXAQEqsM47Fa/jN4+AsoTAb5WV6j/5Zp3eYVoXdSkq1rkS8fRmsEtf
	KkgVskF6BYrQG8SoYeJJEbFgaylfxMKDCYQ==
X-Received: by 2002:a05:7022:660d:b0:128:d279:b8ea with SMTP id
 a92af1059eb24-12be65beca8mr58281c88.5.1774976966237; Tue, 31 Mar 2026
 10:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:09:11 +0200
X-Gm-Features: AQROBzBS6-knL1zyoKnZ9aw9c60rLyHZCDFo7ofTsu_CS53BZFovGzzWB07mGSA
Message-ID: <CANiq72nH1cMgpQGGkbwCQd4bSEVarWteaQaXeZh3FNyNKauKKA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

Ah, it does, it is a keyword, and I should have read the docs better.

From a quick test in Compiler Explorer it seems to be fine to define a
macro like the keyword:

    #define __ob_trap __attribute__((overflow_behavior(trap)))
    #define __ob_wrap __attribute__((overflow_behavior(wrap)))

That could be a bit more flexible in the name we pick on our side and
more like the rest of the attributes, but if the intention is to
eventually use that keyword in standard C or similar, I guess it is
fine.

Cheers,
Miguel
