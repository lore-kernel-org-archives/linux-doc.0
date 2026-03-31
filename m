Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13964343D75
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977432; cv=none; b=H0EIE/jV8qQTy4hO0tXzKqAvuSOjchX/fwOHUqqR9xcETt3p6gspl2Yvacsj4jH1ky6JhpfU9qBj8Cu6hi/tGnChsy16vlceNImvXyJjbNl+P1+UFvJkHkgQGJgiT2HFwvZKqnhXEZfnOPTuxsN/OxRBSXTNtUm5wmoXHcdG8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977432; c=relaxed/simple;
	bh=X8mgB91EilmZX84/+DAl/QEGzBiT68+EQBIZrGj6ois=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeZ1CWDh8hu04ABgi9om2QrNq+MqSPzeRupgSQBGQ9C+/7fA7l3OcmveffLiSnQv47sSPO7QbE/T943LoZiDZ07fSq0HpKWKM/wMqZBdXgWL006uE38SPDqPeN0vs87mTOzQR3X9HQpUd5be7zHqROwNHHOHSYS3Jylk/k57704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fM4rTxn5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fM4rTxn5"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so10219629a12.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977429; x=1775582229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=fM4rTxn5rgETcXmtgnTlITv4/toDrnJPsfQHALwr2JK48y93j8m74Nb+AhT6G8aZ8+
         y5l9wBaN6lTBhPWlR5rUxKE7iPemKktf0uNLtYJ1TnsgPRqVeoPjm0eBAoQ51+UqqUAY
         k4so6jv7oVNL5+uGEsHDxoxBMUEmcrUklmxpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977429; x=1775582229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=qSTH43saE2Qeba6PjMAeMuZIMxigsyfPJRoiypzXppcRCG4xWvamvwY27ImAku9tbi
         R5PdWZthHh8ORfpqCarabkdKRLHVGQguabdm6jOZX8y+7/BS10RwCNw4A6SnDy0xzeef
         RB1+DqBGjpBJT1du3qXCQxYa6yY/u1Yc+SIgvrl3AFGes8uSFSZAVPa1myeN7KTRyGbR
         WKZjp9i9+6r4hbARA3agg1EUIzZi7a8ki9pQBXPfU5Y5e0gat2BGV2wUuWDA9IFwVIMQ
         i6f4RSspM7EFQeRSvUtzzli1Jq6YeLZNNbGNhtMu4V+8Ez8p7y4hYnSUY0h2th8WCfaB
         eEMg==
X-Forwarded-Encrypted: i=1; AJvYcCV7bnF1FHwD6g83MweJgdRIq3NdBjIjEmmNZK4fzoGgtR/+RSjNXZ9UQEyeDBjIRaYZBA/X08mWqfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiNy/pNy8k+T7Xb4kFSmHcP/d2fXaq/mqXHco2Q2bjanTf/Ke+
	378MiHkqxfSQhbjUFhVaC3/5iWm18cIV9sBzi7/7fBq6qfLwVoWWNxTZ4ogkfMbGQmwRMArjd/U
	4NgoyfI7Cyg==
X-Gm-Gg: ATEYQzxx7zNQwwDpYa0XAf+UDyL4CMQ9bvmvdJgODIrsvEK8ExWu613iFIWC6wkLXVM
	FUyLLF7aWayRpPMCXIKg6CSzdCxygmQHzSD1UhVkY6Sxc5yehZ3lYh0BzbNtptRQP2RTnjLbRRd
	mw7zGL50fSWZQuIEa8kA3Eh7GoffsyT2ZPeQ0jwEVFjxAqGRsmBAN7xlKQccNsOpWaorRCaDDWN
	IX85SzZ8U7FuI3jUVQW+Ty9/n1JnD58vYPJig03mhCdTulHoThHWHR6bGSir2WEnKcn+3SpCnB6
	ncsQiC9fTJcwRF13NZq+erU+rmP7hcfyZmN44XdYqfJ/920ZasslnJuRuPoh8Ivc53W0FCNgMwG
	hg/WVhW08iqdWl/+f2sAbmvoTqzZ+5WxqY5ibXDeeATutLLw9c/EK3SbE/6s9ie8Jw0Ms9M+8r5
	Q+mEMg//T2zQ/4W+HUhEfXncjSGUqD38o1qI5UDwk8PJZFKALY92NwNqvd5u8Pi8wSRUWdZcv7
X-Received: by 2002:a05:6402:5406:b0:660:a4ad:16a2 with SMTP id 4fb4d7f45d1cf-66db36f7c5bmr235374a12.22.1774977428491;
        Tue, 31 Mar 2026 10:17:08 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66bf3e16f80sm2210902a12.25.2026.03.31.10.17.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:17:07 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9382e59c0eso959962266b.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 10:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRChPt0Ayi3ItOOafz2xFvxj7pq9sT3mQ9Q96Bw+N0HqBPMZtroXKae6e4uELcW7pIBzs9EC44/XE=@vger.kernel.org
X-Received: by 2002:a17:907:a604:b0:b97:b9d5:4ae4 with SMTP id
 a640c23a62f3a-b9c138e5f3bmr33991866b.20.1774977427566; Tue, 31 Mar 2026
 10:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-3-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:16:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
X-Gm-Features: AQROBzBItZBmx5_N-ynlPw8E_7o3PG43Wcm0ba7e3I2MR7-9HUZsFelf3Nv9M7s
Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>> +
> +  typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint;
> +  typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_uint;

This is fundamentally broken sh*t.

Stop thinking that trapping is "safe".

It damn well isn't. A dead machine is not a safe machine.

Any patches that call trapping behavior safe will ne NAK'ed by me.,

We have decades of peoiple using BUG_ON() as a safety measure, and it
has been a HUGE PROBLEM.

There is no way in hell that we are ever adding implicit BUG_ON()
things that are this hidden, this easy to use, and then mislabeled as
being "safe".

Guys, that's the same logic as having a airbag in your car that just
shoots you in the head. You're certainly "safe" from the vagaries of
bad healthcare. But dammit, if anybody thinks that a "bullet to the
head" should be called "safe", then that person damn well shouldn't be
involved with kernel development.

So NAK NAK NAK NAK.

The only safe trapping behavior is something that has a clear an
unambiguous and simple to use way to *HANDLE* it. Not just "mark it
trapping".

              Linus
