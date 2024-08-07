Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141E1C9DCF
	for <linux-doc@vger.kernel.org>; Wed,  7 Aug 2024 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723019267; cv=none; b=qG9UxtgpJ6nMSwhs/nbCR68a0a+kv/v0eINYZ9pae4su9Qr0WVIgCmLo/zPI+2mt7ubdOztghSWM8uKrPIZ/ODnxAEBiFNQzacwCQw6xJ5PfZexuzxUorzob5ap1vB5+X8sH2wk+9jLZ3a/n5HdLrwgtUFEkxEOAMz1pVNCoDu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723019267; c=relaxed/simple;
	bh=VjCKTrVCGp20uaV9/jDf8DJnQm8WVUERSF7FaiYYu+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1KA6p95h2rj77Ma3S3Hev/oi7O1VE9jxmpxav8gDdZIjMrX0yMQ+aA+XxEpTwkdz1wKEI1I48Lv91Loiq+COc2mc6HytgJU/dGlsrRAKBCoZjB3kzXQpG3AaxdsiuFK6ZPdheCwxdRCrQjud5yFJxZcDCPXQdu3sYaaOL4Nkwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gi8WhD5w; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gi8WhD5w"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6bbbd25d216so2494636d6.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Aug 2024 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723019265; x=1723624065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcjlAwWs3hexCvUovNEYGd6p98RErfbaioX/6j6nW3U=;
        b=Gi8WhD5wsTCYEI2qZgUSHj/t0IedxaS2k6iU2cC3vV29WoR1jL3hDGPtYdHSnAzLhr
         fQmAloJ1mRft07Wt6lCOrYR2rfX0VBHOu8rIhJ5uAgB51CF1M7MnPTs8pWZvn8xo48VD
         L3723Rcy7B1k/leeILvwuprKCBBe/5PnsAcXiYLiuTzh1YNPPa6srJf06w5RZ0h+6jMA
         A92P1guUVshPxdEB1TTFiCClvE0Y+5bvjLi28+q+C4GF+hvg9BXeILbalGtsxRYUHA4d
         cFoJTzbPewxlgdo6DULUhW26poToYe44glaXr3YPzFAiQp5ZBVd8HD2iKOrlTTEaXCf9
         m0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723019265; x=1723624065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcjlAwWs3hexCvUovNEYGd6p98RErfbaioX/6j6nW3U=;
        b=VZ95nll+zu47firpHlT8wuy2YThA5B2PibAHQu8Y0faMpl6BVf6Z4lLU/8JHnpbkeZ
         ZDhVQye0ArVUoIjI/GHnGp+q3KQy72EpRI6tFWF6EBpR91A70nTZ46iT3IPhNUoNKdpB
         h38mK4Tbdjllj2EG8GP+BS+F/atIT0Pccas02JwJVfJnETCWv9aaC9UYNdoS2+8tDgRx
         ALDz5nJrr5TdrMy7yXtnAsn/DHAff7v3WYdClaOP7u1n1D539aXRUl028Rf9CZEKoPpq
         z+XdXL3fk3sYxBhuFdPWJEAeHY3gVbJ/jgfTfm7k3k1idDmPsyCSwZheBw8MGvfUgrSb
         rEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDzjiO6SH6QappVRgCiE0vqPeODn3N1kswjsHURW8nWi4zebmKniRl/6MWoyIJRwf7o7D/w0+GuZVEspl6Q2omvAneo8fmn8Tb
X-Gm-Message-State: AOJu0YyNASI+895FYAZVXi8QEnp1BVM24/mwK2B6y13AyV6IGyAboYzs
	+Eg/Qw36FFu3VULhqQ9DsKMkgwGTDFJi0UTYXk/a4Sj5QEZgnueWUjXf3P67oxf5cGC+KjAxSAc
	qMUMl1y/dwMkYL5EJ4pz4iugi2DR8T9DmH/u+
X-Google-Smtp-Source: AGHT+IEcvMnb4X4O6U4Rpq53D1t/7zNkq31q4hjFOvgZYWlOqyzxxBJWe99x4DZTzrTjPjBVKDTFaDZdCmVqbpyHddY=
X-Received: by 2002:ad4:41c2:0:b0:6b5:e0d3:31b3 with SMTP id
 6a1803df08f44-6bbbbdc7376mr27127586d6.9.1723019264543; Wed, 07 Aug 2024
 01:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805124203.2692278-1-elver@google.com>
In-Reply-To: <20240805124203.2692278-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 7 Aug 2024 10:27:03 +0200
Message-ID: <CAG_fn=UBWge=QGeB+XQRtuFkzqWbrA8_FJsrwhihhwkrzt8DoQ@mail.gmail.com>
Subject: Re: [PATCH] kfence: introduce burst mode
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 2:43=E2=80=AFPM Marco Elver <elver@google.com> wrote=
:
>
> Introduce burst mode, which can be configured with kfence.burst=3D$count,
> where the burst count denotes the additional successive slab allocations
> to be allocated through KFENCE for each sample interval.
>
> The idea is that this can give developers an additional knob to make
> KFENCE more aggressive when debugging specific issues of systems where
> either rebooting or recompiling the kernel with KASAN is not possible.
>
> Experiment: To assess the effectiveness of the new option, we randomly
> picked a recent out-of-bounds [1] and use-after-free bug [2], each with
> a reproducer provided by syzbot, that initially detected these bugs with
> KASAN. We then tried to reproduce the bugs with KFENCE below.
>
> [1] Fixed by: 7c55b78818cf ("jfs: xattr: fix buffer overflow for invalid =
xattr")
>     https://syzkaller.appspot.com/bug?id=3D9d1b59d4718239da6f6069d3891863=
c25f9f24a2
> [2] Fixed by: f8ad00f3fb2a ("l2tp: fix possible UAF when cleaning up tunn=
els")
>     https://syzkaller.appspot.com/bug?id=3D4f34adc84f4a3b080187c390eeef60=
611fd450e1
>
> The following KFENCE configs were compared. A pool size of 1023 objects
> was used for all configurations.
>
>         Baseline
>                 kfence.sample_interval=3D100
>                 kfence.skip_covered_thresh=3D75
>                 kfence.burst=3D0
>
>         Aggressive
>                 kfence.sample_interval=3D1
>                 kfence.skip_covered_thresh=3D10
>                 kfence.burst=3D0
>
>         AggressiveBurst
>                 kfence.sample_interval=3D1
>                 kfence.skip_covered_thresh=3D10
>                 kfence.burst=3D1000
>
> Each reproducer was run 10 times (after a fresh reboot), with the
> following detection counts for each KFENCE config:
>
>                     | Detection Count out of 10 |
>                     |    OOB [1]  |    UAF [2]  |
>   ------------------+-------------+-------------+
>   Default           |     0/10    |     0/10    |
>   Aggressive        |     0/10    |     0/10    |
>   AggressiveBurst   |     8/10    |     8/10    |
>
> With the Default and even the Aggressive configs the results are
> unsurprising, given KFENCE has not been designed for deterministic bug
> detection of small test cases.
>
> However, when enabling burst mode with relatively large burst count,
> KFENCE can start to detect heap memory-safety bugs even in simpler test
> cases with high probability (in the above cases with ~80% probability).
>
> Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
