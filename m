Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DD18C34A
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048208; cv=none; b=MpTZJU+UyO6Sq6f6kr0EbJ4XDzga6LfcX/EWdjAlQZmRkU2FlK7kjm2ke9CZlZY9/azG65SlfRKXmmXkwzb3QLdHWegneD7Ky8sJIFiG1NkBRJs3hXlqIX0cN2UefZeUBX5QNurb+xENJGfv5PeH8lhVG51bDIiSzMSkp6Kb4IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048208; c=relaxed/simple;
	bh=FXxvxDNMjpNVzwzqZhWBa1tOHGY8zYU9VrOR2o556sE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGK0uuxUdm0KuMS2xlz+ZrFtFniiTqQj9p/jwXJXgzBH7RObYkcfIneP8/LCgyKi7tpNp6+cCNQpesL2Qd4wtWVD1owfAjFuHeWoQI2PQUX+/+MBoqGnqRRQfpcYfP6BvjsO0rl+NB/FnbzIJHp+UxF7P5NA0bwq6yEUETlC7Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QexLbJ93; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QexLbJ93"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77c4309fc8so547981166b.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 05:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721048205; x=1721653005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxfNNMp1rG3SXkek7cMYvB8iok7DNluaUVkXIU0Xf14=;
        b=QexLbJ93JEyxZvu628I2UWvMqo8uXieaqS/fpZhsOWLWPD7aNNjLthPyQ+49lhkSOc
         qBjx9AIiFwKY/lNLixLAfIQz2hzT5G7i6k5CwSz9v7RP7JSMJ9+s20TdV0yoeKMbvnZT
         WOLcvr9D9LEDKan+HDj9esjlMQw+nFMmFFev9OreNwxHm1MiohItvszOBqAuUqUKDwD7
         dea37r/x4Z3bbgHq3VXaYPO7JatHogAuW+EY01pM2U9RW4x5BtaP25v8zs105zzVVCC1
         a/pXz1USpbpACQ4j4UzbXoybrK7WwMrDj2A7pqPyeZ4DBneAcs+eknHi0Vrj2wyeivK3
         4sDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048205; x=1721653005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxfNNMp1rG3SXkek7cMYvB8iok7DNluaUVkXIU0Xf14=;
        b=uuaoZHPTwum/LGJH0Dd0oEObDLJHNosT1ilP3p9gA7I9bu54OO+oeZFRWS0DTgTHdN
         oaT3CYcqV9wOv1ZKscPPYZwCuy/LcELsamBm2bjuv4HJeeKh9yZhrDLqJHuWMVV3GH3k
         W76gMtjgHLY45ULUhqbXPm6DRdOpDr59HrlbWtLQZxJQ5XRV0q6MKm4BfCZ4iPG1WL8Z
         ONdf5RWu3peW2KymkWQ65fOWX8475jDJsi2nAYWFKOvOtSMZUCgALl12hVBffk/ugUv/
         qElP7XpJx+CAgf4DdZWxUkrvBHpKtrvPtGo+6Ld2TgCDmm0T5zlQehqQRAlGIEEykvKG
         swxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEm3Gov0C8deXGN/uywYbQ+TYEB+ru9bB/s4Ovd/S6Gi9WqFof7Q1hl/tRRxw5fIh4+yL8faCicO6yU9pFBc1dV5GFihKOhXB
X-Gm-Message-State: AOJu0YxAQMtxMAJkjcT0uD+bX1GADFhhu+sQ6+cQzQXJOqt6zmMJ0HUT
	8XLrNWYjXBC0dYunQ+QmwTTo2prtoLesyu23WVxLaUxGdj9yfnS3q5YXJF5zVgHslgUsrZMN5id
	xFMMjl4I8GQZSMjY0SBfe7o8MTTp/l2EHXy1DUA==
X-Google-Smtp-Source: AGHT+IEQxCwmk3v9bZId3rguAE4ZhEMOX7OQcvnvy46JJ2wjs4mq+MuCAlAfeu4173n5ppDi6qdRzxNLjJYPZQTWSyo=
X-Received: by 2002:a17:906:fa08:b0:a72:b811:4d43 with SMTP id
 a640c23a62f3a-a780b883462mr1101581166b.59.1721048205077; Mon, 15 Jul 2024
 05:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-4-alexghiti@rivosinc.com> <Zn1StcN3H0r/eHjh@andrea>
 <1cd452af-58cd-468c-9bb6-90f67711d0b0@ghiti.fr> <Zo3NBHUEMMec/6uD@andrea>
In-Reply-To: <Zo3NBHUEMMec/6uD@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 15 Jul 2024 14:56:34 +0200
Message-ID: <CAHVXubjCdse-3z3hKR81VpdvjxVaxPUZdmTwc4fvHordcfHVng@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] riscv: Implement cmpxchg8/16() using Zabha
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On Wed, Jul 10, 2024 at 1:51=E2=80=AFAM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> > > I admit that I found this all quite difficult to read; IIUC, this is
> > > missing an IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check.
> >
> > I'm not sure we need the zacas check here, since we could use a toolcha=
in
> > that supports zabha but not zacas, run this on a zabha/zacas platform a=
nd it
> > would work.
>
> One specific set-up I was concerned about is as follows:
>
>   1) hardware implements both zabha and zacas
>   2) toolchain supports both zabha and zacas
>   3) CONFIG_RISCV_ISA_ZABHA=3Dy and CONFIG_RISCV_ISA_ZACAS=3Dn
>
> Since CONFIG_RISCV_ISA_ZABHA=3Dy, the first asm goto will get executed
> and, since the hardware implements zacas, that will result in a nop.
> Then the second asm goto will get executed and, since the hardware
> implements zabha, it will result in the j zabha.  In conclusion, the
> amocas instruction following the zabha: label will get executed, thus
> violating (the semantics of) CONFIG_RISCV_ISA_ZACAS=3Dn.  IIUC, the diff
> I've posted previously in this thread shared a similar limitation/bug.

So you mean that when disabling Zacas, we should actually disable
*all* the CAS instructions, even the Zabha ones. It makes sense and
allows for a single way to disable the CAS instructions but keeping
the other atomic operations.

I'll fix that and add a comment.

Thanks,

Alex

>
>   Andrea
