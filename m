Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918439E6FD
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247395; cv=pass; b=aXrYVgyXHcNB4YOWBnWGdCq7vJjn0fyw0UXaZTOB9T+WdJJgqjdUWkF+6eAVD1cfafOfUvi3Ot65ALIBTzQGo9/p4l0sd2mMvvd1uF57t/Xkgo7cu69eeeo7qFBCigzsuG+Zcy2fIEs1h65vhdxamB+4QBWLCYN8ikHe3Trpicg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247395; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+rjp/pYUHRr3VwJEESOhSMg7A1qq3mm/wLrNCaomJhTv6JqQd6LmQUt+cqdhyKUK8M5xO5hnoM6Q3GhJhv6hKINT8hAkvMa3WOY3iQKU0s0eAjdwp4Qp2HcbUg1EttmuzkibiLh4ZvkxnO9rh1HnKMm60WZM3oPmOZDnZUsShs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDjjaIn; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDjjaIn"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so1109822a12.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=ER0c6V61smPR3hxEfcf7FGBl6GcUNLiM9g51MVcU4XnccV5cLOcsPJOmL1p6pm7T6w
         mfxZ9iE8zQjpVjrau8HnO5XpvdsJRBY3PiNW92P97t0zBzZ7oBYEhNawB6mtaAI76N0k
         J+D6nDHhVM2eq61TUOcL8IjzG15ql+QtzmIMeuplXRxRCjTjiN+X7yMxthZ3S6f9BHCG
         peOdTCX6W+aQeLLeVDWlm5hIAl5NA6fTIK70e6+YlV8ZDDuJmb1+hCdcPxQX94ucjXhT
         SjYQL8ZNLIjvx4L9VCsMayxNtE7F/2qb+yy/QTvsOj9hYX2yWnKz84mUi2cztxeTbBNQ
         3VWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=c8o6lv3sBtIsC9sPpQ/Cu3v4gv4RCY9C0fgvLO3C5E4=;
        b=D1xGYuPijVzbql2z/t/bFXZBGSIJyIqy3BTNE2H6EnnCerfUjpHtjUT8M7DbYYX2UZ
         ROMpunxJ9rQzOzloEiT1SHTQExrBsJJMCG7jYMGn/bHoid0o8Wa1fdEB75EuGW3BfA3u
         KZEcoGrbSxEJKFSy4FyHK56RNWV0inUD8CSsi5ASZWuqrOaI4VjdUE6mNqAFTUxMLZwg
         ecKm8fmu+fsmICkchJFdFWhscjWq3lx0aBOa5/PtzSxpFrG8Xj2ndAYeWb0APih5wi5g
         Id9RaHYjC2DzDP1CYxJHxLb6b4WiTqBxvFwcKrUz8GWRDf6jKbl26iqJOBHTtBeVgA+m
         ybpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=EqDjjaInov0ka4alN+yEFWBFuaxhdbrfTeM99dBjBHVH1TGqPNOwMXvp3aBAtkNwGy
         wuUszsiCnccC+mXgVgklYrmJpM4ITNLR+1Pdq81iYB9iH8fIQ4Bj7siJSio/GUKufXNx
         uXLplkNvuYKJ356p1ai5tl+9d3qggFzGRiMQ0Y85CiE+L3Q12ToW+x1COpZlQo+fpOZE
         Apr3vb1VXwL/9IHBFx3WjOH6ceWGtdi2t3QdLCyf1j21yuQZfrSPzo1HjsEevZyy96Wl
         FDOKchXplfC1MTsnyxN7ZPsFme7ZJTfu3QPEZC/sMXV7SCV1Jl+fh+kNG5QUGdXfpb45
         NfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=OcBLludp8tOWhFMNEN4N4LX7Msi+1zQdoFsSHNYAXZa6VGWEITx1mDR4dkbzHTVsK/
         jvAWzng9r0LE2AsUFmBulh8hFm+Y7oi7DBzyOdgq1ETzuVtDk5xuTjL3EsmLWI5FIXWh
         CaBkrl05JBmqrWtxUg7/PTEwFgOYSfhHwFCxvDSDnRxs1CEkSbkg0RUJ3980e1SzsRwD
         71V2Wh8tY3naRfU13fBBLHB/uFi6s6aWTY5pIv2QOoHmD33WvH1lWmrg051emSb6Mdux
         ULV2FnVVk5Mcs5TcY35YZFGc055El0dljo5a7APJVpFsUwgSEn9JSIoiYLOHbyqImD1l
         No7Q==
X-Forwarded-Encrypted: i=1; AFNElJ822Eoqo6g3GapfgWOvRKqvBTvthmEUyYKzxHj8592M9OaKoL8Z38drzVAlsr0NpMAVildh5qpBBjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0XrNWJPKNyxVx0upJyQsrvSWqw7KA8jz288vD32+Ip+r0bQY
	jwm9m7yNDMeRsO+6NPuUbMuTF0uHUfn21EDIYVlGFBqPAAuGuj5i69rcZ0DgHpBq8mnr1CCfgM0
	2EJznm0Uq1M5yUQamaNWi6+9QwFzp76K4CMQQIfAW
X-Gm-Gg: Acq92OESoDOsi8ajBMu2zHBGD2stSz0GCs3qLwfRHTau+ebl7cuHw/2uBRsm4H7khSd
	7c2rIIQKG87nemA+CSuX06gowB7if8H3frYMyViyKjer5G9LaHj5rIOA9jVd3n6kRPNUbmW8Bps
	+bsjAXBUg04KK8Ye0n93Jzw188yveK/lhhrRf1No6kOyE9T+w+cxSua/3153nzUOBc9yJbkYRns
	hxOns5foj++HABNzY98TR+LZQS/GpqqTkL0I3aGMWtUjyLNwfR+OF14ie1+3A3XZb6VryTwEWMP
	EDk81uGm4rNWjQPCaClZqiBjxFDzYOsJUztBVw==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.
