Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830641A08BC
	for <linux-doc@vger.kernel.org>; Mon, 28 Jul 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734807; cv=none; b=NSpbi6iTOqNNWpSCk7jAjcbi3MP5cK8xIiQS/q5Ng0kQPC5V0dZ7CU5z5i6wMU0rnM8MNmQwuZ9Reft7NHWvfdruSLJwVJS/HK5h7i8K1EeRUS0wL06WOMEGSPwWKxjeoHUKH6OQ24Pa/wi+XfS46CcMl8QOsSRZjxd6793dQkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734807; c=relaxed/simple;
	bh=teayqiuCzSaQjJnQj70/U/ADAw/StTCH/gj4tVb3cPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rre4jUEsjKciatPq0tksId75qd2EkmVi4H3QFRILwgK4IWI9ltKEo2bzEZJBKklWq7BdhQPym+VUaamS2k3tEnkx3VGntCFALUqa2PoZalhQ5BUIjVjNZ+iTBoNRBgIU7MKw7JLT6wqfSldgK1YPzxyUTB5gtrIaBVLe7NbOU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hotN5DPh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hotN5DPh"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso5211997a12.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Jul 2025 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753734805; x=1754339605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUBXSlb6O3h9wA9dBxb9GAArtBxswFFmvqz7tVHohcQ=;
        b=hotN5DPhzQRUvkd8L0Bl4kjfeyMihh9gIroLKPz5P47lpuBBfTq6uxqNZbJ1sn3rHY
         LLwfYYsYoVjGPxtR8Pjm0BeZJSy93KqcE8MEVbR0/oAlI6h/Z0nPDbmb6nljCRdcH0B8
         i8GhycY6LLIov770V75lxLxe+jUBWbhkW4iQE4aRY23UexB+Wf4ihxrP31cpbiNUeGEV
         9dbLhKd8eIegCCsEh8I3D39N2ez13TyOBu2w1tVoa2Dk8hsccerapAKRGYLj2KmbkQoD
         pv1CwUzgL89n4k7bVDbPhvLwL6OJbu1WV8G4le4WXrDXFefRBTe1l6pr4BufR02vdgmR
         I0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734805; x=1754339605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUBXSlb6O3h9wA9dBxb9GAArtBxswFFmvqz7tVHohcQ=;
        b=m03Wso4X1CFVQd06ZSxMVNM8x6QnMbA8Do/WwtiR6oe/8xaH58VRJbrDUgEOph/Kzr
         ncrS5fGa4ntd+bgg6io7WTkdajCF7O8flPFCo5qMoBZWL8fiTdBwZQOIx0IDk5pKme7B
         fa6rDnuT0CRjvYSWr1retblRQQwdcAb8Knyb23LvEBtymtA7v6s8qRpLohdtJG2OeGKY
         2GOWdRIDVVLrA+Wohnc8kNPREEOvUcvZZwZph+BPBEuWzv8t6mDtN3CkLbAE/eLdkFFt
         DQv7TMHlYYAbnZrdNSlVg21m2heXeCGwK+iKdx+HjTvBwJ0dEFoWZY/bzBoObZhDfP9z
         w30A==
X-Forwarded-Encrypted: i=1; AJvYcCUvH6DwKGRepwKRJiWTQicUHODG5S+bE0bxH7HPjG7vqPkUuNHdq5MUseMCfUEBnhgPi/Ru0IRoZ7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrkxe7/CqijRCbn2VAu9jVaX6Tq/qGelBum0DqQ1OGI9yC0eIN
	nb96B1BaAsuHovT5PCD+wgi0UdSjD6/ZI/NyO7QIzY896gUTpd0h+8jBJRBfPX1wS0fEOI9u66h
	FS/yWhOddc9lhasMAB95q1MP/qXuQ8NBcmDhMWWtA
X-Gm-Gg: ASbGnct4ZOolo7GsYC1T+Gf8wg1prdfL6GMRKgOi4LV5wzi93TodBpaTl1AZt/5eLCb
	BmJR2+ALysXwWykMw10I13HeU4Ff5BWdWWt6J5La/bZH9lzkTKmJoc1RiLsGk5hXyUOBhmQIucH
	3JJY32KBS+zq38mlONGw0bAlkGnuWLIfKvSpv2+VGtyQN6wxnnSZbOrAlHfXWI/6Kqd4l5t4qEQ
	ZeEB7N89Ptf5XvFZddkf7Q8eSGc6IzQjmf6eYc=
X-Google-Smtp-Source: AGHT+IHK3kKWFUOpDo+1w4dpi3jl6CKAuy4IN5RkLlqGNNAA1K92Ca+e/wtI2hICx9qG3l198YLwP1IzabAVSNvIOkI=
X-Received: by 2002:a17:90b:4c:b0:31f:1db2:69b1 with SMTP id
 98e67ed59e1d1-31f1db27000mr3287346a91.18.1753734804686; Mon, 28 Jul 2025
 13:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728184318.1839137-1-soham.bagchi@utah.edu> <20250728184318.1839137-2-soham.bagchi@utah.edu>
In-Reply-To: <20250728184318.1839137-2-soham.bagchi@utah.edu>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jul 2025 22:32:48 +0200
X-Gm-Features: Ac12FXxrA0KuBzkm3AL3l8gRNoz9nEwCgGw777gfr_Ks9ZDLjrKOw5hgi17LW5w
Message-ID: <CANpmjNPWzJZrAFT3-013GJhksK0jkB6n0HmF+h0hdoQUwGuxfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kcov: load acquire coverage count in user-space code
To: Soham Bagchi <soham.bagchi@utah.edu>
Cc: dvyukov@google.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	tglx@linutronix.de, glider@google.com, sohambagchi@outlook.com, arnd@arndb.de, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 20:43, Soham Bagchi <soham.bagchi@utah.edu> wrote:
>
> Updating the KCOV documentation to use a load-acquire
> operation for the first element of the shared memory
> buffer between kernel-space and user-space.
>
> The load-acquire pairs with the write memory barrier
> used in kcov_move_area()
>
> Signed-off-by: Soham Bagchi <soham.bagchi@utah.edu>
> ---
>  Documentation/dev-tools/kcov.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd..46450fb46fe 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -287,6 +287,11 @@ handle instance id.
>  The following program demonstrates using KCOV to collect coverage from both
>  local tasks spawned by the process and the global task that handles USB bus #1:
>
> +The user-space code for KCOV should also use an acquire to fetch the count
> +of coverage entries in the shared buffer. This acquire pairs with the
> +corresponding write memory barrier (smp_wmb()) on the kernel-side in
> +kcov_move_area().
> +

This new paragraph is misplaced.
You've added it after the "... handles USB bus #1:" part which clearly
should be right before the code (note the colon).

Why not add what you wrote here as a block-comment (similar in style
to comment above the sleep()) right above the __atomic_load_n below? I
think those details probably don't quite belong into the high level
text, but the detailed code example.

>  .. code-block:: c
>
>      /* Same includes and defines as above. */
> @@ -361,7 +366,7 @@ local tasks spawned by the process and the global task that handles USB bus #1:
>          */
>         sleep(2);
>
> -       n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
> +       n = __atomic_load_n(&cover[0], __ATOMIC_ACQUIRE);
>         for (i = 0; i < n; i++)
>                 printf("0x%lx\n", cover[i + 1]);
>         if (ioctl(fd, KCOV_DISABLE, 0))
> --
> 2.34.1
>
