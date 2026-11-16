Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858124;
	b=CbiFTsmSa19c7cVAU1pKhYk9G7DxCf6F40zpPGWAyPX1O/a6sTWfyS9zkRU7IIA1Rti4
	 yBua48qSgqlhwsZmdhEj+unfvGfKT060LISIwfPeGzlUIwUPjsG2gpVNpNDUU0a1fcFAa
	 QjhrFyRTWhgdHx8/XCbZFZuOjErWh/DJ44GrwHLx8vPEJcLz0U1yM/PKS1n2h1gGYFDMI
	 v0r2ayG1h3Z0ZK/tsJgZO5//1ZzoQddVzMYJxq0vhfsLpUeDwMAicKHBBjtiva4DDIS/p
	 DKo2HuMg6ulwXoXfKfn49LHhUBcPObmMUsdPOiciwBqhEZRJns/nw1zOpEaR1AuKUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
	b=I8t9ijyobDSPZipej2uIEfMy2zOI6VL0Il9Yo4RdeqBEkGVKaREzIQMHLLCDCxJ0C7Sx
	 7fiUVEIz8lTQ0dPrqIU3pFfb4h5OGm6F3YXDdAaUzT8LejfQ0bV2D7Q+hoXPX1d+iAevJ
	 0k6a8eTE9+Ywywl+Ibx4k5PZh9mbPkTYD3Gltq0vpXjqfDzUNiDsZAKaUwPdxkOfWVU1U
	 Y77LyCDAcr4tENrr0TrzEFAEolp/PJvJcsUcQ6XnHU5VEgbIJIKGEKn41HDaybYWtSQmG
	 3hQkaL0Hk7TR3cYtS2zOWVdeSPTd/uZ99332dVK0Qw1ukMNHuaWD+1f6AH217q/yrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eoWff0YO;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922B606A32F
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5922B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eoWff0YO
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50e9408873so130669366b.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794858122; x=1795462922; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=eoWff0YOlKIoIHjF1NQtRoRnm8FUpD+Y+ES0aboA/2ep5x5Zghx7qc5wWe3xqvFIq5
         tLFABPvvov/AaKN+xXjGw9J7GLBZRa0WfosWqmjeG3+hmpXmqdMIfACR+fKVNwT0aPdR
         3bVvEL53CTKRlo0pUJynlr8GV8cVqYdq2rZXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858122; x=1795462922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoqAqmuXv97PmZGFBFFCczoznG+kfpt1kIToyl4KM94=;
        b=Wv5ahwNGHpzxlhq+gVDNt3MTcrUXeNbeHCEGQYEqgfr9xH/7f/q0jQvT8mwPrnx9Uj
         26poPgXNxWwXRYOuxlZzv3qDn5bkLRhwmwKBcQ0Okgj3EPlhIxlTBezUNRzOroIXOD2t
         eyyUylQdMVL7mKwmH8WhjevlOSoP31DU1l4meoTr5Mycyij5CemJ2yMuY8We9W8w46uk
         H2tp/xDId1+O5qzhplBhvl+G592+js3OUfskKMK8T0aLOjTLdQkUPQpAeyWENFk43F6y
         L/BZd1XhPRjxKQ8Xtqjdpao5M6P7gURFulZvPLL7g4Nezu1GoVt5TcwI685KOrHbEo4h
         i0Hw==
X-Forwarded-Encrypted: i=1; AL+hErHqcsVSBkGGtQIKx+pNUTfVUy5tt0geboUDrgrSJatasMfMcWBYF+bNKmL27hvCQinxpX9HFsJ+t48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N8J53lIErHuk2tDO8mMAk19cYtBnEwk6fWD3rLHg2DvsnLrAz
	2rEFxAif5bcqeVbXewhDzCQHaa5hBmCrXWSc2Y/csv0VIZDSpjfkuu1USYHe6O/0QxPOFf8WgFT
	HM3EE4IL46Q==
X-Gm-Gg: AYBFou3ZjU5ND41+fxSsgyPJDxXgHIphFiPz9RDjjrExXSk+WjPspy7h+b7T8gKxyYL
	+0BkrhhtU9s79M8U5Y7unsbq8oxDM+A3gMNxe1o6ac0K21yruaqj44QtndhjwFWUGYBYxHafuCR
	rpqgI2mqyw8HBa2i7C5BJcqJ2u8x0sSdzNabTvBuyyh85oROpPyaNJgQJxyDHR77jaZ6QIIGiza
	HhxP30zmsQ0aeQyHJjnxcj3l1zDjzpHyEmdlXm6YD6Z0LV7OdoHJ6DQVuzBzN5OQonptNOiNbeJ
	/3ZT2VGMlftDfKxhhzkFry10K3ELCOzCTDpxbnoYtFNuvXarw+0TKqpw9Y+7Wu+O5JuMDw1OhXm
	47NP6/ep4sgRUqpEgyvaZK4kAe69OL+CvpGu6hjDOvDctMo3y+EZ8LeFnI9iT4fowceCGrGtGsQ
	0FaeU0LTLmuEb2ejdBymoE9KFm5LepQWmi05M0Kd7zWI74ldAsp8gXnEV+ZvTel0+qtvAZ7IGsx
	CV6TXdL0w12PXs95hvNTo+0MtNXvuwiR75PjhsmJ2sgP2fUEhoEfmRbUUoaio/DVCg8JPjpkIWx
	N2t+jt8kFxx0vcDaHCUs1YqsrryqnpFQgbSLnKylQPtMq47Ece0ADzbBuSdIy1LwvL1iOz8CvA/
	01bOpNTjbfsbK+jq5V1r2EzQq
X-Received: by 2002:a17:906:4785:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c5095dbb6efmr844387866b.0.1794858121737;
        Mon, 16 Nov 2026 11:42:01 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b4289csm461960266b.37.2026.11.16.11.42.01
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:42:01 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d427836e9so513741966b.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:42:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE0YwHXSqNgL6ybjGPiWrsweOCH56ye6GVezG2J/KAb8WTmRYdwGmY3pdBnkmyK/YBKNLv7RDePuAU=@vger.kernel.org
X-Received: by 2002:a17:907:60cb:b0:c4c:d6a3:f4bb with SMTP id
 a640c23a62f3a-c509634503cmr1008394466b.10.1794858120895; Mon, 16 Nov 2026
 11:42:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
 <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:41:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
X-Gm-Features: AclHuK-GW-sq_aqp10QbcNSLO7AtIlmoHSb6NWDtJ770GEzenoCICUrGbvxqol4
Message-ID: <CAHk-=wg-5cWvYgmnE2WH4yys8tB5AwwRQU6kW0r5VoRYBLT7TA@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 11:36, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And I see *no* upside to any /sys/kernel/debug/kapi interface

And yes, the documentation calls this part "human-readable". Nobody
cares. No sane human ever reads and compares specs. We shouldn't
expect humans to do that, and we should not design *any* of this
around "humans will check it". Completely pointless.

I think the specs should be purely for automated checking, and I
suspect any initial spec should probably even be *generated* by tools.
Because the kernel API is not something that has ever been designed
"by spec".

The kernel API has grown over time, and pretending anything else would
make the whole project be just a fever dream. We are *NEVER* going to
change the API _to_ some spec. The spec needs to match reality, we're
not changing reality to match a spec.

Then, once such a "spec matches reality" has been generated, that spec
can then be used to check changes. But neither of those phases are
ever going to involve any humans, because competent humans have better
things to do.

           Linus
