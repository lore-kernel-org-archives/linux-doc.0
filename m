Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A951F37757C
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 20:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785096663; cv=pass; b=LhAL+Z9e23UwTBixw+CYXR/ek6Jnc3L1mlUb+gOl7+t8amw1vxNbrsfT8bYmkvUvhfKGxm6tYRAdj90UxE08ESoxuF2oByBRt0cZRmQg259d2degxhuQFRI4gZTTFWN96nK54AND8hu77vIA/ueZ09LiZzFVm5N1yY0598wxIhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785096663; c=relaxed/simple;
	bh=kWd2ZlnaGIqOzhBDtr6CPo+wqxbzhTWntedFRzAihME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pdLDemwrQuW51osbEC1x06+3PXYYcdg6LBcMB2kS29MkB0poGEXdbo6dGWYSaRKi0DCdK5g7vQNkY+F3R9TneWPy9tBxuM9z6xaEjcvANcLx29+9juk1BHFXtOmCGYBCgV93fFbzGPqnNKdy3PnsdI5BnaJj0QtOTDlNxbmDR2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWjNmrzf; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWjNmrzf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1847212a12.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 13:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785096661; cv=none;
        d=google.com; s=arc-20260327;
        b=mi38wps+P6XVr+ROpI5H3qsz3hQ9S3Iwir6x8hKi0D5rpxXOhFnKJ1Pj4ZMzcyk8l/
         IPZBEXHDMv7HrE0BhG9XUgMN9k3aHB3bsqKdQFjsmczWJXPXKCOZj2EQWAo+sNOHTwrG
         xWzmypRGBInCavpjqKpWAwpBsIcgszdMzG0ObV0/CEydGTa4tFZXDEZmbLO3el5Xa7z4
         qAL0utuUah0CcJvEMtOLRk3zCfkwBj6nkqHCogjLn/Pq/vKO68V2hNUe9ZKj/YhYW4P5
         Yte5d7OHT3GZzcSeLAej/Pvyg8zeCvP/Np3XvSkD423OQLz4oz4HVqIsQMwDhxxh0IOs
         u9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        fh=Yc2n5Y3tvIRXtxZAmd0I08OIIbS6Ip426ip9ILvhz6s=;
        b=bqqPH3F7VXAIm2xQhgyi5dqDliowtAZ7n8EdInE1gbpIuUvyUTQjDUqbQdYFnz6Suf
         fR+GLAL6QKEj0JmMHeV2K7yECPtuHmrCG/PItjWKFR26/pgBYgfDWWBFqaA6qznombbP
         Rv/cEdSjjQhFlpUhgvaVW2gagSxyr9OFj5JYOlUCKCmovQm/UVqWRt8wy72jrZ6pEaS3
         GYZ0cV+LyDoithWzimigbtpaxlR2wUDq41cZo2gr8QM1hMXZCLEAhVBjtpzkM3xzy0Zk
         yY2mx2HNn7aRgoWOxY2l0hc9/kwQs6ZA3ZEu4tLaQUqWv5Ldi7bFfSAAEqLZiceGqxcd
         RLmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785096661; x=1785701461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        b=bWjNmrzfOcznBPitgGj/HS0xLXFm9c9EvME+U9Y38WewNosDqzxcptmAggNl6jtEYm
         THi8L8kT7chED9bWcXg7+qUv/N7TMowQCnPZL3LwK7fkr6tym+6FhlhoxdYN4k1BD/Uf
         9qaSxmxHi4Sjq3UYpbzBwI0DQFesqVWoJqU2jiPsnBPApLeCtmNo0OUMuH18+2f9+5LA
         oo9hGHabcykOJDdvexQexzB4IBppCw9JBRQRZdnqM2zqJLAfzdlDvLn0nywYK8qtiGOj
         x9pUhyT/uAItjv0TDjAWjuOVo5/1tolIctW/xUEQ+wdpDz9bPsJdIrkZuxbm8Nu+sMBL
         pOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785096661; x=1785701461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+Bo0viCEB2m22FDhwGjICfsYsQ1DUFzTfnhxFo1SU0=;
        b=bWCRCjKhIIkjPKbi0GJwVH3/ImggpT+lz5PLW7j0SfRO4UUjdM5t2FSGH1kcxoOW1Q
         wHtmpU8zLG9XA2x0gm/eUhfOfVRFcHAhmEOzWj05yqNbGk2qoxRO4O7vxav5LyF0VUG9
         LOKs69s9Q8apWYXI2izyNmiLwAhXWyDTgbBQHmNHjlu4IPYi3rSApVgNZBRj2fXsmnYf
         xIMTZKuIIv9ESERYHMgznmLgUKO1X2dEgFalW+UJyyzRuwrLJ6ih/9fqG7Iq6BB7PlSg
         jHlCbZdImSr8XAEwtcTBq4Cf6vYCyecx2C77XcGE7FdPe4Tkyrq3V1BcQTXl7wz1CWsA
         p3xg==
