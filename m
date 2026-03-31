Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BB342524
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977476; cv=pass; b=A0bRx/hVUjQxWtcBkwYGWU/531nVbhONQ47iAdWl5GkxbnCnm6676dCmCkoMC9eEMAaGoEwGiDl9oI/Odl42euXAe8odKV9y/PK9mTK1zhdBJWS4rGxMAnPOk5BoBxhna7XqavFtLBmG89O1EUa5FUvthTN1jFzD7Fj9JwzroG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977476; c=relaxed/simple;
	bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPCcgrAitsij8lQrNG4HXEkRAnTSDq9z/fAWlbGfYkHMZR6R2xINOr5ssGUD6z4iBB3eRN3H2Y2eFVA0H/5EFfJkGoRqHpMF1CyFKUxfyPphonP8NDFk1WsGl/dMZ4tqeG24lk/ospIGmL2Ah/Phk3GzF7M+2pxzh4IlRIrjeFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g4GSVzlP; arc=pass smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g4GSVzlP"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-60567e76830so10908137.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977474; cv=none;
        d=google.com; s=arc-20240605;
        b=OdeP6mj6i9i+QQQrVVcpuoPjzm4eubVLI5T0XLeqE5Zl7UXMOPb4QbRdVCen9jHS9K
         lZhpCfg/weCcpAmnk7UUZxIfHsnREFnNuiLKBL9PIDheq9S2sl3Z2fZ1m2ZsaXKTPW1k
         kRDQReqQpR7gj4aeYYsZ/mE/TN37Lv9Ab4MWFulLwK20kNxAJd3heuLeFeq/owgtwRYI
         5DUx1quA9TCSucbnnI9gDqo//26dgeXciMEUaI2r+Ff5C4H8y1bz3TOF42iqgOiIvA4Q
         pyVVn1chJP4K9oXNzgpY9pFn9JHLXwdB1AiRRLD3NAKw66O2YGnmPeko7hyY+v030e3D
         Ldew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        fh=vtoLIcc5oI54KXn0lfqPLJpiYMuguCBNTuYBWIdfhUg=;
        b=NfP12nQvPbzCoKQx9x2pVLfsVcDnmuC1RDwHB0L77F5vdwE9giqX2OjzVC8zpdyj7C
         fciQTQH6QtniPksSqjlxFfeiIThG6tdJfIlKKQ3loDtsjOrIqoVGpapuZVSLpwzmU92C
         +McAl6BtlDL6B9KTif20xECXcPn4Zl7grCW+QR24jspt7ffsb0UIEWl9Ey2UnRcpi+Ux
         pHXiIBBlmAc0UOgf74YKChgxZq+JB+jQdPevWMTba9GyTWCB8SZX1OCrx14BxjDMH/8V
         U0HhXuBfN7mFaFoIxKEqeDCETV2i8isCSzE95jrYExpCYbWmeD/YBoDNfFsf3JRRjbta
         11Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977474; x=1775582274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=g4GSVzlPvZyTxCdQRik9r58eeT3v3a/iTwQpqVjcArg3oZq/1wkwpys2I1Cf/kxCFH
         6djOmhHrT7fomF/WgtcNZDLzyYQG7WnV6dNM9A7kHloTjNwFhbvPNBwNiPJCGMFgJvIv
         nrhzSa9HTdWbe2JaOROrd9RyBsYf5ETfj7+f1cYQgn9sjWCJ6+9OaafpGTm7j+7zglNw
         f/qze2XNhWiUM6J9/gfNoCCvR6g2PRwDDfs22f4RpveOsgfYG+5tEw0DLmTfMu8kRX1Y
         BnOZP+h6/0JJ7yqPuJjm6+pnI+7oVbmcSmdZUcSCKm5Loyc7/zq8j0IZ99OVMY+olF7G
         Jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977474; x=1775582274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=R9PLHjjDNQ4W98QdniVrslcFwZAIHKKYwv4fL4h+n19zg/dfQazYkBgRJFMt9WCGAa
         0Bqx3zU+im19KWNlUkmubV7cV4ReOrUBvcznkyYRAAu+7VypL+c2aRa7oW3Kygbz9yIz
         Yw2ZrytpPg6gw4lHZiaOQMZa42YckMQX+oHNg3NJryHDUXCGgq1UkOboKo3vvng/AtYt
         Qe84/V06I0EwQW9R0cy6B/sBSDaReuZCAC2hHQym+L55auIDAIFUmq5TJSI0w1xrgkk1
         tsYwryxTbT2bVuUbb3/iVFGOjVZY9wKIr6cK9rznfrObjxkOXsACrjJc1Fe90acIyIx7
         JwCg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Wk0oJY0J3uRCb9VAudEgZlqdXWf12wFaG00b6cX/r9ne6wDfqqmcYv/g9fT5/Wh5mVFX7HpspAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CmRgeelbfGLjDC82anvxHhoMOraQJJ+wWzkk7H63iAP9NTnL
	ZnV2FtbX1UU/YgFH8siXX7UU1KymiNkwZiyw1udYath15X4NY86PRVvvhgNISm+coPyHF9TXmru
	MTJSGFFAcZOTEM+UyfJOnU4OMmJCIpiE7K8tSPwIW
X-Gm-Gg: ATEYQzzDB52ax0X4uHO5Eenhtzt1lGaj5AXZG3TdK5SXCy33Vd6ri10/zbdOgtF8+Wr
	pbebrMJH8KR7AxFuWZxAk7vf9U0iK6bCxlsVI5hTc4OBsoJWYLq8KI7sO1jgeiqCsIst2UE2hjv
	6NShd3PfTK9Xc2qQVBU09EtQYPYsl/6c0xQ0V607wSVuof0zWjG7jWcLwf50T/aTvVccHfNtBc8
	oFJMK9jIV817Z2CSUablgSrYT2GHFxXg9rGwyNSLP5nJBuMtEDQpAC+RR5SmG82UNkHdg85fFAu
	eNdPEuA=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr40188137.14.1774977473726; Tue, 31 Mar 2026
 10:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com> <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
In-Reply-To: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:17:41 -0700
X-Gm-Features: AQROBzDziq6Gf2V5ut4O-Crb8XfwsiZEe1mK1jC7L_WO2ZUVxZo1u0OLGaY1nqw
Message-ID: <CAFhGd8o2C5T4_-p3zsSbygwi=yDPOdpDBPC69X=R8qoefbVXew@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

Hi,

On Tue, Mar 31, 2026 at 10:14=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > __ob_trap and __ob_wrap are defined by the compiler.
> >
> > There are some examples within the documentation additions of this patc=
h.
> >
> > Kees, is it possible to make it more clear about what we expect of
> > kernel developers in terms of style? Should they use keyword
> > spellings? attribute spellings? only use custom types?
>
> Yeah, I noticed that right after sending the email, sorry.
>
> So I tried to use a macro even if happens to have the same name as the
> keyword, since that form is a bit more flexible, but it is fine either
> way.
>
> What I would suggest is adding to the comment that these were decided
> to be used as keywords, and thus we only need to define them as empty
> in the disabled case.

Agreed.

>
> Thanks!
>
> Cheers,
> Miguel

Justin
