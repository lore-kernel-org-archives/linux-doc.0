Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C828101E3
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707903351; cv=none; b=CIsO+SeZv8xYK6XPwysyZVYM6rzc21WP2FTdB5R3sD7sNluKXkQcUuzISRZ0Ao1vejMKplhHCXac56H1pQth/ea+PE2XR0hs+D8T+3oMoG72ThhZIayOa+cFTqAQ4AKIa6bVxINV27wwpVsYOhqoSRW0Mf5DqBfAiKgKK3hw7dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707903351; c=relaxed/simple;
	bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNh+BBf3PypHo+6hf4XA5deCUi7qaxRl5DcgqCZv1QN9ahltNYtD4IBt2pFyPd2+sxx3+i2kuKfehgOlGxedUp3fdGOxyAYlE3Qgjwcq2cxAYl9yNksgprJjF+b9wZW6TzfLPHlUt2SgiOxwGyJnK5fNn6LfVpWv1BSYREHeCMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=k9eS6af2; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="k9eS6af2"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d698a8d93cso866792241.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707903349; x=1708508149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
        b=k9eS6af2Le1UDrnWN4cY+JAmQ33DtPRzd55GR+pIeNMrDCv8z7vHyfwaqnTqbIc0Xf
         wO6pDEbGuortCX1plRHEb/tnavCZlIa2wCtfa1zkS731DYHWpSnC/fkcQbsq3vrQoWYI
         zCnh16Nsf7idk0olqb1AVOJ9iTv0imxvD3+no9uByAT7aYqdkMlvfaaCOvOuVLJhSc4x
         YTqhJ0jCz24Ry5SBC0N/LPxtgx4ZrSv/WrSmu48up0CO34tsqavzN7YQPQrbQmlP3If+
         j4QynBK4lm2GY0qXYou6WH/VW0qkUoep9rZXQMOgcQ2jFGz7BkXIiayiTj16wqAnfOyW
         +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903349; x=1708508149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxGJAH83UTrQJFawuwOkZhQNDaql6s20rG59BXEIoT0=;
        b=LxqsaGkjUI3Dv6y2rB21E/82lgvSfzgGM8FI+REVaX/45Q1CcP51zASZhuw2l2qx5v
         rcyW2iJ6beb8RvRKUW6tStE2iv/sTLiHVpo4zOjfawQltGoUJSNgakd685tse6TbQKPz
         Z4f1KwLizVW2TRxdo9HMIagBCyHUJ4qWnRPmviO+Hd2vO0XCod3FpShC12xLut3yrnte
         4aWFWUYiBU9/8RL4ARSeajEglRdD8Nqhctd1/226SsoyYZiDwGjv5KODK9sRi498VU/p
         IGSfnhTIFyixpdqcF5Ub5qHXFdolot6o6SyfSfn5o2wLAj7+ZKZC3edpVkQY+/c+KSfn
         aVPw==
X-Forwarded-Encrypted: i=1; AJvYcCWTZdzXK1Ebdmeps3mJc/1Zv99YXNhuTHgoT9DAJdHDatvju2JsNZvjiah6hiQw7VGDrxFVBZoKpUXOpu8MB04LDdH4EGFkP9Nt
X-Gm-Message-State: AOJu0Yx/BC9H4ITrhiOKwXvfEmY9x8hHmMoqRAswLljpGVtu/8Nfat8O
	B7jdidfa8rRDZnzW9z04+YQQs0asPt1y8nKNJsIul9Tz8OxMiS9doYKnbAe2YshtvF53QZXKRvU
	CEHmY7IPX/b/50gIhgVqV4ewNiu2l3HAb0q/XjQ==
X-Google-Smtp-Source: AGHT+IEOxg1ObHX8j5ADuwz4SaSKeY0U/wXSXneGYVCIWIk2eqRKhLL0UkhWDS2Bv0MsNKDNNk02uHpLn4FhpW05EPE=
X-Received: by 2002:a05:6102:2746:b0:46e:d0cd:428d with SMTP id
 p6-20020a056102274600b0046ed0cd428dmr1931571vsu.33.1707903349246; Wed, 14 Feb
 2024 01:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213141222.382457-1-warthog618@gmail.com>
In-Reply-To: <20240213141222.382457-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 10:35:38 +0100
Message-ID: <CAMRc=MdmfHLyy0UrfC21UMxFa8CTySOx8LCEg0Nt+Z9tb8mRSQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: consistent use of logical line value terminology
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:12=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Consistently use active/inactive to describe logical line values, rather
> than high/low, which is used for physical values, or asserted/de-asserted
> which is awkward.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Applied, thanks!

Bart
