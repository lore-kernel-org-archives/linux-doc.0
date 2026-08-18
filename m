Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D03515D5
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 23:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096964; cv=pass; b=NQ39lnbakctdK2YvbSh0cZkgI6euoJXzByNzlYFi8Jjh40hmAmZlzSnvhr86Cci80fhbzkM5bnRipwTZ3WxaOPYS+TKihsfRZAMzZ2+eTvh0APdK0i9Li9JK+tjrD1kGP0O/RZDGZxgJ0SQptUJyPSczX9Snkbxt7vncnUFvUJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096964; c=relaxed/simple;
	bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDPsBAEfJ8jZPVxizlpgHGTXmmXCM+IH1M151Ckv4YwAF0kjkvrt8w6CtFOHnSp2Z+179fvNvdd4SMhMjhtgk+ixb+BWzxgUL9BtdiAdo3SoW9dcJvK0EwKLxiJU2pTBnrxdzfMseY/SXPc+dtsrjtV0JbbWp0y+MC5SMV40P7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT2x83FR; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT2x83FR"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb36c46bbso50854e87.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 16:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787096960; cv=none;
        d=google.com; s=arc-20260327;
        b=gLbFNC2yLlFp0K0FA73+u8jldU02wm/SCArlpgajVqd3rTIsaLDJ/RYy2Esy7DxJH5
         tQNWAU6fMbfYU800x+XRb9uJIPhqZILUJJg2yD+ObzOZUnVh3cDhBaPJrwvh4Z/5bRjL
         wgi5Ipayw4uR67tS1uo/cV9/0Z/FSAIxsc+qic9odipWxUOJmQsxxt0xkvWikmsEqld/
         UoHCdibD3YXOgD7Xg5EO3QRWn7PRZFhgjJvcZCnwktINBMYjll9hFOVbulV4Xtv6I3LQ
         TRBVgVemvhGyG3uyZ+kA1xbvbplX6QX4kIkwdxQK3qf3Brt/vCRDS0YEmL4zGAshJkgd
         ppOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        fh=xC5/rC0OnQlcvgDx4Ku7vKUQCxUsPOa72vSCwuz9ruI=;
        b=IXDgx40Ty/rp+e/NiBaDUfSrlIVHsbYUmm87QDdAnpb9/1WaZnIgV+ZXhz10v/MGlI
         es1WE3avIycaPQ7SWFz2e+saEo1sQUvGvOA1dk3p0Al9UWyUjP5yxqeYisHahSelknHW
         qbCQMaW//33HhNm7DCnk1l100KEd1SuoM64hxVdM/aiTJ6wyhezWOZoYayKBpgyJ2NZD
         A1gAtYTN0mEo94BxA6pTpH5UU0Srb5pHx7k6wtoJaowTiYLPSYJTMcPSzzgsdRNlv1o3
         pT0LwepEJ3VlmdFX4UKJrqWm3kGEImTTchBsGWkQYDrITbcGPVC9i7Sluh6ncty6bE/V
         Codw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096960; x=1787701760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=ZT2x83FRp8XeVgI/X9EmOA1Ew8JjyaYhox8S4lnvW6U7RqeGQCJlGyS5tMhzR3bHm8
         96Hv3bnZ7EnUfT21OJMQ9lneNWUXnbLIWYF5ncH5K1+rkCKHIe3c6yQSionqqXcdlSs3
         DCLwFz/+UaKDYAeuJ3pRxt9vLhy/AQBzXTa1Pi3IfWsu8kdATYyzOrrsPIw0MUY75bzs
         fzRIq3ZX7RI1tw4HOox3pMnxUqf5AWac/f6g1BvTpXXaMOxKevtE4syKA3sd84iPNDyX
         TsW1bjzb6Kx1a42W+EqKbswE0uusvAYfnEh8d07MVNvW7fGuv20VLXAqDdTSBiL/w1pz
         hk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096960; x=1787701760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSZWWilzYpTVs7ITY+iihKXbAs3mgU9i5QVnV/i4kYU=;
        b=HjLeqomAisOyaq3zgOpmlon+RTyJ68CQjxIhbLloFDa74WigSCtJuTRgvteeF44QRl
         plGAuKaBB2sHpywvAn135MYzaYa7j4ZK0pgKy8L/2l788kXVO/S6iKJKdhab5XEw8i0c
         9xK9oCky6N2S9SloJDCs5rTdAS+0Kkf01BBoCV/VUeQKatmKL8NmQZAWr5vBNkqlAllo
         rTnavBXsslB9q7M/bN49++3wAkqT7uZwVTdQ4TON5J3sQE0NjAWw+h8DfO/wSoim61ob
         zA+Rrg/VMDiMwa1T7KWagRfnMX+OQ/q2bcaTgyvhj1xZI6q5n8ws/P39FE1Ru48yqbP+
         zPEA==