X-Forwarded-Encrypted: i=1; AHgh+RqMwfJkZKd8zEoHKNvgoE5/JcS76EezC6OaI3EY7+4YdE5VOJ76eIOH3WRxkE7UFg2C91WpemRSCn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3YsDX4EwH1eb8ciu+6bnLiDuV/aYeus18eJIvlsE8Njb525s8
	tIXBAxNh2nHqpD8pJzH8V6Rm3sajAtBsNEOV0z0WHdnFH2vtd4TxNqV5s7KmEo7f26NeiEhxWoo
	chwZ73Vf7ntXOOsNUg78QcK9+xoKyxMc=
X-Gm-Gg: AR+sD111YyJK7S0ZC5usbcgsyQdq1p34yqB3GSTaIqdX1H+k/f2B7VVWynQl9cbYb67
	sKzHmC09jQxVkN8Yw49YIzuO9FwCp8F6uQsrmETGaDwuDZALoDZQhn7WDVEqVklvSAdNMhNJ244
	CpTlww7yK7DYchAp/JtWWxUQSfhBJCfbqaghPKKfyffceRV+DjUJ3XSqlYrwOuO6P1tddZ6ROsc
	pn5r//cXFIvDzJ/J+Fu4nyePrjsU6wPgKVgV7rRexhZsmvuptUBB40B3y6yvd0lRndvA76m
X-Received: by 2002:a17:90b:384b:b0:38d:ef48:b04 with SMTP id
 98e67ed59e1d1-38f294ea3c5mr6088330a91.10.1785096661118; Sun, 26 Jul 2026
 13:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-af-alg-harden-v1-2-c76755c3a5c5@gmail.com>
 <20260603133312.12848-1-freude@linux.ibm.com> <amOGWwdjnJqyxH5L@codewreck.org>
 <20260724160034.GB2032@sol> <amOTjPW__CNZui3_@codewreck.org>
 <CAFLxGvy+ec3nQLrQtwFZgGELhT2pKBDnHdD0pMvEGh-Mf3rjgQ@mail.gmail.com>
 <20260725220443.GA41199@quark> <CAFLxGvyBGzfwh61F5YkYqctNPCQJCpFOwTtKfDs4L+iK8WJZpQ@mail.gmail.com>
 <20260726155024.GB1673@sol>
In-Reply-To: <20260726155024.GB1673@sol>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 26 Jul 2026 22:10:48 +0200
X-Gm-Features: AUfX_mwZurnXooec2A3FqadK1K8O_igYrMZGYhDFbqwtbTaFK-ATjGnI_bmWgHQ
Message-ID: <CAFLxGvzaAH+ZGr-OFo=Li1aOxgwBjjR76T7m1CjFaL-6w3KPPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] AF_ALG: Drop support for off-CPU cryptography
To: Eric Biggers <ebiggers@kernel.org>
Cc: Dominique Martinet <asmadeus@codewreck.org>, demiobenour@gmail.com, 
	Harald Freudenberger <freude@linux.ibm.com>, acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, ardb@kernel.org, axboe@kernel.dk, 
	corbet@lwn.net, davem@davemloft.net, edumazet@google.com, 
	herbert@gondor.apana.org.au, horms@kernel.org, io-uring@vger.kernel.org, 
	irogers@google.com, james.clark@linaro.org, jolsa@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, namhyung@kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, peterz@infradead.org, 
	skhan@linuxfoundation.org, willemb@google.com, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 5:52=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
> Then I would suggest that skcipher_bind() should check if the name is
> "cbc(paes)", and if so use 0 instead of AF_ALG_CRYPTOAPI_MASK.  Please
> go ahead and send a patch against mainline (for v7.2-rc6) if you're
> interested.

Patch sent.

> On cryptodev/master (future 7.3) it should get an entry in the new
> skcipher_allowlist as well: { "cbc(paes)", true }.  That would be a
> separate patch.

Do you mind a new field in struct af_alg_allowlist_entry which indicates
that  AF_ALG_CRYPTOAPI_MASK should get bypassed?

bool bypass_apimask;?

> With those it will keep working as root.  (And you mentioned in your
> other email it's used only as root anyway.)

Agreed. While I don't know whether others out there using it in
non-privileged mode,
let's be conservative. If something breaks, users will speak up, I hope.

--=20
Thanks,
//richard