X-Forwarded-Encrypted: i=1; AHgh+RparN343684GLb8v/fyAHqRALtMFIa73ojAhRLzzbm34NgkwWfyR+OTvM6z43+9HsbL2nnr2oUlwyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJl8hZKzuAXm+fTGtellznrxChGZpn18FxLSPzqt67XMejENf
	szgaRai/++Fsl6Tij8gMa10lxi8lgMJBbLhecCIwjmNt0sUO8N9fdCwsk3Mi5TcRa4cBd5mxDEo
	WbrmEZ8da0TevXyrd0lGAO7ldHrbg+EI=
X-Gm-Gg: AR+sD12GkhRUc4zmhcXGhIYW00GSatzJcd8aYojTa+MgSMom7JKjh9gyyDH3Q610BWd
	TSQpvd+LwZjb9Ih2QeKWOdaiaPTnsaOZ+Lfw4nEpp0xuCORCSw8m13J6ug8FMyBGZhFBqSoQNr0
	CoWwRDTMz52A+IhRfJuJCWdMgamguVRMXsj1NZbC4cALC4OwKnBQfO1w+atNxbtxOsaKarIwS4F
	2wM1d/5aAWNpjuQ7qLX2xLkx9O2sSVLyVyyLPCpkoYbhhJx1vQyAjsxyjYfxks7VOmYFEIQP2Js
	kMKyZecSaB7WVL7Rr4VW1TeUELKMnBQni9dTdAizuJzovX7azJH0lIb5I5L1ODsHX3jgZstc19D
	o7J3XIblkd5hOo8IdnNAyh2YG5ZRMGN7nMDayxhPK0HeSHVJUP6gokdLAQ0fI
X-Received: by 2002:a05:6512:3409:b0:5b4:740d:6daa with SMTP id
 2adb3069b0e04-5b478b82ec3mr66034e87.1.1787096960202; Tue, 18 Aug 2026
 16:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818152324.587932-1-ynorov@nvidia.com> <CANiq72m2M5Csh_9qQYa8MRmJZtciU3d4S3ht5FG-K+YwR4iAwQ@mail.gmail.com>
 <DKSDWO1NQKF3.25QCXPPUM27J4@garyguo.net> <aoTjHtiSHJAuDQ7B@yury>
In-Reply-To: <aoTjHtiSHJAuDQ7B@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2026 01:49:05 +0200
X-Gm-Features: AcwNN1WRSakbfVQ8U0riTSPzb9OJF0aufUcbMY-OEMi-rmUv3-QMTzisl7KpfDU
Message-ID: <CANiq72=9X_WmkkRrrBKvLKBatgOnmAO2L=LbijzwzTv_Xoc5Hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: kunit: enforce test configurability
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, David Gow <david@davidgow.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 12:56=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> If there's something more complicated... Let's wait for at least one
> real test like that, and not speculate on non-existing cases.

I asked because the issue is that this enforces a policy early on,
i.e. if a user happens to need it, then they will have to dive into
the implementation to change it or, likely, work around it or assume
they shouldn't do that.

In other words, there is a cost to enforce something too early on.

So it is a balance, depending on what we expect, which is why I asked
David about his experience here.

> This series begins with "enforce", so it's not about being nice. The
> generic kernel tries to save every single bit of memory and nanosecond
> of runtime. That's a secret of Linux success IMO.

It is great to save bits and nanoseconds, but KUnit is explicitly not
meant for production.

> pay for the functionality they don't need. In Rust, before e74b7a3f5a
> there was no way to throw the tests out. And even after that, we still
> have such tests.

False, you could disable KUnit (or make it `m`) -- which is what you
are supposed to do in production.

So, no, we were not bloating every Rust-enabled kernel out there with tests=
.

> This is not a coding style, it's a factual error. So it should be
> caught at compile time as an explicit error.

Klint and lints in general are not just for coding style.

And lints are also compile-time, and they can stop the build too.

Cheers,
Miguel
